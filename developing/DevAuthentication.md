# SkotOS UserAPI, UserDB, DevUserD and Authentication

SkotOS is an old codebase, rich in alternatives and duplication. Common activities have been done in more than one way over the years, and authentication is no exception. However, a rework in March of 2021 significantly reduced the authentication methods for ChatTheatre/SkotOS. Older methods are documented below, but labelled as removed. If you're working on other SkotOS codebases you're likely to encounter these other authentication methods which are no longer included in ChatTheatre's SkotOS code.

## Thin-Auth - the Production Authentication Server

There's a program called [Thin-Auth](https://github.com/ChatTheatre/thin-auth) written in PHP that will manage your accounts for you. Full setup instructions are [on its GitHub page](https://github.com/ChatTheatre/thin-auth) but you'll need to run MariaDB, Apache, PHP and a couple of PHP servers to use it. It also wants to be at a very specific location in your file system. I don't recommend it for development for these reasons.

To use Thin-Auth, you'll normally need at least these components:

* thin-auth itself - you'll need to run this via PHP and Apache
* restartuserdb.sh - this is an admin script that will keep server-control.php and server-auth.php running
* keep_authctl_running.sh or userdb-authctl - a shim server that connects to server-control, server-auth and DGD and acts as a connection between them
* DGD - DGD will connect to the PHP servers via userdb-authctl for any logins, including serving HTTP pages that require login

### thin-auth

