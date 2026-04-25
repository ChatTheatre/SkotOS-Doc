# Diagnosing a SkotOS Production Outage

When a production SkotOS deployment goes silent, you have a small handful of failure classes to check, and the order matters. This page is the diagnostic order, the first commands to run, and the symptom-to-cause table that production maintainers tend to rebuild from scratch every time.

See also: [Maintenance](./Maintenance.md) for the standard component layout, [Healthy State](./Healthy_State.md) for what processes and listeners should exist on a working deploy, and [Authentication](./Authentication.md) for the auth flow internals.

## Diagnostic Order

Work outward from the user's browser to the deepest service. Each layer rules out a class of cause before you spend time on the next.

1. **Public reach** — Does the box answer at all? `dig +short login.<your-domain>` and `curl -v --connect-timeout 10 https://login.<your-domain>/`. Connection-refused, timeout, and TLS-error are different problems.
2. **VM baseline** — SSH in. `df -h`, `free -h`, `uptime`, `last reboot`. A 100% disk or a recent OOM reorders every later step.
3. **Listener state** — `ss -tlnp` on the VM. Compare against [Healthy State](./Healthy_State.md). Missing apache on 80/443, missing DGD listeners, or missing PHP daemons all point at distinct causes.
4. **Failed services** — `systemctl --failed`. Apache, MariaDB, certbot, logrotate, and the PHP daemons are the load-bearing ones. A failure list with three or more of these almost always traces back to a single shared cause (disk, file-permission corruption, or a config-file change).
5. **Certificate state** — `openssl x509 -noout -dates -in /etc/letsencrypt/live/<host>/fullchain.pem` for each cert. An expired cert is the single most common reason an apparently-healthy box refuses HTTPS.
6. **Logs around the suspected outage time** — `/var/log/apache2/error.log`, `/var/log/nginx/error.log`, `/var/log/userdb.log`, `journalctl --since "30 days ago"`. Look for OOM, segfault, "No space left on device", certbot renewal failures.
7. **Auth bridge presence** — `ps -ef | grep userdb-authctl`. The Perl bridge between thin-auth's PHP servers and DGD's AuthD/CtlD is easy to miss because nothing else on the box looks broken when it dies.
8. **WebSocket tunnel presence** — `ps -ef | grep "node.*main.js"` and `ss -tlnp | grep -E ':808[12]\b'`. Without the tunnel, the Orchil client cannot reach DGD even though every other piece looks fine.

If steps 1–4 all come back clean and the site is still broken for users, the problem is almost always at step 7 or 8.

## Symptom-to-First-Check Table

