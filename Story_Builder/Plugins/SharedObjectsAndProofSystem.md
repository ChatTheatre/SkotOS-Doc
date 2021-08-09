# Shared Object & Proof System

## Shared Object System

The Shared Objects System is an attempt to create an ever-growing repository of shared things, from clothing to consumables (food and drinks) to furniture or entire systems.

The goal of Shared Objects System is for these objects to become a common core for all things in all games in SkotOS, by to allow customization at every point in the UrHierarchy that allows games to offer unique features, Yet as much as possible simple (so as to not include possibly undesired, extraneous features of any kind). 

Great emphasis is placed on quality of the content in `Shared:*`, and for this reason a lot of effort has gone into making it as easy as possible to ensure the quality of shared objects using `+proof` tools.

To further improve the cooperation between games, a sync system is being introduced into SkotOS, called Sync 2.0, which enables anyone from any game to provide and patch content from their local games, and to then sync their changes out to the rest of the world.

*NOTE: The Sync System is now broken.*

The first pass at the standardizing on Shared objects was for clothing objects used between games beginning around July 2006. 

***NOTE:** Unfortunately in recent years SkotOS games have diverged rather than try to leverage the theoretical ability to allow for every game to customize. So it isn't clear that the current Shared Objects approach really will work for all games the future, or if it was due to other factors like key coders leaving.*

## How to use Shared Objects in your game

The simplest way to start using a shared item is to spawn objects from `Shared:*` up and use them. If you want to be fancy, set their traits to appropriate things (e.g. set "trait:color" to "blue") either using `+setp my shoes "trait:color"` or using the +traits popup `+traits my shoes`.

If you wish to introduce a shared item into your game, do it like you would introduce any item into your game. If you have NPC's which hand out/sell items, well, then give the NPC the item(s) you want in the game, and voilá, there you have it. If you need to customize the object, then simply go into Woe, spawn the item you want, rename it to Yourgame:clothing:shoes (or whatnot) and modify your local copy, then put that in game.

If you wish to submit additions or modifications to  Shared items, then you'd need our help to move the Shared item over to our master copy. This was automatic with `+proposal`, however, has becom broken in recent years. Hopefully in the future you will be able to do this on your own, as using `+proposal` agin, but this is not currently on the roadmap.


## What it does

The biggest advantage with the shared objects are, well, that they are shared. It's a big collection of mostly clothing items (which will continue to grow over time), each item available in all games, and each item confirmed to use the same, underlying core system. A game basing its clothing on the shared core objects  will additionally be able to use any shared object, as is, in their game. Any new items added can also be used, as is, with no modifications required (although modifications are of course always possible to do, at the whim of the game hosts).


## How that is possible

This is handled via the expansion system inherent in the shared system itself. The expansion system expands the UrHierarchy, "weaving in" game-local UrParents at every step in the UrHierarchy. Thus, any item that inherits the Shared:clothing:UrClothingPair is in actuality inheriting Shared:Local:clothing:UrClothingPair, which in turn inherits Shared:clothing:UrClothingPair. By doing it this way, the system lets you put in game-local code or properties into the :UrClothingPair object itself, by simply doing so in the Shared:Local object. 


## What it doesn't do

The shared clothing system does not, and will never, include crafting. While you can customize an item to oblivion via the traits, the shared core will never include systems for actually letting the players do this. There are tools which let a game host alter things easily `+traits` or in the future in some games with a more limited set of choices using the OOC command`@traits`. but these tools do not take into account character skills, or similar. The reason why the shared clothing system will not include this (and other) features is because it is meant to be exclusively about shared objects. The moment we start adding crafting, or any other external system to the core, we are taking away the flexibility of the system itself.

That said, there will over time be many examples to derive your own crafting code from.

-- Main.KalleAlm - 27 Jul 2006 (modifed by @ChristopherA, 18 Aug 2020)

## The Proof System

, The Proof System was created to help staff to make sure that all Shared object meet minimum standards.

To ensure the quality of Shared objects, the proofing system was created to help staff by making it as easy and convenient as possible to proof shared (and non-shared) objects in the SkotOS environment, for for all Shared objects to meet minimum standards.

The proofing system is a set of panes in dynamically generated web pagse which present the proofer with various aspects of an object. The system not only displays the content, but auto-detects potential issues and errors, and informs or advices the user about these issues.


## Notes

## Good shared objects that have been proofed recently:

```
Shared:clothing:ageless:ensemble:rob
Shared:clothing:ageless:ensemble:cassock
Shared:props:tool:food:spoon-silver
```
## Some Useful Links to Wiki archives (required account):

