---
title: Exploring and debugging SkotOS
---

SkotOS is deep, complex, and has been worked on by many hands over many years. It's huge, sprawling and fascinating. It ran (and runs!) at least one text game for over 20 years. It has older features in varying states of deprecation, and it has many different implementations of many of its features. Some things don't work. Some things have pretty clearly never worked. There's just a lot there.

And much like an ancient city covered in the jungle, that can make exploration very rewarding! The trick is getting into the interesting parts where you can study, take notes, and find interesting loot.

This guide can help.

## Local Setup

If you've [set up your SkotOS for local development](setup.md), the most important debugging tool is an admin/dev-type account, such as the "admin" and "bobo" accounts in the local setup doc. Note that you're sometimes prevented from logging in as "admin", probably because it's a root-type ultra-privileged account. So you're going to need a non-admin dev account for a lot of this.

You can log into the [telnet and binary ports](SkotOS_Ports.md) as an admin user with almost no other setup. You don't need a body, a production account or all sorts of other things. On the less-fortunate side, you don't ***have*** a body necessarily and you can't easily see what normal users of SkotOS are doing. This is a sort of back-door login for playing with DGD code at the lowest level.

And if you learn DGD from some less complex setting like [eOS](https://github.com/ChatTheatre/eOS), that's good news &mdash; this is the mode that works like you're used to.

Once you've logged in, you have the ability to execute small snippets of code with the "code" command. For instance, if you type `"/usr/System/initd"->shutdown()` then you can shut down SkotOS.

You can use the "compile" command to recompile objects. If you've changed the code, that won't just automatically change the behaviour of the game. You have to compile the program. If you "compile /usr/System/initd", for instance, that will update the code to initd to match the most recent code in the .c file.

## Updating Code and Statedumps

If you restore from a statedump (the skotos.database file), then the code and data comes from that statedump file. If you haven't recompiled your initd after your last changes then it's still not recompiled. Whatever set of users are in devuserd, they're still the same ones after you restore.

This means that changing code in initd can be fiddly. The initd is normally only loaded, and its create() function called, on a new, cold boot. If you update create() for a long-running daemon process like System/initd or System/sys/devuserd, it may never be called again. After all, that object was created long ago. In some sense the initd for Castle Marrach, a long-running SkotOS game, was called over twenty years ago and never will be again.

One alternative is to define a method called patch(). You'll see them in many places. When an object is ***recompiled***, its patch() method will be called. This is done via the SkotOS object manager, registered with the Kernellib.

## Recompiling Code

If you're using the wiztool via the telnet port, the "compile" command has no security restrictions. That's important, because you can't normally just write code to compile objects in the System directory - try it with `code compile_object("/usr/System/initd")` and you'll discover you can't. But cd into /usr/System and type `compile initd.c` and it'll do it without complaint.

## Dumping LPC Objects on The Gables

The live version of The Gables uses slightly different code and data than the checked-in GitHub version. It's essentially the original live source of this information, but needs objects to be appropriately "scrubbed" of things like user data before they can join the public source code.

I've added the vault tool (skoot/usr/System/sys/tool/vault) to The Gables, which permits object dumping for sync'ing with the public code.

To use that tool for dumping objects, you give it an operation and wait for it to complete:

```
code "/usr/System/sys/tool/vault"->dump_single_object("Theatre:Theatres:Gables")
code "/usr/System/sys/tool/vault"->save_subdir("Theatre")
code "/usr/System/sys/tool/vault"->save_subdir("")
```

The final line of code above is a "save everything" instruction. Everything is saved under skoot/data/vault in subdirectories according to registered object names.

Here's what The Gables shows on your network connection when you attempt a full object dump:

```
> code "/usr/System/sys/tool/vault"->save_subdir("")
$37 = nil
> Can't dump Base:Actions, no state root (lpc: /base/sys/actions)
Can't dump Base:DerivedBase, no state root (lpc: /base/sys/base)
Can't dump Base:DerivedDetails, no state root (lpc: /base/sys/details)
Can't dump Base:DerivedInitial, no state root (lpc: /base/sys/initial)
Can't dump Base:Init, no state root (lpc: /base/initd)
Can't dump Core:DerivedCore, no state root (lpc: /core/sys/handler)

> Can't dump Generic:Init, no state root (lpc: /usr/Generic/initd)
Can't dump HTTP:Init, no state root (lpc: /usr/HTTP/initd)
Error dumping :LinkZone:MaleLarge
> Can't dump SID:Daemon, no state root (lpc: /usr/SID/sys/sid)
Can't dump SkotOS:API, no state root (lpc: /usr/SkotOS/sys/api)
Can't dump SkotOS:Assistd, no state root (lpc: /usr/SkotOS/sys/assistd)
Can't dump SkotOS:Merry, no state root (lpc: /usr/SkotOS/sys/merry)
Can't dump SkotOS:Profiler, no state root (lpc: /usr/SkotOS/sys/profiler)
Can't dump SkotOS:Sync, no state root (lpc: /usr/SkotOS/sys/sync)
Can't dump TextIF:Info, no state root (lpc: /usr/TextIF/sys/infod)
Can't dump Theatre:Init, no state root (lpc: /usr/Theatre/initd)
Can't dump Tool:Config, no state root (lpc: /usr/Tool/sys/config)
Error dumping :UserAPI:InitCan't dump UserAPI:UDatD, no state root (lpc: /usr/UserAPI/sys/udatd)
Finished
```

Here are errors from the system log during that same time:

```
Oct  7 07:41:23 ** error:Bad argument 1 for kfun sizeof [caught]
error:     /usr/System/sys/tool/vault
error: 719     -                              work
error: 249     -                              dump_single_object
error:  90     -                              write_object
error:  35     /usr/SID/lib/stateimpex        export_state
error: 242     -                              export_element
error: 242     -                              export_element
error: 249     -                              export_element
error: 175     -                              raw_value
error:  95     -                              execute_call
error:     /base/obj/thing#1759           LinkZone:MaleLarge
error: 548     /base/lib/thing                query_ascii_initial_property
error:  65     /usr/System/lib/sys_auto       mixed_to_ascii
error:     /usr/System/sys/textdata
error: 116     -                              private_to_ascii
error:     /usr/SkotOS/data/merry#-1
error: 273     /usr/SkotOS/data/merry         query_source
error: 164     -                              expand_to_source



Oct  7 07:44:46 ** error:node UserAPI:Init unknown [caught]
error:     /usr/System/sys/tool/vault
error: 719     -                              work
error: 249     -                              dump_single_object
error:  90     -                              write_object
error:  26     /usr/SID/lib/stateimpex        export_state
error:     /usr/SID/sys/sid               SID:Daemon
error: 192     -                              get_root_node
error: 185     -                              get_node
Oct  7 07:44:51 ** debug:memory_watcher: 78 MB in use; 204 MB allocated
```

And you can check vault_error.log, but it will only contain records of the same "can't dump" messages from your console, saying they have no state root.
