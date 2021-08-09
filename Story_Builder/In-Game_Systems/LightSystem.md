---
sort: 8
---

# The Light System - A Technical Summary

## What Do You See In A Text-Based Game?

> > \<font size=+2 color=darkgreen\>*\"What light through yonder window
> > breaks?\"*\</font\>\<br/\>\<font size=-1 color=darkgreen\>William
> > Shakespeare (1564 - 1616), \"Romeo and Juliet\", Act 2 scene
> > 1\</font\>

\</blockquote\>

In a text-based description of physical reality, the bulk of descriptive
material is produced by \'visual\' details. Visual perceptive ability,
and much of subjective mood, are affected by the light levels and type
of light sources in an area.

A system to describe illumination levels is really only needed if
illumination can change \-- otherwise, the light level would be a fixed
part of detail descriptions within rooms and areas.

Changes in light levels alter the amount of description provided to
players, the presence or absence of certain details within descriptions,
and the general \'mood\' of an area.

## Approaches

Many MUDs have the concept of day and night descriptions.

Skotos.DartMUD had the concept not only of various light intensities; it
also had the a concepts of night_vision, bright_blindness, and
magical_darkness. In addition, also implemented distance_vision (for
seeing far objects) and detail_vision (for seeing small details). As an
example, Dwarves have terrible distance_vision but great detail_vision
and night_vision.

The problem with Skotos.DartMUD\'s system was it that the simulation was
a bit too realistic, and could make writing descriptions very complex
for the novice builder. For a description system to work well, a
compromise is required between realism and complexity.

## Problems Solved by the Light System

Castle Marrach initially had only \'lit\' rooms, and \'dark\' rooms, but
in recent years, as an \'underworld\' evolved, we required a more
sophisticated system.

The current system allows for the following: \* Descriptions of \'dark\'
rooms as well as three different light levels, \'dim\', \'bright\' and
\'superbright\'. \* Variable room luminosity based on: \* Luminosity of
details \* Luminosity of carried objects \* Size of the room

Together these accomplish a good balance of realism and complexity.
Builders may opt to totally ignore carried lights and describe rooms on
a per-case basis, they may just describe dark and light rooms without
worrying about the other two cases, or they may use all four description
levels to have increasingly dynamic rooms.

In addition, lighting objects is very simple since each light emitting
object just needs one luminosity value.

The following quick summary overview the whole system.

\<table border=1 cellpadding=10 bgcolor=\#eeffff\>\<tr\>\<td\>
[QuickSummaryLightSystem]{.twiki-macro .INCLUDE}\</td\>\</tr\>\</table\>

## Summary of the Light System

### Physical Simulation

We have a simple but powerful simulation of light, based on the way that
light works in the real world, but simplified for prose games.

### Point Sources of Light - Luminosity

Present in each room or area can be any number of point sources of
radiant light. Examples of point sources of inside light can include
candles, torches, flashlights, fireplaces, table lamps, ceiling lights,
etc. Outside sources of light include street lights, the blue sky, the
stars, the moon, the sun, etc.

These points sources are described in separate details (See
DetailSystem); every detail in a room or item can be also be a point
source of light. If it is a source of light, the detail has an intrinsic
luminosity value. All the visible luminous objects in the room together
contribute to the total light in a room.

You can set luminosity in a detail via the Woe interface, or you can get
or set a derived detail property in the detail using a detail reference
from SAM, Bilbo or Merry (We will be using SAM syntax in this document):
\* `$object.details:{detail-id}:luminosity`, for example
`$this.details:lamp:luminosity` or if the detail ID has a space in it
`$this.details:lamp wall:luminosity` \* `$nref.detail:luminosity`, for
example `$target.detail:luminosity`

        > +tool sam exec $actor.base:environment.details:lamp:luminosity
        Original input:
                  $actor.base:environment.details:lamp:luminosity
        Output:
                  "40"

**Note:** When you -do- change the luminosity of a detail, the effects
on any UrChildren may not be immediate. On the Skotos 7 server the
change goes into effect in a matter of seconds, but on Marrach if you
added a glowing detail to the UrMale, it may take an hour to fully
propagate.

Luminosity values for details are scaled using the real-world values
known as \"candelas\" (cd). Though now a Standard Internation (SI) unit,
the definition of a candela was originally based on the measurement of
\"candlepower\":

> > \"One candlepower (cp) is the luminous intensity of a standard
> > candle made of whale wax, weighing 1/6 lb., 7/8 in. in diameter, and
> > burning 120 grains per hour.\"

\</blockquote\>

We do have some standard luminosity levels that can make it useful for
you to gauge how bright you want various objects to be. These were drawn
from real-world luminosity levels, but then modified for \'drama\'. Here
are the values, in candelas, for point sources of light:

     Luminosity Example                                       light level if only light source in a SMALL room
  ------------- ------------------------------------------- --------------------------------------------------
            0.1 starlight                                                                                 dark
            0.1 new moon                                                                                  dark
            0.5 a lit cigarette                                                                           dark
            0.5 quarter moon                                                                              dark
            1.0 a lit candle                                                                               dim
            1.0 half moon                                                                                  dim
            1.0 poor street lighting                                                                       dim
            5.0 full moon                                                                                  dim
            5.0 a lit torch                                                                                dim
           10.0 a lit flashlight                                                                           dim
           12.0 Swann & Edison 100 watt incandescent lamp   
           20.0 Brazier or campfire                                                                        dim
           40.0 Modern GE 40 watt incandescent bulb                                                     bright
           50.0 Fireplace                                                                               bright
           70.0 Modern GE 60 watt incandescent bulb                                                     bright
           95.0 Modern GE 75 watt incandescent bulb                                                     bright
          140.0 Modern GE 100 watt incandescent bulb                                                    bright
          400.0 100 watt flourescent tube                                                               bright
          500.0 red hand flare                                                                          bright
       20,000.0 parachute flare                                                                         bright
       60,000.0 searchlight                                                                        superbright
    1,000,000.0 bright sun                                                                         superbright

In addition, by convention, we use these candelas for outdoor details
that are not precisely \"point sources\".

    Luminosity Example                            light level if only light source in a LARGE room
  ------------ -------------------------------- --------------------------------------------------
          20.0 street lights at night                                                          dim
          40.0 twilight sky                                                                    dim
         100.0 sunset sky                                                                   bright
        1000.0 dull and overcast daylight sky                                               bright
      20,000.0 cloudy daylight sky                                                          bright
     100,000.0 partly-cloudy daylight sky                                              superbright
     200,000.0 hazy daylight sky                                                       superbright

Large, open windows should provide an \'interior\' ambient of about
1/20th the exterior ambient light; doors and small windows about 1/50th
the exterior level (these are *very* rough guidelines).

If the light source you are looking for is not in the above list, there
are some tricks that you can use:

The most accurate way is to look for the \'lumens\' of a light source on
the net. Since 1971, the US Federal Trade Commission has required all
light bulb packages be labelled with lumens output. For example, a 100
watt soft white bulb is labelled 1710 lumens. You can convert most light
bulb lumens roughly to candelas by multiplying by 0.08 (8%). So if you
can find the lumens of a light, you can easily convert it to candelas
for our system.

