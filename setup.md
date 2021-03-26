---
title: Setting Up SkotOS
layout: default
---

* [Installing SkotOS on a Production VPS Server](setup_vps.md)

See also: [Exploring SkotOS](./Exploring_SkotOS.md)

## Requirements

On a Mac, the setup script should take care of its own requirements. If you install manually, you need to deal with them, including the Homebrew package manager.

### Requirement: SSH Key Registered With GitHub

Do you have an SSH key? Check \~/.ssh/ and see if you have an id_rsa.pub file.

If you don't, you'll need to create one:

```
$ ssh-keygen -t rsa -f ~/.ssh/id_rsa
$ ssh-add -K ~/.ssh/id_rsa
```

If you haven't already added your SSH key to GitHub, you'll need to do that. Pop over to "https://github.com/settings/keys", click "New SSH Key" in the upper right, and paste the contents of your public key (\~/.ssh/id_rsa.pub) into the text box.

## Are You On a Mac?

The SkotOS repo has a setup script called deploy_scripts/mac_setup/mac_setup.sh in the repo. Once you clone it, you can run that script to automatically clone the other repos you need next to your SkotOS repo, to build DGD with the right options and to otherwise get you set up.

The rest of this page is the manual equivalent of doing the same. The setup script will always be at least as up-to-date as this page, and usually more up-to-date.

Note that the setup script will liberally install things it needs like Homebrew, Node.js and potentially things like NGinX. If you don't want that software installed, you shouldn't run the script.

### Requirement: Homebrew

To install Homebrew, copy and paste the following into the terminal.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

If you use the setup script, Homebrew will be installed automatically if you don't already have it.

Similarly, Homebrew will install npm and nginx if you don't have them already.

Once homebrew is installed you'll also need these packages:

    brew install git
    brew install npm
    brew install nginx

## Setting It Up Manually?

You'll want some kind of source directory for cloning SkotOS, DGD and similar tools. I'll refer to it as ${SRCDIR} here, but you can call it what you like.

First, let's clone some repositories:

```
cd ${SRCDIR}
git clone git@github.com:ChatTheatre/SkotOS.git
cd SkotOS
git clone git@github.com:ChatTheatre/dgd.git
git clone git@github.com:ChatTheatre/wafer.git
git clone git@github.com:ChatTheatre/websocket-to-tcp-tunnel.git
```

## Build the Driver

SkotOS needs a modified build of DGD. It uses more sectors (memory and disk space) than unmodified DGD will accept. We would also like to support more than 255 simultaneous users, which also requires modification. DGD has compile options to fix this, but you'll need to use them. Similarly, DGD only allows outgoing network connections if they have been requested during compilation.

[Here's more about that](./building_dgd_for_skotos.md).

## Running Locally

I'll assume you have DGD built. You can put it in your path or just type its location every time you run it. I'm going to write "dgd" in the commands here as though it was in your path.

To start things going from inside your SkotOS directory, run:

```
$ dgd skotos.dgd
```

The first time that SkotOS runs, you should see lots of console output. A new file will appear in your SkotOS directory, `skotos.database`. This is the snapshot of your application. It will let you restore your game if the machine crashes.

When the initial cold boot is done, you should see something like this written to the console:

```
Apr 27 15:10:57 ** info:Boot completed.
```

After the first time state is dumped you'll have a database file you can use (or you can manually statedump if you're logged in with staff privileges.)

The following text indicates the statedump has happened:

```
Sep 30 13:16:39 ** info:Prepared for statedump.
Sep 30 13:16:39 ** info:Global state save complete.
```

By default it occurs roughly once every two hours. You can adjust the DUMP_INTERVAL in skoot/usr/System/initd.c to be shorter if you'd like a more frequent statedump.

## Restart the Driver

You should probably kill your driver now using ctrl-c. You'll see messages as it cleanly shuts down and does a statedump. You can now load the snapshot when you start SkotOS like this:

