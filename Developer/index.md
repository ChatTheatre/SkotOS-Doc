---
sort: 10
---
# Developing in DGD for SkotOS

SkotOS exists in various layers. You have the operating system, the host computer (or virtual personal server, or...), the operating system and the interpeter (DGD) underneath SkotOS. You have the network, web browsers and so on that run on the user's side. You have high-level StoryBuilder layers like MERRY and SAM for coding the story.

And then you can write code in DGD's dialect of LPC, a dynamic language that looks a lot like old-style C. The lowest levels of SkotOS itself are written in DGD, and the people who write in it are often called "developers" to distinguish them from [other roles like StoryBuilders](../Basics/Roles.md).

Documentation at this level is harder to find. There's a [ChatTheatre DGD and LPC documentation](https://chattheatre.github.io/lpc-doc/) site which can help. You can learn low-level "raw" DGD [from at least one online book](https://noahgibbs.github.io/self_conscious_dgd/).

But SkotOS is basically a large, long-lived application written in DGD. Like most old applications, it has a lot of code and a lot of conventions about how to write that code.

## Some Pages for Developers

* [WOE For Developers](./WOEForDevelopers.md)
* [Commands for Developers](./CommandsForDevelopers.md)
* [Authentication for Developers](./DevAuthentication.md)
* [Exploring SkotOS](./Exploring_SkotOS.md)
* [Linode Workflow](./Linode_Workflow.md)
* [SkotOS Port Numbers](./SkotOS_Ports.md)
* [the SkotOS Wiztool](./SkotOS_Wiztool.md)
* [the SkotOS Instance File](./instance_file.md)

## How Do I Learn to Do This?

Becoming a developer isn't the easiest thing. DGD is (arguably) an easier language to learn than C, probably similar to Java or Rust, and harder than Ruby or Python.

If you already know MERRY then you have a good head start &mdash; MERRY is built on top of DGD and has a lot of the same data structures and control structures.

If you don't already know any other languages, DGD isn't going to be the easiest to learn. The community has always been small. There aren't many web pages that mention it. Online resources are fairly scarce.

You ***should*** read ChatTheatre's documentation sites, but there's only so much there.

So: you might consider learning another language, maybe something dynamic like Ruby or Python, as preparation. You should definitely play around in MERRY and get a feel for it.

But probably the easiest thing to do is to start in MERRY and dig downward when you need to. DGD looks a bit different than MERRY, but a lot of those differences don't matter if you're just fixing a small bug or adding a small feature. And once you've looked at a few DGD files, you'll start to recognise the structure that's different from MERRY &mdash; inherits, functions, variables and so on.

Like most skills, there's a progression to it. Like most skills, some things are much easier than others. Like most skills, it can be hard to tell at a distance which is which, so don't be shy about trying new things, and abandoning them if they're too hard.
