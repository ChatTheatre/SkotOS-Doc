# Linode Development Workflow

When developing SkotOS and SkotOS-based apps/games on a Linode server, there are particular operations you'll want to accomplish. You may also want to know just how the server was installed.

NOTE: for now thin-auth integration with UserDB is NOT fully working. This means you may need to use devuserd authentication (e.g. user "builder" below) rather than creating a user through the login web UI and thin-auth.

NOTE: all of the ":10080" URLs need to get remapped to something better. Working on it.

## Installation

For Linode, you can use the Linode Stackscript found in SkotOS/dev_scripts/linode_stackscript.sh. Copy it into a StackScript in your account, then launch a new Linode based on it.

You can use the very smallest "Nanode" size for early development, but you'll want a size bigger before long &mdash; or even larger, depending on your number of users or workload. DGD isn't all that memory- or CPU-hungry, but these are very small instances.

You'll need to allocate two DNS names - one for the "client" (the actual DGD game and Orchil) and one for "login" (thin-auth.)

The "deploy user" passwork will be used for the "skotos" deployment user. It will also be the DevUserD password for a staff/wizard DGD user called "builder", and for the DGD "admin" user, and for your MariaDB "userdb" user for thin-auth. All of these things can be changed, but they default to the password you chose.

Once you've installed, you should check to make sure everything is up and running. If your "FQDN Client" name were "skotos-client.mydomain.com" and your "FQDN login" name were "skotos-login.mydomain.com", you would check the following URLs:

* https://skotos-login.mydomain.com/ - this should show a "log in or create a character" UI

Also these: (NOT HTTPS, ONLY HTTP FOR NOW)

* http://skotos-client.mydomain.com/gables/gables.htm&charName=ignored - game client
* http://skotos-client.mydomain.com/gables/TreeOfWoe.html&charName=ignored - builder interface
* http://skotos-client.mydomain.com:10080/SAM/Prop/Theatre:Web:Theatre/Index - body creation
* http://skotos-client.mydomain.com:10080 - list of theatres, links broken

Note that you can't (quite) log into the game client yet. You'll need to create an account and a body. And the "FQDN login" (skotos-login) URL won't work until DGD has finished starting up and thin-auth can talk to it. This will normally take 5-10 minutes for the first boot, and less than one minute for subsequent boots from a statedump file (skotos.database). You can open the DGD server logfile (/var/log/dgd_server.out) and watch for an "info:Boot completed." message if you're impatient.

(NOTE: I'm trying to get thin-auth to work for creating an account here, but it's not fully working yet.)

### Important Security Warning: devuserd Auth and Plaintext Password

*YOUR USER PASSWORD WILL EXIST IN PLAINTEXT INSIDE YOUR DGD DIRECTORY AFTER INSTALLATION!*

You'll really want to fix this. Once you have successfully dumped the DGD state and the file /var/skotos/skotos.database exists, you can "git checkout" the file /var/skotos/skoot/usr/System/sys/devuserd.c to remove the password again. The password will successfully exist inside skotos.database and will no longer be required in a DGD source file.

However, patching it into that source file is how it gets ***into*** skotos.database in the first place.

### Patching

During install, some parts of DGD will be auto-patched.

A user named "builder" will be added with the same password you chose for the "skotos" Unix account. This is in devuserd.c - see the important security warning above about this!

An "instance" file will be created under skoot/usr/System/data/instance to set up access to your SkotOS UserDB, and to let DGD know the DNS name for the game. This file should stay the same. If you blow away these changes then your DGD server will stop using thin-auth and you'll have to log in via devuserd.c. See [Authentication](/Authentication.md) for details of SkotOS's various authentication systems.

## Building

Want to log in as an all-powerful developer? Type "telnet localhost 10098" from inside the Linode VM. Your default initial username is "builder" and the password is the one you entered for the StackScript.

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