You can often find the candelas or candlepower for a number of light
sources by searching the net. Be careful, however, with spotlight or
flashlight candepower \-- because they are focused beams of light, they
actually are not as \"bright\" for the purposes of our simulation. The
candelas for a wide-beam flashlight should be divided by 30, a
narrow-beam flashlight by at least 100, etc.

Another trick for roughly determining candelas is by wattage. It is not
very accurate at low wattages, but can give you a guess.

  Light Source                        Candelas per Watt
  --------------------------------- -------------------
  Edison\'s first lamp                              0.1
  Infrared lamps                                    0.6
  Tungsten filament                                 1.5
  Incandescent                                      2.0
  Quartz Halogen                                    2.0
  Mercury                                           4.5
  Fluorescent                                       5.6
  High Intensity Discharge                          6.8
  Metal Halide                                      8.4
  High Pressure Sodium Vapor                        9.6
  Theoretical max for white light                    18

### Ambient Illumination - Base Light

Ambient light is the fairly uniform apparent illumination level for a
large area \-- usually the light level of an entire room or outdoors
\'area.\' Our simplified simulation determines the descriptions of
objects and details based on this ambient light, which we call
\"base:light\". This is measured in a unit called \"lux\".

In the real world, how candelas convert to ambient illumination is quite
complex. In our physical simulation we do not attempt to go to that
level of completeness. Instead, the luminosity of all the visible
details in a room is totaled, then it is modified by the capacity of the
room, and the total becomes the ambient illumination (base light) for
the room.

This approach allows us to more accurately reflect the differences in
light based on the capacity of a room. For instance, a \"standard\" room
capacity is 30 m\^3. This is slightly larger than a 10 foot cube (27.3
m\^3) or a 3m cube (27 m\^3). In a standard capacity room, a single
candle (luminosity of 1) will make the the room dim, and six torches
(luminosity of 30) will make the room bright. A candle may dimly light a
small room, but it should not dimly light a large one.

You can get a derived property to see the current base light level in a
room: \* In a room: `$object.base:light`, for example `$this.base:light`
\* From an object in a room: `$object.base:environment.base:light`, for
example `$actor.base:environment.base:light`

        > +tool sam exec $actor.base:environment.base:light
        Original input:
                  $actor.base:environment.base:light
        Output:
                  "55"

You can see the luminosity of each object that contributes light to the
room using Zell\'s luminometer, or look at the luminosity of a specific
object:

        > +spawn Zell:luminometer
        Christopher Allen's eyeball-on-a-stick arrives.
        A spawn of an eyeball-on-a-stick has been created and teleported into your inventory.
        > wave my stick
        You wave your eyeball-on-a-stick.
        `--.[55] a small room
        ....|--.[40] /lamp/
        ....|--.[10] you
        ....|...`--.[10] your lit flashlight
        ....|.......`--.[10] /light/
        ....`--.[5] /light door/
        This room's floor is 93% of a 'standard' one; thus dark turns to dim at 0.92866189 total luminous intensity; it turns bright at 9.2866189.

### Light Categories

The ambient light (base:light) of a room is translated into four light
categories \-- dark, dim, bright, or superbright. These levels are
hardcoded, and affect brief, glance, look, and examine descriptions for
all details.

With ambient lighting of 30 or more there is full illumination of all
details \-- we call this \"bright\". At an ambient level less then 30,
colors and fine details begin to be lost \-- this we call \"dim\". With
an ambient light of less then 1, text cannot be read no matter how close
you hold it \-- this results in \"dark\", and many objects are then
unreachable. Optionally, ambient lighting that is greater then 100,000
is considered \"superbright\", typically for sun-lit outside locations
to differentiate the descriptions from those due to bright lights at
night.

When the ambient light in a room changes category (e.g. dark to dim) in
a room, such as someone turning on the lights or entering with a torch,
the change is reported to everyone present.

The four light categories are:

  base:light-category     base:light-level base:light
  --------------------- ------------------ -----------------------------------------------------------------------------------
  dark                                   1 in a standard capacity room, a base:light of less then 1
  dim                                    2 in a standard capacity room, a base:light of 1 or greater, and less the 10
  bright                                 3 in a standard capacity room, a base:light of 10 or greater, and less then 100,000
  superbright                            4 in a standard capacity room, a base:light of 100,000 or greater

You can use a derived property to get the current light category name
for a room: \* In a room: `$object.base:light-category`, for example
`$this.base:light-category` \* From an object in a room:
`$object.base:environment.base:light-category`, for example
`$actor.base:environment.base:light-category`

        > +tool sam exec $actor.base:environment.base:light-category
        Original input:
                  $actor.base:environment.base:light-category
        Output:
                  "bright"

You can also used derived property to see the numerical value of the
light category in a room: \* In a room: `$object.base:light-level`, for
example `$this.base:light-level` \* From an object in a room:
`$object.base:environment.base:light-level`, for example
`$actor.base:environment.base:light-level`

        > +tool sam exec $actor.base:environment.base:light-level
        Original input:
                  $actor.base:environment.base:light-level
        Output:
                  "3"

In addition, there are four booleans than can be used for testing the
light catagories: \* **`base:dark`** \-- true if the light category is
\"dark\" \* **`base:dim`** \-- true if the light category is \"dim\" \*
**`base:bright`** \-- true if the light category is \"bright\" \*
**`base:superbright`** \-- true if the light category \"superbright\"

You can also use this handy +tool script to see what players would see:

        > +tool sam exec <describe what="$(this.base:environment)" cap="1"/> is $[Call(${Lib:light}, "lights-description", $env: $this)].
        Original input:
                  <describe what="$(this.base:environment)" cap="1"/> is $[Call(${Lib:light}, "lights-description", $env: $this)].
        Output:
                  "A small room is dimly lit by a light from a flashlight."
        >

You\'re invited to examine the lights-description code in Lib:light to
see how it works!

### Light & Descriptions

The light category of a room can affect how objects are described. Both
brief descriptions and glance/look/examine descriptions adjust to light
level, as follows:

\|** **\|brief\|glance/look/examine\|will be shown if
base:light-category is dim, bright, or superbright, but not if dark\|
\|**dark**\|brief-dark\|glance-dark/look-dark/examine-dark\|shown only
if base:light-category is dark, overriding even the -full descriptions\|
\|**dim**\|brief-dim\|glance-dim/look-dim/examine-dim\|shown only if
base:light-category is dim\|
\|**bright**\|brief-bright\|glance-bright/look-bright/examine-bright\|shown
only if base:light-category is bright, or if superbright doesn\'t exist
and bright:light-category is superbright\|
\|**superbright**\|brief-superbright\|glance-superbright/look-superbright/examine-superbright\|shown
only base:light-category is superbright\|
\|**full**\|brief-full\|glance-full/look-full/examine-full\_\|always
shown, no matter what light category, unless a -dark, -dim, -bright, or
-superbright description takes precedence. (Generally used as an
alternative to dark/dim/bright/superbright if you prefer to use inline
SAM, as discussed below.)\| \|**unseen**\|brief-unseen\|\|not directly
related to darkness, used whenever something is entirely unidentifiable
yet must be described\|