```
dgd skotos.dgd skotos.database
```

You'll know you restored correctly from the backup if you see this on the console:

```
Apr 27 16:25:23 ** info:Reboot completed.
```

## Set up the HTML Client

This is (for now) pretty involved. We'll be setting up a web-to-game gateway and using it.

You'll need DGD up and running. The port we'll be connecting to is 10443 - the Text Interface Port, or TextIF port.

Next, we'll need to get Relay.js working. That will open up a websocket-to-game tunnel.

```
cd websocket-to-tcp-tunnel
npm install  # Only the first time, to download dependencies
node src/Relay.js --listen=10801 --send=10443 --host=localhost --name=gables --wsHeartbeat=30 --shutdownDelay=3 --tunnelInfo=false
```

If you're going to make object, you'll also need the Tree of Woe -- that is, the builder interface. That gets its own relay:

```
node src/Relay.js --listen=10802 --send=10090 --host=localhost --name=gables --wsHeartbeat=30 --shutdownDelay=3 --tunnelInfo=false
```

Leave this running. As soon as this process dies (for instance if you hit Ctrl-C) then your gateway stops working until you re-run it. It has to just sit and run.

You'll also need to run an NGinX relay to serve your web files and handle your websockets.

## The Authentication Server

Current SkotOS sets up Wafer, an extremely simple and limited authentication server.

Wafer doesn't actually check passwords - it pretends any password is fine. It also doesn't track a lot of normal SkotOS stuff (time played, story points, payments and subscriptions.) See the Linode instructions and/or setup scripts to see how to use thin-auth, an actual authentication server.

Have a look at wafer-users.json. You can copy a user entry here (or rename bobo) to give yourself new users for logging in. If you delete the file it will be re-created with just admin and bobo.

## How Do I Log In? (Dev/Admin Edition)

If you're a DGD user or doing [deep SkotOS exploration](./Exploring_SkotOS.md), you're probably interested in logging in via the Wiztool.

Start DGD, and you now have the ability to log in as bobo (but not admin) on the telnet port. Go ahead and telnet in:

(Note: because of how Wafer works, literally any password will get you in. For this reason, you really do NOT want to expose dev-mode DGD to the internet at large &mdash; the default setup is as bad as a NoSQL server like MongoDB. The Linode setup is much more secure.)

```
telnet localhost 10098
Noahs-MBP-2:SkotOS noah$ telnet localhost 10098
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.

Welcome to SkotOS.

What is your name: bobo
Password:
> ls
/usr/bobo: No such file or directory.
> cd ..
ls
/usr
> CSD/         Generic/     SID/         Socials/     Tool/        admin/
DTD/         HTTP/        SMTP/        System/      UserAPI/     nino/
DevSys/      Jonkichi/    SkootOnInn/  TextIF/      UserDB/      zell/
Game/        SAM/         SkotOS/      Theatre/     XML/
>
```

Bobo can do a number of things, including evaluating bits of code:

```
> code 7 + 3
$0 = 10
```

Note that this is raw DGD code, not anything sandboxed like Merry. You can do some real damage here if you feel like. This is also how you rebuild programs (objects) after you change their code, and a way you can add other development users or change your password if you're so inclined.

See [Exploring SkotOS](Exploring_SkotOS.md) for more details on things you can do from here.

## How Do I Log In? (Dev/Web Edition.)

Once SkotOS is up and running and so is Wafer, go to http://localhost:2072. You should see a very simple interface including a "Play" link and a "Tree of WOE" link. The "Tree of WOE" is a builder interface to create and edit in-game objects (see [WOE objects](./woe_workflow.md)).

And now you have a working account on your running server.

Go ahead and create a body, which will be chosen automatically on later logins.

While you can only log in with users you've created in Wafer, literally any password will work. That's one of many reasons we don't use Wafer in production.

## But How Do I Make Objects?

Log into the Tree of WOE and look around. You can create and edit [in-game objects](./woe_workflow.md) here.
