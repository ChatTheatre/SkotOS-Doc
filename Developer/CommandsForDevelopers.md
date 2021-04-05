# Commands for Developers

Are you a software developer and you're looking for more details? There are several different ways commands are implemented. For the high-level overview, you can also [read the basic description of commands](../Basic/Commands.md).

A bit of vocabulary:

* TextIF is the name of the overall system of in-game commands
* ALICE is the name of the over-the-wire protocol that it speaks on the socket
* Neoct is the [MERRY](../Story_Builder/LanguageExplanation.md)-based system of SkotOS verbs
* MerAcHa is the system that allows MERRY verbs to get registered to handle actions; it works with Neoct verbs

Highly relevant files include:

* [The network connection object that reads ALICE and translates to TextIF calls](https://github.com/ChatTheatre/SkotOS/blob/master/skoot/usr/TextIF/obj/user.c) - it also handles "possession", where a network connection takes over a body that doesn't originally belong to it, such as a Story Host making a cat do plot-relevant things
* [The main command-parsing object that dispatches to different command parsers](https://github.com/ChatTheatre/SkotOS/blob/master/skoot/usr/TextIF/main.c)
* [All the command parsers themselves](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/usr/TextIF/sys/parser) - the command parsers correspond to different forms and levels of commands
* [Files describing how to parse the various command grammars](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/usr/TextIF/grammar/) - these commands are in a SkotOS specific grammar/parser format
* [The big directories of social verbs and adverbs](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/data/vault/Socials)

Note that commands can be, and often are, embedded at any of these levels.

## Deep Down in DGD

A few commands are implemented all the way down in the wire protocol. For instance, [that's how deep the understanding that "n" means "go north" is](https://github.com/ChatTheatre/SkotOS/blob/master/skoot/usr/TextIF/obj/user.c#L793). You can change them, but only down in the deepest layers of the game, far below the [WOE objects](../woe_workflow.md). Similarly, the idea that punctuation commands are only available to specific types of users? [It's that deep](https://github.com/ChatTheatre/SkotOS/blob/master/skoot/usr/TextIF/main.c#L165).

There are also a few random @-verbs like "@profile", "@help", "@tip" and "@page" that are [randomly buried that deep](https://github.com/ChatTheatre/SkotOS/blob/master/skoot/usr/TextIF/main.c#L262). But most verbs are implemented in [MERRY, a SkotOS built-in game language](../Story_Builder/LanguageExplanation.md) which is a sub-dialect of DGD's LPC language.

There are some random TextIF [built-in verbs](https://github.com/ChatTheatre/SkotOS/blob/master/skoot/usr/TextIF/main.c#L327) that look still usable... But also like they're long-obsolete and there are better ways to do those things now. If it's still possible to use them at all, it may be time to change that.

## Command Parsers

The various [command parsers are written in DGD](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/usr/TextIF/sys/parser) and some of them hardcode commands. There are also [grammar files in a SkotOS grammar format](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/usr/TextIF/grammar/).

Randomly: you can find DGD implementations of old [skill, study and teach commands](https://github.com/ChatTheatre/SkotOS/blob/master/skoot/usr/TextIF/sys/cmds/study_teach.c). It's a bit of a curiosity, one file off by itself.

## Social Verbs

A lot of verbs communicate that you said or did something, but they don't have any other effect. You can yawn, giggle, gibber, and so on, and other than showing a message it doesn't really ***do*** anything. These are called "social" verbs, or occasionally "soul" verbs for historical reasons related to ancient MUDs.

There's a [huge nested directory of XML files that defines nearly all of them](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/data/vault/Socials/Verbs). The XML defines what prepositions they permit for direct and indirect objects, whether the verb is audible, private, out-of-character and so on. Also the imperative, first and second-person versions of the verb, since the game will need to be able to display all of those in most cases.

Similarly, there's a [giant list of adverbs, in files by first letter, sorted alphabetically](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/data/vault/Socials/AdvCats/Evokes).

## Punctuation Verbs (Copied from Command Basics)

Verbs that are just words are in character: "say", "yawn", "hiccup".

Verbs that start with an @ are out-of-character but can mostly be used by anybody: "@who", "@allow".

If you work on the game itself (story builder, story teller, developer, staff) you can use verbs that start with +. "+unlock", "+traits", "+obname". Some of them require an object, just like other verbs: "+traits my trousers". There isn't usually online help on these in the help system. But if you type the verb by itself it will often give usage information.

Storyguides get commands with a ! in front ("guide commands.") Storyhosts, "honoured guests" and up get commands with + ("host commands" or "dev commands.")

## MERRY Verbs

Verbs that do something to in-game objects need a bit more flexibility than the Social verbs allow, but usually not as much flexibility as the deep-in-DGD verbs take for themselves. Most verbs are best with ***some*** framework (not raw DGD) but not as restricted as socials.

For example, [here's a verb to fill a container](https://github.com/ChatTheatre/SkotOS/blob/master/skoot/data/vault/Shared/neoct/base/consumables/%252Bfill.xml). It's meant for storyhosts, storybuilders, devs and so on since it starts with + (that percent-two-b is a plus sign, HTTP-encoded.) You can see MERRY code in there, along with notes, comments, help text and so on. That kind of thing is the preferred way to make a verb. You can edit it in the Tree of WOE since it's a WOE object &mdash; that specific verb is under Shared:neoct:base:consumables if you go looking for it in the UI.

MERRY-based verbs seem to hide in a lot of different places in the Tree of WOE and are often specific to individual SkotOS games. [Here is a variety of social and non-social verbs](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/data/vault/S7-Neoct) broken down into a typical-ish set of directories.

If you're trying to hunt down all the Neoct verbs, you can search for /usr/SkotOS/obj/meracha - these verbs are clones of that object, which is how they get registered to be used by actual users typing into a TextIF socket. MerAcHa is short for "MERRY Action Handler."
