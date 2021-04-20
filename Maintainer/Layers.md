# Layers of the SkotOS Server

For a full comprehension of the SkotOS software stack, please also refer to [ChatTheatre's LPC Docs](https://ChatTheatre.github.io/lpc-doc).

## DGD Layer

Nothing in SkotOS has direct access to the hardware or OS, including network sockets not listed in the DGD configuration file, or files outside the DGD root directory. All access to OS resources by LPC code must be done through DGD's kfun ("kernel function") api.

Not only is DGD a programming language, it's a fairly restrictive one. Many operations that would be allowed in a random general-purpose language like C or Python aren't allowed in DGD. DGD is more like Javascript &mdash; it's designed to "sandbox" code that isn't fully trusted into only being able to do what it should.

## Kernel Library Layer (a.k.a. klib or kernellib)

The kernel library sits between DGD and the rest of SkotOS. The Kernel Library provides [the Driver and Auto objects](https://noahgibbs.github.io/self_conscious_dgd/20_AutoDriver.html) mentioned in DGD documentation. It also provides security, [resource limits](https://noahgibbs.github.io/self_conscious_dgd/16_Rlimits.html), quotas and a lot of other low-level operations.

The kernel library is extremely low-level, even from the point of view of developers.

### Kernel Library Security: Creators

Most of the security provided by the klib is enforced by functions in the auto object masking kfuns in dgd, such as anything to do with files or objects.

One key part of an object is its creator, which is the owner of the file the object was compiled from. The object's creator determines many of its privileges.

The System creator has unique privileges from the klib, including being able to inherit libraries from the kernel library (apart from the auto object of course), call certain functions in the klib, and override certain privilege checks that apply to other creators.

Please refer to the kernel library's documentation for further information.

Creators and owners can be real people, or game modules.

The admin user is given the ability to back-door using the first binary port listed in the config file, provided their password in the klib shell (located in /kernel/data) is enabled.

### Kernel Library Security: Owners

All objects in the klib are owned.  Master objects are owned by their creators, while clones are owned by the object that cloned them.

The klib forbids kernel objects from being cloned or destructed except by other kernel objects, and forbids objects from destructing other objects that do not have the same owner, unless the destructing object has the System creator.

### Kernel Library: Resources

Many things are optionally limited.  Ticks, stack space, callouts, objects, and other things can be given a quota which is enforced on a per-creator basis by the klib.

## LPC Layer

On top of the klib, SkotOS has its own layer of its LPC code. This handles authentication, bulk, rooms, exits, details, and so on, including the parser. Some staff commands are implemented directly as LPC code.

Line for line, most of SkotOS is written in DGD's LPC, and written primarily by Skotos Tech engineers.

Different kinds of objects can be cloned for the game, including but not limited to things, verbs, property containers, help nodes, tips, storynuggets, and probably others.  The "type" of an object cannot be changed once cloned.  However, SkotOS's data inheritance means that some things can be surprisingly configurable at runtime.

Importantly, the LPC layer also handles compilation and execution of [MERRY scripts](../Story_Builder/MerrySystem.md).

The LPC layer interfaces with lower levels like the Kernellib via code like the DevUserD, [which implements the Wiztool](../Developer/SkotOS_Wiztool.md).

## Merry, SAM and WOE

Above the LPC level is the level [most familiar to StoryBuilders](../Story_Builder/). At this level, [WOE objects](../Story_Builder/woe_workflow.md) are the norm, and code is written in [SAM](../Story_Builder/QuickSummarySAMSystem.md) or [MERRY](../Story_Builder/MerrySystem.md).

## Outer Layers: the Web Server and the Browser

SkotOS's underlayers go all the way down to the operating system. And from there, they also go out to the user's browser.

[SkotOS opens network sockets](../Developer/SkotOS_Ports.md) for various reasons. And some of those sockets are for players to play the game and for creators to use the Tree of WOE to create new in-game objects and locations.

SkotOS uses a game-specific protocol called Alice on its TextIF port. It's possible, but very inconvenient, to directly open that port and type commands. Older SkotOS game clients (e.g. Zealotry) would provide an interface to the player and then connect to that port directly.

The current web-based client called [Orchil](https://github.com/ChatTheatre/orchil) uses a simple web-based UI and connects to the Alice port via a [Node.js-based relay](https://github.com/ChatTheatre/websocket-to-tcp-tunnel) and a websocket.
