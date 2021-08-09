---
sort: 1
---

# SAM and Merry: The Two Skotos Languages

(*or: What Are Hobbits Doing Here?*)

The Skotos Developer Interface allows you to do much of the work of creating an online game.  You can describe rooms, objects, people, and whatever else you might want to fill your game world with. The problem is, however, it's totally static.

Sure, you can create some objects that do things. Lots of them, actually. You can create swords that cut and clothes that can be worn and pouches that can hold stuff. But, if you want to make anything that varies in any way from the standard objects, you're stuck.

The engineers behind the Skotos system do their engineering work in one of two programming languages--C or LPC. This is partially available to all developers as MERRY. However, some developers might prefer using the simpler SAM system for simple, dynamic descriptions.

## SAM: Skotos Active Markup

Master Samwise is the simplest of the Skotos languages. Its primary purpose is to allow for variable output of text. With SAM, a description might appear differently to different characters, to people with different skills, or just randomly. SAM is most often used to modify descriptions, such as briefs, looks, and examines. However, over time it's expanded so that it can be used in other places.

SAM can also be used to change things when a certain text is read. (Inevitably, this causes variable output of text too, but it's a long term thing.) For example, whenever someone read a sign you could mark that they'd seen that sign, then never force them to see that sign again, or curse them, or whatever you want. 

## MERIADOC: Mediated Execution Registry Involving A Dialect Of C

Most developers will not want to use MERIADOC; most engineers will. MERRY is essentially the LPC that most of the complex systems of The Skotos Developer Server are built in, except it's been "sandboxed" to try and prevent Admins.StoryBuilders from accidently destroying the whole world.

MERIADOC allows access to a fairly complete dialect of C, and you can use this language for <i>whatever</i> you want to do. However, if the capabilities of SAM are sufficient, you should strongly consider using them instead.

<i>This documents leaves out discussion of BILBO, the original Skotos programming language. MERRY is a cleaner and more powerful language, and thus we don't suggest BILBO be used except for legacy systems. For legacy purposes only, you can get info on BILBO at the BilboIntro.</i>

**For more information:** [SAM](SamIntro.md) | [Merry](MerryIntro.md)