* [Clothing Through time](http://skotos-wiki.marrach.com/twiki/bin/view/Builders/ClothingThroughTime)
* [SyncSystem v2](http://skotos-wiki.marrach.com/twiki/bin/view/Builders/SyncSystemTwo)


### +proof

`+proof` gives you a list of all the unproofed objects in Shared:

`+proof my object` will let you proof that object if it is a properly set up Shared object. Let @ChristopherA know if it isn't properly set up.

*NOTE: that the +proof system is optimized for proofing clothes right now.*

### +shared

`+shared` gives you list of all the proofed objects in Shared.

*NOTE: This isn't quite true, it only shows clothing that has been proofed. So for instance, Shared:props:tool:food:spoon-silver has been +proofed, but now does not show up in either list (`+proof` or `+shared`).*

### +traits

`+traits my object` should allow you to edit the traits of any Shared object

***NOTE:** This seems to only work for clothing objects right now.*

### @traits

This command is available to players to modify themselves or objects in their possession.

A list of traits is stored in the export:traits:adj-map:restricted property along with predefined options for those traits. The options will be displayed in a drop down box.

```
Example
export:traits:adj-map:restricted
([ "color":({ "red", "black", "green", "blue" }) ])
```


## Morphs

A morph is a the spawn of a child object, that has been been given a name using Woe, and only has different default Core:Properties.

*NOTE: there is some other trick to get morphs to show up in the shared list. WIP (a Work In Progress).*

### Proofing a Shared Object

In general focus on the Base:Details, and the default Initial:Property & Core:Property traits: properties in the parent object (not the spawn).

When you make changes in the parent object, if the spawn does not have that description or property, it should just work in the child. However, if you use +traits on the child, it will override what Core:Properties you've set in the parent. If you are creating chains of named child objects, note that Core:Details above will be overriden in children.

### Testing

A good best practice even if you are using the +proof tool is +spawn the object, drop and pickup the item to see if brief is working. Then look, and examine every detail with default traits. Then use the +traits tool to try out every optional trait with both traits that start with a consonant and traits that start with a vowel.


## Old Notes on Shared Objects

```
From:    Kalle Alm <kalle@mortalis.skotos.net>
Reply-To:    List for Skotos Seven developers and their cohorts <skotos-seven@skotos.net>
To:    List for Skotos Seven developers and their cohorts <skotos-seven@skotos.net>
Subject:    [skotos-seven] Shared clothing rev 2.
Date:    Tue, 18 Jul 2006 19:22:44 +0200


Picking up the ball, here's the second revision of the shared clothing
proposal. I've left things in that we agreed about, and modified the
things we didn't, and added the things that we came up with.

The goal for it is to allow new games to benefit from a shared common
set of clothing as a starting point. While it is not intended as a
sophisticated crafting system by itself, it is written to faciliate the
injection and overriding via game-local UrParent practices code and
properties which makes it compatible with potentially any crafting
system in the skotosphere.

Lets start with a simple Ur-style dress, that was copied to
Shared:clothing:contemporary:dresses:sport

In KarMode it has three details as follows:

======================================================================
DETAIL [default]
Brief: white cotton sport dress
Look: [*
  A clean, short-sleeved sport dress made of white cotton.
*]
Examine: [*
  This clean white cotton dress is tailored to fit comfortably about a
woman's figure; it has short sleeves, a modest neckline and a pleated
knee-length skirt.
*]
Pbrief: clothings
SName: dress
SName: garb
SName: clothing
SName: garment
PName: clothes
PName: clothings
PName: dresses
PName: garments
Adjective: cotton
Adjective: knee-length
Adjective: short-sleeved
Adjective: sport
----------------------------------------------------------------------
DETAIL [skirt]
Brief: the skirt of a sport dress
Look: The pleated skirt of a sport dress.
Examine: [*
  The skirt of a sport dress is pleated and reaches knee-length.
*]
SName: skirt
PName: skirts
Adjective: knee-length
Adjective: pleated
----------------------------------------------------------------------
DETAIL [sleeves]
Brief: the sleeves of a sport dress
Look: The short sleeves of a sport dress.
Examine: [*
  The sleeves of a sport dress are short, cut to reach a third of the
way
down a wearer's upper arm.
*]
SName: sleeve
PName: sleeves
Adjective: short
======================================================================

To convert it to the Shared clothing system, we add the following
properties:

<Core:Property
property="trait:material">"cotton"</Core:Property>
<Core:Property property="trait:color">"white"</Core:Property>
<Core:Property
property="trait:condition">"clean"</Core:Property>
<Core:Property property="export:traits:adj-map">
        ([ "color" : ({ "default" }), "material" : ({ "default" }),
"condition" : ({ "default" }) ])
</Core:Property>

The first are the values for simple traits that all Shared clothing
should have, and the export:traits is a mapping that allows game
specific crafting systems to know which traits can be possibly changed,
and the shared:proofed shows that this item has not been proofed yet.

Different from revision 1 is the fact that the traits are no longer
exported. The system will turn traits into initial properties when set.
Additionally, the export:traits:adj-map property was added (replacing
adj-list), pointing the specific traits to the specific details for
adjective usage. Setting this property up is *optional* unless the
builder wishes to apply adjectives to other than the default detail.
Furthermore, I want to see a way to do details:[detail]:description:part
pointing to a particular trait part, and that somehow updating the
adj-map. Finally the shared:proofed property was removed. Any code
depending on proofing will check for nil rather than 0, and this will
save everybody some time in the long run. 

So now the descriptions for the dress are changed, mostly replacing the
condition, color, and material with property references, and any text
tweaking to make it work. You also should delete any adjectives refering
to the condition, color, and material.

======================================================================
DETAIL [default]
Brief: $(This.trait:color) $(This.trait:material) sport dress
Look: [*
  A $(This.trait:condition), short-sleeved sport dress made of
$(This.trait:color) $(This.trait:material).
*]
Examine: [*
  This $(This.trait:condition) $(This.trait:color)
$(This.trait:material) dress is tailored to fit comfortably about a
woman's figure; it has short sleeves, a modest neckline and a pleated
knee-length skirt.
*]
Pbrief: clothings
SName: dress
SName: garb
SName: clothing
SName: garment
PName: clothes
PName: clothings
PName: dresses
PName: garments
Adjective: knee-length
Adjective: short-sleeved
Adjective: sport
----------------------------------------------------------------------
DETAIL [skirt]
Brief: the skirt of a sport dress
Look: The pleated skirt of a sport dress.
Examine: [*
  The skirt of a sport dress is pleated and reaches knee-length.
*]
SName: skirt
PName: skirts
Adjective: knee-length
Adjective: pleated
----------------------------------------------------------------------
DETAIL [sleeves]
Brief: the sleeves of a sport dress
Look: The short sleeves of a sport dress.
Examine: [*
  The sleeves of a sport dress are short, cut to reach a third of the
way down a wearer's upper arm.
*]
SName: sleeve
PName: sleeves
Adjective: short
======================================================================

Finally, the dress's UrParent is changed to Shared:clothing:UrClothing,
which has the following scripts:

Core:Property   [property='merry:setprop-post:trait']
        return shared_clothing::process_trait($object: this, $property:
$(hook-property), $old: $(hook-oldvalue), $new: $(hook-value));

Core:Property   [property='merry:act:start']
        return shared_clothing::construct($object: this);

The process_trait() function would essentially do four things. 
1. It would init-prop the property for use by potential children.
2. It would store the old property as old-[property] in the object
("trait:color" -> "old-trait:color").
3. It would apply the various adjectives based on the traits:adj-map
property, if [ this."core:ur:firstchild" == nil ]. 
4. It would trigger a (delayed) function that stepped through all its
children and, if nil, set the property to the default value.

The construct() function would basically just ensure that the adjectives
are not present in the parent. (I have tested and verified that initial
properties in conjunction with setprop-post scripts function correctly.)

So how does someone change these traits? Well any staffer can just
+setprop, or any script change the properties, and the process_trait
script in setprop-post will just do the right thing. We can also create
a +sharedmorph command (maybe @morph for chattheatres) that presents
ajax popup that lets you change all the values listed in traits:list,
dynamically showing you the result.

So how do we change Bilbo-based Generic clothing with these?

First, we run a command on it, +generictoshared (to be written), which
copies the Base:InitialProperties to recreate normal descriptions with
place holders for various generic traits (converting trait:color by
init-propping it, etc.) and converting unsupported traits
with the text in all caps, like TRAIT:FIT. Finally, the script clears
out Bilbo code from the initial and core properties. Then you just go
through the same procedure above to clean up the clothing to the
simple Shared:clothing:* system.

A few notes:

Revision 1 notes (modified & updated):

* The intent here is to allow StoryBuilders and StoryPlotters without
merry experience to easily convert or make these clothes. So other than
adding the 3 properties in XML mode (trait:color, trait:material,
trait:condition), and changing the UrParent in the E) mode, all of the
changes can be done in KarMode. 

* All clothing with initial values should have non-plain values, such as
white (color) cotton (material). However, this is optional and up to the
builder.

* All briefs should:
        * mandatory display color, if any (no matter how small it is, in
a brief moment you can see its color).
        * optionally display material, if any (often you can't identify
the material, however).
        * optionally display condition, if any.

* All looks should have all three values somehow.

* Children of these clothes can be made by overriding initialized
property values, but should have a longer name, e.g.:
        UrParent: Shared:clothing:contemporary:dresses:sport
        Children:
                Shared:clothing:contemporary:dresses:sport-denim-blue-clean
                Shared:clothing:contemporary:dresses:sport-cotton-pink-clean
                          
* At some point, Shared:clothing:* that have been proofed (i.e.
export:shared:proofed set to 1) might be available from a UI list (say
for a chat theatre or stage), so the briefs and looks should always be
valid for all clothes, parent and child, in the Shared:clothing folders.

* Proofers should check and remove all InitialProperties and any errant
properties.

* Proofers should double-check that we really need all the details, or
maybe merge some details.

* Could be we want to create some type of popup to help proofers clear
errant properties, inspect values, etc., and finally approve the item.


Revision 2 notes:

* The clothing system will perform a delayed, automatic "expansion" of
UrInheritance, which basically does the following:
        1. Recursively scan through all clothing objects (that have a woename
-- i.e. it won't go into spawns). 
        2. Ensure that all objects relay their named children to a game-local
Data property in Data:Shared.
        3. Create corresponding initial objects for the synchronization of the
above.

Effectively, the above will allow games to adjust properties, set
values, add/override scripts, etc. on any level in the UrChain and still
use the existing shared objects + their corresponding UrChildren
(existing as well as those made in the future). For example, this is a
potential UrChain (child -> parent):
        Shared:clothing:modern:mittens ->
        Data:Shared:clothing:UrPair ->
        Shared:clothing:modern:UrPair ->
        Data:Shared:clothing:UrClothing ->
        Shared:clothing:UrClothing.
Noone will have to care about setting the urparents appropriately, due
to the "expansion" mentioned above.

* The traits:adj-map will be dynamically created and default to the
default detail of the object (its prime) if an entry does not exist for
a particular trait. Thus, if adj-map["color"] is nil, and trait:color is
set, adj-map["color"] is set to ({ "default" }), and the default detail
acquires the adjective for the color. At this point, the
details:[detail]:description:part description remains on the wishlist,
but some form of "check thru all the details before applying the
default" deal might be the way to go.

I think that about covers it. Miss anything?

-Kalle.

-- Main.KalleAlm - 27 Jul 2006
```

## Old notes on Proof System


```
---+ Proof System

%TOC%

---++ Todo

---+++ Unresolvable

   * TWEAK: Put # anchors in all of the panes so that when you do things like "unproof" you can return back to that specific pane rather then the top.
      * Attempted to #-link the more common ("aye" and "unproof") but unable to do so using <redirect>.
         * Emailed Everybody list, awaiting response. Confirmed with Nino that he knows about the issue.

---+++ Needing input

   * TWEAK: Make it work on Monday on all games. 
      * Now in place, and confirmed to work.
      * Demo to Ironclaw people some time during the week. And to Lazarus people.
         * Emailed IC team. Laz team will require that you demo for them, as times are completely incompatible.
         * Ironclaw lead host has been demoed too. Lazarus remains.
   * POSSIBLE BUG: In Shared:clothing:ageless:coats:sweater-knitted-cable, somehow the QA note is displayed twice.
      * I believe this was a WOE bug, and was fixed. The object is no longer using the above woename but if either of us run into it, we should confirm that it works.
   * Azrael feedback (go into pending/deferred/long-term?)
      * The wording in item name is off; "The least significant part of the name should be rightmost." but this should perhaps be "the most detailed part of the name" or such, since e.g. "satchel" in "Shared:clothing:satchel" IS the MOST significant part, not the other way around.
      * Azrael says, "I can't hide automated sanity checks. That might be one to add, since it takes up space right at the top, if I'll be scrolling past to proof each other section each time I click "this makes sense."
   * Lovecraft preparations.
      * <strike>Some</strike> *ALL* items are already using trait:[aspect] properties. These simply need a UrParent-change and they're all set. If not all, then the majority of them. I checked 6-7 random objects and they all had $(this.trait:foo) style descripts.
      * *Left now is basically to convert items; possibly one by one, at least until we have it confirmed that they convert without issues. Question is when?*
   * Quick-doc to shared/proofing system. +proof, +shared, 
      * Begun: https://twiki.skotos.net/twiki/bin/view/Builders/SharedProjectSummary
      * *Unsure where to take it from there. It's pretty self-explanatory (by nature).*
   * Get list of all non-base non-inherited properties. eliminate those that are in shared, and traits that are used in descriptions, and any other known "gosh, can't get rid of that property" properties. List the final results in a 3 column table property value delete. I.e. gather up all properties in all shared objects, clean out the must-have ones and see if we can do some cleanup?
      * (First) see if there are some obvious properties that are just screwball -- that should not be in a clothing system, and kill them all.
      * Game-specific properties are okay, provided they're named accurately, e.g. "1970's price for this item". Proofer might be aware of some of these.
         * This is in place at http://hq.skotos.net/SAM/Prop/Shared%3Asys%3Abuild-tool%3Aproof/props
         * Find out what "export:comment" comes from, which items have it, etc.
            * It is located in 3 objects, with the values:
               1 [Shared:clothing:contemporary:unsorted:jacket-dinner]: "It is slim with silk-lined lapels, a single-button closure and tapered, cuffless sleeves"
               2 [Shared:clothing:contemporary:unsorted:jacket-doublebreasted]: "It has slim, tapered lapels, two rows of buttons, straight-buttoned cuffs and is fitted below the hips"
               3 [Shared:clothing:contemporary:unsorted:straight-leg]: "They fall loosely to the ankles ending in short turn-ups"
         * Deprecate nip:item:cost -> trait:cost:1930s:dollars -- something like that.
            * Requires NIP code rearranging; deferring for now.
         * export:trait:trash -> trash:now?
            * No can do. NIP is using this property. NIP can be coded to auto-deprecate this property, but it cannot be to trash:now, which has a different meaning. trait:trash means the NPC will accept the item when offered; perhaps trash:accept is a better (currently unused) property-name.
         * money:value???
            * Only used in one single object. Most assuredly a misnaming.
               1 [Shared:clothing:modern:shirts:t-shirt]: 10.0
         * merry:act:start?
            * A basically copy-pasted piece of code in ~a dozen objects that randomizes color and material in objects. This must go, but needs a replacement. It also appears that these items have "specific" ranges of features, which ought to be preserved.
         * skotos:creator -- keep or not? prefer to get rid of it
            * Only in one object; getting rid of it.
         * Which have trait:button:color? trait:insignia:color.
            * Two objects have trait:button:color:
               1 [Shared:clothing:contemporary:unsorted:jacket-suit]: "black"
               2 [Shared:clothing:contemporary:unsorted:jacket-tuxedo-black]: "rose"
            * One has trait:insignia:color:
               1 [Shared:clothing:contemporary:unsorted:jacket-letter]: "white"
         * Add new pane to proofer at bottom, called "Properties", which lists properties "excluding some criteria" -- merrry:act:start, export:traits:adj-map, export:sys:shared:*, etc.
         * In a separate thing, any unidentified merry scripts.

---+++ Pending

---+++ Deferred

---+++ Deferred long-term

   * FEATURE REQUEST: If a spawn of a simple morphed object (say ageless:accessories:ribbon-blue-satin) has its trait properties changed, then its ur parent should chould be changed to the root object (i.e. ageless:accessories:ribbon).
   * non-prime detail adjective creator/checker/editor -- number of kinds of details; "hem embroidery" or something
      * Make sure details exist for sub-trait-traits.
   * Editor for morphed children. Example: the default is cotton jacket; density 1.5. The other item is a silk jacket; density 1.2. To turn one child from 1.5 into 1.2, some magic has to happen. 
      * morph physical pane, that helps with changes here, for instance, you can say the target is 1.3, and the original is 1.5, so it will make the multiplier work right.
   * Not use the woe bulk editor at all. 
   * TWEAK: If it an item is completely proofed the fact that it is proofed should show not just at the bottom of the page, but maybe also at the top.
      * Eventually, we might turn this into interactive-divs in which case this can totally happen. 
   * Create docs in builders
   * Refactor it, so that games can add game-specific proofing.


---+++ Resolved previously

   * <strike>BUG: In Shared:clothing:Unsorted:handwear:gloves in the "Are the descriptions in the prime detail sensible?" pane, there is a problem in the look description after "made of ." -- however, when I check the detail's look desc, it seems fine, i.e.: "A $(This.trait:condition) pair of gloves reaching to the wrist made of $(This.trait:color) $(This.trait:material)." should work as both color and material are set. But It's acting like there are no traits set at all. </strike> This was due to the editing woe name bug. If you go back to +proof, refresh, and edit the corrected name, this bug goes away.
   * <strike>FEATURE REQEST: There are quite a few items like: "A $(This.trait:condition) pair of gloves." -- the current a/an test in "Are the descriptions in the prime detail sensible?" doesn't spot "a avowel" and "an consonant" types of errors.</strike> You are already doing this -- this bug was also due to the rename bug.
   * BUG: I tried editing the woe name Shared:clothing:Unsorted:handwear:gloves to make it ageless, but when I change the woe name and click on the rename, it is still Unsorted in the form. Yet it appears that it actually was renamed, and other changes in this form may or may not work from this point on.
      * The object "Shared:clothing:ageless:handwear:gloves" already existed; the system attempted to inform the user, but the bug lay in the fact the error message never appeared.
   * BUG: ageless:accessories:belt appears to not be in either +shared or +proof.
      * I see it in +shared.
   * BUG: ageless:leggings:pants isn't proofed completely, but it showing up in +shared.
      * I don't see these. I suspect the system repaired these inaccuracies as you opened up the items.
   * TWEAK: "for" should not be a suggested adjective
      * Fixed.
   * TWEAK: "Are all the details sane?" pane does not have to be displayed if there is only the prime detail -- it can be considered automatically checked.
      * The all-details pane only appears if there are more than one detail in an object, now.
   * FEATURE REQUEST: it would be nice if there was some popup menu that let you change the era to one of the existing eras.
      * Hover-div in place.
   * update the era descriptions from edits I've made to twiki.
      * Done
   * BUG: You don't say what the error is when the era is "Unknown", just that there is an error.
      * Sure I do -- in the actual information about the era, it says "The era is unknown. This can mean that the era was simply not added to the proof tool."
   * TWEAK: should probably have ethnic (for anything weird), and futuristic -- I've added wiki pages.
   * TWEAK: in +shared need more space between the columns.
      * This will happen once more items are added, as only the longest woename will "be close" to the next column -- not changing, considering you saying there was too much space in the proof list earlier (and the two are using the exact same output).
   * TWEAK: Need more white space above and below "suggested name types" table. BTW, this feature is working really well.
      * Fixed.
   * TWEAK: What the parent is should be more prominant someplace, i.e. UrPair or UrClothing, etc.
      * Added to item-name pane.
   * TWEAK: after doing a few, woenotes should be at the end, not beginning. But the +objectnotes text should be at the top near the name (if any), non-editable, with a link that takes you down to the #anchor to edit it.
      * Moved.
   * TWEAK: have some way to give an example +objectnote in a popup, i.e.

"A bliaut, a type of 12th century gown typically made of better then average cloth. In addition to the standard trait:color, trait:material and trait:condition, it also supports trait:fit and an embroidered trait:symbol.

It is converted from a Castle Marrach generic object, original author unknown."
      * Added this example to the green div. I'm not convinced it needs a popup in an example, though feel free to insist.
   * FEATURE REQUEST: the description checker needs to be done for each detail, with the edit links going to the non-prime detail edit page with non-prime detail examples. 
      * Done.
   * TWEAK: change details sensible pane question to "Are the details properly referenced in the prime?" 
      * Done.
   * QUICK FIX: one-time change all non-morphs to condition:nil and any material:cotton to density 1.5 
      * Done.
   * QUICK FIX: change term mold to morph 
      * Done
   * FEATURE REQUEST: non-prime detail edit page with examples appropriate for non-prime details. 
      * Duplicate of earlier request (but done)
   * FEATURE REQUEST: In physical pane, warning if mass, density or capacity are 1, and so are the parents.
      * This is already the case.
   * TWEAK: confirm that when you unproof an aspect, it is removed from +shared. 
      * Confirmed.
   * TWEAK: warning in a morph that if parent isn't proofed, with link to proof it. 
      * Already the case.
   * TWEAK: warn if a morphs parent is a morph. 
      * In place.
   * TWEAK: morpher proof on should red on -unknown 
      * It will automatically do this in the "Is the woename based on traits in the object?" check.
   * TWEAK: display the +objectnotes for the parent as info above the +objectnotes for that item, for both clothing items and morphs.
      * Added.
   * TWEAK: make sure that the messages for +spawn items that are proofed or not proofed make sense. Maybe an acmd to proof it.
      * Converted +proof to use raw verb; changed +spawn message to use woename rather than description.
   * OPTIONAL: Maybe if the background color of the whole page changes if it is completely proofed. I.E. Unproofed is a very, very light yellow, and proofed is a very, very light green.
      * In place.
   * TWEAK: a link from +proof to +shared at the bottom of the page, and another in +shared back to +proof.
      * In place.
   * TWEAK: in the proofing page, there should be some way to get back to the +proof page.
      * Added to top.
   * FEATURE REQUEST: in that [all-details] pane, warn if non-prime pnames and/or snames are not mentioned in prime descriptions someplace.
      * In place. 
   * FEATURE REQUEST: +objectnotes that works for both "my clothing" and "woe:name", and whose result allows you to acmd to the proofer or to woe edit, and make +proof woe:name work. 
      * In place.
   * FEATURE REQUEST: ability to quickly create a new morph, i.e. on the +shared page for each proofed item that creates an empty object with name appending -unknown to the woe name, sets the parent to the woe:name, and then opens the morph proofer page for that item allowing you to edit the name and defaults. You should not be able to create a new morph for a morph using this tool. 
      * In place.
   * FEATURE REQUEST: wiki style warning if you try to proof something that someone else is proofing.
      * Sort of in place, but not possible to check, until Nino has resolved an issue with UDAT objects on HQ.
   * BUG: Shared:clothing:modern:leggings:denim-jeans is showing up in +proof, but the checker thinks that it isn't a clothing item. It probably should not continue if it doesn't recognize the type of item it is.
      * Object was using an UrParent outside of Shared (<nop>UrTrousers</nop> from LC) -- we do have a converted UrTrousers object, and I may do some magic to magick these all to use the correct version.
         * The above one-timer was executed successfully, and changed UrParent for all such items to the Shared variant.
   * BUG: When you return from the detail editing view from the woe view, you don't see the woe edit for the detail again but instead see the woe edit for the whole object in the area below the examples.
      * Fixed.
   * BUG: Coverage for Shared:clothing:Unsorted:mens-cable has woe name parser problems: "The auto-scan considered this item to be of the coats type, but the woename indicates the item is of the mens-cable type! (coats means the item is typically covered by arm-upper-left, arm-upper-right, elbow-left, elbow-right, arm-lower-left, arm-lower-right, wrist-left, wrist-right, shoulders, back, chest and waist; mens-cable means it is typically [I don't know about the mens-cable type!])."
      * I can't fix this. The woename is invalid, and has to be changed before the system can give reasonable suggestions.
   * TWEAK: put +objectnotes on the ur items. 
      * Displaying ur-objects +objectnotes in children proofer views.
   * QUESTION: should "pair" be an allowed adjective?
      * Yes, as should "of". We want "take pair of pants" over "put bowl on top of fridge" (can just use 'on fridge') or "sit in front of lucy" (can just use 'before'). See bug regarding snames and pnames (with 1-4 points).
----
   * TWEAK: In the "Do the adjectives in the prime detail make sense?" pane, I would find that it useful to have the fully expressed (i.e. all traits set) examine of the prime detail above the "Adjectives in Prime Detail" table, as I often find myself unproofing the prior details pane to go look at it. I really need this in the morph'as adjective proofing pane as the examine is never completely shown there. I believe that this is true for the "Do the prime singular and plural names make sense?" pane as well, follwing the green div "the following names" . I know this is redundant, but I think it helps make these panes stand alone better.
      * Added item desc to prime adjective/sname proofing panes, and examine for normal detail adjective/sname proofing panes.
   * TWEAK: In "Coverage makes sense" change to "Edit in Woe" to "Edit Coverage in Woe".
      * OK.
   * TWEAK: After you Edit Coverage in Woe, the return button should be [back to Proof Tool]
      * OK
   * TWEAK: In the PBrief warning, change to "The PBrief is set in this item. This is fine, but please note that PBriefs should primarily be used for items that should stand out in a pile, such as a large or obvious clothing item, or for items that use the clothing system but are not clothes, for instance, a rug."
      * OK
   * TWEAK: In "Is this clothing redundant" change the text in the green div to "Make sure that this item does not duplicate the functionality of another item. One way to check is to look at items that may have similar names in woe, but you might want to look at the whole +shared list for synonyms". Then put the old green div text in the white "The following clothing shares the same name with this object:" only if there are clothing with the same name, otherwise "There does not appear to be clothing sharing the same name as this object".
      * OK
   * TWEAK: Some more words can be automatically excluded from the "look for any missing adjectives" list "can be are is was has have more then than around"
      * OK
   * TWEAK: In the Snames/Pnames pane, above the suggested snames pnames table, add the following in a green div "The following snames and pnames were found in similarly named objects. They may be appropriate for this object:".
      * OK
   * TWEAK: The examples of possible +objectnotes should be different for morphs -- grab the one for Shared:clothing:contemporary:accessories:belt-dress-black-leather as an example.
      * OK
   * BUG: When you rename something with the coverage renamer, the old names stays in the +proof list with "object not found".
      * OK
   * FEATURE REQUEST: In construct lib, if the item is clothing system and proofed, add to output [1 -> Christophera] (item was proofed 2006-11-16)
      * OK
   * TWEAK: the links on "Is this clothing redundant" should go to the proofer page of that object, not the woe page.
      * OK
   * ONE-TIME: If density 1.1 -> 1.5 for any clothing item.
      * OK
   * TWEAK: Only in adjectives for non-prime details, it is a good idea to put some of the prime-details pnames in the "suggested adjectives" list. For instances, for a cap, which has a bill detail, "look at cap bill" should reasonable.
      * OK
   * FEATURE REQUEST: In "Are the descriptions in the prime detail sensible?" in the second pane, if a look or examine description does not end in a period, question, or exclamation, there is an error in the SAM someplace, so we should highlite it and give an Error box.
      * OK
   * FEATURE REQUEST: We should warn people more when there are identical words in sname and pnames, i.e. pants in both. I don't know any reason why you can't only have pants in pname. Thus give the warning: "You have a word duplicated in both pname and sname. In general, favor only using the pname over sname when a word belongs in both, especially in 'pair of' type items."
      * OK
   * TWEAK: We should not suggest snames that already exist as a pname.
      * Fixed.
   * FEATURE REQUEST: Disallowed pnames - error if pnames like "clothings" exist. Another one I found is "headwears". Should be an easily editable list for you to add other disallowed snames or pnames.
      * OK
   * BUG: I am unable to finish proofing Shared:clothing:contemporary:accessories:belt-dress-black-leather as it thinks the woename is incorrect, but it is correct. I just changed the era from agless for contemporary for this morph, as the style would be inappropriate for other eras. This should be fixed and this morph's proof completed.
      * Fixed.
   * BUG: What is wrong with ageless:leggings:pants when you look at it in +shared? They are showing up as "white cotton pants" when all the others are "a brown knitted sweater". Is it a problem with +shared? A problem with the object? And if it is a problem with the object, how do we make it easier to spot that SAM error.
      * I don't get what SAM error you're talking about, even.
      * Resolved. Chris will fix.
   * TWEAK: If density is 1.2, leather and nylon is one of the choices of examples. Heavy leather to be precise - 0.95 is density of light lighter.
      * Added to 1.2 density (nylon was already listed at precisely 1.2 -- did it not show up for you in the proofer?)
      * Confirmed.
   * Are the item traits and defaults sensible -- morphed and traits not even up
      * Probably fixed.

---+++ Demo notes

Before demo:
   * proof 5-6 items, then unproof

Demo:
   * meet in HQ
   * +spawn Sharedd:clothing:ageless:accessories:belt
      * point out the message
   * +spawn an unproofed item
      * point out the message the the opportunity to proof.
   * when they click the ACMD, they can now proof that item
   * give them each some simple items that are easy to proof, maybe find 5-6 items that are almost ready.
   * also 5-6 easy problem ones
   * show +proof, show +shared
   * point out that we don't need everything proofed all the way -- even storyguides can help by proofing objects at least partially. Just proof what you can and leave what you can't.
   * explain what a morph is, and how they are useful as they are premade items for putting in catalogs or making available to CNPC shopkeepers
   * tell feel free to make as many morphs as they like, and how to proof them.
   * explain, our goal, in lc, they will be able to proof in LC rather then here in HQ, that all of these will shared with other places, we will work with them to convert all of their existing LC pieces of clothing to this system, hopefully next week.
   * in order for us to do this next week, we need a whole bunch of stuff proofed. everything in ageless / contemporary, we need proofed!
   * next thing, look through other things, the unknowns, the medieval's for stuff that ought to be in ageless / contemporary, and rename them, and proof them.
   * starting Tuesday, any staffer able to do it directly from LC.
   * +task shared any bugs
   * clothing now, consumables next, props is third, then we're done for a bit and we'll see how the games use them. It it works well and we get lots of sharing, we will create more shared systems and proofing tools.
   * TWEAK: I suspect any prox word should not be suggested adjective, such as "over cloak", as I think the parser will croak out. May be worth checking if that is true by adding over as an adjective to a cloak and then referring to it that way.
      * Need to produce list of all prox words, preposition words, etc. Ask Nino for list.
         * Looked through source myself, and found "above", "about", "across" "from", "against", "around", "at", "atop", "before", "behind", "beneath", "below", "beside", "by", "close" "beside", "close" "by", "close" "to", "concerning", "down", "for", "from", "in", "in" "front" "of", "inside", "into", "near", "nearby", "near" "to", "next" "to", "of", "on", "on" "top" "of", "onto", "over", "regarding", "to", "toward", "towards", "under", "upon", "up", "using", "with", "within", "front", "top"
      * OK
   * BUG: Why does +shared think ageless:coats:shirt-simple-longsleeved is proofed? I've barely started it yet and there are lots of errors in it, but it is showing up there.
      * It's not there anymore. Odd that it ever appeared to be, as it was not there when we looked before, and I thought that bug was fixed. *frown* I'll leave it be for now, but placing it here so you at least see what I think.
      * OKaying for now
   * TWEAK: Announce definite article briefs. Check plastic briefs.
      * FEATURE REQUEST: Some briefs messages for the "Are the descriptions in the prime detail sensible?" pane. Briefs should not have periods in them, so there should be an error if it has a period. Briefs should rarely have any other punctionation in them, so a warning if it does. Briefs should rarely be capitalized, so a warning if it does. When an detail is marked as being def, and the brief does not have a "the" at the beginning of it, there probably should be a warning. I also believe that all of this applies to pbriefs and worn descriptions.
         * "." check added.
         * Capitalization check in place for plastic briefs; plastic briefs detected; definite articles without a starting "the" detected.
   * problem -- in Shared:clothing:ageless:legwear:garter-pair there is an adjective or snames/pnames with a space in it "pair of" -- should be flagged as erroneous
      * Fixed.
   * FIX: Warning for density 1.
      * OK
   * BUG: The coverage checker thinks Shared:clothing:ageless:handwear:gloves should be ensemble, but it it is properly handwear.
      * The coverage checker now considers the gloves handwear.
      * (06:26:27 PM) Chris: probably coat is redundant, and everything coat should be a shirt.
         * Moved *:coats:* -> *:shirts:*, and modified coverage detection to return "shirts" for coats as well.
      * I.e. FIXED.
   * Is woename of item correct -- "-unknown" -> make error in item name pane; same for era.
      * Now errors.
   * Fix wording on "blue was not recognized" -> trait not found; edit the item traits below to fix this.
      * OK
   * FEATURE REQUEST: Some testing re: def -- found some details that showed "a the" and "an the" because they were not properly marked as def. Another thing to warn about in the detail descriptions pane.
      * Fixed and confirmed.
   * Text versions of each clothing type (ensemble, etc).
      * Mouseover text that appears when you drift over the word ensemble: For example, a single object that is a three-piece suite and would cover the entire body would be considered an ensemble. A vest from that three piece suit would not.
         * OK
   * TWEAK: Finish sharifying things that are appropriate.
      * Added a link from proofer which lets users auto-convert objects to Shared system.
   * FEATURE REQUEST: It would be nice if the white on blue divs for the questions of each pane could change slightly in color, say slightly lighter, if that pane is successfully proofed. I noted this when I proofed what I thought was everything but I was not getting a finished proof, and it was because I'd not clicked on the "Is the clothing redundant" item as there were no related items.
      * OK
   * TWEAK: Global s&r item to object
      * DONE
   * Revisions properties seem to have been truncated and old ones lost for most of these items, making attribution difficult. We should make sure that revisions properties are preserved. At some point we may want to have the option to display the revisions property in the "woe notes" pane so that someone can look at it to decide attribution.
      * Get list of revisions by clicking something in woe notes.
      * OK
   * BUG: There is a bug in your conversion of cubic decimeters to cubic feet. I.E, you say 0.028 cubic decimeters (9.88 cubic feet), but google says it is 0.000988810668 cubic feet or 1.70866483 cubic inches.
      * FIXED -- (This is a bug in format_float. Nino has patched format_float code successfully.)
   * FEATURE REQUEST: duplicate detail checker -- I've found a number of objects where two different details have the exact same brief, look, and examine. I suspect it comes from a long-time bug where when you rename a detail it doesn't remove the old.
      * Sidenote: That is a feature, not a bug (rename a detail to make a new one), a bug that I use quite vigorously, and others too I think, to create a new detail based on an old one.
      * Added check for duplicate details.
   * non-prime detail adjective creator/checker/editor -- number of kinds of details; "hem embroidery" or something; make item that has one of these and test that it doesn't croak.
      * Looks okay to me: http://hq.skotos.net/SAM/Prop/Shared%3Asys%3Abuild-tool%3Aproof/index?ob=Shared:clothing:ageless:accessories:TEST2
   * FEATURE REQUEST: physical pane, with emphasis on mass and density and reference weights. 
      * Check Shared:clothing:ageless:accessories:purse-simple
         * *Not sure what the above check is in reference to. (What about it?)*
      * at minimum put those reference weights I gave you in the twiki.
         * Added: PhysicalReferences.
         * Added referencing to proof tool.
      * I have marked a number of items as reference items.
         * Implemented scheduled (cron) calculation of all physical reference items, their masses, densities, and capacities.
      * Warning: if verb2 or verb3 are different than the standard, contain/contains.
         * OK
      * Some place above or whatever, shows what text looks like using verb2/3.
         * OK -- Put it in the "non-standard contain" warning, as that's the only place where it's interesting.
      * Warn if something is marked as flexible, simply say what flexible means. 
         * OK

---+++ Resolved

   * FEATURE REQUEST: In the woe name page, a button to "defer" an item. Reasons for deferring may include that the item has some issue too complex to resolve only in this object (i.e. things like "pair of"), or is redundant, or needs more details, but should not be deleted. When you click on defer item, you will be asked to add a reason which will be put in an open "proofing" woe note, the text "-deferred" is added to the name, which the woe name pane recognizes and gives as an error box in the proofer keeping the woe name from being proofed, the item is moved out of the list of clothing in +shared and to the bottom in a separate list of other deferred items. Otherwise, it works like any other unproofed item. Deferred items should also not be counted in the list of "# items requiring proofing" that staffers get when they log in.
      * Some way of marking items that should not be proofed. Moved to a separate list. Be able to put in a proofing note in the thing. Popup dialog -> proofing woe note.
      * IN PLACE
   * FEATURE SUB-REQUEST: (from "physical pane" request) Say what volume is, based on its material, when full, and when empty.
      * *I know we juggled formulas around here, but I'm not able to recall how this would all work out. Its material? Isn't this basically intrinsic density * intrinsic mass + capacity, straight off (since it's in m^3 already), for full, and excluding "+ capacity" for empty?*
      * This is a duplicate.
   * physical pane, emphasis on capacity
      * Containers. Most of them made way too big. If capacity is close to density*mass, something is wrong with capacity. For clothing only, if cap > 1, error, if > 0.5, warn. Item capacity probably never be < compacted volume of an item + ~10% (density*mass = compacted volume). Trying to rationalize volume into the equivalent of a liquid measure.
         * This all is now in place, but the purse which was proofed gives off warnings: http://hq.skotos.net/SAM/Prop/Shared%3Asys%3Abuild-tool%3Aproof/index?ob=Shared%3Aclothing%3Aageless%3Aaccessories%3Apurse-simple
         * Case table; less than X, greater than Y; use cups; etc; use pints. Use for weight as well. Both metric and english. 
            * Capacity in place. Weight (mass) in place.
   * FEATURE REQUEST: related to pair clothing
      1 you should be warned if it detects 'pair' in a description and the object is not parented to UrPairClothing.
         * OK
      2 you should be warned if pair is an adjective.
         * *I'm not sure what the message for this should be. Set it to 'The adjective "pair" is used in this object.' for now.*
            * "The adjective 'pair' is used in this object, but UrClothingPair is not a parent of this object."
            * Set.
      3 you should be able to see any adjectives that are in parent.
         * You do.
      4 you shouldn't see pair as a suggestion.
         * OK
      * Please re-proof pair of pants and pair of garters to make sure they are still ok.
         * *I auto-unproofed all items that were children of the UrPair object, because the UrPair object has definite-aricle default detail! I don't understand WHY this is, but it is so.*
   * BUG: Shawl (covers neck, shoulders, back) is set as accessory, but accessories may only cover at most 1 body-part. Should I increase that to 3 body-parts? I.e. accessories cover between 1-3 body parts and are transparent. The system currently considers shawls "ensemble", which is most assuredly wrong. http://hq.skotos.net/SAM/Prop/Shared%3Asys%3Abuild-tool%3Aproof/index?ob=Shared%3Aclothing%3Amedieval%3Aaccessories%3Ashawl
      * Test with 3.
      * OK
   * TEST: IE6.
      * I don't have IE6 anywhere. My lap top has IE7. So test IE7.
      * IE7 has issues. Had. Bug in LI's with classes (how surprising).
   * TWEAK: Morphs must be marked somehow. Automatic.
      * A property must be set in the object when it is created as a morph.
         * sys:shared:clothing:morph is now set when using the "Create morph" link from +shared.
      * All existing morphs must be flagged like the above. 
         * sys:shared:clothing:morph is now being set and updated every day
   * BUG: in "Is this clothing redundant?", in each of the found similar objects the SAM is showing in examine displayed for that object. This should be parsed. 
      * I can change that to using the brief, but I cannot describe the look without some major magic.
      * I actually found a workaround for this, so, fixed.
   * Probably need some way to mark an object as being deferred, for further investigation or possible deletion, moving it to a seperate section in +proof. For instance, belt-dress which is a unique item can be replaced by a morph of belt.
      * This is a duplicate.
   * TWEAK: make sure that no items show up in +proof that might break the proofer. Morph items should be listed seperate and below non-morph items, or marked italitc or a color to make them show up as different. 
      * All items are now proofable; items can be sharified via link in the proofer; morphs do show up different --->>> FIXED.
   * Kalle proof 5 or 6 different kinds of objects.
      * I've proofed ~5 objects, but left physical properties be, and left objectnotes as I can't think of anything useful to put there.
   * Explore the worn description.
      * (08:55:03 PM) Chris: I'd also like an info message if there is no worn desc
      * (08:56:32 PM) Chris: Info: There is no worn description in this object. worn descriptions are useful when you want a different brief to be displayed when you look at someone wearing the object.
         * IN PLACE
   * FEATURE REQUEST: Not all children of a root clothing object are automatically a morph. Morphs are only items that have properties changed -- no new merry, no changed descriptions, etc. We need to list any  children of root clothing objects that are not morphs differently.
      * Not perfect, but in place.

```