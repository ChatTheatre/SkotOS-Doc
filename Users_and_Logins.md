---
title: Users and Logins
---

SkotOS has many different layers of users and logins, just as it has [many layers]() more generally. And how they work is affected by whether you're working in [local mode](Local_Mode.md)...

## DevUserD and the Lowest-Level Users

If you've used [DGD](https://ChatTheatre.github.io/lpc-doc) or [eOS](https://ChatTheatre.github.io/eOS-Doc), you're familiar with a low-level, fairly simple system of users, probably involving registering a UserD &mdash; that is, a user-managing object, referred to as a User Daemon.

[SkotOS has one of those](https://github.com/ChatTheatre/SkotOS/blob/master/skoot/usr/System/sys/devuserd.c), but it's normally only used if you're logging in on the lowest-level, most raw interfaces, such as the [Telnet Port or Binary Port](Skotos_Ports.md) (portbase + 98 and portbase + 99, respectively.)

## UserDB and Regular Users

Depending on your [Local Mode](Local_Mode.md) settings, most users would ordinarily log in at a different level than your Dev users. In production mode they are completely separate.

## Other Ports and How DGD Handles Users

DGD allows a different object to be assigned management for each port. Some objects, like SkotOS's HTTPD, will further delegate some of that management. As a result, a "user" as referred to in DGD's code may be quite different from what you or I would call a user when we talk to each other.

But keep in mind that authentication and input handling are very different on SkotOS's [various other ports](SkotOS_ports.md).
