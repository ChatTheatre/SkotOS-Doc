# Linode Development Workflow

When developing SkotOS and SkotOS-based apps/games on a Linode server, there are particular operations you'll want to accomplish. You may also want to know just how the server was installed.

NOTE: eventually all of the ":10080" URLs need to get remapped to something better. Working on it.

## Installation

For Linode, you can use the Linode Stackscript found in SkotOS/dev_scripts/linode_stackscript.sh. Copy it into a StackScript in your account, then launch a new Linode based on it.

You can use the 2GB next-to-smallest Linode size for early development, but you'll want a size bigger before long &mdash; or even larger, depending on your number of users or workload. DGD isn't all that memory- or CPU-hungry, but these are very small instances. I see MariaDB die from low memory on Nanode-sized instances even with minimal load, so I do not recommend them.

You'll need to allocate two DNS names - one for the "client" (the actual DGD game and Orchil) and one for "login" (thin-auth.) I recommend doing this as you create the Linode, if possible. DNS propagation can be annoying, so don't create it with a different IP address earlier. And some processes like to make sure their allocated DNS name works, so it's not a good idea to just not create them.

### The Boot Process

When you first start your Linode, it will be setting up all kinds of infrastructure from web servers to websocket tunnels to DGD itself. This takes time.

The output of the Linode setup script will be in \~root/standup.log.

After that, the DGD game server will take some time, around ten minutes, to boot up. You can find its logfile in /var/log/dgd_server.out. There will be a "boot complete" message when it's done. Any port-10080 URL is going to be unstable or not available until DGD is booted and ready.

Here's what the successful end of that output looks like in /var/log/dgd_server.out:

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

### Accounts, Passwords and URLs

The "deploy user" password will be used for the "skotos" deployment user &mdash; that is, on your Linode there will be a Unix user called "skotos" with that password. The same password will also be the DevUserD password for a staff/wizard DGD user called "skott", and for the DGD "admin" user, and for your MariaDB "userdb" user for thin-auth. All of these things can be changed, but they default to the password you chose. The passwords don't all have to stay the same, but they are by default.

If you go to your FQDN login URL, you should see a login interface. The username "skott" with your deployment password should get you in as an admin user with a fake email address. If you click "Play Game" it should take you to the game interface. There is also a "Tree of WOE" URL for a builder interface.

(NOTE 19th Jan 2021: the click-through isn't currently working. Working on it.)

Some relevant URLs:

* http://skotos-client.mydomain.com/gables/TreeOfWoe.html&charName=ignored - builder interface
* http://skotos-client.mydomain.com:10080/SAM/Prop/Theatre:Web:Theatre/Index - body creation
* http://skotos-client.mydomain.com:10080 - list of theatres, links broken

### Important Security Warning: devuserd Auth and Plaintext Password

*YOUR USER PASSWORD WILL EXIST IN PLAINTEXT INSIDE YOUR DGD DIRECTORY AFTER INSTALLATION!*

You'll really want to fix this. Once you have successfully dumped the DGD state and the file /var/skotos/skotos.database exists, you can "git checkout" the file /var/skotos/skoot/usr/System/sys/devuserd.c to remove the password again. The password will successfully exist inside skotos.database and will no longer be required in a DGD source file.

However, patching it into that source file is how it gets ***into*** skotos.database in the first place.

Later you can create DGD admin characters from your first admin character, using the "code" command.

## Email and Setting Up Accounts

By default, your Linode isn't allowed to send email. You'll need to file a customer service ticket with Linode if you want that to work. Here's how you can set up accounts without email:

The account creation process will mostly work, though it might say the email failed. But the account will be created correctly otherwise.

There is an account-approval page that will let your admin account approve new accounts without them having to click on the email successfully. It's at /support-mail.php from your Login URL.

If you want to do it automatically, there is a table called "email_ping" in database userdb. To verify an email, you can also just delete its row from email_ping and it will count as verified.

## Building

Want to log in as an all-powerful developer? Type "telnet localhost 10098" from inside the Linode VM. Your default initial username is "skott" and the password is the one you entered for the StackScript.

## Debugging

### Updating Source Files

Let's say you've made a change to a DGD source file. Good! Now, how do you make it work? The old compiled code is still in memory (and/or skotos.database). So how do you use something new?

If it's one source file, log in to the telnet port (telnet localhost 10098) with an admin user (e.g. "builder", with the password you originally configured.) Then cd into the appropriate subdirectory of "skoot" and compile the file. If the file is called foo.c, you'd type "compile foo.c". That will replace the old "foo" object with the one you just modified if all goes well.

Now the next time the statedump happens, the new skotos.database will also have your modified version. If you restore from an older statedump, though, you can lose your changes.

### Logfiles

The DGD server logs both standard output and standard error to '/var/log/dgd_server.out'. The DGD server can be configured to log all HTTP accesses but it's slow, and the logfile has to be under /var/skotos/skoot, which you usually don't want.

Thin-auth logs to /var/log/apache2/user-access.log and /var/log/apache2-user-error.log. The "undefined index" notices are normal and not a sign of misconfiguration. The checks for wp-login.php and installer.php are malevolent spambots trying to hack your site, but the files they're looking for don't exist &mdash; so no harm done.

The Apache portion of the client site logs to /var/log/apache2/client-error.log and client-access.log. The NGinX portion of it logs to /var/log/nginx/error.log and access.log.

The socket relays log to files in /var/log/tunnel.

