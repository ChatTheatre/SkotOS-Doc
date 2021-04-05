---
title: Setting up SkotOS on a VPS Server
layout: default
---

This document is about how to set up a server with SkotOS for development. You may also want to look at these pages:

* [Workflow with a SkotOS VPS Server](./Developer/LinodeWorkflow.md)
* [SkotOS for local development](./setup.md)
* [Exploring SkotOS](./Exploring_SkotOS.md)

## Hosting and Referral Codes

For best reliability and stability, set your SkotOS instance up on a virtual private server (VPS). 

Linode has proven to be a very stable locale for SkotOS games with high uptime, but any VPS should do the job. The following referrals codes can be used if you want to earn a month of free time:

> Linode Referral Code: https://www.linode.com/?r=3c7fa15a78407c9a3d4aefb027539db2557b3765
> Digital Ocean: http://www.digitalocean.com/?refcode=a6060686b88a

## SkotOS from a StackScript

"Plain" SkotOS comes with a [basic StackScript](https://github.com/ChatTheatre/SkotOS/blob/master/deploy_scripts/stackscript/linode_stackscript.sh) to install its requirements. However, that StackScript does *not* set up a functioning game server. Instead, a SkotOS app like [The Gables](https://github.com/ChatTheatre/gables_game) provides [a StackScript](https://github.com/ChatTheatre/gables_game/blob/master/app_stackscript.sh) which calls to the basic SkotOS StackScript.

So you'll want to choose a SkotOS-based game, not "just plain" SkotOS for this install. We'll write here as if you're installing The Gables. Please see the README for your chosen game for any unusual details.

## Create Your VM

Copy your chosen stackscript, such as [the one for The Gables](https://github.com/ChatTheatre/gables_game/blob/master/app_stackscript.sh), into a StackScript in your Linode account.

(NOTE: non-Linode installs aren't supported or documented, but shouldn't be too hard - the StackScript is basically just a shellscript that expects to be run as root with some environment variables already set.)

You'll want to use a Debian 10 (Buster) image and a Linode 2048 or larger. The SkotOS production deployment relies on MariaDB, which doesn't run happily on any instance smaller than that. It's highly recommended to set a Linode SSH key for root login rather than a password.

## Installing SkotOS

You'll want to start from a SkotOS game, which installs based on the SkotOS repo. The simplest is [The Gables](https://github.com/ChatTheatre/gables_game), though you could use another if you have one in mind.

You can find [the Linode stackscript](https://github.com/ChatTheatre/gables_game/blob/master/app_stackscript.sh) in the game repo. Copy it into a new StackScript in your Linode account. You'll need to set up a subdomain for your game with three hostnames (see below.)

Create a new Linode, of at least "Linode 2048" size, from that StackScript based on Debian 10 (Buster.) After hitting "create" you should copy the new IP address and create three new hostnames on the subdomain:

* gables.&lt;subdomain&gt;
* gables-login.&lt;subdomain&gt;
* meet.&lt;subdomain&gt;

Now you can ssh in as root using the SSH key you set up in Linode and run "tail -f game_standup.log". With luck everything will finish correctly without error. If it does, it will create an empty file in the root directory called game_stackscript_finished_successfully.txt.

Just because everything has installed successfully doesn't mean that DGD is finished booting. It's going to take 5-10 minutes to compile everything when you first start it up (or any time you delete its statedump and restart), and it will give errors in the mean time. You can watch the file /var/log/dgd/server.out to see its progress.

## DNS and the StackScript

The current StackScripts will set up HTTPS for any production mode. That's good! But it means you need to set up DNS in a great big hurry. That's annoying.

Specifically:

***When you create your Linode, you should hit 'create', then copy the IP address, then IMMEDIATELY set up your DNS entries.***

Then you probably want to "ssh root@" for that (numeric) IP address.

***THINGS TO BE CAREFUL ABOUT:***

* When you ssh as root, use the numeric IP, not the name. DNS propagation is weird and annoying and you should let the servers figure it out a bit *before* you ask for a name. If you try to SSH to the name before it exists, something may cache it as "nope, doesn't exist" either on your own personal machine or on other caching DNS servers in between.
* Do not edit an existing DNS entry. Make a whole new one. Old stale DNS entries are awful and you want to avoid them.
* Making new DNS entries gets annoying fast, of course. I like to use a subdomain (e.g. gables.testing-47.mydomain.com) so you can change just the subdomain name when making changes to the StackScript. This is mostly only important for debugging the StackScript, but you may need to do that at some point.
* If something goes wrong you can re-run the StackScript on the same machine. Be sure to set the correct environment variables.

## As the StackScript Runs

You can ssh into your VM as the StackScript is running. There will be files in root's home directory with names like "standup.log" and (for The Gables) game_standup.log. These are the console and/or error output from the StackScript running. You can use a file viewer like "less" to look at them and/or use "tail -f" to monitor them constantly as they're added to.

The StackScripts are normally configured to stop as soon as a command fails. You can sometimes correct the problem and re-run.

## After the StackScript

Your StackScript has a "login" hostname, possibly called $FQDN_LOGIN and possibly called something like "gables-login" under your specified domain. Whatever that login name is, point your browser at it. You should see a nice interface with options like logging in and creating an account.

Until you've asked Linode to let you send email from your host, email will be blocked. So if you try to create an account you should get an error message about how the account was created but no email could be sent, so it can't verify you.

However, there is an admin account called "skott" with the password you set when creating the Linode. You can use the Support pages to verify emails for accounts, at least until you have Linode unblock sending email from your new VM.

The Skott account can be used to log in and look around - it also has admin privileges in your new SkotOS game server. But you'll need to be able to create more accounts later for builders and users.

## Workflow

You've probably been doing [local development](./setup.md) already so you know the basics.

Make sure to read up on [VPS workflow](./Developer/LinodeWorkflow.md) and [using DGD Manifests](./Developer/ManifestsAndLinode.md).

The hardest part to get a feel for is the way a DGD server has files on disk that it loads from, objects in memory and the statedump file. By reading the various "workflow" documents you can learn how to handle this unfamiliar-to-most-people programming model.

## Great Ideas that Aren't Described Here - and the StackScript Doesn't Do

* Logfile consolidation and rotation
* Regular backups of /var/skotos/SkotOS/skotos.database
* Make the DUMP_INTERVAL in usr/System/initd.c something reasonable like 7200 again
