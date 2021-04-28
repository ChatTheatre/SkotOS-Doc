---
title: Setting Up SkotOS Locally
layout: default
---

When you first get started, you'll want to set up a SkotOS server locally on your Mac computer, and/or possibly on a networked server.

* [Installing SkotOS on a Production VPS Server](setup_vps.md)
* [Linode Development Workflow](Developer/LinodeWorkflow.md)

See also: [Exploring SkotOS](Developer/Exploring_SkotOS.md)

## Plain SkotOS vs SkotOS Games

SkotOS is a game library, not a game. So you'll want to install something that uses SkotOS, not "just SkotOS." The obvious choice is [The Gables](https://github.com/ChatTheatre/gables_game).

For other SkotOS-based games you should check their README to see how to install them. There should normally be a local install script based on SkotOS's Mac setup script, and also a Linode-or-similar script to set up a VPS server.

Most SkotOS-based games will have a deploy_scripts subdirectory with a mac/setup.sh script and a Linode stackscript - and possibly others.

For The Gables, the Linode script is called gables_stackscript.sh.

## How Do I Log In? (Dev/Web Edition.)

Once you've run the appropriate dev scripts, go to http://localhost:2072. You should see a very simple interface including a "Play" link and a "Tree of WOE" link. The "Tree of WOE" is a builder interface to create and edit in-game objects (see [WOE objects](Story_Builder/woe_workflow.md)).

Click the "Play" link.

Go ahead and create a body, which will be chosen automatically on later logins.

By default, Wafer will let you use literally any account name and assume it's a staff/developer account. That's one of many reasons we don't use Wafer in production. For production, you should use the [VPS Setup](./setup_vps.md) documentation rather than the local-dev documentation. It installs a much more reasonable authentication server.

## How Do I Log In? (Dev/Admin Edition)

If you're a DGD user or doing [deep SkotOS exploration](Developer/Exploring_SkotOS.md), you're probably interested in logging in via [the Wiztool](Developer/SkotOS_Wiztool.md).

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

See [Exploring SkotOS](Developer/Exploring_SkotOS.md) for more details on things you can do from here.

## Setup Notes

SkotOS contains a "just plain SkotOS" install script. But then there's no game. However, SkotOS-based apps use that to set up SkotOS dependencies and then run their own games on top.

The rest of this page is about what's in that script. The setup script will always be at least as up-to-date as this page, and usually more up-to-date.

There's a requirement you'll need to do for yourself (see SSH keys below) but most developers have already done it and the setup script will check it for you.

### Requirement for Local Setup: SSH Key Registered With GitHub

Do you have an SSH key? Check \~/.ssh/ and see if you have an id_rsa.pub file.

If you don't, you'll need to create one:

```
$ ssh-keygen -t rsa -f ~/.ssh/id_rsa
$ ssh-add -K ~/.ssh/id_rsa
```

If you haven't already added your SSH key to GitHub, you'll need to do that. Pop over to "https://github.com/settings/keys", click "New SSH Key" in the upper right, and paste the contents of your public key (\~/.ssh/id_rsa.pub) into the text box.

If you have no SSH key registered with GitHub, the setup script is going to fail and tell you to do this.

## Running Locally: Workflow

Once you have SkotOS installed and running, what's next? The Mac setup script should start a DGD server and websocket relays so that you can play. It should show a terminal window with DGD's logfile. And after a lengthy first compile, it should open a browser window so you can create a character and play.

You should be able to click the "Play" link to create a character and play, or the "Tree of WOE" link to go to an object building interface.

### Local Workflow: The Game

Once you're into the game, you can use text commands. Type "exits" to see how you can leave a particular room. You can "go north", abbreviated to just "north", to move around. If you see a locked door, you can "+unlock front door" or similar - the "plus" in front of the command is because it's an out-of-character command and those command names start with punctuation. In this case it's a builder command to unlock the door even though you don't have the key.

### Local Workflow: Messing with Objects

The most common changes you'll want to make are to [WOE Objects](Story_Builder/woe_workflow.md), via an editing interface called the Tree of WOE. Look under "Theatre:Theatres", for instance, and you'll find some top-level setup for whatever game you're currently looking at.

WOE objects update immediately. As soon as you edit them in the Tree of WOE they change in the game. You don't have to reload them from source files - and editing in the Tree of WOE won't change source files.

