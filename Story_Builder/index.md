---
sort: 5
---
# SkotOS Story Building

Story Builders create in-game objects and systems. In the [heirarchy of SkotOS roles](../Basics/Roles.md), they're far more technical than players, but weild less power than low-level developers. There's a ***lot*** of room within the Story Builder role to create whole new game systems, verbs, and even some amount of the game's "physics."

The systems below are often written by Story Builders, and everything here is at least used by Story Builders. A Developer should know about this world, even Developers who focus more on the lowest levels.

## Tutorials and Starters

The hardest part of a new system is often just... starting. Getting in and getting a feel for it. How can you do that with SkotOS? Here are some starting points.

* [Your First Week with SkotOS](../FirstWeek/)
* [Learning the Ropes](./Getting_Started/Learning-the-Ropes.md)
* [Merry Lesson One](./Tutorials_and_Examples/Merry/MerryLesson1.md)
* [Traits Tuturial](./Tutorials_and_Examples/Building_Objects/Traits_Tutorial.md)

## In-Game Systems

* WOE objects: [Overview](./Tree_of_Woe/woe_workflow.md) [Some Important WOE Objects](./Tree_of_Woe/Key_Woe_Objects.md)
* [Things, /base/obj/thing and UrThings](./SkotOS_Objects/ThingsAndUrThings.md)
* [Consent System](./In-Game_Systems/ConsentSystem.md)
* Description System: [Quick Summary](./Getting_Started/DescriptionSystemQuickSummary.md) or [In-Depth Details](./In-Game_Systems/DescriptionSystem.md)
* Detail System: [QuickSummary](./Getting_Started/DetailSystemQuickSummary.md) or [In-Depth Details](./In-Game_Systems/DetailSystem.md)
* [The Movement System](./In-Game_Systems/MovementSystem.md)
* [The Proximity System](./In-Game_Systems/ProximitySystem.md)
* [Staff +Commands](./The_Parser/Staff_Plus_Commands.md)
* [Shared Objects and the Proof System](./Plugins/SharedObjectsAndProofSystem.md)
* [The Sync System](./Plugins/SyncSystem.md)

## SAM and MERRY

Most SkotOS in-game building happens in SAM, the markup language of SkotOS, and in MERRY, the scripting language of SkotOS. There are a number of systems built on top of both, and you're likely to build on top of them yourself.

Both, especially MERRY, interact extensively with WOE objects.

* [SAM and MERRY: the Two SkotOS Languages](./SkotOS_Languages/LanguageExplanation.md)
* [SAM Quick Summary](./Getting_Started/QuickSummarySAMSystem.md)
* [How to Write SAM Tags](./Tutorials_and_Examples/SAM/HowToWriteSAMTags.md)
* [SAM Technical Details](./SkotOS_Languages/SAM_Language/SamIntro.md)
* [Properties and Values](./SkotOS_Objects/Object_Types/Standard_Object/PropertiesAndValues.md)
* [The Signal System](./In-Game_Systems/SignalSystem.md)
* [The Merry System: a Technical Summary](./Getting_Started/MerrySystem.md)
* [Tips on Writing Merry](./SkotOS_Languages/Merry_Language/MerryTips.md)

## Skotos Builders Twiki (TODO: convert more)

There's lots of interesting stuff still in the TWiki, and some of it's clearly worth converting. Here are some starting points for further conversion:

* http://skotos-wiki.marrach.com/twiki/bin/view/Builders/MerryDebugging
* http://skotos-wiki.marrach.com/twiki/bin/view/Builders/HowToDocuments
* http://skotos-wiki.marrach.com/twiki/bin/view/Builders/MerryIntro
* http://skotos-wiki.marrach.com/twiki/bin/view/Builders/StoryBuilderToolkitDocuments
* http://skotos-wiki.marrach.com/twiki/bin/view/Builders/
