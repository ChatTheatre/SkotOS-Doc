# Tutorial: Crafting a Proofed & Shared Towel

## Who, What & How

We'll start with an old object, a "Generic towel", and turn it into a new [Traits] object with an alterable [SAM] tag based prime [Description](../StoryBuilder/DescriptionSystem.md), convert it to Shared using the [Sharify] tool, proof it with the [Proof] tool, and ultimately learn how to [Share] it between ChatTheatres and Narrative Prose Games that use the Shared SkotOS ChatTheatre Library.

[Part One](#PartOne) of tutorial should be relatively easy for any person that wants to be a StoryBuilder for ChatTheatre's in the 2020s.

[Part Two](#PartTwo) of this tutorial is for intermediate StoryBuilders, and share some optional ideas on how to add additional details (using the [Detail System](../Story_Builder/DetailSystem.md), how to facilitate creation of [Morph] child objects, variants objects using [Clones], and how to convert old legacy [Bilbo] objects that need to be deprecated.

[Part Three](#PartThree) of this tutorial is for advanced StoryBuilders, or people want to become eventually StoryCoders. It will introduction some easy features you can add to the towel using simple [Merry](../StoryBuilder/MerrySystem.md) scripts, how to create additional [Ur](../Story_Builder/ThingsAndUrThings.md) object heirarchy, and finally, how to create a [Local](../Story_Builder/SyncSystem.md) towel with custom features unique to your game and not shared with others, but allows you to leverage updates from other games to your shared objects.

This tutorial will not teach a StoryBuilder how to integrate the object into local game systems such as [Crafting], however, the goal is that an Shared object properly crafted can easily be adapted to local game requirements.

## Part One

### Cloning a Generic Object

A Generic Object is an object that just has simple text `Brief`, `Look` and `Examine` descriptions in the "prime" detail, as possibly a few additional details. In addition, the object does not use any properties thus there should be very few entires`core:properties` in Woe, or displayed when you `+stat my object "property:*"`.

There are quite a number of Generic objects that can be found in the Tree of Woe from old games. Generic objects can still be very useful to create as a one-time prop for a plot, but typically have no flexibility or opportunties for re-use in the future or by other StoryBuilders or in other ChatTheatres.

The best Generic objects for learning on are ones that have a simple prime Detail, at most one or two other details, and don't have complex Bilbo properties.

We have made an example tutorial object that we suggest you try first. Don't change it, make a copy:

* Open it in the Woe view popup window `+tool woe view %Shared:clothing:ageless:accessories:tutorial-towel-generic`
* Click on the "Duplicate" button it (which makes a [Clone] of it)

* The result of cloning it will be an object named like `/base/object/thing#18871`. Rename the result with your name. I suggest something like `Shared:clothing:ageless:accessories:tutorial-towel-daris`

* Now let's make a spawn of your personalized generic towel to look at it: `+spawn Shared:clothing:ageless:accessories:tutorial-towel-daris`

### First look

First test your generic Towel in the text environment. Drop it, get it. It is a clothing, try wearing it. These commands will reveal the `brief` description in a variety of ways.

```
>  drop my towel
 You drop a clean white towel.
>  get towel
 You take a clean white towel.
>  wear my towel
 You wear a clean white towel.
 
```
Next, while wearing it, look at it, and look at yourself, and examine it.

```
> You look at a clean white towel.
 A clean, towel made of white cotton. It is embroidered with the Miskatonic University insignia. 
> look at me
 You look at yourself.
 Daris is a short, wiry man of ruddy complexion with a head of thinning salt-n-pepper hair. He is wearing a clean white towel and a white cotton robe.
> examine my towel
> You examine a clean white towel.
 This is a rectangular white towel, made of soft cotton. It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
```

## Investigate our Towel's Spawn in Woe

Now lets look at this spawn more carefully:

```
> +obname my towel
 It is a spawn -- [Shared:clothing:ageless:accessories:tutorial-towel-daris]#12276 ; "default" [V] [M]
-- of Shared:clothing:ageless:accessories:tutorial-towel-daris [V] [M] [O]
```

The first thing to note is that this spawn is called `[Shared:clothing:ageless:accessories:tutorial-towel-daris]#12276` — this means that it doesn't really have a name, it just is a child of a named object with a number. In fact, it's root "real" name is `/base/object/thing#12276` — the Ur:Parent object's name in brackets is just a hint, and `/base/object/thing` means that it a object that has an existence in our virtual text environment. Unnamed objects like this don't show up in the Tree of Woe.

You could give this spawned object a name if you wanted. If you did, it would mean that it would now show up in Woe lists and with the `+woe <searchword>` command. This can be useful in some cases, for instance, the Trash System will not trash named objects. I don't suggest naming this spawn now.

But the object will always still have the  underneath it the "real" name of `/base/object/thing#12276`. This can useful as if later some advanced function or script referred to this object, and you changed the Woe name of it, the script would still work despite the Woe name change, as scripts will use "real" names, not Woe names.

Click on the spawn's [V] to view it in a popup window editor. Then click on [V] in `Core:Properties`:

```
Core:Properties V E X N
Core:Property   [   property='base:clothing:worn'   ] V E X D
1
Core:Property   [   property='base:initialcontents'   ] V E X D
({ })
Core:Property   [   property='bilbo:solo:refresh'   ] V E X D
"run"
Core:Property   [   property='bilbo:solo:refresh:0010'   ] V E X D
"set this.item to $obj(this) :: slay obj.this.item"
Core:Property   [   property='misc:lastdropped'   ] V E X D
"1598231047 Daris[christophera]"
Core:Property   [   property='skill:fatigue'   ] V E X D
1.0
Core:Property   [   property='spawn:creator'   ] V E X D
({ "christophera", 1598230794 })
```

You'll see that it doesn't have very many properties, and it has no "trait:\*" properties at all. This is one of the characteristics of a "Generic" object, and thus good candidate for learning how to turn this Towel into Shared clothing with Traits.

Note that this Towel does, however, have some three legacy "Bilbo" properties — we later will delete these. (It also has an errant "skill:fatigue" property, but this is a bug and I'm not sure how to delete permanently).

Close the spawn's Woe window.


## Investigate our Towel's Ur:Parent in Woe

You'll note that this object has no Ur:Parent. This is common among Generic objects.

Now lets look at the this Generic object more carefully:

```
> +obname my towel
 It is a spawn -- [Shared:clothing:ageless:accessories:tutorial-towel-daris]#12276 ; "default" [V] [M]
-- of Shared:clothing:ageless:accessories:tutorial-towel-daris [V] [M] [O]
```

Click on the Ur:Parent's [V] to view it in a the Woe popup window. 

```
Base:Thing V E X Base:Thing(s) are objects that can exist the game world, such as rooms, characters, items, etc.
Base:Transient   [   ] V E X
Base:Inventory [ #0 ] V E X
Ur:UrObject   [   ] V E X
Base:Bulk   [   mass='0.025'   density='0.8'   ] V E X These are the physical bulk values of an object. (See Buiders TWiki BulkSystem for documentation)
Base:Container   [   ] V E X These are the physical container values for an object -- (See Buiders TWiki BulkSystem for documentation)
Base:Misc   [   ] [ #10 ] V E X
Base:Details V E X N
Base:Detail   [   id='default'   prime='true'   ] [ #6 ] V E X D
Base:Combat [ #2 ] V E X
Base:Clothing V E X N
Base:Covered   [   value='waist'   ] V E X
Base:Covered   [   value='groin'   ] V E X
Base:Covered   [   value='thigh-right'   ] V E X
Base:Covered   [   value='thigh-left'   ] V E X
Base:SingleWear   [   ] V E X
Base:Crafting   [   ] V E X
Base:Ingredients V E X N
Base:Tools V E X N
Base:CraftVerbs V E X N
Base:InitialContents V E X N
Base:InitialProperties [ #2 ] V E X N
Core:Properties [ #4 ] V E X N
Notes:Notes V E X N
```
The first key thing you'll notice is that this towel only has one Detail — the "prime" Detail that is the default when you perform actions with the object (which shows the `Brief`), or `Look` or `Examine` Descriptions.

Click on the prime description's `Base:Detail` [V] to view it:

```
Base:Detail   [   id='default'   prime='true'   ] V E X D
Base:Preposition   [   ] V E X
Base:Names V E X N
Base:SNames V E X N
Base:SName   [   sname='towel'   ] V E X D
Base:PNames V E X N
Base:PName   [   pname='towels'   ] V E X D
Base:Adjectives V E X N
Base:Adjective   [   adjective='clean'   ] V E X D
Base:Adjective   [   adjective='cotton'   ] V E X D
Base:Adjective   [   adjective='embroidered'   ] V E X D
Base:Adjective   [   adjective='soft'   ] V E X D
Base:Adjective   [   adjective='white'   ] V E X D
Base:Descriptions V E X N
Base:Description   [   type='brief'   ] V E X D
clean white towel
Base:Description   [   type='examine'   ] V E X D
This is a rectangular white towel, made of soft cotton. It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
Base:Description   [   type='glance'   ] V E X D
A clean white towel.
Base:Description   [   type='look'   ] V E X D
A clean, towel made of white cotton. It is embroidered with the Miskatonic University insignia.
Base:Exit   [   ] V E X N
Base:Climbable   [   ] V E X
```

You'll see that this is a fairly simple object, with one singular name and one plural name, a few adjectives, and a `brief`, `look` and `examine`. And these are not very complicated. So again, this makes this towel a good candidate for learning how to create a Shared object.

You'll also see that this object only covers certain named details:

```
Base:Clothing V E X N
Base:Covered   [   value='waist'   ] V E X
Base:Covered   [   value='groin'   ] V E X
Base:Covered   [   value='thigh-right'   ] V E X
Base:Covered   [   value='thigh-left'   ] V E X
```

These seem reasonable, but newer "Chatter" bodies may have more parts that get covered with clothing — we'll consider adding more coverage later. [[**ROO CAN YOU ADVISE ON THIS?**]]

## Cleaning up your Generic Object

Go back to the full Woe view, and click on [V] to see your towel's `Core:Properties`:

```
Core:Properties V E X N
Core:Property   [   property='bilbo:solo:refresh'   ] V E X D
"run"
Core:Property   [   property='bilbo:solo:refresh:0010'   ] V E X D
"set this.item to $obj(this) :: slay obj.this.item"
Core:Property   [   property='revisions'   ] V E X D
({ 1055962234, "zwoc", "X", 1122146624, "alexander_lancaster", "K", 1125331940, "ocannie", "K", 1125331955, "ocannie", "E", 1598216193, "christophera", "R", 1598222195, "christophera", "E", 1598222212, "christophera", "E" })
Core:Property   [   property='skill:fatigue'   ] V E X D
1.0
```

Lets first delete those legacy `bilbo:\*` properties by clicking on the [D]. Keep the property "revisions" as it has the history of this object. We like knowing giving credit where credit is due!

If there are a few other oddball properties, it is probably safe to delete them, but if you don't know, ask another StoryBuilder or StoryCoder. (You can also try to delete skill:fatigue, be there is a non-harmful bug and it will keep coming back.)

Go back to the full Woe view, and click on [V] to see your towel's `Initial:Properties`. These are the properties that are copied in a spawn when it is created.

```
Base:InitialProperties V E X N
Base:InitialProperty   [   property='bilbo:solo:refresh'   ] V E X D
"run"
Base:InitialProperty   [   property='bilbo:solo:refresh:0010'   ] V E X D
"set this.item to $obj(this) :: slay obj.this.item"
```

[D]elete all of these legacy Bilbo properties as well.

Now if you your test spawn `+slay my towel`, and `+spawn Shared:clothing:ageless:accessories:tutorial-towel-daris` it, and `+obname my towel` to [V]iew it's `Core:Properties` again, you'll see that this spawn has a different "real" name, and the errant extra properties are now gone.

Next let's look at this object in simplified [KarMode] editor. Either go back to the base Woe view for your towel and click the `KarMode` button at the top, or from the text interface enter `+tool woe karmode %Shared:clothing:ageless:accessories:tutorial-towel-daris`

```
DETAIL [default]
Brief:              clean white towel

Glance:              A clean white towel.

Look: [*
               A clean, towel made of white cotton. It is embroidered with the Miskatonic University insignia.
*]
Examine: [*
               This is a rectangular white towel, made of soft cotton. It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
*]
SName: towel
PName: towels
Adjective: clean
Adjective: cotton
Adjective: embroidered
Adjective: soft
Adjective: white
```

Notice that this object isn't quite truly "Generic" in theme. There is a mention of a game specific "Miskatonic University insignia". We could delete this part of text out now, but we'll leave it for now and fix it later in this tutorial. Or change it to be a bit more generic by chaning it to "…an embroidered symbol of a rose."

You'll also notice a `Glance:` description. Glance is rarely used, and when it is used it substitutes for `Brief` in lists. Glance is mostly by rooms when you first enter them. Since this Glance is largely the same as the Brief, delete this line in KarMode and submit the change.

Your Generic towel has now been cleaned up and is ready to start the process of sharing and proofing it!

## +sharify

To make your Generic Towel object into a Shared object would normally involve a lot of steps, but we have a staff tool that helps simplify the first steps.

Before you begin, you may want to sure that there are not a lot of errant child objects out in the text environment that need to be deleted until you've finished converting your towel and proofed it.

You can see how many spawns there are by doing`+obname my towel` and clicking on the Ur:parent's [0] link which will show you all the spawn's owned by your Ur:Parent object.

There shouldn't be more than one in this case, your own spawn. If you are planning to change an object with many children, you might want to `+summon` the errant children and `+slay` them.

Now let's use the `+sharify <woename>` command to convert our Generic Towel to become a Shared Towel:

```
> +sharify Shared:clothing:ageless:accessories:tutorial-towel-daris

Sharify :: Shared:clothing:ageless:accessories:tutorial-towel-daris
- It is clothing... handing control over to lib:fix_clothing.
Setting UrParent to UrClothing. (If this is a pair, you need to fix this manually.)
Details :: default
- [default]
-- brief
--- We found at least one replacement in the color category.
----- It was one. Adding 5 replacement rules.
----- Adding spa removal rule: white
----- Fixing adj-map
----- Setting trait:color to white
-- Storing final brief: X[S]              cle<describe-prop what='trait:color'/> towel
-- look
--- We found at least one replacement in the material category.
----- It was one. Adding 5 replacement rules.
----- Adding spa removal rule: cotton
----- Fixing adj-map
----- Setting trait:material to cotton
-- Storing final look: X[S]              A clean, towel made of $(this.trait:color) $(this.trait:material). It is embroidered with the Miskatonic University insignia.
-- examine
-- Storing final examine: X[S]              This is a rectangular $(this.trait:color) towel, made of soft $(this.trait:material). It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
-- Performing spa removal for: white, cotton
Final cleanup (bilbo).
[ALL DONE]
Please fine tune: [karmode] [view] [xml]
```

Though the `+sharify` tool is powerful, it isn't perfect. Now if you look and examine your towel you'll see a problem:

```
> look at my towel
 You look at a clea white towel.
A clean, towel made of white cotton. It is embroidered with the Miskatonic University insignia.
> examine my towel
 You examine a clea white towel.
This is a rectangular white towel, made of soft cotton. It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
```

The look and examine is ok, but notice that your action text says "a clea white towel". So it look like your towel is slightly broken.

This one is an easy fix. Let's open this object in by `+tool woe karmode %Shared:clothing:ageless:accessories:tutorial-towel-daris` or clicking the [karmode] in in `obname`

```
DETAIL [default]
Brief: cle<describe-prop what="trait:color"/> towel
Glance:              A clean white towel.

Look: [*
  A clean, towel made of $(this.trait:color) $(this.trait:material). It is embroidered with the Miskatonic University insignia.
*]
Examine: [*
  This is a rectangular $(this.trait:color) towel, made of soft $(this.trait:material). It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
*]
SName: towel
PName: towels
Adjective: embroidered
Adjective: soft
```

You'll see that there is a errant 'cle' in the `Brief:`. Just clear the errant text and submit it, and the brief will be fixed.

Look at examine again.

```
> look at my towel
 You look at an a white towel.
A clean, towel made of white cotton. It is embroidered with the Miskatonic University insignia.
> examine my towel
  You examine an a white towel.
This is a rectangular white towel, made of soft cotton. It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
```

Now you'll see that there is an errant "an a white towel" in the brief. What went wrong?

Basically in both of these cases the `+sharify` tool was trying to puzzle out how to add traits to your towel by substituting SAM tags appopriately. In this case it tried to put `<describe-prop what="trait:color"/>` in all places where white is used, the function of which adds the correct article "a" or "an" to the trait adjective. However, in many cases this is not correct, and in the `brief` is often one of them.

Instead, go back to [karmode]() (or `+tool woe karmode %Shared:clothing:ageless:accessories:tutorial-towel-daris`) and change it use the simplest SAM tag `$(this.trait:color)` instead, and click submit.

Now look and examine again:

```
> look at my towel
 You look at a white towel.
A clean, towel made of white cotton. It is embroidered with the Miskatonic University insignia.
> examine my towel
  You examine a white towel.
This is a rectangular white towel, made of soft cotton. It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
```

Now it all looks good again. But what was the problem with `a clea white towel`? In this case `+sharify` was confused and didn't properly add the correct SAM tag. Go back to Karmode and add back in `$(this.trait:condition)` before `$(this.trait:color)` in the brief, submit, and then look and examine again:

```
> look at my towel
 You look at a white towel.
A clean, towel made of white cotton. It is embroidered with the Miskatonic University insignia.
> examine my towel
  You examine a white towel.
This is a rectangular white towel, made of soft cotton. It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
```

## Testing Traits

So what did `+sharify` do?

One thing is that it gave your Generic object a Ur:Parent. Try `+obname my towel` again and you'll see that the named Ur:Parent of your object now has an Ur:Parent:

```
> It is a spawn -- [Shared:clothing:ageless:accessories:tutorial-towel-daris]#14032 ; "default" [V] [M]
-- of Shared:clothing:ageless:accessories:tutorial-towel-daris [V] [M] [O]
-- of Shared:clothing:UrClothing [V] [M] [O]
```

It is the addition of this Ur:Parent `Shared:clothing:UrClothing` that gives adds all the scripts that make Shared objects with Traits function. 

Try `+traits my towel` and you'll see the popup:

```
[Shared:clothing:ageless:accessories:tutorial-towel-daris]#14032

Appearance (brief, look, examine):
a clean white towel
A clean, towel made of white cotton. It is embroidered with the Miskatonic University insignia.
This is a rectangular white towel, made of soft cotton. It is large enough to cover the torso. One of the corners bears the Miskatonic University insignia.
Attributes:
white (color)
clean (condition)
cotton (material)
```

You can now change these traits in this `+traits` to see what happens.

One useful thing to test is make sure that any "a" "an" articles function correctly. Change your `+traits` from the default "white, clean, cotton" to vowels "orange, old, organza" (BTW, not a lot of kinds of cloth start with an 'o' — organza is a lightweight, sheer, plain-woven fabric that was originally made from silk.)

You'll note that both consonant and vowel forms all work ok.

Another thing to test is if a trait is blank.

By convention, all clothing should always have `trait:color` and `trait:material`, however, `trait:condition` is option. Make it blank.

Again, the brief, look at examine all do the right thing. Your Towel object now has fully functional traits!

## ASIDE: Behind the Scenes of +Sharify

You can skip this section and go to the next if you like, but here are some details of what `+Sharify` did to your Generic object to make it Shared.

Let's look at it in Woe `+obname my towel` and \[V\] (or `+tool woe view %Shared:clothing:ageless:accessories:tutorial-towel-daris`):

The `+sharify` tool attempted to substitute what it recognized as possible trait adjectives in your object's Details to use SAM tag based traits. As we saw above, it isn't perfect.


`+sharify` added `Initial:Properties` to your Ur:Parent towel for default trait values:

```
Base:InitialProperties V E X N
Base:InitialProperty   [   property='trait:color'   ] V E X D
"white"
Base:InitialProperty   [   property='trait:condition'   ] V E X D
"clean"
Base:InitialProperty   [   property='trait:material'   ] V E X D
"cotton"
```

It also added some new properties. Go back and look at [V] `Core:Properties`:

```
Core:Properties V E X N
Core:Property   [   property='export:traits:adj-map'   ] V E X D
([ "color":({ "default" }), "condition":({ "default" }), "material":({ "default" }) ])
Core:Property   [   property='revisions'   ] V E X D
({ 1055962234, "zwoc", "X", 1122146624, "alexander_lancaster", "K", 1125331940, "ocannie", "K", 1125331955, "ocannie", "E", 1598216193, "christophera", "R", 1598222195, "christophera", "E", 1598222212, "christophera", "E", 1598423976, "christophera", "E", 1598423978, "christophera", "E", 1598424045, "christophera", "E", 1598424156, "christophera", "E", 1598424157, "christophera", "E", 1598426166, "christophera", "K", 1598426994, "christophera", "K", 1598427327, "christophera", "K" })
Core:Property   [   property='skill:fatigue'   ] V E X D
1.0
Core:Property   [   property='trait:color'   ] V E X D
"white"
Core:Property   [   property='trait:condition'   ] V E X D
"clean"
Core:Property   [   property='trait:material'   ] V E X D
"cotton"
```

In addition to adding the default traits, it added a special `export:traits:adj-map` property with what is known as a "mapping" which is a special list of the traits that will be used by `+traits` command and other Merry scripts

```
([ "color":({ "default" }), "condition":({ "default" }), "material":({ "default" }) ])
```

Finally, it set the Towel's Ur:Parent to `Shared:clothing:UrClothing`.

In `+obname` if you click on this Towel's [M] link, you'll see what Merry scripts this towel inherited by addin the `Shared:clothing:UrClothing` as its parent.

```
Merry code found in Shared:clothing:ageless:accessories:tutorial-towel-daris:
    Inherited from Shared:sys:CoreClothing:
        lib:expand_extension
    Inherited from Shared:sys:Core:
        lib:spawn:may-spawn
    Inherited from Shared:clothing:UrClothing:
        lib:import_kin
        lib:import_kin_generic
        lib:import_kin_static
        lib:proof:autocheck
        lib:proof:detail
    Inherited from Shared:clothing:UrWearable:
        act:start
        setprop-post:trait
```

We're not going to describe this now, but for instance the Merry scripts `setprop-post:trait` is executed with one of the trait properties is changed, whether by the `+setp` command, the `+traits` tool, or even by another Merry script.

## +proof

So you think your shared Towel is ready for sharing! Let's make another to give to your friend:

```
> +spawn Shared:clothing:ageless:accessories:tutorial-towel-daris
 You may only spawn proofed items.
```

Shared objects are special, and until they are proofed, they are not available to be offered to others.

AN ASIDE: What if you +slay'ed or lost your towel? How do you test it? Do `+tool woe view %Shared:clothing:ageless:accessories:tutorial-towel-daris` to get to the woe view of the object, click on the `spawn` button, take note of the name of the spawn and `+summon [Shared:clothing:ageless:accessories:tutorial-towel-daris]#14032` it to your room.

To proof your object use the command `+proof Shared:clothing:ageless:accessories:tutorial-towel-daris`:

The `+proof` tool will do some automated sanity checks and either offer warning or errors, and then will ask the following questions, while offering tips, advice and tools for testing each:

* Is the woename of this object correct?
* Is this clothing redundant?
* Are the object traits and their defaults sensible?
* Are the descriptions in the prime detail sensible?
* Do the prime singular and plural names make sense?
* Do the adjectives in the prime detail make sense?
* Coverage makes sense?
* Are physical properties sane?

Finally the +proof tool asks to to share some `+objectinfo` notes that will also show up in Woe, to help others who might want to use this object in the future know what it is and does.

Once you have signed off after testing all of these `+proof` questions, added your Woe notes, your Shared object with Traits will be complete.

### Automated Sanity Checks
### Is the woename of this object correct?
### Is this clothing redundant?
### Are the object traits and their defaults sensible?
### Are the descriptions in the prime detail sensible?
### Do the prime singular and plural names make sense?
### Do the adjectives in the prime detail make sense?
### Coverage makes sense?
### Are physical properties sane?
### Are the details properly referenced in the prime?
### Woe Notes
### Complete +Proof

### Worn Descriptions

### Morphs & Clones

### What else needs proofing? +shared

## Part 2


### Adding additional traits: trait:symbol

### Adding additional Descriptions: Embroidery 

### Traits for non-Prime Descriptions: trait:embroidery:threadcolor

### Adding other useful SAM tags

### Self-referencing SAM tags to save effort.

### Adding additonal Ur:Heirarchy

### Adding simple Merry into SAM tags

### Adding simple Merry reactions to signals

## Part 3

### Calling a existing Merry script in a script container

### Writing a less simple Merry script

### Using Ur:Heirarchy for unshared local game Merry functionality
