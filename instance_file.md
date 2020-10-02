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
access jonkichi
memory_high 128
memory_max 256
statedump_offset 600
freemote +emote
```

Each of those is a setting.

## UserDB File

In a separate file, normally skoot/usr/System/data/userdb, you'll get different settings. Note that that file may not be present, depending what [Local Mode](Local_Mode.md) your SkotOS is configured for. If the file is present, here are typical contents:

```
userdb-hostname 127.0.0.1
userdb-portbase 2000
```

The hostname is the host that should be running the UserDB. The "portbase" is a bit like SkotOS's own [portbase](Skotos_Ports.md). The AuthD port should be at portbase + 70 (e.g. 2070 for this file) and the CtlD port should be at portbase + 71.