| User-visible symptom | First place to look |
|---|---|
| Browser shows "can't connect to the server" on `https://login.<domain>/` | Listener state on `:443`. apache may be down or bound to the wrong IP. |
| TLS handshake fails with `certificate has expired` | Cert dates in `/etc/letsencrypt/live/`. Then check disk space and `certbot.service` status. |
| `https://login.<domain>` loads, login form works, but Play Game returns to login | `userdb-authctl` is dead or never started. See [Failure Modes](#failure-modes) below. |
| Play Game URL loads a page, Orchil shows "connecting…" forever | `websocket-to-tcp-tunnel` is dead. Check `:8081`/`:8082` listeners. |
| Site is up but slow, lots of `502`/`504` from apache | mariadb is slow or down; PHP daemons can't reach the DB. |
| Site is up but DGD reports `No space left on device` in driver.log | `/var/log` has filled the partition; almost always an unrotated log file. |
| `ssh root@host` works, no other public service responds | Disk full, or the public-facing IP is unbound. Check `ip -br addr show`. |

## Failure Modes

These are the failure modes we have hit on production deployments often enough to write down. Each one has a distinctive symptom signature, a root cause that is not obvious from the symptom, and a recovery path.

### `/var/log` fills the disk

**Symptoms:** Multiple `systemctl --failed` units at once. mariadb, certbot, logrotate, exim, and timesyncd in particular. apache may keep running for a while but stops accepting new connections. DGD is alive in the process list but has crashed and is being respawned by `runinstance.sh` without ever staying up.

**Root cause:** Some log file (often `/var/log/userdb.log` and its rotated copies) grew without compression and without a sane retention count, and exhausted the partition. logrotate itself fails as soon as it can't write its state, so the situation is self-perpetuating.

**Recovery:** Truncate the offending files in place rather than deleting them, in case anything still holds an open file descriptor:

```sh
truncate -s 0 /var/log/userdb.log.[2-7]
```

Then restart the cascade-failed services. Then renew certs if they expired during the outage. Then, before declaring recovery complete, fix the logrotate config so the same fill cannot recur — most production deploys want `compress`, `delaycompress`, and a low `rotate` count for `userdb.log`.

### Cert renewal has been failing silently

**Symptoms:** Browser shows expired-cert warning. Certs in `/etc/letsencrypt/live/` are months or years past `notAfter`. `certbot.service` is FAILED.

**Root cause (the obvious one):** disk full, certbot can't write new certs.

**Root cause (the less-obvious one):** the certbot renewal config (`/etc/letsencrypt/renewal/<host>.conf`) names an authenticator (typically `apache`) that is itself broken. Renewal then fails even with disk free.

**Recovery:** Free disk first. Then check `cat /etc/letsencrypt/renewal/*.conf` for the `authenticator` line. Make sure that authenticator's service (apache or nginx) is running, then run `certbot renew --force-renewal --non-interactive`. Old certbot versions impose a randomised non-interactive sleep of up to several minutes; this is normal, do not kill the process for a few minutes.

### Login works but Play Game loops back to login

**Symptoms:** thin-auth login form works. After login, clicking Play Game (the link to your `chat.<domain>` host) navigates briefly, then bounces back to login. Repeating the cycle eventually times out the session.

**Root cause:** `userdb-authctl` is not running. DGD's HTTP layer cannot verify the auth cookie because the Perl shim that bridges DGD's AuthD/CtlD ports to the thin-auth PHP daemons is dead. DGD treats every request as anonymous and 302-redirects to login.

**How to confirm:** `ps -ef | grep userdb-authctl` returns nothing, or `tail /var/log/userdb.log` shows no recent `CTL: announce` line.

**Recovery:** `nohup /var/skotos/support/misc/userdb-authctl <PORTBASE> > /var/log/userdb-authctl.log 2>&1 &`. Watch userdb.log; you should see a `CTL: announce ... OK OK` within seconds. Then test the Play Game flow again with the user's browser session.

**Persistence:** see [Healthy State](./Healthy_State.md) for the canonical restart hook. On older deploys this was supposed to be `keep_authctl_running.sh` in the `skotos` user's crontab. On modern ones, `runinstance.sh` is supposed to launch `userdb-authctl` itself. If neither is in place on your box, add a check-and-restart line to root's crontab as a stopgap.

### Play Game page loads but Orchil never connects

**Symptoms:** thin-auth login works. Play Game navigates successfully. Orchil's loading UI appears but never reaches the game. Browser dev-tools show a WebSocket connection attempt that fails or stalls.

**Root cause:** `websocket-to-tcp-tunnel` is not running. The Node daemon that translates WebSocket-on-`:8081` and `:8082` to raw TCP into DGD is dead. nginx's `/gables` reverse proxy still serves, but its upstream (`127.0.0.1:8081`) has nothing listening.

**How to confirm:** `ss -tlnp | grep -E ':808[12]\b'` shows nothing, or only nginx on `:8080` with no Node process on `:8081`.

**Recovery:** Clear stale pid files (`rm /usr/local/websocket-to-tcp-tunnel/*.pid`), then restart as the configured user (typically `www-data`):

```sh
sudo -u www-data sh -c "cd /usr/local/websocket-to-tcp-tunnel && /usr/bin/node main.js > /var/log/tunnel/start.log 2>&1 &"
```

Verify listeners on `:8081` and `:8082`. The supplied `search-tunnel.sh` cron-restart script has a known bug where an empty `tunnel.pid` is read as PID 0, which short-circuits the restart logic. Delete stale pids before relying on the cron path.

### DGD process exists but no listeners

**Symptoms:** `ps -ef | grep driver.run` shows DGD running. `ss -tlnp` shows none of DGD's expected ports bound. `runinstance.sh` is in the process tree.

**Root cause:** DGD has been crash-looping. `runinstance.sh` respawns it, DGD tries to bind ports, hits the underlying problem (almost always disk-full), and exits before the listener is established. From outside the box this looks like "DGD is up" because the bash supervisor never goes away.

**Recovery:** Fix the underlying problem (usually disk). DGD will self-heal on the next respawn cycle, typically within a minute. If it does not, kill the supervisor and restart it: `pkill -f "runinstance.sh <PORTBASE>"`, then `cd /var/skotos && /var/skotos/runinstance.sh <PORTBASE> &`.

## Tools That Help

A few commands worth keeping in muscle memory for SkotOS diagnostics:

- `ss -tlnp` — listener state with the owning process. Faster than `netstat`.
- `journalctl -u <service> --since "30 days ago" | tail -50` — recent service-specific logs without scrolling.
- `systemctl --failed` — cuts straight to the broken units.
- `du -sh /var/log/* | sort -h | tail -10` — biggest log files at a glance.
- `openssl s_client -connect <host>:443 -servername <host> < /dev/null 2>&1 | openssl x509 -noout -dates` — cert dates from outside the VM.
- `tail -f /var/log/userdb.log` — fastest way to see whether the auth bridge is alive and processing requests.
