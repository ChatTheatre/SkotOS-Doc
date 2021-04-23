# SkotOS - Build Your Own Virtual Theatre

SkotOS, from ChatTheatre, is a suite of tools for making text-based games. If you want to ***play*** a SkotOS-based game, you can make an account on [Castle Marrach](https://www.marrach.com/), [Allegory of Empires](https://allegoryofempires.com/) and/or [Multiverse; Revelations](https://home.multirev.net/).

But if you want to ***build*** a SkotOS-based game, this is a good place to start.

SkotOS runs primarily in a dynamic game-development language called [DGD](http://www.dworkin.nl/dgd/). There are also miscellaneous scripts and tools in other languages including Node.js and PHP &mdash but the game is mostly in DGD, while other tools are in appropriate other languages.

SkotOS is a game-building library, not a game. [The Gables](https://github.com/ChatTheatre/gables_game) is an example (tiny) game built on SkotOS. It's a great place to start from as you use this documentation.

([The Eternal City](https://www.eternalcitygame.com/) was a Skotos Tech game, and is still running and you can play it. But it wasn't built on this engine. [Lots of other games](./Games.md) were.)

## Thinking About Starting?

What's a SkotOS game like? Why would you want to build or run one? [Why would a ***text game*** be worth running for twenty years?](Basics/Why_Text.md)

Once you've pondered those questions, you might want to create an account on [Castle Marrach](https://www.marrach.com/) to see a working SkotOS game in action. Or you might want to [log into The Gables](Basics/Prod_Gables.md) and see what's in a SkotOS mini-stage, and roughly what you'd get right out of the box.

And what if you decide to build a SkotOS-based game.

[What would your first week of building a SkotOS game be like?](FirstWeek/index.md)

## Ready to Build?

Don't skip that [First Week](FirstWeek/index.md) section. But after that, you'll want [more StoryBuilder docs](Story_Builder/index.md) on ***so many*** topics...

These will show you the architecture, systems and concepts behind a SkotOS game in more detail.

* [Setting up to build on SkotOS (local Mac)](./setup.md) [(on Linode/VPS)](./setup_vps.md)
* [SkotOS Architecture Quick Overview](./architecture.md)
* [SkotOS WOE Objects and Workflow](Story_Builder/woe_workflow.md)
* [Exploring SkotOS](./Developer/Exploring_SkotOS.md)
* [SkotOS Builder Docs](./Story_Builder/index.md) &mdash; including MERRY and SAM docs

Also, check out the sidebar on the left. Sometimes it's easier to scroll through lots of topics than to drill down into sub-categories.

## Maintaining a SkotOS Game

We also keep [documentation about maintaining your SkotOS game](./Maintainer/) once you've set it up.

* [Maintenance](Maintainer/Maintenance.md)
* [Authentication](Maintainer/Authentication.md)
* [SkotOS Wiztool](Developer/SkotOS_Wiztool.md)
* [Staff_Plus_Commands](Story_Builder/Staff_Plus_Commands.md)

## Writing DGD-Side Code?

Documentation at this level has a more do-it-yourself feel. DGD's LPC is a programming language, and a lot of DGD problems are programming problems.

There's a [ChatTheatre DGD and LPC documentation](https://chattheatre.github.io/lpc-doc/) site which can help. There's also a bit of [SkotOS-specific DGD documentation](Developer/index.md) on this site, including:

* [Commands for Developers](Developer/CommandsForDevelopers.md)
* [Authentication for Developers](Developer/DevAuthentication.md)
* [Exploring SkotOS](Developer/Exploring_SkotOS.md)
* [Linode Workflow](Developer/Linode_Workflow.md)
* [Unit Tests and Continuous Integration](Developer/UnitTests.md)

* [... the Developer docs index ...](Developer/index.md)

## SkotOS Classic

A few folks may be here, not to build a game, but because you heard about a twenty-year-old mass of glorious untamed built-by-volunteers digital wilderness and ruins, on top of a frankly bizarre dynamic language that few people ever braved.

That description is [SkotOS Classic: a glorious wilderness of really amazing stuff built by volunteers, in all sorts of states of repair](./SkotOS_Classic.md). Through the magic of Git, we can retain that beautiful wilderness for you to explore, even as we build a well-manicured amusement park out of its best parts.

Note that a lot of older SkotOS code, including both SkotOS Classic and SkotOS games that weren't part of that release, are being moved into other [ChatTheatre](https://github.com/ChatTheatre) repositories. Not everything wants or needs to be part of the core game-building library that everybody uses for every game.

## Copyright & Status

Unless otherwise noted, the contents of this repository as declared public domain using the Creative Commons "No Rights Reserved" [CC0 Declaration](https://creativecommons.org/share-your-work/public-domain/cc0/).

### CC0 Declarations

Under US law it is a bit more difficult to declare something public domain (see [article](https://www.techdirt.com/articles/20150123/15564629797/why-we-still-cant-really-put-anything-public-domain-why-that-needs-to-change.shtml)). Creative Commons offers a [CC0 tool](https://creativecommons.org/choose/zero/) that combined with GPG signed commits to this repository, helps with this issue.

The following parties have declared their contributions to this repository as public domain:

* Noah Gibbs

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <a rel="license"
     href="http://creativecommons.org/publicdomain/zero/1.0/">
    <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" />
  </a>
  <br />
  To the extent possible under law,
  <a rel="dct:publisher"
     href="https://codefol.io">
    <span property="dct:title">Noah Gibbs</span></a>
  has waived all copyright and related or neighboring rights to
  <span property="dct:title">Skotos-Doc repository</span>.
This work is published from:
<span property="vcard:Country" datatype="dct:ISO3166"
      content="UK" about="https://github.com/ChatTheatre/eOS-Doc">
  United Kingdom</span>.
</p>

## Contributing

This repository is intended as a "working documentation", which means that we are actively seeking documentation and proposals for improvements of all kinds.

We require that before any first PR from a contributor to this repository can be accepted, either their first commit must be GPG signed and it must either a general update to this README.md with a CC0 disclaimer as above, or every commit must contain a comment that include a similar CC0 disclaimer, which can be obtained from [Creative Commons CC0](https://creativecommons.org/choose/zero/).

