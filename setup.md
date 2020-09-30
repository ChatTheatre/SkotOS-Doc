---
title: Setting Up SkotOS
layout: default
---

* [Installing SkotOS on a Production VPS Server](setup_vps.md)

You'll want some kind of source directory for cloning SkotOS, DGD and similar tools. I'll refer to it as ${SRCDIR} here, but you can call it what you like.

First, let's clone some repositories:

* `git clone git@github.com:ChatTheatre/SkotOS.git ${SRCDIR}/SkotOS`
* `git clone git@github.com:dworkin/dgd.git ${SRCDIR}/dgd`
* `git clone git@github.com:ChatTheatre/orchil.git ${SRCDIR}/SkotOS`
* `git clone git@github.com:ChatTheatre/websocket-to-tcp-tunnel.git ${SRCDIR}/SkotOS`

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

## How Do I Log In?

(NOTE: THIS DOES NOT WORK YET!)

That's okay, but how do you log in? You're going to need a user. And unfortunately, we don't have a UserDB available (yet).

Open up SkotOS/skoot/usr/UserDB/sys/userd.c. You're looking for a function called create(), which will look like this:

```
static
void create() {
   users  = ([ ]);
   emails = ([ ]);
   purged = ([ ]);
   banned = ([ ]);
   staff  = ([ ]);

   compile_object("/usr/UserDB/obj/user");

   SAMD->register_root("UserDB");

   set_object_name("UserDB:Daemon");
}
```

We're going to add a line at the bottom, plus a new function:

```
  set_object_name("UserDB:Daemon");

  /* Add line at the bottom */
  call_out("add_dev_user", 0);
}

void add_dev_user() {
    object new_user;
    string new_user_name;
    new_user_name = "bobo"; /* username */
    /* password, email address */
    new_user = "/usr/UserDB/sys/userd"->make_user(new_user_name, "bobo_password", "bobo@gmail.com");
    new_user->start_trial_month();
    "/usr/UserDB/sys/userd"->add_staff_user(new_user_name);
}
```
