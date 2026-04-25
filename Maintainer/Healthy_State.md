# A Healthy SkotOS Production Deploy

A SkotOS production deploy is the sum of a half-dozen processes, two web servers, a database, a Perl bridge, a Node bridge, and a few scattered crontab entries. Most of these components are documented in their own pages, but no single page tells you what should be running, listening, and ticking on a working box. This page is that reference.

See also: [Maintenance](./Maintenance.md) for the standard file layout and component overview, [Diagnostics](./Diagnostics.md) for what to do when something here is missing, and [Developer/SkotOS_Ports](../Developer/SkotOS_Ports.md) for the canonical port-offset table.

## Expected Processes

Run `ps -ef` (or `systemctl --type=service --state=running`) and confirm each of the following is present. The exact PIDs and arguments vary, but the binaries should be there.

| Process | Where it comes from | Notes |
|---|---|---|
| `apache2` (multiple workers) | `apache2.service` | Front-end web server. Serves thin-auth, Orchil client, and image vhosts. |
| `mysqld` (or `mariadbd`) | `mariadb.service` | Backs thin-auth's account database. |
| `php server-auth.php` | `restartuserdb.sh` cron | thin-auth AuthD daemon. Listens on portbase-independent port (commonly `:9970`). |
| `php server-control.php` | `restartuserdb.sh` cron | thin-auth CtlD daemon. Commonly `:9971`. |
| `runinstance.sh <PORTBASE>` | `@reboot` in root crontab | Bash supervisor. Should be a long-running parent. |
| `driver.run /var/skotos/<PORTBASE>/skotos.dgd ...` | child of `runinstance.sh` | DGD itself. |
| `perl /var/skotos/support/misc/userdb-authctl <PORTBASE>` | `runinstance.sh` (modern) or `keep_authctl_running.sh` (older) | The bridge between thin-auth's PHP servers and DGD's AuthD/CtlD ports. **Most easily missed.** |
| `node /usr/local/websocket-to-tcp-tunnel/main.js` | `start-tunnel.sh` `@reboot` in www-data crontab | WebSocket-to-TCP relay for Orchil. |
| `nginx` (workers) | `nginx.service` (when present) | WebSocket reverse proxy. Some deploys do not run nginx; if Orchil works without it, leave it alone. |

If `userdb-authctl` is missing, the symptom is "login works but Play Game bounces back to login". If the WebSocket tunnel is missing, the symptom is "Orchil loads but never connects". See [Diagnostics — Failure Modes](./Diagnostics.md#failure-modes).

## Expected Listeners

Run `ss -tlnp` on the VM. Group the listeners as follows.

### Public-facing (apache, on the public IP)

| Port | Service | Bound to |
|---|---|---|
| 22 | sshd | all |
| 80 | apache2 | public IP |
| 443 | apache2 | public IP |

### DGD direct (on the admin IP, if you use a two-IP layout)

DGD listens on the admin IP only. Replace `<PORTBASE>` with your instance's portbase (commonly `6000` or `11000`).

| Port | Purpose |
|---|---|
| `<PORTBASE> + 17` | UserAPI broadcast |
| `<PORTBASE> + 70` | AuthD (incoming from `userdb-authctl`) |
| `<PORTBASE> + 71` | CtlD (incoming from `userdb-authctl`) |
| `<PORTBASE> + 80` | webport |
| `<PORTBASE> + 90` | WOE / Tree of Woe |
| `<PORTBASE> + 91` | DevSys ExportD |
| `<PORTBASE> + 98` | telnet |
| `<PORTBASE> + 99` | binary |
| `<PORTBASE> + 443` | TLS-wrapped binary (where configured) |
| `80` and `443` on admin IP | DGD direct HTTP/HTTPS, where the deploy uses `chat.<domain>` to point at DGD's HTTP layer |

The full canonical list lives in [SkotOS_Ports](../Developer/SkotOS_Ports.md). The above is the production-listener subset.

### Internal-only

| Port | Service |
|---|---|
| 3306 | mariadb (bound to `127.0.0.1`) |
| 8080 | nginx (where present) |
| 8081 | websocket-to-tcp-tunnel (gables) |
| 8082 | websocket-to-tcp-tunnel (Tree of Woe) |
| 9970 | thin-auth `server-auth.php` |
| 9971 | thin-auth `server-control.php` |

## Expected Cron Entries

Cron entries are scattered across multiple users. A working deploy has roughly the following set; the exact paths come from [Maintenance](./Maintenance.md).

### root

```
@reboot /var/skotos/runinstance.sh <PORTBASE> &
* * * * * /var/www/html/user/admin/restartuserdb.sh
1 5 1-2 * * /usr/bin/certbot renew
40 1 * * * /var/skotos/support/misc/backup-dumps <PORTBASE>
```

### www-data

```
@reboot /usr/local/websocket-to-tcp-tunnel/start-tunnel.sh
* * * * * /usr/local/websocket-to-tcp-tunnel/search-tunnel.sh
```

### `skotos` user (older deploys only)

If your deploy was set up before `runinstance.sh` started launching `userdb-authctl` itself, you also need:

```
* * * * * /var/skotos/support/bin/keep_authctl_running.sh <PORTBASE>
```

Modern deploys fold this into `runinstance.sh`. If your `runinstance.sh` does not already invoke `userdb-authctl`, either update it from the canonical version or keep the older `skotos` user's keep-alive entry.

If your VM has no `skotos` user (only the `skotos` group), neither model works without modification. The simplest stopgap is a root crontab entry that re-runs `userdb-authctl <PORTBASE>` if it is not in the process list.

## Expected Hostname Layout

Production deploys typically use a small, conventional set of subdomains. Each one routes differently.

| Hostname | Served by | Purpose |
|---|---|---|
| `<domain>` | apache | Public landing page; usually redirects to login. |
| `login.<domain>` | apache + thin-auth PHP | Sign-in, account management, billing, support. HTTPS-only. |
| `client.<domain>` | apache | Static Orchil JS/CSS/HTML. |
| `chat.<domain>` | DGD direct on admin IP | Game session entry; the URL the "Play Game" link sends users to. May fall back to plain HTTP. |
| `images.<domain>` | apache | Image assets for the game UI. |

The split between apache (public IP) and DGD direct (admin IP) is intentional: it lets the production-grade web server handle TLS termination, vhosts, and static files for the user-facing flow, while DGD owns the game-protocol path. A two-IP-per-VM layout is the cleanest way to express this; both IPs typically live on `eth0`.

## Healthcheck Commands

The following commands belong in a maintenance bookmark. Each one answers a single question quickly.

```sh
# Disk and memory pressure
df -h /
free -h

# Failed services
systemctl --failed

# Listener inventory
ss -tlnp

# Cert expiries
for d in /etc/letsencrypt/live/*/fullchain.pem; do
    echo "$d"; openssl x509 -noout -dates -in "$d"
done

# Auth bridge alive and processing
ps -ef | grep userdb-authctl | grep -v grep
tail -5 /var/log/userdb.log

# WebSocket tunnel alive
ps -ef | grep "node.*main\.js" | grep -v grep
ss -tlnp | grep -E ':808[12]\b'

# DGD listening on its expected ports (replace PORTBASE)
ss -tlnp | grep -E ":(<PORTBASE>|<PORTBASE+70>|<PORTBASE+71>|<PORTBASE+98>)\b"
```

A green run of all of the above is a strong signal that the deploy is healthy. A red anywhere is a strong signal that the next step is [Diagnostics](./Diagnostics.md).
