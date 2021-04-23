---
title: Setting up SkotOS on a VPS Server
layout: default
---

This document is about how to set up a server with SkotOS for development. You may also want to look at these pages:

* [Workflow with a SkotOS VPS Server](./Developer/LinodeWorkflow.md)
* [SkotOS for local development](./setup.md)
* [Exploring SkotOS](./Developer/Exploring_SkotOS.md)

## Hosting and Referral Codes

For best reliability and stability, set your SkotOS instance up on a virtual private server (VPS). 

Linode has proven to be a very stable locale for SkotOS games with high uptime, but any VPS should do the job. The following referrals codes can be used if you want to earn a month of free time:

> Linode Referral Code: https://www.linode.com/?r=3c7fa15a78407c9a3d4aefb027539db2557b3765
> Digital Ocean: http://www.digitalocean.com/?refcode=a6060686b88a

## You'll Install a SkotOS Game, Not "Just SkotOS"

"Plain" SkotOS comes with a [basic StackScript](https://github.com/ChatTheatre/SkotOS/blob/master/deploy_scripts/stackscript/linode_stackscript.sh) to install its requirements. However, that StackScript does *not* set up a functioning game server. Instead, a SkotOS app like [The Gables](https://github.com/ChatTheatre/gables_game) provides [a StackScript](https://github.com/ChatTheatre/gables_game/blob/master/app_stackscript.sh) which uses the basic SkotOS StackScript.

So you'll want to choose a SkotOS-based game, not "just plain" SkotOS for this install. We'll write here as if you're installing The Gables. If you start from a different SkotOS game, please see the README for your chosen game for any unusual details.

## Create Your VM

Copy your chosen stackscript, such as [the one for The Gables](https://github.com/ChatTheatre/gables_game/blob/master/deploy_scripts/stackscript/gables_stackscript.sh), into a StackScript in your Linode account.

(NOTE: non-Linode installs aren't supported or documented, but shouldn't be too hard - the StackScript is basically just a shellscript that expects to be run as root with some environment variables already set. So read through the up-front list of environment variables, export them and call the script like a normal bash script.)

You'll want to use a Debian 10 (Buster) image and a Linode 2048 or larger. The SkotOS production deployment relies on MariaDB, which doesn't run happily on any instance smaller than that. It's highly recommended to set up a Linode SSH key for root login. It's more secure than a root password.

## As You Create Your VM...

Immediately after you hit "create" you'll need to set up a subdomain for your game with three hostnames. Immediately copy the new IP address and create three new hostnames on the subdomain:

* gables.&lt;subdomain&gt;
* gables-login.&lt;subdomain&gt;
* meet.&lt;subdomain&gt;

(See below for more details.)

Now you can ssh ***TO THE NUMERIC IP*** as root using the SSH key you set up in Linode and run "tail -f game_standup.log". With luck everything will finish correctly without error. If it does, it will create an empty file in the root directory called game_stackscript_finished_successfully.txt.

After the VM is fully installed, DGD will still be booting up. It's going to take 5-10 minutes to compile everything when you first start it up (or any time you delete its statedump and restart), and trying to use the game client will give errors in the mean time. You can watch the file /var/log/dgd/server.out to see its progress. You ***can*** go to the login URL, log in as "skott" with your master password and generally look around. It's the part where you hit "Play" or "Tree of WOE" that takes time to boot up.

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

## Occasional DNS Errors

Certbot is used to create SSL certificates, so that you can run a web server that uses HTTPS. The whole point of certificates is that they verify the particular domain they're for.

That means that Certbot needs the DNS name you gave to work. And DNS is a horrible protocol where things go wrong at random, often badly wrong.

Sometimes, even if you set up DNS ***right after*** you create the Linode, the DNS name won't be available when Certbot tries to use it.

This is what that looks like in the Standup logfile:

~~~
++ certbot --non-interactive --nginx --agree-tos certonly -m webmaster@rwot.testing-1.madrubyscience.com -d rwot-login.testing-1.madrubyscience.com
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator nginx, Installer nginx
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for rwot-login.testing-1.madrubyscience.com
Waiting for verification...
Cleaning up challenges
Failed authorization procedure. rwot-login.testing-1.madrubyscience.com (http-01): urn:ietf:params:acme:error:dns :: No valid IP addresses found for rwot-login.testing-1.madrubyscience.com
IMPORTANT NOTES:
 - The following errors were reported by the server:

   Domain: rwot-login.testing-1.madrubyscience.com
   Type:   None
   Detail: No valid IP addresses found for
   rwot-login.testing-1.madrubyscience.com
~~~

If it happens, you'll need to either run the stackscript again or just destroy the node and recreate it. The "run the stackscript again" solution is a bit faster (see below.)

## As the StackScript Runs

You can ssh into your VM as the StackScript is running. There will be files in root's home directory with names like "standup.log" and (for The Gables) game_standup.log. These are the console and/or error output from the StackScript running. You can use a file viewer like "less" to look at them and/or use "tail -f" to monitor them constantly as they're added to.

The StackScripts are normally configured to stop as soon as a command fails. You can sometimes correct the problem and re-run.

## After the StackScript

Your StackScript has a "login" hostname called "gables-login" under your specified domain. Point your browser at it. You should see a nice interface with options like logging in and creating an account.

Until you've asked Linode to let you send email from your host, email will be blocked. So if you try to create an account you should get an error message about how the account was created but no email could be sent, so it can't verify you.

However, there is an admin account called "skott" with the password you set when creating the Linode. You can use the Support pages to verify emails for accounts, at least until you have Linode unblock sending email from your new VM.

The Skott account can be used to log in and look around - it also has admin privileges in your new SkotOS game server. But you'll need to be able to create more accounts later for builders and users.

## Troubleshooting

### Problems with Accounts and Authentication

Having trouble with authentication on a production (thin-auth) setup? One thing to try is the dev_scripts/stackscript/show_all_log.sh script. It will run "tail -f" to show all changes to a lot of different authentication-related and DGD-related logfiles. Now try logging in. What do you see in the logs?

### "No urbodies" or Can't Find the Theatre

You'll sometimes get problems where a white error dialog comes up instead of the next SkotOS page and it mentions "no urbodies" or that it can't find the Theatre.

Often that means that the Host header of the HTTP request isn't being set correctly. Check your NGinX or Apache config and make sure the hostname matches the hostname you gave when configuring, or that you haven't otherwised changed what SkotOS thinks the hostname is.

### Unknown property GetUserMedia

You're using Jitsi but you're not using HTTPS. Jitsi requires a secure connection. The automatically generated URLs all point to https, but you're probably using http directly on a different port. Maybe don't do that?

### Fully Restarting DGD

Sometimes you'll want to change files and restart DGD. DGD doesn't make this easy for some file types - skotos.database caches built code and various data. See [VPS workflow](./Developer/LinodeWorkflow.md) for full details.

If you want to fully restart DGD, first go into /var/game and touch no_restart.txt. Then run the stop script for the server (/var/game/deploy_scripts/stackscript/stop_game_server.sh). Remove the skotos.database file ***after*** DGD has fully shut down.

This fully stops DGD, and removes all cached code and information. Next time you restart the server (by removing no_restart.txt and either waiting or manually starting it) you'll get a slow boot that rebuilds everything. Nothing will be cached. That's important if you want to change WOE objects by modifying their XML files, or change DGD source files (.c and .h files.)

Note: you may also want to run "dgd-manifest update" after you stop DGD and before you restart it - see below.

### Updating DGD LPC Files

SkotOS games "build" a root directory from their own game files combined with SkotOS core library files. If you just change the file under the root directory (for instance, with "git pull") then it won't work. You have to ***then*** run "dgd-manifest install" or "dgd-manifest update" to update the built root from its sources.

You can do a full restart as described above. That will ***definitely*** update everything, but it will be annoying and take awhile. You can also log in on the wiztool port and "compile" the updated .c files manually, if you feel comfortable with that.

See [VPS workflow](./Developer/LinodeWorkflow.md) for full details.

It can also be useful to [run your app locally](./setup.md) to get a feel for how everything work.

## Updating and Re-Running the Stackscript

The Stackscript tries to be re-runnable where possible. So in many cases if you're changing it you can just re-run it on the same instance with the appropriate environment variables set.

Note that re-running your Stackscript will probably delete some or all changes you've made to your game. So don't do it casually.

In some cases you may need to create a new Linode VM or reset an old one to a previous state and re-run.

The existing DNS entries will normally work fine unless you create a new Linode. Re-running certbot won't cause DNS problems.

Here's what my "run the stackscript" scripts tend to look like:

~~~
#!/bin/bash

# run_my_stackscript.sh

SUBDOMAIN=testing-1.madrubyscience.com USERPASSWORD=MyUtterlySecurePassword123 GAME_GIT_URL=https://github.com/ChatTheatre/gables_game GAME_GIT_BRANCH=master SKOTOS_STACKSCRIPT_URL=https://raw.githubusercontent.com/ChatTheatre/SkotOS/master/deploy_scripts/stackscript/linode_stackscript.sh . ./gables_stackscript.sh
~~~

You can run them like that. You can also export an environment variable called SKIP_INNER to ***not*** run the full SkotOS-install stackscript, if it's already succeeded once. Something like this:

~~~
SKIP_INNER=true ./run_my_stackscript.sh
~~~

## Great Ideas that the StackScript Doesn't Do

* Logfile consolidation and rotation
* Regular backups of the SkotOS statedump file
* Regular backups of the thin-auth MariaDB tables