While the [GitHub Readme](https://github.com/ChatTheatre/thin-auth) is pretty good, [you can also see a Linode Stackscript that configures thin-auth](https://github.com/ChatTheatre/SkotOS/blob/master/deploy_scripts/stackscript/linode_stackscript.sh) if you like.

Thin-auth is a fairly ordinary PHP application running on top MariaDB. Most of its configuration difficulty is because it has a lot of moving pieces and/or because it wants specific things (like files) to be in specific places.

### server-control.php, server-auth.php, restartuserdb.sh

These two are servers running a custom SkotOS protocol for user and authentication commands. They can verify logins, but also create users, ban users and otherwise manipulate user data.

SkotOS on DGD runs the same protocol outgoing (via UserAPI) to connect to these servers. At one time SkotOS games used an incoming version where the DGD server ran the User database. That code no longer appears to work in that mode, though it's hard to be sure.

By default, these will log to /var/log/userdb.log if it exists and they can write to it. The logfiles are fairly verbose, which is great when you're trying to debug them.

If you run restartuserdb.sh, it will check the two PIDs for the servers and write that it's doing so to the logfile as a sort of constant heartbeat.

### userdb-authctl, keep_authctl_running.sh

Since both SkotOS's UserAPI and thin-auth's PHP servers expect ***incoming*** connections, something has to make those connections. userdb-authctl makes them.

keep_authctl_running.sh is a script to check if userdb-authctl is running and re-run it if it isn't. It is normally configured in production to run once per minute via the "skotos" user's crontab.

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

The basic logging statements don't seem to reliably happen on reconnect. Not sure why.

## The AuthD and CtlD Servers

Originally there was a component inside SkotOS itself called the UserDB. A SkotOS server (appears to have) contained its own user information. That doesn't make it easy to make a single SkotOS.net account and log into all the games, though. Some vestiges of local information, such as the UDat structures, still persist from this time.

Shortly afterward there was UserAPI, a method to make authentication requests (via AuthD protocol) and requests to view or modify account information (via the very similar CtlD protocol) to an external server. Then multiple SkotOS games could share a single set of accounts, and things like StoryPoints and subscriptions could be shared by all SkotOS games. One SkotOS server (a game, effectively) would have all the accounts and other SkotOS servers could authenticate from it. The UserAPI is the preferred method to let a SkotOS server authenticate via some other external server to this day. But the server ***receiving*** the requests is no longer a SkotOS DGD server.

Now there is Thin-Auth, a straightforward PHP web application that managed accounts and subscriptions in a fairly normal way. It also happened to run two servers, "server-control" and "server-auth", which mimicked the Auth and Ctl ports from older SkotOS servers, speaking the same network protocol but turning it into database requests to interface with the PHP web application.

Soon (I hope, possibly) there will be another authentication server which *also* speaks that same network protocol but has an even simpler underlying implementation.

The AuthD and CtlD protocols are nearly identical except for the specific operations they support. You can see an example of ***receiving*** AuthD and CtlD requests in thin-auth -- there is also older DGD-based code to do so which may be removed soon. You can see code that ***makes*** AuthD and CtlD requests in UserAPI, under skoot/usr/UserAPI/sys/authd.c and skoot/usr/UserAPI/sys/ctld.c.

There are a number of different operations in the AuthD and CtlD wire protocols, some of them now obsolete. There is not a good central list of them except for the auth server implementations.

## AuthD and CtlD Wire Protocol

There are two message formats, at least for AuthD -- specifically, Thin-Auth has a format ("the secureAuth format") that it uses for its own AuthD (but ***not*** for its CtlD) which DGD-based clients currently do not use.

Here is the "secure" format, used only by Thin-Auth to query its own AuthD:

~~~
: uname code command seq [additional arguments per-command, if any]
~~~

The format that DGD emits (and that Thin-Auth uses for CtlD) is similar:

~~~
command seq uname [additional arguments per-command, if any]
~~~

The secure format re-sends the keycode with every message and validates it, essentially. That's not security against an attacker &mdash; not only are both formats allowed at any time, the AuthD and CtlD servers are ***absolutely not*** defended in any useful way against attack. You should keep them firewalled at all times, as the production deploy does.

For these lines, "uname" is the user's account name, URL-encoded. Seq is a sequence number, which is echoed back with the result -- that way if DGD sends four or five different commands, it can easily tell which one a given response belongs to. And "command" is one of a small, fixed set of strings for different operations of the AuthD and CtlD.

If you'd like to observe DGD's wire protocol, you can ask AuthD to log messages sent and received to the global syslog:

~~~
code "/usr/System/sys/syslogd"->set_debug_level("/usr/UserAPI/sys/authd", 2)
~~~

That's pretty verbose. So when you're done, turn it off again by calling the same code and specifying "0" rather than "2" as the debug level.

### userdb-authctl and the "userdb" File

Here's a slightly odd thing: for historical reasons, DGD does not like making outgoing connections. The UserDB/AuthD/CtlD all started as DGD implementations, and expected incoming connections. Even UserAPI, designed to speak to an external UserDB, expects incoming connections.

As a result, thin-auth expects a small shim server to make connections to its socket servers and to DGD, allowing both of them to receive an incoming connection.

One consequence of this is that the "userdb" file, used to configure SkotOS for an external UserDB, no longer contains useful information. DGD won't be making an external connection to the hostname and port number contained in that file &mdash; instead, it will wait for userdb-authctl to make an incoming connection to it. So the file only (until the UserAPI rework) indicates that such an incoming connection is expected. After the UserAPI rework, such an incoming connection will ***always*** be expected and the userdb file is no longer useful or significant &mdash; it may be removed entirely.

## Removed: DevUserD - the Low-Level Interface and the Crufty Development-Only Option

DevUserD was used for the wiztool login, for low-level access for DGD developers. It also could be used in local development for all authentication, even though it was insecure and finicky. But it didn't need a separate UserDB server.

To use DevUserD as a primary auth method, you'll need to somehow bootstrap your first user into devuserd.c. You can find old code to do this in the Git history of mac_setup.sh and the Linode stackscript. If you roll your own, you'll need to do it for yourself.

To use DevUserD, you'll also want to make sure you do ***not*** have "standalone" in your instance file. And don't include a "skoot/usr/System/data/userdb" file - you have no UserDB. See "UserAPI Modes" for details.

When using DevUserD, DGD does a trivial little md5 hash of your username and password to check if it's correct. MD5 is an old algorithm and this method is quite insecure by now.

When people tell you to use a "code" incantation in the wiztool containing "set_password", this is the method they're setting the password for. That method no longer does anything in ChatTheatre SkotOS, which uses normal user passwords for developers too.

Historically DevUserD has been used for developer login so that login is still possible even if the auth server fails and can't be restarted - having a simple local auth mechanism is a sort of failsafe even if the external auth server goes down. It's clear why that was once desirable, but at this point it has outlived its usefulness: a weird, janky DGD-based method that few people clearly understand is *not* usually going to be more reliable than an external dependency at this point...

## Removed: UserAPI Modes

The SkotOS authentication system had three modes you could configure it in - in the Git history before March of 2021, see skoot/usr/UserAPI/lib/authapi and/or search all of skoot for LOCAL_USERDB for how that's implemented.

These are the three modes:

* LOCAL_USERDB: this is the normal production mode, where an AuthD and CtlD server are used. To use it, add a skoot/usr/System/data/userdb file to tell SkotOS where to find the AuthD and CtlD server.

* LOCAL_THEATRE: this is the DevUserD-only mode described above where no AuthD or CtlD are used. To configure this mode, do not add a userdb file and make sure skoot/usr/System/data/instance contains the word "standalone" on a line by itself.

* LOCAL_LOCAL: I have never gotten this mode working, nor have I spoken with anybody who has claimed to do so. It is a local standalone mode of some description, but it's not clear the code still works. To use this mode, do not add a userdb file and do not include the word "standalone" in your instance file.

## Removed: Staff "Jonkichi" Server Auth

There was an alternate auth system written in Merry, with a lower-level DGD wrapper around it (/usr/Jonkichi/initd.c) which was used for some staff/developer authentication, and in a standalone auth mode that seems to have been nonfunctional as of late 2019.

This used md5 hashing and local WOE storage of user information.

The Jonkichi object is still used for a number of APIs and for general Merry implementations of commands and APIs. But we're attempting to remove the auth API in favour of current non-DGD methods that can use more secure hashing.

## Removed: Second Internal Auth Server

In addition to the (very old) embedded UserDB authentication, there was a much smaller Auth DGD object in /usr/System/sys/authd.c, which seemed to be used only by a "populate" script in Zell's home directory.

This was a tiny self-contained auth object in the style of DevUserD, but less developed.