### Local Workflow: Low-Level Development, The Wiztool and Updating Objects

Underneath the browser interface and gameplay commands are some lower-level interfaces. You can "telnet localhost 10098" and log in with the "bobo" account and you'll get to a cryptic, difficult, "you can do anything that's possible but nothing is easy"-type interface. Type "cd /" and "ls" to verify to yourself that commands exist, and then "quit" to get out of there.

This is called the ["wiztool"](Developer/SkotOS_Wiztool.md) interface for weird historical reasons, both for SkotOS and for DGD in general.

If you change a .c or .h file inside SkotOS then you'll need to update it by this interface (or delete skotos.database and do a full restart.)


### Local Workflow: WOE, the Statedump and Updates

So if you can update objects from the Tree of WOE, and those objects come from files on disk but they live in memory, how do the updates work?

SkotOS games use a sort of VM image that stores the in-memory objects. You can load objects on disk into that image. You can update them in memory. And you can save them out to files again. But it's all a pretty manual process.

To save them out to files you log into the wiztool interface and type:

    > code "/usr/System/sys/tool/vault"->save_subdir("")

WOE objects are loaded from the skoot/data/vault directory for plain SkotOS, or from data/vault under your root directory (whatever it's called) for different SkotOS-based games. They're saved back to the same place. Long-term you probably want to keep that under a Git repository so you can dump and update the WOE objects regularly. You don't want to lose your changes!

You can learn more about all this in [Exploring SkotOS](Developer/Exploring_SkotOS.md).

## Installing Manually

The script will install the Homebrew package manager on your Mac if you don't already have it. The steps below are in case you need or want to do it manually. Note that the install script is normally the most up-to-date documentation...

### Script Installation: Homebrew

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

### Script Installation: SkotOS, DGD, Websocket Tunnel

You'll want some kind of source directory for cloning SkotOS, DGD and similar tools. I'll refer to it as ${SRCDIR} here, but you can call it what you like.

First, let's clone some repositories:

```
cd ${SRCDIR}
git clone git@github.com:ChatTheatre/SkotOS.git
cd SkotOS
git clone git@github.com:ChatTheatre/dgd.git
<<<<<<< HEAD
git clone git@github.com:ChatTheatre/wafer.git
=======
>>>>>>> master
git clone git@github.com:ChatTheatre/websocket-to-tcp-tunnel.git
```

### Script Installation: Build the Driver

SkotOS needs a modified build of DGD. It uses more sectors (memory and disk space) than unmodified DGD will accept. We would also like to support more than 255 simultaneous users, which also requires modification. DGD has compile options to fix this, but you'll need to use them. Similarly, DGD only allows outgoing network connections if they have been requested during compilation.

[Here's more about that](Developer/building_dgd_for_skotos.md).

### Doing it Manually: Running Locally

I'll assume you have DGD built. You can put it in your path or just type its location every time you run it. I'm going to write "dgd" in the commands here as though it was in your path.

To start things going from inside your SkotOS directory, run:

```
$ dgd skotos.dgd
```

The first time that SkotOS runs, you should see lots of console output. A new file will appear in your SkotOS directory, `skotos.database`. This is the snapshot of your application. It will let you restore your game if the machine crashes.

When the initial cold boot is done (in about 5-10 minutes,) you should see something like this written to the console:

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

### Restarting the Driver

You should probably kill your driver now using ctrl-c. You'll see messages as it cleanly shuts down and does a statedump. You can now load the snapshot when you start SkotOS like this:

```
dgd skotos.dgd skotos.database
```

You'll know you restored correctly from the backup if you see this on the console:

```
Apr 27 16:25:23 ** info:Reboot completed.
```

### Setting up the HTML Client

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

Current local-dev SkotOS sets up Wafer, an extremely simple and limited authentication server.

Wafer doesn't actually check passwords - it pretends any password is fine. It also doesn't track a lot of normal SkotOS stuff (time played, story points, payments and subscriptions.) See the Linode instructions and/or setup scripts to see how to use thin-auth, an actual authentication server.

Have a look at wafer-users.json. You can copy a user entry here (or rename bobo) to give yourself new users for logging in. If you delete the file it will be re-created with just admin and bobo.
