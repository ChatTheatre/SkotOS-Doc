---
title: SkotOS Architecture
---

A SkotOS game, like any other application, has an architecture with many components and layers.

## DGD

Nothing in SkotOS has direct access to anything below [DGD](https://ChatTheatre.github.io/lpc-doc) (such as the os, network interfaces, files outside the LPC root), and all access to OS resources by LPC code must be done through DGD's kernellib and kfun API.

### Inside DGD: Kernellib

The [kernel library](https://ChatTheatre.github.io/kernellib-doc) is the lowest level of software running inside DGD. Originally written by dworkin it has since been modified by skotos engineering staff.

The Kernellib controls access to the outside world (e.g. network connections, files, CPU resources) and manages low-level resources inside DGD (e.g. tracking objects, limiting allocations, security and permissions.)

It provides the driver and auto objects mentioned in the DGD documentation.

### Inside DGD: LPC Code

On top of the klib, SkotOS has its own layer of its LPC code.  This handles such things as basic authentication, bulk, rooms, exits, details, and so on, including the parser.  There are some staff commands implemented directly here.

Different kinds of objects can be cloned for the game, including but not limited to things, verbs, property containers, help nodes, tips, storynuggets, and probably others.  The "type" of an object cannot be changed once cloned.  However, SkotOS's use of data inheritance means that some things can be surprisingly configurable at runtime.

Importantly, the LPC layer also handles compilation and execution of Merry scripts.

This also provides the devuser shell that was probably used by the skotos engineers, and most of the code in this layer was probably written by them.

### Inside DGD: Merry/Woe

This is the layer most familiar to Skotos staff. Merry provides a subset of LPC code with important facilities like properties and signals.

## The Host Machine

The host machine provides normal system resources - memory, CPU and so on. It also provides necessary tools and resources for DGD such as system libraries. The most common deployment platform for SkotOS games is a Linux OS, frequently Debian-based.

### System Libraries and Utilities

Compiling DGD requires certain tools and utilities:

* C++ compiler and support libraries (probably gcc with g++ enabled as well as libstdc++)
* yacc (probably bison)
* make

In addition, the normal SkotOS setup requires other software, including:

* Git
* Node.js
* Apache
* NGinX

## Production Deployment Topology

The components above can be deployed in various shapes. The shape that production SkotOS games tend to converge on has two notable patterns worth calling out, because they shape how diagnosis and recovery work in practice.

### Two IPs on One VM

A production SkotOS box typically has two public IPs assigned to the same network interface. One is the user-facing IP and serves apache (and through apache, all browser-driven traffic to thin-auth, the Orchil client, and image vhosts). The other is the admin IP and is where DGD itself binds its own listeners — telnet, binary, and the HTTP/HTTPS ports DGD opens for the in-game flow.

This split lets apache own TLS termination and vhost routing for the user-facing layer without colliding with DGD's own network footprint. From `ip -br addr show` on a healthy production box, both IPs appear on `eth0`.

DNS for the public-facing hostnames (`login.<domain>`, `client.<domain>`, `images.<domain>`) points at the user-facing IP. DNS for the game-session hostname (typically `chat.<domain>`) points at the admin IP, where DGD answers directly.

This is a useful pattern but not required. Single-IP deploys put apache in front of DGD's HTTP layer with a reverse-proxy vhost; the user experience is identical.

### Hostname Layout

Production deploys converge on a small, conventional set of subdomains. Each one routes differently. The table below shows the canonical layout; replace `<domain>` with your game's domain.

| Hostname | Served by | Purpose |
|---|---|---|
| `<domain>` | apache | Public landing page; usually redirects to login. |
| `login.<domain>` | apache + thin-auth PHP | Sign-in, account management, billing, support. HTTPS-only. |
| `client.<domain>` | apache | Static Orchil JS, CSS, HTML, and per-game theme assets. |
| `chat.<domain>` | DGD direct | Game session entry; the URL the "Play Game" link sends users to. |
| `images.<domain>` | apache | Image assets for the game UI. |

The `chat.<domain>` host is the one most often misunderstood, because it is the only hostname where the browser hits DGD directly rather than going through apache.