If you are an entirely dark room, brief-dark is used for object that you
can interact with \-- because they\'re in your inventory, or near you,
or have the \'targetable when dark\' flag set. The brief-unseen is used
for other objects, e.g. if a person speaks on the other side of the
room, or pokes you with a stick, thus a cigarette with a faintly glowing
tip should have a brief-dark that mentions the glow, and have
targetable-when-dark set. It can also have a brief-unseen, which should
mention **no** visual clues. If there is no brief-unseen, \'something
unseen\' is used as the default description.

See DescriptionSystem for more information on descriptions.

### Darkness

In a dark room, briefs are converted to \"something unseen\"; any
glance, look, or examine descriptions are converted to \"It\'s dark.\"
The room inventory will be also be supressed.

In a dark room, you can only interact with items you\'re holding, or
that you are proximate to. Other people\'s actions are reported as done
by \'something unseen\' if they make noise (verb has its audible flag
set to true) or affects you directly:

\* Someone unseen coughs. \* Someone unseen pokes you in the ribs. \*
Someone unseen prods you with something unseen.

We currently have a prototype concept of infravision: set the property
`base:infravision` on yourself to experiment with this. The property
will almost certainly change, so this is for testing only.

### Writing Descriptions

Each game may have its own standards for what is included in
superbright, bright, dim, or dark descriptions; however, the following
system seems to work \'pretty good\' so far.

#### Bright Descriptions

The plain old \"look\" descriptions are typically what should be written
into bright descriptions. They should include all the color and subtle
details possible.

#### Dim Descriptions

Dim descriptions are very similar to bright descriptions, however, color
sensitivity at dim light levels is significantly less. Dark colors fade
to grey, bright colors fade to primary. For instance, \'dark red\'
becomes \'dark gray\', and \'light green\' becomes \'green\'. Materials
identification may degrade \... the \"Nigerian Palm Weasel\" fur may
just be identified as \"weasel fur\" or even just \"brown animal fur.\"
In addition, subtle details are sometimes lost \-- a \"Doric column\"
might become a \"classical column\", a \"fire-engine red Lamborghini\"
might become just a \"red Italian sports car\", etc..

#### Dark Descriptions

Dark descriptions are the hardest to write. In most situations a dark
description of an object will not even be displayed unless the object is
in your possession. Often you just use a sentence that is no more then
the brief \"A room.\", \"A handle.\". Sometimes, you\'ll explicity say
that is is dark \"A dark room\", a \"A table in the darkness\". For some
objects, this is the time to describe only what you can also feel, \"The
flashlight has a handle and you feel a switch.\"

#### Superbright Descriptions

Superbright descriptions are used typically in outside rooms that
experience night and day. They allow the descriptions to differ from a
brightly lit night \"The sandy beach is brightly lit by streetlights\"
vs. the superbright day \"The sunlit beach.\"

#### Full Descriptions

A \'look-full\' descriptions allows you to take complete control over
how light is described completely in SAM. If you just use the plain
\'look\' and it was truly dark, the default \"It\'s dark\" output will
be given. With \'look-full\' you have complete control over all
descriptions from 0 to 100,000+ luminosity.

Examples:

         {? | $actor.base:environment.base:dark | The object can barely be seen in the darkness. }
         {? | $actor.base:environment.base:dim | The object is shadowed in the dimness. }
         {? | $actor.base:environment.base:bright | The object is brightly lit. }
         {? | $actor.base:environment.base:superbright | The object is blindingly lit. }
         {? when | $this.base:light-level |
              1 | the room is dark |
              2 | the room is dim |
              * | the room is bright or superbright}
         {? lessthen | $this.base:light-level | 3 |
              The room is dark or dim |
              The room bright or superbright }
         {? greaterthen | $this.base:light-level | 2 |
              The room is bright or superbright |
              The room is dark or dim }

The advantage of using \"full\" is that you can easily share
descriptions between light levels without having to rewrite them, while
at the same time you do have control for appropriate differentiation.

### Reacting to changes in light levels

Whenever the light level in an object changes, a signal is triggered in
that object: if the object got brighter, \'base/lightens\' occurs, and
if it got darker, \'base/darkens\' does. Special variables are set for
these calls:

  -------------------- -----------------------------------------------------
  old-light            The amount of light in the object before the change
  old-light-category   The categorization of old-light; dark/dim/bright
  new-light            The amount of light in the object after the change
  new-light-category   The categorization of new-light; dark/dim/bright
  light-bringer        The object that \'brought\' the light; see below
  -------------------- -----------------------------------------------------

The default result of this action is the description \"It\'s now bright
here, rather than dark.\" As usual with signals, you can catch the -pre,
-prime, -desc and -post signals. If you only want to change the
description, catch only the -desc signal. If you want side-effects, put
them in the -post signal. The -pre signal is largely useless because a
light level change cannot be prevented.

The \$(light-bringer) variable is set only for those changes in light
level that are caused by an object entering (or leaving) an environment.
The original purpose of the variable was to hide the \"It\'s now
bright\...\" from a player who walks with a torch from dark room to dark
room. It\'s quite generally useful a variable, though.

## Dynamic Luminosity

### Looking at Lights

If you have fiddled with lights, it can often be confusing to you, and
to your users, as to what is lighting what.

The Zell:luminometer can be used to help you debug, but it too can be
confusing.

For instance:

        > +spawn Zell:luminometer
        Christopher Allen's eyeball-on-a-stick arrives.
        A spawn of an eyeball-on-a-stick has been created and teleported into your inventory.
        > wave my stick
        You wave your eyeball-on-a-stick.
        `--.[55] a small room
        ....|--.[40] /lamp/
        ....|--.[10] you
        ....|...`--.[10] your lit flashlight
        ....|.......`--.[10] /light/
        ....`--.[5] /light door/
        This room's floor is 93% of a 'standard' one; thus dark turns to dim 
            at 0.92866189 total luminous intensity; it turns bright at 
            9.2866189.

To make it easier for both you and your users, there is some very simple
SAM that you can put into a special \"look at lights\" detail in your
UrRooms. What this SAM function does is convert that information into
something that is prose, useable yourself for debugging and by users who
are confused about light sources.

You can put this SAM at the top of all your UrRoom chains, with an
easily recognizable and unique detail ID, e.g. \"lightcheck\".

        DETAIL [lighcheck]
        Brief: lights
        Look: [*
            <describe what="$(actor.base:environment)" cap="1"/> is 
            $[Call(${Lib:light}, "lights-description", $env: 
            $actor."base:environment")].
        *]
        Pbrief: lights
        Name: lights
        Name: brightness/brightnesses
        Adjective: bright
        Adjective: dim

