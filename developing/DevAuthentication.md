# SkotOS UserAPI, UserDB, DevUserD and Authentication

There are two major forms of authentication used by SkotOS. One is used in development locally, while the other is primarily for production-style deployment on a VM.

## DevUserD - the Development-Only Option

If you don't configure a userdb at all, you can use a local DGD object in your DGD server for all your user and authentication needs. It's finicky and insecure, but it has very few moving pieces.

To use DevUserD, you'll need to somehow bootstrap your first user into devuserd.c. [You can find instructions here](../setup.html).

You'll also want to make sure you do ***not*** have "standalone" in your instance file. And don't configure a "usr/System/data/userdb" file - you have no UserDB.

In this mode, DGD does a trivial little md5 hash of your username and password to check if it's correct. MD5 is an old algorithm and this method is quite insecure by now.

## UserDB Authentication - the Production-Only Option

There's a program called [Thin-Auth](https://github.com/ChatTheatre/thin-auth) written in PHP that will manage your accounts for you. Full setup instructions are [on its GitHub page](https://github.com/ChatTheatre/thin-auth) but you'll need to run MariaDB, Apache, PHP and a couple of PHP servers to use it. I don't recommend it for development for these reasons.

Here's a starting list of components:

* thin-auth itself - you'll need to run this via PHP and Apache
* restartuserdb.sh - this is an admin script that will keep server-control.php and server-auth.php running
* keep_authctl_running.sh or userdb-authctl - a shim server that connects to server-control, server-auth and DGD and acts as a connection between them
* DGD - DGD will connect to the PHP servers via userdb-authctl for any logins, including serving HTTP pages that require login

### thin-auth

While the [GitHub Readme](https://github.com/ChatTheatre/thin-auth) is pretty good, [you can also see a Linode Stackscript that configures thin-auth](https://github.com/ChatTheatre/SkotOS/blob/master/dev_scripts/stackscript/linode_stackscript.sh) if you like.

Thin-auth is a fairly ordinary PHP application running on top MariaDB. Most of its configuration difficulty is because it has a lot of moving pieces and/or because it wants specific things (like files) to be in specific places.

### server-control.php, server-auth.php, restartuserdb.sh

These two are servers running a custom SkotOS protocol for user and authentication commands. They can verify logins, but also create users, ban users and otherwise manipulate user data.

SkotOS on DGD runs the same protocol outgoing (via UserAPI) to connect to these servers. At one time SkotOS games used an incoming version where the DGD server ran the User database. That code no longer appears to work in that mode, though it's hard to be sure.

By default, these will log to /var/log/userdb.log if it exists and they can write to it. The logfiles are fairly verbose, which is great when you're trying to debug them.

If you run restartuserdb.sh, it will check the two PIDs for the servers and write that it's doing so to the logfile as a sort of constant heartbeat.

### userdb-authctl, keep_authctl_running.sh

Since both SkotOS's UserAPI and thin-auth's PHP servers expect ***incoming*** connections, something has to make those connections. userdb-authctl makes them.

***BUG: Right now (27th Jan 2021), my modified userdb-authctl for SkotOS on Linode doesn't seem to be logging. The file redirection seems to simply not write output into /var/log/userdb-authctl.txt. It's not clear why. The same user can echo into the file. The same user can get output when running on console. But something does not want to log to that file.***

### SkotOS UserAPI

In skoot/usr/UserAPI/, there are a number of interesting entities.

* UserAPI/lib/auth_api.c - objects that inherit this can use its functions to query user info via AuthD
* sys/authd.c - this entity handles DGD-side requests for authentication. Requests, timeouts and the basics of protocol live in this object.
* sys/authd_port.c - this watches for incoming connections on port PORTBASE + 70 and sends auth requests to the oldest of them.
* sys/ctld_port.c - this watches for incoming connections on port PORTBASE + 71 and sends ctld requests to the oldest of them.
* obj/authd_tcp.c - this is the code for each authd connection. Any connection (not just the oldest) will forward input to sys/authd_port.c. I'm not sure anything sends data initially, so presumably this would only work for replies.
* obj/ctld_tcp.c - like authd_tcp, but for ctld.

You can show more debugging information by setting debug log levels in certain components. For instance:

```
code "/usr/System/sys/syslogd"->set_debug_level("/usr/UserAPI/sys/authd", 2)
```

The Debug() and XDebug() log statements will only show up in the log if the debugging log level is high enough &mdash; 1 or 2 for Debug or XDebug respectively. Anything above 2 has no effect beyond setting it to 2.

The basic logging statements don't seem to reliably fire on reconnect. Not sure why.
