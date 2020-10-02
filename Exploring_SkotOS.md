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
