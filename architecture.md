---
title: SkotOS Architecture
---

A SkotOS game, like any other application, has an architecture with many components and layers.

## DGD

Nothing in SkotOS has direct access to anything below [DGD](https://ChatTheatre.github.io/lpc-doc) (such as the os, network interfaces, files outside the LPC root), and all access to OS resources by LPC code must be done through DGD's kernellib and kfun API.

### Inside DGD: Kernellib

The [kernel library](https://ChatTheatre.github.io/kernellib-doc) is the lowest level of software running inside DGD. Originally written by dworkin it has since been modified by skotos engineering staff.

The Kernellib controls access to the outside world (e.g. network connections, files, CPU resources) and manages low-level resources inside DGD (e.g. tracking objects, limiting allocations, security and permissions.)

It provides the driver and auto objects mentioned in the DGD documentation.

### Inside DGD: LPC Code

On top of the klib, SkotOS has its own layer of its LPC code.  This handles such things as basic authentication, bulk, rooms, exits, details, and so on, including the parser.  There are some staff commands implemented directly here.

Different kinds of objects can be cloned for the game, including but not limited to things, verbs, property containers, help nodes, tips, storynuggets, and probably others.  The "type" of an object cannot be changed once cloned.  However, SkotOS's use of data inheritance means that some things can be surprisingly configurable at runtime.

Importantly, the LPC layer also handles compilation and execution of Merry scripts.

This also provides the devuser shell that was probably used by the skotos engineers, and most of the code in this layer was probably written by them.

### Inside DGD: Merry/Woe

This is the layer most familiar to Skotos staff. Merry provides a subset of LPC code with important facilities like properties and signals.

## The Host Machine

The host machine provides normal system resources - memory, CPU and so on. It also provides necessary tools and resources for DGD such as system libraries. The most common deployment platform for SkotOS games is a Linux OS, frequently Debian-based.

### System Libraries and Utilities

Compiling DGD requires certain tools and utilities:

* C++ compiler and support libraries (probably gcc with g++ enabled as well as libstdc++)
* yacc (probably bison)
* make

In addition, the normal SkotOS setup requires other software, including:

* Git
* Node.js
* Apache
* NGinX
