---
title: Setting Up SkotOS
layout: default
---

* [Installing SkotOS on a Production VPS Server](setup_vps.md)

You'll want some kind of source directory for cloning SkotOS, DGD and similar tools. I'll refer to it as ${SRCDIR} here, but you can call it what you like.

First, let's clone some repositories:

```
cd ${SRCDIR}
git clone git@github.com:ChatTheatre/SkotOS.git
git clone git@github.com:dworkin/dgd.git
git clone git@github.com:ChatTheatre/orchil.git
git clone git@github.com:ChatTheatre/websocket-to-tcp-tunnel.git
```

## Build the Driver

SkotOS needs a modified build of DGD. It uses more sectors (memory and disk space) than unmodified DGD will accept. We would also like to support more than 255 simultaneous users, which also requires modification. DGD has compile options to fix this, but you'll need to use them. Similarly, DGD only allows outgoing network connections if they have been requested during compilation.

[Here's more about that](./building_dgd_for_skotos.md).

## Running Locally

I'll assume you have DGD built. You can put it in your path or just type its location every time you run it. I'm going to write "dgd" in the commands here as though it was in your path.

To start things going from your SkotOS directory, run:

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

### The Web Client Code

You already checked out orchil, above. We'll be using it. First pop over into that directory and we'll make a profiles.js to use...

```
cd orchil
vi profiles.js
```

Now here's what should be in it:

```
"use strict";
// orchil/profiles.js
var profiles = {
        "portal_gables":{
                "method":   "websocket",
                "protocol": "ws",
                "server":   "localhost", //"chat.gables.chattheatre.com",
                "port":      10800,
                "woe_port":  10802,
                "path":     "/gables",
                "extra":    "",
                "reports":   false,
                "chars":    true,
        }
};
```

### NGinX on a Mac

Homebrew, by default, will put your NGinX setup in /usr/local/etc/nginx/.

You'll need to create a new file in /usr/local/etc/nginx/servers/skotos_nginx.conf:

```
# skotos_dev_nginx.conf

# Websocket-based client connection for incoming port 10800, via relay at 10801 to TextIF at 10443
map $http_upgrade $connection_upgrade {
    default upgrade;
        '' close;
        }

upstream gables {
    server 127.0.0.1:10801;
}

server {
    listen *:10800;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    location /gables {
      proxy_pass http://gables;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $connection_upgrade;
    }
}

server {
    listen 10900 default;

    root /Users/noah/localsrc/dgd/orchil/;   # Or your own file location

    location / {
        try_files $uri $uri/ =404;
    }
}
```

You can test your configuration to make sure it's okay:

```
nginx -t
```

Now start NGinX:

```
sudo nginx
```

Now you should be able to connect. Point your web browser at "http://localhost:10900/gables/gables.htm". You'll be prompted in your browser for a user, a password and a character name. You don't have any of those, so you'll get a bad hash (that is, wrong password) and you'll be disconnected.

## The Authentication Server

It's possible to set up thin-auth to handle authentication. Realistically, it may be easier to remove than set up... It's heavily hardcoded to run at a specific location on the drive, and seems ***very*** specific to SkotOS' needs.

Standalone mode seems not to work at all. Local non-standalone seems to work, though!

## How Do I Log In? (Dev/Admin Edition)

SkotOS has a non-standalone mode (a.k.a. LOCAL_LOCAL) which permits developer users to log in directly using the developer credentials. Of course, it has no way that I've found to add these users from outside the running server if you don't already have any of them.

Open up SkotOS/skoot/usr/System/sys/devuserd.c. You're looking for a function called create(). Here's the end of it:

```
   /* become managers for kernel functionality */
   USERD->set_telnet_manager(0, this_object());
   USERD->set_binary_manager(0, this_object());

   user_to_wiztool = ([ ]);

   user_to_hash = ([ ]);

   set_object_name("System:Developers");
}
```

We're going to add a couple of lines:

```
   /* become managers for kernel functionality */
   USERD->set_telnet_manager(0, this_object());
   USERD->set_binary_manager(0, this_object());

   user_to_wiztool = ([ ]);

   user_to_hash = ([ ]);
   user_to_hash["admin"] = to_hex(hash_md5("admin" + "adminpassword"));  /* ADD THIS LINE */
   user_to_hash["admin"] = to_hex(hash_md5("bobo" + "bobopassword"));  /* ADD THIS LINE */

   set_object_name("System:Developers");
}
```

"Admin" is a highly-privileged dev user. And you can pick its password, which above is "adminpassword". The other use can be called anything you want -- I picked "bobo" above, but it doesn't matter.

(You're going to have to restart and do the long reboot again, I'm afraid. If you restart from a statedump then the InitD doesn't get created again. So this only works if you're cold-booting, no skotos.database on the command line.)

Start DGD, and you now have the ability to log in as bobo (but not admin) on the telnet port. Go ahead and telnet in:

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

## How Do I Log In (Dev/Web Edition.)

Or you can point your browser at localhost:10900/gables/gables.htm, as you did above. You're going to need to enter a (useless, ignored) username, password and character name... And then you'll get an actual development-user login. You can give the name "admin" and the password you chose ("adminpassword" if you just copied the line in.)

And now you have a working account on your running server.

Of course, it's asking you to choose a body and you don't have one yet...

## How Do I Log In? (Web Edition)

There's a nice login page available: http://localhost:10080/SAM/Prop/Theatre:Web:Theatre/Index

As long as you're in LOCAL_LOCAL mode, as described above, you should be able to log in with your dev credentials for this login as well!

And that will take you to... an empty list of theatres. There isn't one here yet. Hm.

## INCOMPLETE WORK

And from here, the hard part is matching these up. We have an outermost start (the login form) which leads partway to where we want to go (the incorrect list of theatres), but not all the way to where we want to be (the Gables client and successful login.)
