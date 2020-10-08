---
title: Building DGD for SkotOS
layout: default
---

We recommend using the latest DGD in the GitHub repository. You're also going to have to make some code changes.

## How to Build

From an appropriate directory, here is how you would clone and build DGD:

* `git clone git@github.com:dworkin/dgd.git`
* `cd dgd/src`
* `make DEFINES='-DUINDEX_TYPE="unsigned int" -DUINDEX_MAX=UINT_MAX -DEINDEX_TYPE="unsigned short" -DEINDEX_MAX=USHRT_MAX' -DSSIZET_TYPE="unsigned int" -DSSIZET_MAX=1048576 clean install`

This should build an interpreter named "dgd" in dgd/bin/dgd. Go ahead and run it. It should fail with a message about usage, essentially telling you that you have to supply a config filename. Great! You didn't supply the filename, it complained and exited. So it's working.

## Random Notes

On a MacOS X host, "long" means an eight-byte type, not a four-byte type. Try to use "int" (four-byte on both Mac and Linux) or "long long" (eight-byte on both) rather than "long", which varies between them.