Now, as long as you don\'t have any rooms with a detail ID
\"lightcheck\" or with a detail with the singular name \"lights\", you
get this effect:

        > look at lights
        A small room is brightly lit by a ceiling lamp fixture and dimly lit by a flame.
        > drop torch
        You drop a flaming torch.
        After you drop a flaming torch near the door, the flame goes out.
        > look at lights
        A small room is brightly lit by a ceiling lamp fixture.

### Example: A Switchable Ceiling Lamp

There are a number of techniques for changing luminosity using Merry,
but following is the primary technique that we will be using for turning
on and off luminosity for Lovecraft Country and probably all future
games.

This technique can be done entirely in KarMode with only a smidgeon of
SAM \-- no Merry coding at all, and I\'ve attempted to make it so that
you can just copy and paste, with trivial changes, for it to work in
your rooms.

The simplest of lights just require two details, a switch and a light.
Both of these can be done in KarMode. For instance:

        ----------------------------------------------------------------------
        DETAIL [lamp]
        Brief: ceiling lamp
        Pbrief: ceiling lamps
        Examine: [*
            A simple lamp fixture is attached to the ceiling. It has a 
            frosted glass dome of a milky white color and is set in a brass 
            band rim about fifteen inches in diameter.
        *]
        Look: [*
            A simple lamp fixture is attached to the ceiling.
        *]
        Name: lamp/lamps
        Name: fixture/fixtures
        Name: light/lights
        Name: lighting/lights
        Adjective: ceiling
        Adjective: simple
        Adjective: brass
        Adjective: domed
        Adjective: frosted
        Adjective: glass
        Adjective: lamp
        Adjective: light
        ----------------------------------------------------------------------
        DETAIL [switchwall]
        Brief: wall switch
        Pbrief: wall switches
        Look-bright:  A brass wall switch that toggles up and down. It is 
                          near the door on the south wall.
        Name: switch/switches
        Name: plate/plates
        Adjective: brass
        Adjective: light
        Adjective: wall
        Adjective: toggle

Once you have created these details, then just paste these \"signal
descriptions\" into the KarMode of the switch detail to have the lamp
turn on and off:

        React-post:verb/toggle-dob: [*
            {? | $(this.details:lamp:luminosity) |  The lamp in the ceiling 
            turns off. $[Set($this, "details:lamp:luminosity", 0.0);] | 
            The lamp in the ceiling turns on. $[Set($this, 
            "details:lamp:luminosity", 40.0);] }
        *]
        React3-post:verb/toggle-dob: [*
            {? | $(this.details:lamp:luminosity) |  The lamp in the ceiling 
            turns on. | The lamp in the ceiling turns off.}
        *]

So what do these \"signal descriptions\" do?

When you toggle the switch, after the normal \"Christopher toggles the
switch\" is output to everyone, the system looks for reactions (react)
that should happen after the action is completed (react-post:) with the
verb (react-post:verb/toggle) that has a direct object
(react-post:verb/toggle-dob). If there is a detail named appropriately,
it will output the text in that detail. In this case the text in
react-post:verb/toggle-dob is output.

React-post:verb/toggle-dob contains a SAM statement in it that checks to
see if the lamp is lit, and if it isn\'t, makes it lit.

        > toggle switch
        You move from the door to a wall switch.
        You toggle a wall switch.
        The lamp in the ceiling turns off.
        It's now dim here, rather than bright.
        > toggle switch
        You toggle a wall switch.
        The lamp in the ceiling turns on.
        It's now bright here, rather than dim.
        >

After reactions, the system looks for other people that might see the
reaction (react3:). If there is a detail named appropriately, it will
then output that text. In this case the text in
react3-post:verb/toggle-dob is output.

React3-post:verb/toggle-dob contains a SAM statement in that it checks
if the lamp was just turned \'on\', and if it was, tells everyone in the
room.

        >
        Michaelb toggles a wall switch.
        The lamp in the ceiling turns off.
        It's now dim here, rather than bright.
        >
        Michaelb toggles a wall switch.
        The lamp in the ceiling turns on.
        It's now bright here, rather than dim.
        >

The switch and the lamp are now basically functional.

For your own use, you may need to change the text of these two
description slightly.

**If the detail is not a lamp:** If the object that is being turned on
and off is not a lamp, change every occurance of \"lamp\" to the
appropriate noun. In addition, make sure that
\"details:lamp:luminosity\" portion of the text matches the ID of the
detail, for instance if the detail ID is \"blue lamp\" then the SAM
should be changed to \"details:blue lamp:luminosity\".

**If the detail is not bright:** In a small room, a single lamp will
make it \"bright\" \-- bright starts at 10.0. If a room is much larger,
you may not want to lamp to illuminate with a brightness of 10, but
instead illuminate more dimly at 5.0, requiring another lamp or a torch
(whose flames are luminosity 5) for the room to be bright. By
convention, a candle has a luminosity of 1.0, thus will dimly light a
room, and ten candles will brightly light a room. A torch has a
luminosity of 5.0, also dimly lighting a room, but only two torches are
required to brightly light the room.

**If the verb is not toggle:** Just change the description to the
appropriate verb, i.e. react-post:verb/push-dob &
react3-post:verb/push-dob.

#### Simple Refinements

There are some other refinements you can do easily:

**Verb hints:** How do players know what verb to use with a switch? You
may want to add some more signal descriptions.

For things that are possible, but do not operate the switch correctly,
use this react-post form:

        React-post:verb/push-dob: [*
          Pushing the wall switch does nothing, but you could toggle it.
        *]

With this, everyone will see you pushing the switch, but only you will
see that it didn\'t work:

        > push switch
        You push a wall switch.
        Pushing the wall switch does nothing, but you could toggle it.
        >

For things that are obviously impossible, you can also prevent the
action from happening at all by using the react-pre form:

        React-pre:verb/pull-dob: [*
          You can't pull the wall switch, but you can toggle it.
        *]

In this case, you are stopped when you attempt to pull the switch, but
no one else will see you try.

        > pull wall switch
        You can't pull the wall switch, but you can toggle it.
        >

You can also prevent someone from trying to toggle the incorrect item,
such as the lamp.

        React-pre:verb/toggle-dob: [*
          There is nothing to toggle on the ceiling lamp. Maybe you want to toggle the switch?
        *]

This results in:

        > toggle lamp
        There is nothing to toggle on the ceiling lamp. Maybe you want to toggle the switch?
        >

You can also prevent whole classes of actions:

        React-pre:sense/touch-dob: [*
          You can't quite reach the ceiling lamp fixture.
        *]

This results in all attempts to touch or feel the lamp to fail:

        > touch lamp
        You can't quite reach the ceiling lamp fixture.
        > caress lamp
        You can't quite reach the ceiling lamp fixture.
        >

A note: In general it is better to do a react-post warning then a
react-pre stopping of an action. When possible, everyone in the room
should have a chance to see the \"incorrect\" action. Use -pre to stop
things that someone just wouldn\'t attempt to do given the situation,
such as trying to touch a lamp that is 12 feet overhead.

