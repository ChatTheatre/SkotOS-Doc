---
title: Building DGD for SkotOS
layout: default
---

We recommend using the latest DGD in the GitHub repository. You're also going to have to make some code changes.

## Code Changes

In DGD's dgd/src/config.h, you're going to need to change a few constants. Here's what they are:

<pre>
diff --git a/src/config.h b/src/config.h
index c7338852..a70f91bb 100644
--- a/src/config.h
+++ b/src/config.h
@@ -46,8 +46,8 @@ typedef EINDEX_TYPE eindex;
 # define EINDEX(e)     ((eindex) e)

 /* sizeof(ssizet) <= sizeof(uindex), best kept at 16 bits */
-typedef unsigned short ssizet;
-# define SSIZET_MAX    USHRT_MAX
+typedef unsigned long ssizet;
+# define SSIZET_MAX    ULONG_MAX

 typedef unsigned short kfindex;
 # define KFTAB_SIZE    1024
@@ -84,7 +84,7 @@ typedef unsigned short kfindex;
 /* interpreter */
 # define MIN_STACK     5       /* minimal stack, # arguments in driver calls */
 # define EXTRA_STACK   32      /* extra space in stack frames */
-# define MAX_STRLEN    SSIZET_MAX      /* max string length, >= 65535 */
+# define MAX_STRLEN    1048576 /* max string length, >= 65535 */
 # define INHASHSZ      4096    /* instanceof hashtable size */

 /* parser */
</pre>

You'll also need to configure a few things that don't need code changes, just command-line options. You'll see more about those below.

## How to Build

From an appropriate directory, here is how you would clone and build DGD:

* `git clone git@github.com:dworkin/dgd.git`
* `cd dgd/src`
* `make DEFINES='-DUINDEX_TYPE="unsigned long" -DUINDEX_MAX=ULONG_MAX -DEINDEX_TYPE="unsigned short" -DEINDEX_MAX=USHRT_MAX' clean install`

This should build an interpreter named "dgd" in dgd/bin/dgd. Go ahead and run it. It should fail with a message about usage, essentially telling you that you have to supply a config filename.
