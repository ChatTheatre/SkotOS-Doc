---
title: The SkotOS Instance File
---

The instance file is one of SkotOS various settings files. It can normally be found at skoot/usr/System/data/instance.

Here's a typical example:

```
portbase 10000
hostname localhost
bootmods DevSys Theatre Jonkichi Tool Generic SMTP UserDB
textport 443
real_textport 10443
webport 10080
real_webport 10080
url_protocol https
access gables
memory_high 128
memory_max 256
statedump_offset 600
freemote +emote
```

Each of those is a setting.

## UserDB File (Obsolete)

It used to be important to have a userdb file at skoot/usr/System/data/userdb to let SkotOS know to use UserAPI to contact a UserDB. As of March 2021, that's no longer used. Well before that, the settings inside weren't used - SkotOS expected an incoming connection and would use it, so it didn't worry where it came from.