**Adding light value to the light source:** With the lamp above, it will
always look like \"A simple lamp fixture is attached to the ceiling.\"
However, you may want it to show that it is lit. You can add the SAM
text below to the detail\'s look or examine descriptions and it will
tell you if the item is lit or not:

        Look: [*
            A simple lamp fixture is attached to the ceiling. {? | 
            $(this.details:lamp:luminosity) |  The lamp is brightly lit. | 
            The lamp is unlit.}
        *]

When the lamp is on this will result in:

         > look at lamp
         A simple lamp fixture is attached to the ceiling. The lamp is 
         brightly lit.
         >

**Adding light value to other objects:** You may also want to have how
much light is illuminating other objects in the room, or in the room
description itself. This can be done by adding SAM to your detail\'s
look or examine description.

For a room or for room details the SAM is as follows:

        Look: [*
             A small square room, painted white.  The room is 
             $(this.base:light-category)ly lit.
        *]

This will result in \"A small square room, painted white. The room is
dimly lit.\".

For stand alone objects, it it slightly different.

        Look: [*
             A desk. The surface of the desk is 
             $(actor.base:environment.base:light-category)ly lit.
        *]

This will result in \"A desk. The surface of the desk is dimly lit.\"

### Example: A Dynamic Flashlight

Using a similar techniques you can make a fairly sophisticated
flashlight, done entirely with KarMode. In
`[[http://skotos-seven.skotos.net:6080/Dev/Kar.sam?obj=Examples%3Acomplete%3Alight%3Aflashlight][+tool woe karmode %Examples:complete:light:flashlight]]`,
rather then changing the luminosity, we show or hide a \"light\" detail.

        > +tool woe karmode %Examples:complete:light:torch
        Viewing Woe object in popup window.
        >
        
        DETAIL [default]
        Brief: {? not | $(this.details:light:hidden) |lit } flashlight
        Look: [*
          {? not | $(this.details:light:hidden) | A flashlight shines with a 
          cold yellow light. | A flashlight is unlit but ready.}
        *]
        Examine: [*
          {? not | $(this.details:light:hidden) | A simple cylindrical 
          flashlight with a dull aluminum shaft with a small switch on top. 
          The bulb of the flashlight illuminates the room with a beam of cold 
          yellowish light.| An unlit flashlight, with a dull aluminum shaft 
          with a small switch on top.}
        *]
        Pbrief: {? not | $(this.details:light:hidden) |lit }flashlights
        React-desc:verb/extinguish-dob: [*
          {? not | $(this.details:light:hidden) | $[EmitTo($actor, 
          Describe($this, nil, $actor) + " turns off."); EmitIn(Get($actor, 
          "base:environment"), Describe($this, nil, nil) + " turns off.", 
          $actor); Set($this, "details:light:hidden", TRUE);] | The 
          flashlight is already off. }
        *]
        React-desc:verb/light-dob: [*
          {? not | $(this.details:light:hidden) | The flashlight is already 
          on. | $[EmitTo($actor, Describe($this, nil, $actor) + " turns 
          on."); EmitIn(Get($actor, "base:environment"), Describe($this, 
          nil, nil) + " turns on.", $actor); Set($this, 
          "details:light:hidden", FALSE);] }
        *]
        React-post:sense/smell-dob: The flashlight has no obvious smell.
        React-post:sense/taste-dob: The flashlight tastes vaguely of metal.
        React-post:sense/taste-iob: The flashlight tastes vaguely of metal.
        React-post:sense/touch-dob: [*
          The flashlight is roughly cylindrical, is cool to touch, and 
          should be easy to grip. {? not | $(this.details:light:hidden) | 
          The light rising from the bulb also feels quite cool. }
        *]
        React-post:verb/switch-dob: [*
          {? not | $(this.details:light:hidden) | The flashlight switches 
          off. $[Set($this, "details:light:hidden", TRUE);] | The flashlight 
          switches on. $[Set($this, "details:light:hidden", FALSE);] }
        *]
        React-post:verb/toggle-dob: [*
          {? not | $(this.details:light:hidden) | The flashlight toggles 
          off. $[Set($this, "details:light:hidden", TRUE);] | The flashlight 
          toggles on. $[Set($this, "details:light:hidden", FALSE);] }
        *]
        React3-post:verb/switch-dob: [*
          {? not | $(this.details:light:hidden) |  The flashlight turns on. 
          | The flashlight turns off.}
        *]
        React3-post:verb/toggle-dob: [*
          {? not | $(this.details:light:hidden) |  The flashlight turns on. 
          | The flashlight turns off.}
        *]
        Name: flashlight/flashlights
        Name: switch/switches
        Adjective: aluminum
        Adjective: metal
        ----------------------------------------------------------------------
        DETAIL [light]
        Brief: light from a flashlight
        Look: A yellowish light from a flashlight.
        Examine: [*
          The bulb at the end of a flashlight emits a beam of cold yellowish 
          light.
        *]
        Pbrief: lights
        Name: light/lights
        Name: bulb/bulbs
        Adjective: light

In the above example, we change the actual text of the brief, look, and
examine descriptions by whether or not the light is hidden.

If you look carefully, the \"toggle\" and \"switch\" react-post signal
descriptions are very similar to that of the the wall switch, except
instead we are setting the light detail to be hidden rather then setting
the luminosity of the light detail. Also note the more complex \"light\"
and \"extinguish\" react-desc signal descriptions \-- these carry just a
little bit more of inline Merry. To look at that more closely, here is
that inline Merry code with comments:

        /* Tell the actor "Your flashlight turns on." */
            EmitTo($actor, Describe($this, nil, $actor) + " turns on.");
        /* Tell everyone where the actor is located that "Actor's flashlight turns on."
            EmitIn(Get($actor, "base:environment"), Describe($this, nil, nil) + " turns on.", $actor);
        /* Reveal the detail in this object with the id of "light" */
        Set($this, "details:light:hidden", FALSE);

### Example: Dynamic Light from Adjacent Rooms

In most rooms there are other sources of light then direct sources such
as lamps and torches. The most common of these is light shining from an
adjacent room, or though a curtain from outside. This technique is a
little more sophisticated then the simple lighting as described above,
but still can be done from KarMode with no knowledge of Merry.

For each room that has a door that light can shine through, a second
detail is created that describes the brightness past the door. In
Examples:complete:desc:urroom it is the \"light door\":

        ----------------------------------------------------------------------
        DETAIL [light door]
        Brief: light from the other side of the open door
        Look-bright: [*
          Some light shines from the other side of the open door.
        *]
        Look-dark: It is dark in here.<br/>
        Look-dim: [*
          Some light shines from the other side of the open door, dimly illuminating <describe what="$(actor.base:environment)"/>.
        *]
        Name: light/lights
        Name: illumination/illuminations
        Adjective: dim
        Adjective: distant
        Adjective: door
        Adjective: faint
        Adjective: other

