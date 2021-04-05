# SkotOS-Doc

SkotOS, from ChatTheatre, is a suite of tools for making text-based games. If you want to ***play*** a SkotOS-based game, you can make an account on [Castle Marrach](https://www.marrach.com/), [The Eternal City](https://www.eternalcitygame.com/), [https://allegoryofempires.com/](https://allegoryofempires.com/) and/or [Multiverse; Revelations](https://home.multirev.net/).

But if you want to ***build*** a SkotOS-based game, this is a good place to start.

SkotOS runs primarily in a dynamic game-development language called [DGD](http://www.dworkin.nl/dgd/). There are also miscellaneous scripts and tools in other languages including Node.js and PHP &mdash but the game is mostly in DGD, while other tools are in appropriate other languages.

SkotOS is a game-building library, not a game. [The Gables](https://github.com/ChatTheatre/gables_game) is an example (tiny) game built on SkotOS. It's a great place to start from as you use this documentation.

## Looking Around?

What's a SkotOS game like? Why would you want to build or run one? [Why would a ***text game*** be worth running for twenty years?](Basics/Why_Text.md)

* [Logging into The Gables](Basics/Prod_Gables.md) - a basic SkotOS game you don't need to run for yourself
* [Basic SkotOS commands](Basics/Commands.md)
* [What's a Story Builder? (SkotOS roles)](Basics/Roles.md)

## Ready to Build?

Here's a variety of developer documentation to show you the architecture, setup and concepts behind a SkotOS game. It's aimed at showing you the ropes as you build your game initially. You're also going to need to dive into the code

* [Setting up to build on SkotOS (local Mac)](./setup.md) [(on Linode/VPS)](./setup_vps.md)
* [SkotOS Architecture](./architecture.md)
* [SkotOS WOE Objects and Workflow](./woe_workflow.md)
* [Exploring SkotOS](./Exploring_SkotOS.md)
* [SkotOS Builder Docs](./Story_Builder/) &mdash; including MERRY and SAM docs

## Maintaining a SkotOS Game?

This is a grag-bag of documentation from commercial SkotOS games, including the ones still running.

It could use a proper reorganisation.

This can show you what a successful game could expand to if all goes well. MUDs have historically needed a bit more [hierarchy and management](Basics/Roles.md) than you'd expect because they're normally run by volunteers, not by a small number of paid, dedicated employees. That means it's important to give out privileges carefully, and to know who does what.

* [Maintenance](./Maintenance.md)
* [Authentication](./Authentication.md)
* [SkotOS Wiztool](./SkotOS_Wiztool.md)
* [Staff_Plus_Commands](./Staff_Plus_Commands.md)
* [StoryBuilder Documentation](./Story_Builder/)

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

