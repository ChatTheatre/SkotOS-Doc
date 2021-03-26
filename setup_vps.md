---
title: Setting up SkotOS on a VPS Server
layout: default
---

For best reliability and stability, set your SkotOS instance up on a virtual private server (VPS). 

Linode has proven to be a very stable locale for SkotOS games with high uptime, but any VPS should do the job. The following referrals codes can be used if you want to earn a month of free time:

> Linode Referral Code: https://www.linode.com/?r=3c7fa15a78407c9a3d4aefb027539db2557b3765
> Digital Ocean: http://www.digitalocean.com/?refcode=a6060686b88a

## Create Your Machine

SkotOS games have relatively low requirements and can be run on low-end VPSes. At Linode, the Linode 2048 is suggested, which has 30 GB of storage and 1 CPU core — though you could probably get started on the Linode 1024, which has just 20 GB of storage. 

If you've got a decent, modern CPU, then the storage will be the biggest requirement. It will slowly grow with time and usage, but most modern VPSes will let you easily upgrade the time comes.

We recommend a Debian 10 (Buster) image for SkotOS deploys.

## Installing SkotOS

You'll want to start from a SkotOS game, which installs based on the SkotOS repo. The simplest is [The Gables](https://github.com/ChatTheatre/gables_game), though you could use another if you have one in mind.

You can find [the Linode stackscript](https://github.com/ChatTheatre/gables_game/blob/master/app_stackscript.sh) in the game repo. Copy it into a new StackScript in your Linode account. You'll need to set up a subdomain for your game with three hostnames (see below.)

Create a new Linode, of at least "Linode 2048" size, from that StackScript based on Debian 10 (Buster.) After hitting "create" you should copy the new IP address and create three new hostnames on the subdomain:

* gables.&lt;subdomain&gt;
* gables-login.&lt;subdomain&gt;
* meet.&lt;subdomain&gt;

Now you can ssh in as root using the SSH key you set up in Linode and run "tail -f game_standup.log". With luck everything will finish correctly without error. If it does, it will create an empty file in the root directory called game_stackscript_finished_successfully.txt.

Just because everything has installed successfully doesn't mean that DGD is finished booting. It's going to take 5-10 minutes to compile everything when you first start it up (or any time you delete its statedump and restart), and it will give errors in the mean time. You can watch the file /var/log/dgd/server.out to see its progress.

## Great Ideas that Aren't Described Here Yet

* Logfile consolidation and rotation
* Regular backups of /var/skotos/SkotOS/skotos.database
* Make the DUMP_INTERVAL in usr/System/initd.c something reasonable like 7200 again
