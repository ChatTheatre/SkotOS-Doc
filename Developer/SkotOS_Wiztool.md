# SkotOS Wiztool

# About Wiztool

Each of the games has a "wiztool" port at XX98 (e.g. 10098 for your default setup), which can be used to access a number of functions that sit between the [Layers](../Maintainer/Layers.md) of DGD's Kernel Library functionality, and the underlying SkotOS LPC code that runs the ChatTheatre.

You should rarely need to use this functionality as a maintainer, and you should be aware that you have the opportunity to do basically permanent damage to your server (depending on when/how you do backups, etc.)

## Setting up access to the Wiztool

For your account to be able to access the wiztool, you'll need to make sure your account is marked "developer" or "staff". That's a type of user you can choose in thin-auth, and Wafer (the local-only auth server) will choose staff automatically unless you tell it not to.

You'll also need the correct "access" flag, which is "gables" by default. Again, Wafer will do this for you and you'll need to add it in thin-auth for a VPS-hosted game.

## Accessing the Wiztool

From the same machine (your local server, or the VPS server) you can telnet to port 10098 (with the [default portbase](./SkotOS_Ports.md)). By default the local config will allow you to give any account name and password successfully. By default your VPS installation will allow the "skott" account with the master password you configured in the StackScript. If you change your thin-auth password that will be reflected for the telnet port as well.

So:

    telnet localhost 10098

Or:

    telnet gables.my-subdomain.com 10098

## Wiztool Commands

### > help

```
Available commands in the wiztool:

Coding / compiling / upgrading:
  upgrade   issues    unfreed   leaves    patch     possess   depossess
  command   dbstatus  debug     clones    code      history   clear
  compile   clone     destruct  clonetree inherited inherits

Files / directories:
  cd        pwd       ls        cp        mv        rm        mkdir
  rmdir     ed

Access / resources:
  access    grant     ungrant   quota     rsrc

Miscellaneous:
  people    status    swapout   statedump shutdown  reboot

````
### > access
```
> help access
Command:     access
Synopsis:    access [<user>]
             access <directory>
             access global
Description: Shows what access you or someone else has.
See also:    grant, ungrant
```

### > help code

```
Command:     code
Synopsis:    code <LPC-code>
Description: Allows you to execute LPC code without having to specifically
             create an object, as this has been automated for you.  For your
             convenience the files <float.h>, <limits.h>, <status.h>,
             <trace.h> and <type.h> are automatically included and there are
             26 variables (a..z) of type mixed to use.
See also:    clear, clone, compile, history
```


## Recompiling Code

If you make a local change to your DGD code, by editing it or with "git pull", you'll need to recompile the files individually.

To compile a concrete (non-library) DGD object, you'll cd into its directory and use the compile command. So to compile skoot/some/path/obj/here.c, you'd type:

    cd /some/path/obj
    compile here.c

For a library you'll instead need to "upgrade" it, which will recompile all objects that depend on it.

#### Storypoints Grant Access

(Note: this is for SkotOS games that use StoryPoints.)

This will allow you to grant story-point-granting permissions to certain staff accounts:

This allows you to list current SP granters:

> code "/usr/TextIF/sys/storypoints"->query_accounts() 
$171 = ({ "alice", "bob" })
You can add people by referencing that return value ($171):

> code "/usr/TextIF/sys/storypoints"->set_accounts($171 + ({ "charlie" }))
$172 = nil
You can similarly remove people:

> code "/usr/TextIF/sys/storypoints"->set_accounts($171 - ({ "bob" }))
$172 = nil
Or you could just bypass all of that and create a totally new list of people:

> code "/usr/TextIF/sys/storypoints"->set_accounts(({"charlie", "dan"}))
$172 = nil


