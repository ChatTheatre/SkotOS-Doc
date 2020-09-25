---
title: Setting Up SkotOS
layout: default
---

* [Installing SkotOS on a Production VPS Server](setup_vps.md)

## Local Development

You'll want some kind of source directory for cloning SkotOS, DGD and similar tools. I'll refer to it as ${SRCDIR} here, but you can call it what you like.

First, let's clone some repositories:

* `git clone git@github.com:ChatTheatre/SkotOS.git ${SRCDIR}/SkotOS`
* `git clone git@github.com:dworkin/dgd.git ${SRCDIR}/dgd`

### Build the Driver

SkotOS needs a modified build of DGD. It uses more sectors (memory and disk space) than unmodified DGD will accept. We would also like to support more than 255 simultaneous users, which also requires modification. DGD has compile options to fix this, but you'll need to use them. Similarly, DGD only allows outgoing network connections if they have been requested during compilation.

[Here's more about that](./building_dgd_for_skotos.md).

### Running Locally

I'll assume you have DGD built. You can put it in your path or just type its location every time you run it. I'm going to write "dgd" in the commands here as though it was in your path.

To start things going from your SkotOS directory, run:

```
$ dgd skotos.dgd
```

The first time that SkotOS runs, you should see lots of console output. A new file will appear in your SkotOS directory, `skotos.database`. This is the snapshot of your application. It will let you restore your game if the machine crashes.

When the initial cold boot is done, you should see something like this written to the console:

```
Apr 27 15:10:57 ** info:Boot completed.
```

### Restart the Driver

You should probably kill your driver now using ctrl-c. You'll see messages as it cleanly shuts down and does a statedump. You can now load the snapshot when you start SkotOS like this:

```
dgd skotos.dgd skotos.database
```

You'll know you restored correctly from the backup if you see this on the console:

```
Apr 27 16:25:23 ** info:Reboot completed.
```
