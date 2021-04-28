# Linode Installation and Debugging

When developing SkotOS and SkotOS-based apps/games on a Linode server, there are particular operations you'll want to accomplish. You may also want to know just how the [server was installed](./setup_vps.md).

## Debugging

You can see quite a few of the logfiles in realtime if you run /var/skotos/deploy_scripts/stackscript/show_all_logs.sh. This shows the DGD logfile, websocket tunnel logs and auth server logs.

For more granularity about what goes where, keep reading.

### Monitoring the Boot Process

When you first start your Linode, it will be setting up all kinds of infrastructure from web servers to websocket tunnels to DGD itself. This takes time.

The output of the Linode setup script will be in \~root/standup.log. A Manifest-based app like RWOT may also have an additional log (RWOT's: rwot_standup.log) also found in \~root.

After that, the DGD game server will take some time, around ten minutes, to boot up. You can find its logfile in /var/log/dgd/server.out. There will be a "boot complete" message when it's done. Any URL served by DGD (anything after you hit "play") is going to be unstable or not available until DGD is booted and ready.

Here's what the successful end of that output looks like in /var/log/dgd/server.out:

~~~
Jan 19 11:44:55 ** debug:Socials:Verbs:T:tip :: set_disabled(1)
Jan 19 11:44:58 ** debug:Socials:Verbs:W:warp :: set_disabled(1)
Jan 19 11:45:03 ** debug:Ignoring attempt to set combatnode name of /usr/TextIF/obj/combatnode#7943 to NONAME
Jan 19 11:45:05 ** debug:Ignoring attempt to set combatnode name of /usr/TextIF/obj/combatnode to NONAME
Jan 19 11:45:21 ** Finished
Jan 19 11:45:21 ** info: -- /usr/SMTP/initd...
Jan 19 11:45:21 ** info: -- /usr/UserDB/initd...
Jan 19 11:45:21 ** debug:Booting UserDB...
Jan 19 11:45:21 ** info: -- ~UserDB/sys/userd...
Jan 19 11:45:21 ** info: -- ~UserDB/obj/bill...
Jan 19 11:45:21 ** info: -- ~UserDB/sys/ctld...
Jan 19 11:45:21 ** info: -- ~UserDB/sys/authd...
Jan 19 11:45:21 ** info: -- ~UserDB/sys/broadcast...
Jan 19 11:45:21 ** info: -- /usr/Gables/initd...
Jan 19 11:45:21 ** info:Booting Gables...
Jan 19 11:45:21 ** info:Boot completed.
~~~

DGD will also periodically save its state to /var/skotos/skotos.database. When it does that, here's the end of the relevant log message:

~~~
Jan 19 11:46:40 ** info: -- ~UserDB/sys/userd...
Jan 19 11:46:40 ** info: -- ~UserDB/obj/bill...
Jan 19 11:46:40 ** info: -- ~UserDB/sys/ctld...
Jan 19 11:46:40 ** info: -- ~UserDB/sys/authd...
Jan 19 11:46:40 ** info: -- ~UserDB/sys/broadcast...
Jan 19 11:46:40 ** info: -- /usr/Gables/initd...
Jan 19 11:46:40 ** info:Prepared for statedump.
Jan 19 11:46:40 ** info:Global state save complete.
~~~

### DNS in the Boot Process

Here's a bit of a sticking point: you can't assign the IP address to a DNS name until Linode allocates you an instance. But you're going to need to give it a DNS name, because certbot (the HTTPS name certificate setup) requires that.

So how do you do it?

The easy way is to create your Linode instance and then immediately add two DNS entries for the two FQDNs (Fully Qualified Domain Names) you gave them. If you ssh into the instance to watch its setup, you should do it by numeric IP address, not by name &mdash; sometimes if you query a name and find out it doesn't exist, that fact gets cached in intermediate DNS servers. You don't want that.

You also don't want to create the DNS entries with a different IP address and then change it. That can take hours to propagate, which you ***really*** don't want.

Instead, add the two new DNS entries as quickly as you reasonably can after asking Linode to create the new host instance. By the end of the boot process, when Certbot generates a new HTTPS certificate, the names will exist and it should work just fine.

### Accounts, Passwords and URLs

The "deploy user" password will be used for the "skotos" deployment user &mdash; that is, on your Linode there will be a Unix user called "skotos" with that password. The same password will also be the DevUserD password for a staff/wizard DGD user called "skott", and for the DGD "admin" user, and for your MariaDB "userdb" user for thin-auth. All of these things can be changed, but they default to the password you chose. The passwords don't all have to stay the same, but they are by default.

If you go to your FQDN login URL, you should see a login interface. The username "skott" with your deployment password should get you in as an admin user with a fake email address. If you click "Play Game" it should take you to the game interface. There is also a "Tree of WOE" URL for a builder interface.

After you log in as skott, if you hit "play" it should take you to a character creation interface. Note that after creating your character you may need to go back to the login URL and go through again if you're not using a manifest-based app &mdash; there's some difficulty with https and SkotOS right now which can cause bad redirects.

## Email and Setting Up Accounts

By default, your Linode isn't allowed to send email. You'll need to file a customer service ticket with Linode if you want that to work. Here's how you can set up accounts without email:

The account creation process will mostly work, though it might say the email failed. But the account will be created correctly otherwise.

There is an account-approval page that will let your admin account approve new accounts without them having to click on the email successfully. It's at /support-mail.php from your Login URL.

If you want to do it automatically, there is a table called "email_ping" in database userdb. To verify an email, you can delete its row from email_ping (perhaps with a cron job?) and it will count as verified.

## Adding a Dev User

The "skott" account is okay, but you'll want others over time &mdash; especially if there are other developers or staff members. Here are the steps to adding new users:

* Have them create a new account through the normal login URL
* In thin-auth, you can set their account_type to "developer" - also add the appropriate access flag (usually "gables")

## Building

The skott user has both [StoryBuilder](../Story_Builder/) and [Wiztool](../Developer/SkotOS_Wiztool.md) permissions. You can use both.

### Updating Source Files

Let's say you've made a change to a DGD source file. Good! Now, how do you make it work? The old compiled code is still in memory (and/or skotos.database). So how do you use something new?

If it's one source file, log in to the telnet port (telnet localhost 10098) with an admin user (e.g. "skott", with the password you originally configured.) Then cd into the appropriate subdirectory of and compile the file. If the file is called /usr/System/sys/foo.c, you'd type "cd /usr/System/sys" and then "compile foo.c". That will replace the old "foo" object with the one you just modified if all goes well.

If it's a library file (it will have /lib in the path) then you'll need to "upgrade foo.c" instead, which will recompile all objects using that library.

Now the next time the statedump happens, the new skotos.database will also have your modified version. If you restore from an older statedump, though, you can lose your changes.

### Logfiles

The DGD server logs both standard output and standard error to '/var/log/dgd/server.out'. The DGD server can be configured to log all HTTP accesses but it's slow, and the logfile has to be under /var/skotos/skoot (or /var/rwot/.root), which you usually don't want.

Thin-auth logs to /var/log/nginx/access.log and /var/log/nginx/error.log. The "undefined index" notices are normal and not a sign of misconfiguration. The checks for wp-login.php and installer.php are malevolent spambots trying to hack your site, but the files they're looking for don't exist &mdash; so no harm done.

The websocket-to-tcp tunnels log to files in /var/log/tunnel.
