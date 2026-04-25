# Taking Over an Existing SkotOS Deployment

You have root on a SkotOS production VM that has not been touched in years. The site may or may not be reachable. The previous maintainers are not available. This page is the order of operations to figure out where you are before you change anything.

See also: [Healthy State](./Healthy_State.md), [Diagnostics](./Diagnostics.md), [Maintenance](./Maintenance.md).

## Step 0: Do Not Restart Anything Yet

Restarting a service that has been broken for years discards the evidence of why it broke. The first goal is to capture the current state so you can reconstruct what happened later.

## Step 1: Capture the Baseline

```sh
# OS, kernel, uptime
cat /etc/os-release
uname -a
uptime
last reboot | head -10

# Resources
df -h
free -h

# What is bound where
ss -tlnp

# What is failing
systemctl --failed
```

Save the output to a file outside `/var` (which may be the source of any disk problem). The kernel and OS version often turn out to matter — many production SkotOS boxes are on Debian releases past their LTS window, and some recovery decisions depend on knowing which.

## Step 2: Find the Game Instances

```sh
ls /var/skotos/
```

A typical box has one or more numeric directories under `/var/skotos/` (`3000/`, `6000/`, `9000/`, etc.) — each one is a SkotOS instance with that number as its portbase. The `runinstance.sh` script in `/var/skotos/` takes a portbase as its argument, so the cron `@reboot` line tells you which instance is the production one.

```sh
crontab -l | grep runinstance
```

The portbase you find here is the one you will use for every later step.

## Step 3: Check Whether the Site Is Reachable

From outside the VM:

```sh
# DNS
dig +short login.<domain>
dig +short chat.<domain>
dig +short client.<domain>

# Layer-by-layer
curl -v --connect-timeout 10 https://login.<domain>/
```

The output of `curl -v` distinguishes "DNS broken", "TCP refused", "TLS error", and "HTTP error". Each is a different problem.

If the public-facing IP and the SSH IP are different, the box is using a two-IP-per-VM layout. Confirm with `ip -br addr show`. Both IPs should appear on `eth0`, and the public one should match what DNS resolves for `login.<domain>` and `client.<domain>`.

## Step 4: Inventory the Web Layer

This is where most surprise lives on inherited boxes.

```sh
# Which web servers are configured
ls /etc/apache2/sites-enabled/ 2>/dev/null
ls /etc/nginx/sites-enabled/   2>/dev/null

# Effective config for each
nginx -T 2>/dev/null
apache2ctl -S  2>/dev/null
```

A production SkotOS box normally has apache as the primary web server with vhosts for `login`, `client`, `images`, and the bare domain. nginx, when present, is a reverse proxy in front of the WebSocket tunnel rather than the user-facing front-end. Some inherited boxes have only one of the two; some have both with one fully configured and one near-empty.

Reconcile what you see against [Healthy State — Expected Hostname Layout](./Healthy_State.md#expected-hostname-layout) before assuming any vhost is supposed to exist.

## Step 5: Inventory the Code

```sh
find /var/skotos /var/www/html /usr/local -maxdepth 3 -name '.git' -type d 2>/dev/null
```

For each git checkout, capture remote, current commit, and divergence:

```sh
for d in $(find ... above ...); do
    repo="$(dirname "$d")"
    echo "=== $repo ==="
    git -C "$repo" remote -v
    git -C "$repo" log -1 --oneline
    git -C "$repo" status --porcelain
done
```

Production boxes drift over years. Expect to find some checkouts pointing at long-dead remotes, some with significant uncommitted local edits, and some with no upstream at all. Document everything before you sync anything to a fresh upstream — local edits on a production box are usually load-bearing in ways that aren't obvious.

## Step 6: Confirm the Auth Bridge

Almost every "the site looks healthy but users can't actually play" outage on SkotOS comes back to the same place: `userdb-authctl` is dead.

```sh
ps -ef | grep userdb-authctl | grep -v grep
tail /var/log/userdb.log
```

If there is no `userdb-authctl` process, or `userdb.log` has no recent activity, the bridge between thin-auth and DGD is down. The site can pass every other healthcheck and still be unusable for players. See [Diagnostics — Failure Modes](./Diagnostics.md#failure-modes).

The doc says the bridge is supposed to be kept running by either the `skotos` user's crontab calling `keep_authctl_running.sh`, or (on modern deploys) by `runinstance.sh` itself. Inherited boxes frequently have neither, because at some point one model replaced the other and a piece of the cleanup was missed.

## Step 7: Confirm the WebSocket Tunnel

```sh
ps -ef | grep "node.*main\.js" | grep -v grep
ss -tlnp | grep -E ':808[12]\b'
ls -la /usr/local/websocket-to-tcp-tunnel/*.pid
```

The tunnel's restart cron has a known bug where an empty pid file (left behind by a crash) is read as PID 0 and treated as "still running". If the pid files are stale and dated months or years back, the tunnel has been silently dead.

## Step 8: Decide What to Do First

After Steps 1-7 you have a picture of which pieces are working, which are broken, and which are missing entirely. The recovery order is the same as the diagnostic order in [Diagnostics — Diagnostic Order](./Diagnostics.md#diagnostic-order):

1. Free disk if any partition is over 90%.
2. Restart simple cascade-failed services (haveged, timesyncd, logrotate).
3. Restart mariadb. Apache. PHP daemons.
4. Renew TLS certs. Reload apache.
5. Confirm `userdb-authctl` is alive. If not, start it.
6. Confirm the WebSocket tunnel is alive. If not, clear stale pids and start it.
7. Test the user flow end-to-end with a real login: thin-auth login, click Play Game, Orchil connects, in-game action succeeds.

Each of these steps should be reversible in isolation. None of them should require destroying state. If a step requires a destructive action — for example, deleting `userdb.log.*` rotated files to free disk — capture a sample first if forensics matter.

## Step 9: Capture a Recovery Runbook

Once the box is back up, write down what you did and which assumptions in this page turned out not to match your deploy. Inherited boxes always have some divergence from the canonical setup; capturing yours is the only way the next person to take over does not start from scratch.

A recovery runbook for your specific deploy belongs in the deploy's own repo, not in this documentation. This doc captures the patterns; your runbook captures your specifics.
