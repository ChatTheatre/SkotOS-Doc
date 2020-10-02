---
title: Setting up SkotOS on a VPS Server
layout: default
---

NOTE: THESE DIRECTIONS ARE INCOMPLETE. For now, SkotOS isn't ready for a full deployment.

For best reliability and stability, set your SkotOS instance up on a virtual private server (VPS). 

Linode has proven to be a very stable locale for SkotOS games with high uptime, but any VPS should do the job. The following referrals codes can be used if you want to earn a month of free time:

> Linode Referral Code: https://www.linode.com/?r=3c7fa15a78407c9a3d4aefb027539db2557b3765
> Digital Ocean: http://www.digitalocean.com/?refcode=a6060686b88a

## Create Your Machine

SkotOS games have relatively low requirements and can be run on low-end VPSes. At Linode, the Linode 2048 is suggested, which has 30 GB of storage and 1 CPU core — though you could probably get started on the Linode 1024, which has just 20 GB of storage. 

If you've got a decent, modern CPU, then the storage will be the biggest requirement. It will slowly grow with time and usage, but most modern VPSes will let you easily upgrade the time comes.

All of Skotos' SkotOS games run on either Debian 7.5 or Debian 8.0. Debian is generally suggested as a known stable platform, though other versions of Linux will probably work just as well.

## Installing SkotOS

SkotOS can be installed from this Github repository. For these instructions we'll assume you're cloning it from a Git repository so that you can easily update it later.

You'll need a user who can install SkotOS and run it.

With that user, clone the directories:

* `git clone git@github.com:ChatTheatre/SkotOS.git /var/skotos/SkotOS`
* `git clone git@github.com:dworkin/dgd.git /var/skotos/dgd`

### Optional Configuration

There are two major config files: `/var/skotoslib/SkotOS/skotos.dgd` contains a variety of information on variable sizes and ports, while `/var/skotoslib/SkotOS/skoot/usr/System/data/instance` contains connectivity data.

You may wish to:

1. Change the "\*" addresses at the top of `skotos.dgd` to your IP address.
2. Change the `hostname` in `instance` to your actual Internet hostname.

### Optionally Change the Portbase

By default, SkotOS should respond to ports 80 and 443. But it also listens on a variety of ports in the 10,000 range to implement its own internal structure. If you want to change the internal port locations, you can do so by editing both `skotos.dgd` and `instance`. Be sure to change the `portbase` in `instance` to another number in the form `X000`, then change all of the ports in both files from `10YYY` to `XYYY`. For example, if you choose your `portbase` to be 8000, your `telnet_port` would be 8098 and your first `binary_port` would be 8099.

You probably don't want to adjust the ports unless you plan to run multiple instances of SkotOS on the same machine. But, if you do want to, this is simple: just be sure that each SkotOS game is (1) installed in a different directory; (2) has a different hostname; (3) has a different IP address; and (4) listens to a different range of ports. 

## Adjust Your Network

You will also need to make a few changes to your local network setup to accomodate the SkotOS instance.

### Open Your Firewall

Be sure to adjust your Firewall so that it accepts connections on all the machines. The following iptables rules should make everything accessible:

```
-A INPUT -p tcp --dport    80 -j ACCEPT
-A INPUT -p tcp --dport   443 -j ACCEPT
-A INPUT -p tcp --dport   843 -j ACCEPT
-A INPUT -p tcp --dport  10080 -j ACCEPT
-A INPUT -p tcp --dport  10090 -j ACCEPT
-A INPUT -p udp --dport  10023 -j ACCEPT
```

You may or may not decide to keep these open:
```
-A INPUT -p tcp --dport  10098 -j ACCEPT
-A INPUT -p tcp --dport  10099 -j ACCEPT
```
These are administrative/wiztool ports, and we suggest restricting them to access only on the local machine, in which case you should not put them in.

Be sure to rerun your firewall rules afterward, usually with a command like the following:

```
$ /sbin/iptables-restore < /etc/your-firewall-rules
```

## Build DGD

SkotOS needs a modified build of DGD.

[Here are build instructions](./building_dgd_for_skotos.md). You may have already made the modifications in a repo of your own, or you may need to do it in-place.

## Run DGD from Cron

You will probably want to set your game to restart at machine start-up by putting something like this in your crontab:

```
@reboot /var/skotos/dgd/bin/dgd /var/skotos/SkotOS/skotos.dgd /var/skotos/SkotOS/skotos.database >> /var/skotos/dgd_console_log.txt
```

You are successfully restoring from the snapshot if you see this in DGD's console log:

```
Apr 27 16:25:23 ** info:Reboot completed.
```

## Great Ideas that Aren't Described Here Yet

* Logfile consolidation and rotation
* Regular backups of /var/skotos/SkotOS/skotos.database
* Make the DUMP_INTERVAL in usr/System/initd.c something reasonable like 7200 again
* Thin-auth