Then in the react-post:verb/toggle-dob signal description, a slightly
more complex SAM is used:

        React-post:verb/toggle-dob: [*
            {? | $(this.details:lamp:luminosity) |  The lamp in the ceiling 
            turns off. $[Set($this, "details:lamp:luminosity", 
            0.0);Set(${Examples:complete:desc:closet}, "details:light 
            door:luminosity", 0.0);] | The lamp in the ceiling turns on. 
            $[Set($this, "details:lamp:luminosity", 
            40.0);Set(${Examples:complete:desc:closet}, "details:light 
            door:luminosity", 5.0);] }
        *]

The difference between this and the simple lighting SAM for
react-post:verb/toggle-dob is that in addition to changing the
luminosity of the local lamp, we are also changing the luminosity of the
\"light door\" detail on the other side of the closet.

Last, in the door itself, the following six signal descriptions are set
such that when you open or close the door the \"light door\" detail is
hidden or revealed in the room itself. The react-desc handles changing
the lights if someone opens or closes the door on this side of the door,
react3 tells everyone else what happens if someone opens or closes the
door on this side of the door, and reactin tells everyone what happens
if someone on the other side of the door opens or closes the door.

Example:

        React-desc:close-what: [*
            You shut <describe what="$(target)"/>. $[Set($this, 
            "details:light door:hidden", TRUE);]
        *]
        React-desc:open-what: [*
            You open the <describe what="$(target)"/>. $[Set($this, 
            "details:light door:hidden", FALSE);]
        *]
        Reactin-desc:door/closes: [*
            <describe what="$(target)" cap="1"/> closes from the other side. 
            $[Set($this, "details:light door:hidden", TRUE);]
        *]
        Reactin-desc:door/opens: [*
            <describe what="$(target)" cap="1"/> opens from the other side. 
            $[Set($this, "details:light door:hidden", FALSE);]
        *]
        React3-desc:close-what: [*
            <describe what="$(actor)" cap="1"/> shuts <describe 
            what="$(target)"/>.
        *]
        React3-desc:open-what: [*
            <describe what="$(actor)" cap="1"/> opens <describe 
            what="$(target)"/>.
        *]

The combination of all of these results in the following:

        > l
        A small, simple white room, with a doorway to the south.
        > look at lights
        A small room is brightly lit by a ceiling lamp fixture and dimly lit 
            by a light from the other side of the open door.
        > close door
        You shut the door.
        > look at lights
        A small room is brightly lit by a ceiling lamp fixture.
        > open door
        > toggle switch
        You move from the door to a wall switch.
        You toggle a wall switch.
        The lamp in the ceiling turns off.
        It's now dim here, rather than bright.
        > look at lights
        A small room is dimly lit by a light from the other side of the open 
            door.
        > s
        You move from a wall switch to the door.
        You begin to enter the door.
        You pass through the door to the south ...
        ... and arrive at ...
        A small, simple white closet, with a doorway to the north.
        > look at lights
        A small closet is brightly lit by a ceiling lamp fixture.
        > pull chain
        You move from the door to a light fixture chain.
        You pull a light fixture chain.
        The lamp in the ceiling turns off.
        It's now dark here, rather than bright.
        > n
        You move from something unseen to something unseen.
        You begin to enter the door.
        You pass through the door to the south ...
        ... and arrive at ...
        A small room.
        You are standing near something unseen.
        > look at lights
        You see no lights here.
        >

#### Advanced Adjacent Room Example

For a complete demonstration of two rooms with this advanced lighting,
take a look at:

\*
`[[http://skotos-seven.skotos.net:6080/Dev/Kar.sam?obj=Examples%3Acomplete%3Adesc%3Aroom][+tool woe karmode %Examples:complete:desc:room]]`
\*
`[[http://skotos-seven.skotos.net:6080/Dev/Kar.sam?obj=Examples%3Acomplete%3Adesc%3Acloset][+tool woe karmode %Examples:complete:desc:closet]]`
\*
`[[http://skotos-seven.skotos.net:6080/Dev/Kar.sam?obj=Examples%3Acomplete%3Adesc%3Aurroom][+tool woe karmode %Examples:complete:desc:urroom]]`

### Example: A Torch in Merry

There is a fairly sophisticated example of the LightSystem using Merry
at

\*
`[[http://skotos-seven.skotos.net:6080/Dev/Form.sam?obj=Examples%3Acomplete%3Alight%3Atorch][+tool woe edit %Examples:complete:light:torch]]`

It is working torch, lightable, extinguishable, with luminosity, sense
descriptions, random emits when lit; it runs out in about 17-20 minutes,
goes out if dropped, decays in a day if spent, etc.

There are lots of comments in the Merry scripts. It illustrates use of
the setprop-post signal, Every(), \$delay(), a react signal script
sending info to react:post, and how to avoid crashing if your object is
not located where you expect it to be when you do an emit.

The torch is completely functional as-is, though still a bit a work in
progress in minor ways. Still yet to do: convert light/extinguish to
neoct so that only flammable items can be lit, handle more synonyms of
verbs, add more details, make it lightable only by iob from a flame
detail in a room or an object that has a flame, more proximity checks,
have flame go out if you put it in bag, more randomness OneOfs in
messages, etc.

------------------------------------------------------------------------

## Misc.

Below about 1 lux, text cannot be read \-- no matter how close you hold
it. The lower limit of human visual response is at about 0.01 (one
one-hundredth) lux. Color vision dimishes below 30 lux, and vanishes
below 0.02 lux.

A cheap CCD camera (a typical surveillance camera) can pick up an image
down to 0.1 lumen. Cheap night-vision gear has a \'system\'
amplification of 400 to 1,000 times; better stuff multiplies
illumination by 2,000 to 4,000.

References:

\* Other systems that impact the Light System: ProximitySystem ,
DetailSystem

\* Other systems the Light System impacts: DetailSystem ,
Skotos.SignificanceSystem

------------------------------------------------------------------------

## Old Documents

\<font color=red\>This rest of this document is relatively out of date,
and doesn\'t contain information on the current light system. Some of
the information will be merged in the document above, some will go away,
some are ideas for the future.\</font\>

**Illumination and Proximity**

Each room will have some way of setting or varying the ambient lighting
levels, in lux. In Marrach, this will probably be related to a *time of
day* variable, and possibly further to the open/closed state of doors or
windows. For other games (especially modern games) this will often be
controlled by \'light switches\' characters may have access to. Over 20
lux ambient lighting, don\'t worry about the point lighting stuff below.

\'Point\' light sources produce lumens; see the list below. If we assume
(to a first approximation) that 1/3 of the lumens \'hit the floor,\'
then we can say general lighting lux levels (from point sources) = total
lumens in room / (3 x floor area in square meters). If this value is
over 20 lux, don\'t go any further.

If, however, the overall room lighting is less than 20 lux, the actual
visibility levels \'nearer\' to the light sources will have to be
determined. Each point source will produce a certain amount of
illumination in various proximity regions:

\* within the chamber, the formula is as given above. \* within a
vicinity, use 1/4 of the floor area, instead of the entire floor area.
\* for \'nearby\' proxes, use 4 square meters, or 1/8 of the room area,
whichever is less. \* for \'adjacent\' proxes, use 1 square meter, or
1/16 of the room, whichever is less.

The total illumination from all ambient light and point sources must be
totalled to test the visibility of a detail.

*Example: a room 4 meters on a side has a small window or windows
providing some residual ambient light from the twilight outside \-- 0.1
ambient lux. The room contains a table; on the table is a candlestick.
The candle produces 12 lumen; the room\'s general lighting is therefore
0.35 lux (0.25 + 0.1) \-- equivalent to a full Moon directly overhead.
The table, adjacent to the candlestick, receives 12.1 lux, and is fully
visible (0.5 full, 0.005 partial). People nearby are at 6.1 lux \...
also easily seen (0.5 full, 0.001 partial). Other people, at the same
end of the room as the table (same vicinity), are illuminated at 0.6 lux
\-- some of their own smaller details might not be visible. People in
other ends of the room have only a \'reduced\' description (being
illuminated at 0.35 lux).*

Use of the \'examine\' command \[ *assuming that is the one which
affects a character\'s prox status* \] will double the lux value at the
examined detail for purposes of visibility (i.e., not for emotional
content).

\-\-\--

**Sample Lux Values**

\* **\'Sky\' Light** \* Moon-less night with overcast sky: 0.0001 \*
Moon-less night with clear sky: 0.001 (includes airglow, stars) \* end
of nautical twilight: 0.008 \* quarter Moon in clear night sky: 0.01 to
0.03 \* full Moon in clear night sky: 0.1 to 0.3 \* suburbs, evening
post-curfew: 1 \* deep twilight: 1 \* urban residential areas, post
curfew: 2 \* suburbs, evening pre-curfew: 3 \* urban commercial
districts, post-curfew: 6 \* urban residential areas, pre-curfew: 8 \*
twilight: 10, down to 3 \* urban commercial districts, pre-curfew: 15 \*
very dark overcast day: 100 \* sunrise or sunset on a clear day: 453 \*
outdoors on a cloudy day: 1,000 to 5,000 \* 1 hour after sunrise, direct
light on clear day: 18,000 \* full daylight, but indirect light only:
10,000 to 26,000 \* full sunlight: 50,000 to 130,000 (indirect is 1/5 of
this)

\* **\'Artificial\' Ambient Light** \* machine rooms in basements: 20 \*
parking lots in general: 22 \* inactive storage spaces: 50 \* general
minimum for passages and doors: 54 \* gallery lighting in museums: 50 to
200 \* stairwells, freight elevators, truck docks, warehouse
passageways: 100 \* parking lots, brightest areas at night: 100 to 200
\* gas stations, under canopy: 100 to 1,000 \* rough (non-detail) work
industrial spaces: 200 \* indoor public pool: 300 \* modern offices: 200
to 500 \* critical or detailed work spaces: 500 \* well-lit modern
classroom: 500 \* stage lighting, ordinary: 500 to 1,000 \* indoor
public pool, during competition: 1,000 \* tailors, jewelers,
seamstresses work areas: 1,000 to 4,000 \* well-lit retail store: 750 to
1,500

------------------------------------------------------------------------

**TECHNICAL REQUIREMENTS**

**General Requirements:** 1 **Must (Dependent)** be able to set light
levels in rooms. 2 **Must (Dependent)** be able to set light visibility
levels on objects.

Basic requirement: rooms show light levels and room/object/detail
descriptions change based on those light levels.

**Light Source Requirements:** 1 **Must** be able to identify working
light sources. 2 **Must** be able to assign light levels to those
sources. 3 **Should** be able to turn light sources on and off.

To make this system work, objects might have light levels associated
with them. Most intuitively, this system would work for torches,
lanterns, fireplaces, etc. Light levels could also be set for windows,
etc., instead of having ambient light.

**Object Lighting Requirements:** 1 **Must** be able to set light levels
for objects/details, to determine whether they are visible or not. 2
**Should** be able to set tiered light levels for objects/details, to
give increasing levels of description as light level increases.

Once lit, objects will reveal varying levels of detail.

**Advanced Lighting Requirements:** 1 **May** be able to specify an
ambient illumination level in rooms. 2 **May** have variable ambient
lighting to represent day/night cycle. 4 **May** have ambient lighting
change with door/window condition. 5 **May** combine ambient and
\'point\' light levels to produce a total general light level

There is the possibility of a more complex system of lighting where you
have both ambient light and point lights, which combine to produce the
overal lighting in a room, as described elsewhere in this article.

------------------------------------------------------------------------

**Physical simulation**

We have a simple but powerful simulation of light.

Currently the light level in a room is translated to dark, dim, bright,
or superbright. The levels are hardcoded and thus essentially define the
scale and linearity of the unit used for luminosity. These 4 levels then
affect brief, glance, look, and examine descriptions.

When the light level changes category (dark to dim, e.g.) in a room,
such as someone turning on the lights or entering with a torch, this is
reported to everyone present. (comment: This output is not yet
woe-editable\... it will be. Signals are not yet fired. They will be.)

The physical simulation works as follows:

\* All object details have an intrinsic luminosity value attached to
them. The total luminosity intrinsically contribued by an object is the
linear sum of such detail luminosities. \* The actual light level
contributed by an object is the sum of its intrinsic contribution and,
recursively, of all of its inventory (containers are a special case, see
below). \* Thus Zell, carrying a lit torch, contributes to the room the
light emitted from the torch. \* Objects inside open containers, or
inside transparent containers, will also contribute to the luminosity.
\* When we test the light level of an object, we actually scan upwards
the environment chain and use the highest light level we find. \* Thus
when Umbrian (Zell\'s good friend) who does not himself carry a torch
tests the light level of his own inventory, the light level of the
torch-lit room he\'s in is actually used.

So in effect, all objects have three values, two of which are computed:
intrinsic light, local light, and actual light. \* The intrinsic light
level of the torch is, say, 1.0 \* The intrinsic light level of Zell is
0.0, but his local light is 1.0 \* The actual light level of Zell is
2.0, which is the local light level of the room, which is lit by Zell\'s
torch and also by a torch on the wall.

This is actually pretty intuitive in practice, even if it sounds complex
here.

------------------------------------------------------------------------

Skotos.ChristopherAllen\'s wish log of how light might work:

    > look

    A cosy, square room with a window facing west, and a low wooden table 
    beneath the window. A comfortable-looking bed is here, near a 
    fireplace in the north wall. An ornate chair and armoire are standing 
    next to the bed. You are standing on a large colorful rug.

        ** This is basically the room description for the red private rooms 
        in Castle Marrach. Note that the description of the room and the 
        contents is now merged into one description, and that your stance and 
        location is at the end of the description, not the middle, and that
        the thing you are proximate too has also been moved to the end.**

    > look at light

    Golden light glows from the a lamp on the table. A warm glow comes 
    from the fireplace. A brilliant sun can be seen setting through the 
    window to the west.

        ** Each of the light sources in the room generate a light 
        description, and a luminosity. **

    > look at shadows

    You see no shadows here.

        ** Luminosity is high, and there are multiple light sources, so there 
        are no shadows. **

    > wait

    Through the window, the sun sets to the west. It is somewhat darker now.

        ** Some luminosity comes from transient objects. The windows are 
        programmed to change luminosity over time, and occasional emits. **

    > blow out lamp

    You approach the table beneath the window.

        ** Note that you are not just approaching the lamp, but that you are 
        approaching the lamp which is on the table, and it says so **

    You blow the flame out inside the lamp. It is darker now.

        ** The action of turning off the lamp lowers the luminosity.

    > look

    A room with a window facing west, and a low table beneath the window. 
    A bed is here, near a fireplace in the north wall. An chair and 
    armoire are standing next to the bed. You are standing on a large rug.

        ** This is what I call the dim description. All I did was erase some 
        descriptive details from the previous description. This would be done 
        with SAM construct like "A {bright:cosy, square} room with a window 
        facing west, and a low {bright:wooden} table beneath the window. A 
        {bright:comfortable-looking} bed is here, near a fireplace in the 
        north wall. An {bright:ornate} chair and armoire are standing next to 
        the bed. You are standing on the large {bright:colorful} rug."
        
        ** like {bright:} you can also have {dim:} and {dark:} things that 
        will only be shown under those conditions. For instance, the armoire 
        since it is so big could seem very different at night "An 
        {bright:ornate} chair and {dim:imposing} armoire are standing next to 
        the bed. **

    > look at light

    A warm glow comes from the fireplace.

         ** Only one source of light now.

    > look for shadows

    The fireplace casts flickering shadows into the far corners of the 
    room. The armoire casts a dark shadow across the floor.

        ** when it is dim enough, shadow details are available for each light 
        source, and certain objects. **

    > damp fireplace

    You approach the fireplace in the north wall.

        ** again, you approach not just the fireplace, but the fireplace and 
        it's parent's prox. **

    You damp down the fireplace down to just a few glowing embers. It is quite dark now.

    > look

    A dark room with a window. A few embers in the fireplace dimly glow. A lumbering
    darkness stands against a wall. You are standing on a rug.

        ** This is also constructed by SAM. **

    > approach bed

    You see no bed here.

         ** Objects that are too dark to be seen can't be interacted with. **
         

------------------------------------------------------------------------

## Emails

    ----- Original Message ----- 
    From: "Par Winzell" <zell@alyx.com>
    To: <eng-fire@skotos.net>
    Sent: Wednesday, August 29, 2001 10:44 PM
    Subject: [eng-fire] editing bulk and light in ur-parents


    Folks,

    I've completed the code that allows the editing of bulk and
    luminosity values in objects even when they have ur children.
    This has been a pain in our behinds for a -long- time and it
    is finally resolved in the proper way.

    The code is committed on LC/S7 but not yet elsewhere: I will
    need to put it on Welcome tomorrow.

    Note that when you -do- change these values, the effects in
    the world are not immediate. In a LC/S7 the change goes into
    effect in a matter of seconds, but on Marrach an edit to the
    UrMale may take an hour to fully propagate.

    Zell, desperate for sleep

    ---

    ----- Original Message ----- 
    From: "Par Winzell" <zell@skotos.net>
    To: <eng-cave@skotos.net>
    Sent: Thursday, March 07, 2002 11:44 AM
    Subject: Re: [eng-cave] Re: Lighting


    Folks,


    >       Most of this brightly-lit resort bungalow is one large room; the
    > bath (at the northwestern corner) and the spa (at the southwestern
    > corner) are the only other rooms of any size. Tall windows line most of
    > the eastern half of the building. To the east, between the spa and the
    > bath, is a bar and kitchenette. A sectional sofa, several chairs, and a
    > couple of tables take up some of the middle and northern floor space; a
    > bed is set in the southern part of the room.
    >   </Base:Description>
    >   <Base:Description type="look-dark">
    >       This is a large, dark room, cluttered with furniture.
    >   </Base:Description>
    >   <Base:Description type="look-dim">
    >       Most of this dimly-lit resort bungalow is one large room; the bath
    > (at the northwestern corner) and the spa (at the southwestern corner)
    > are the only other rooms of any size. Tall windows line most of the
    > eastern half of the building. To the east, between the spa and the bath,
    > is a bar and kitchenette. A sectional sofa, several chairs, and a couple
    > of tables take up some of the middle and northern floor space; a bed is
    > set in the southern part of the room.
    >   </Base:Description>
    > 
    > 
    > If Par can give me the SAM for the luminosity tests, I'll show you how
    > to make a look-all description.


    I've just added (on Marrach) for testing purposes the following derived
    properties --

          base:light-category
                returns "dark", "dim" or "bright"
          base:dark
                return true or false (0 or 1)
          base:dim
                return true or false (0 or 1)
          base:bright
                return true or false (0 or 1)



    So a SAM-ified version could look like:

    <if val="$(this.dark)"><true>
        This is a large, dark room, cluttered with furniture.
    </true><false>
        Most of this $(this.light-category)ly-lit resort bungalow is one
    large room; the bath (at the northwestern corner) and the spa (at the
    southerwestern corner) are the only other rooms of any size. Tall
    windows line most of the eastern half of the building. To the east,
    between the spa and the bath, is a bar and kitchenette. A sectional
    sofa, several chairs, and a couple of tables take up some of the middle
    and northern floor space; a bed is set in the southern part of the room.
    </false></if>

    Zell

    ---

    ----- Original Message ----- 
    From: "Par Winzell" <zell@skotos.net>
    To: <eng-cave@skotos.net>; <marrach@skotos.net>
    Sent: Friday, April 19, 2002 11:15 PM
    Subject: [marrach] light-meter written in Merry


    I needed to work out some issues with recursive Merry calls, so I wrote a
    light-meter in Merry, butchering Nino's nice ASCII tree printout meanwhile.
    The dots should really be spaces, but Alice eats those and Merry can't send
    HTML to the user (yet? is it a good idea?).

    I didn't document the code, and it's not exactly simple, but I may pretty it
    up and use it as an example. Meanwhile feel free to eyeball it;

        +tool merry view %Zell:Lumometer react-post:verb/wave-dbob
        +tool merry view %Zell:Lumometer lib:reclite
        +tool merry view %Zell:Lumometer lib:dumpmap


     > wave my stick
    You wave your eyeball-on-a-stick.
    `--.[133.45] the green room
    ....|--.[123.45] default
    ....|--.[2.5] StoryCoder Lichdar
    ....|...`--.[2.5] StoryCoder Lichdar's cedar torch
    ....|.......`--.[2.5] default
    ....|--.[2.5] a cedar torch
    ....|...`--.[2.5] default
    ....`--.[5] you
    ........`--.[2.5] your cedar torch
    ............`--.[2.5] default

%META:TOPICMOVED{by=\"ChristopherAllen\" date=\"1043965962\"
from=\"Skotos.LightSystem\" to=\"Builders.LightSystem\"}%
