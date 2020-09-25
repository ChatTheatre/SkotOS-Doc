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

We recommend using the latest DGD in the GitHub repository.

From an appropriate directory, here is how you would clone and build DGD:

* `git clone git@github.com:dworkin/dgd.git`
* `cd dgd/src`
* `make DEFINES='-DUINDEX_TYPE="unsigned long" -DUINDEX_MAX=ULONG_MAX -DEINDEX_TYPE="unsigned short" -DEINDEX_MAX=USHRT_MAX' clean install`

This should build an interpreter named "dgd" in dgd/bin/dgd. Go ahead and run it. It should fail with a message about usage, essentially telling you that you have to supply a config filename.
