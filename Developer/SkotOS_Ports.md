---
title: Skotos Ports
---

SkotOS opens a number of interfaces to its userbase, various services, intrepid explorers and the world at large. Let's talk about them.

## Portbase

A given instance of SkotOS starts at a "portbase", normally a big multiple of 1000, such as 3000, 6000 or 9000. It isn't ***required*** to be a multiple of 1000, but it makes the mental math easier.

Out of the box, [ChatTheatre's SkotOS on GitHub](https://github.com/ChatTheatre/SkotOS) is configured with a portbase of 11000.

Other ports are given relative to the portbase. For instance the Telnet Port is at portbase + 98, so out of the box you would telnet to local port 11098 to get to it. On a different instance with a portbase of 6000, you would telnet to port 6098 to get to it.

You can set the portbase in the [instance file](Instance_File.md).

## skotos.dgd

Your DGD configuration file specifies where to find these ports. But it will need to agree with the LPC code that opens the ports. If you change any of the port numbers, including the portbase, you'll need to update your skotos.dgd file to match.

Here's an example section of skotos.dgd:

```
telnet_port     = ([ "*": 11098 /* Telnet */ ]);
binary_port     = ([ "*": 11099, /* DGD-style Binary */
                     "*": 11017, /* UserAPI::Broadcast */
                     "*": 11070, /* UserDB / AuthD as server */
                     "*": 11071, /* UserDB / CtlD as server */
                     "*": 11080, /* webport */
                     "*": 11089, /* DevSys::initd - some kind of HTTP port? */
                     "*": 11090, /* WOE / Tree of Woe */
                     "*": 11091, /* DevSys::ExportD for exporting XML objects */
                     "*": 11443 /* TextIF */ ]);
```

One advantage of skotos.dgd is that it can show you all the ports you have open. If it's not listed in DGD's configuration file, it's not open.

Your skotos.dgd file may be generated via dgd-tools and the dgd-manifest command, if you're using them.

## Telnet Port, Binary Port

If you've used DGD in other situations, you're probably used to there being "a telnet port and a binary port." The telnet port is usually more convenient, and respects terminal niceties like not showing your password when you type it and colour-able output.

In SkotOS, those are ports portbase + 98 (telnet) and portbase + 99 (binary). They used to have their own user management, but as of March 2021 they should allow login for (only) accounts with the correct access flag via the normal UserDB mechanism (thin-auth in production.)

Admin is prevented from logging in via the binary port - it's the only account allowed to login via telnet port, and it can *only* log in via telnet port.

## TextIF Port

The SkotOS web interface (Orchil, etc.) and its predecessors run using an old text-based protocol called Alice, after the original client that ran it. It's fairly readable, though you wouldn't normally have users read it directly.

Port pb+443 speaks Alice, and is where the web client normally talks to.

The TextIF port is managed by various programs under skoot/usr/TextIF.

When using Orchil, there's a gateway from websockets to the Alice TextIF port.

## Webport

This is described as being for HTTP and remote players. pb + 80.

When DGD is serving random web pages, this is the port it usually does that on.

## Woeport

The "Tree of Woe" is a builder interface, allowing storybuilders to create and edit new objects and code in the world.

DGD's port pb+90 is the Woe port, used for this purpose.

## UserDB - AuthD and CtlD

DGD expects exactly one incoming connection per port, one each for AuthD (pb + 70) and CtlD (pb + 71).

The UserAPI interface makes requests on those incoming connections to (it hopes) an external UserDB like thin-auth or wafer.
