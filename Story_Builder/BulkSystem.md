# The Bulk System - A Technical Summary

(See also DevDocs4CreatingContainers, OldThoughtsOnBulk)


## Models of a Physical World

All multiplayer interactive fiction games model the physical world in
simplified ways. These models prohibit character actions that should not
be possible. Without such prohibitions players\' suspension of disbelief
would be broken.

Most games have a model for bulk. These models might have a variety of
results from limiting item storage (i.e., limiting character inventory)
to modifying character abilities (i.e., reducing stamina).

Some systems also model dimensionality, allowing objects to have a size.
These models determine whether items can fit in containers (or rooms) or
describe the size of items relative to one another.

### Approaches

Many multiplayer interactive fiction systems take a minimalist approach
to modeling the physical world.

In the simplest model of bulk, items are given a mass and containers are
given a maximum mass. This is easy for players to understand. However,
differing densities cause paradoxes such as a feather pillow taking up
the same amount of space in a container as a gold coin.

Most systems extend this model by giving items a size (volume) and
containers a maximum volume. Again, this is easy for players to
understand. It also doesn\'t require much extra work by the
Admins.StoryBuilder. However inconsistencies still crop up that undercut
the realism of the simulated world.

A few systems have drastically increased the number of physical
attributes for items. This results in more realistic physics but also
produces a very complex model. Admins.StoryBuilders must put more effort
into each item. Inconsistencies and errors are common.

### Problems Addressed by the Skotos Bulk System

A chatroom wouldn\'t require a complex bulk system. However in a fully
featured game players will inevitably encounter complex situations
involving bulk. Currently the Skotos system does this by measuring bulk
by two core values: mass and volume (the latter via a density
calculation).

This allows the Skotos Bulk System to model tricky situations such as:

* A large winged dragon tries to enter a small houses. The dragon would
not fit inside the house. 
* Multiple swords being shoved into a scabbard. A scabbard would be designed to fit a sword.


### Problems NOT Addressed

There are desirable features that we have not addressed in the Bulk
System at this time. Some of these features we actually implemented in
the past, but removed for performance reasons \-- others we felt added
too much complexity.

* The large winged dragon tries to enter a very large house through a
very small door. Ideally the dragon would not fit through a small door
(without destroying it and, possibly, the house). 
* People of different
size contesting for seating room. A particular oak bench might be able
to seat two ogres, four humans, or six dwarves. 
* Objects being pushed
through small holes. A rope could be fed through a small hole into a
large cave. Sadly an elephant would not fit through the same hole.

[QuickSummaryBulkSystem]

## Detail of the Skotos Bulk System

This is a description of the current Bulk System as used in Castle
Marrach and other games circa 2002-2003. As already noted a number of
features were removed from the system in 2001 for performance reasons
and because of Admins.StoryBuilder confusion (see OldThoughtsOnBulk).

### Basic Attributes

The Skotos Bulk System is built on six attributes based on physical
values. Four of them are entered by hand, while the last two are
calculated based on values those entered values.

The two basic physical values are: 
* Mass ( kilograms \[kg\] ) 
* Density ( 1000 \* kg/m\^3 )

Two additional values used primarily for containers used: 
* Capacity (cubic meters \[m\^3\]) 
* Max Weight ( kilograms \[kg\])

Two derived physical values are: 
* Actual Volume ( cubic meters\[m\^3\]) 
* Minimum Volume ( cubic meters \[m\^3\])

It should be noted that the derived values can produce approximations
that aren\'t quite correct. The idea is to arrive at a good compromise
between data entry and realism.

### Physical Attributes

These values are entered by hand for all objects.

#### Mass

Mass a physical attribute whose value represents the amount of matter in
an object. It\'s the simplest physical measurement. It is set by the
Admins.StoryBuilder in the Base:Bulk section of Tree of Woe, or directly
setting the derived property `base:intrinsicmass`.

Unit: kilograms \[kg\]

* 1 kg = 
	* 1000 grams = 
	* \~2.2 pounds = 
	* \~35 ounces 
* 1 kg = 
	* mass of 1 liter of water = 
	* \~2.2 pints of water
	* \~weight of a 5cm (\~1 inch) cube of steel 
* .025 kg = 
	* 2.5 grams
	* weight of a silver dime

**A huge iron kettle will have a mass of 30 kg.**

**A wooden staff would have a mass of 1 kg.**

Some example mass values are listed at [Mass
Values](./MassVaues.md).
There are also some useful unit conversion tools at [www.allmeasures.com
mass
converter](http://www.allmeasures.com/conversion.asp?mass_weight=on&Submit=Converter)
.

Comment: Though rooms are also physical objects, unless they are
contained inside other objects (i.e. their \$environment is not nil) you
do not need to set the mass of a room. Just leave it at the default
value of 1.

#### Density

Density is a physical attribute whose value represents the compactness
of an object. Admins.StoryBuilders can set density in the Base:Bulk
section of the Tree of Woe, or directly by setting the derived property
`base:intrinsicdensity`.

Unit: 1000 \* kg/m\^3

The densities of some common materials are:

* Wood 0.7 
* Water 1.0 
* Iron 7.8

**The iron kettle has a density of 7.8.**

**The wooden staff has a density of 0.7.**

Some common Density values are listed at [Density
Values](./DensityValues.md).

A commonly used alternative to density is *specific gravity*, the
dimensionless ratio of an object\'s density to that of water. Thanks to
of our choice of units, where one cubic meter of water weighs 1000 kg,
density and specific gravity are equal in value.

Comment: Though rooms are also physical objects, unless they are
contained inside other objects (i.e. their \$environment is not nil) you
do not need to set the density of a room. Just leave it at the default
value of 1.

### Container Attributes

These values are also entered by hand, but typically only for
containers.

#### Capacity

Capacity is a phsyical attribute whose value is the total volume an item
can hold or carry; containers are the only objects which typically set
this attribute, however, a non-container may list capacity to denote
\"dead space\" inside an object. Admins.StoryBuilders can set capacity
in the Base:Container section of the Tree of Woe, or directly by setting
the derived property `base:intrinsiccapacity`.

**Capacity** limits the **Actual Volume** (a derived value) that may be
put in a container.

Unit: cubic meters (m\^3)

* 1 cubic meter = 
	* 1000 liters = 
	* 264.2 gallons = 
	* \~five 55-gallon drums = 
	* \~1 long ton of water = 
	* 1.3 cubic yards = 
	* 35.31 cubic feet = 
	* 61,015 cubic inches 
* 1 cubic foot = 
	* \~0.03 m\^3 
* 6x6x6 inches = 
	* \~0.004 m\^3 
* 1 gallon of water = 
	* \~0.004 m\^3 
* 1 liter is 0.001 m\^3 
* 1 cubic inch = \~0.0004 m\^3

**The wooden staff has a capacity of 0.**

**The huge iron cauldron has a capacity of 0.26 cubic meters.**

**A small 10x10x10 foot room has a capacity of \~28.3 cubic meters.**

Note: The Capacity of the iron cauldron was actually based on our
understanding of the cauldron\'s shape. The volume of a sphere = 4/3 \*
pi \* r\^3 = 4/3 \* 3.14 \* .125 = .52. The cauldron is only half a
sphere, so the capacity is determined to be .26 cubic meters. Other
calculations, guesses or real examples would be required for other types
of objects.

Some common Capacity values are listed at
[Capacity Values](./ContainerValues.md).
There are also some useful unit conversion tools at [www.allmeasures.com
volume
converter](http://www.allmeasures.com/conversion.asp?volume=on&Submit=Converter).

Note that for room sized objects, Capacity is used by the LightSystem to
calculate the thresholds between darkness, dimness, and brightness. The
larger the room, the more luminosity is required to make it bright. Thus
it is important that if you plan to use the LightSystem in room-sized
objects that they be reasonably accurate.

#### Max Weight

Max Weight is a physical attribute whose value represents how much a
container can hold until it bursts, rips, cracks, or whatever. The
Skotos system currently assumes \'common sense\' and will stop all
attempts to overflow a container. Containers are typically the only
objects which set this attribute. Admins.StoryBuilders can set max
weight in the Base:Container section of the Tree of Woe, or directly by
setting the derived property `base:maxweight`.

**Max Weight** limits the **Mass** (a physical value) that may be put in
a container.

Unit: kilograms \[kg\]

Note that this value includes the mass of the container itself, so your
max weight must be larger than the mass of the container and the
heaviest object you expect it to contain.

\* 1 kg = \* 1000 grams = \* \~2.2 pounds = \* \~35 ounces \* 1 kg = \*
mass of 1 liter of water = \* \~2.2 pints of water \* \~weight of a 5cm
(\~1 inch) cube of steel \* .025 kg = \* 2.5 grams \* weight of a silver
dime

> *The huge iron kettle could hold a great deal of weight, approximately
> 5000 kg.*
>
> *The wooden staff can hold nothing (0 kg).*
>
> *A small 10x10x10 foot room can hold a great deal of weight, about
> 28,300 kg.*

Note: The max weight of the small room was estimated based on filling
the room with water. A cubic meter of water weighs one metric ton. A
metric ton is equal to 1000 kilograms (NOT a kiloton, which is a
thousand tons). A room with a volume of 28.3 cubic meters which was
strong enough to hold water could get a max bulk capacity of 28,300
kilograms. The max weight of the iron kettle was also based on its
volume of .26 cubic meters, but instead of filled with water, filled
with gold. Thus a kettle strong enough of being a \"kettle of full
gold\" would have a max weight of roughly .26 x 1000kg (the mass of
water) x 19.3 (the density of gold) = 5018 kg.

Some commonly Max Weight values are listed at [Max Weight
Values](./BulkSystem#_MaxWeightValues_Max_Weight_Valu ).

### Derived Attributes

The following attributes have values that are calculated based on the
for basic bulk attributes\--or based on other calculated bulk
attributes.

#### Minimum Volume

Minimum Volume is a derived attribute, based on the basic attributes of
Mass and Density. It represents the volume of the item in its most
compressed form. Consider it the displaced volume of the object if it\'s
empty.

The Admins.StoryBuilder can\'t change the value of this attribute
directly and instead must change one of the physical attributes.

This attribute can be viewed by the command +stat \<object\> \"bulk\",
or by displaying the derived property `base:minimumvolume`.

Unit: cubic meters \[m\^3\]

Calculation: mass in kg / (1000 \* density)

> *The minimum volume of a huge iron kettle = 30 kg / (1000 \* 7.8) = 30
> kg / 7800 = .00385 cubic meters.*
>
> *The minimum volume of a wooden staff = 1 kg / (1000 \* 0.7) = 1 kg /
> 700 = .00143 cubic meters.*

#### Actual Volume

The Actual Volume attribute is a derived attributed, based on the base
attributes of Mass and Density as well as the derived attribute of
Minimum Volume. The value is the volume when the object is in its least
compressed form. Consider it the displaced volume of an object when
it\'s full (and note that minimum volume and actual volume tend to be
the same for non-containers).

The Admins.StoryBulker can\'t change the value of this attribute
directly, instead must change one of the physical attributes.

This attribute can be viewed by the command +stat \<object\> \"bulk\",
or by displaying the derived property `base:actualvolume`.

Unit: cubic meters \[m\^3\]

Calculation: capacity in cubic meters + minimum volume in cubic meters

> *The actual volume of the huge iron kettle = .26 m\^3 (capacity) +
> .00385 m\^3 (minimum volume) = .264 m\^3.*
>
> *The actual volume of the wooden staff = 0 m\^3 (capacity) + .00143
> m\^3 (minimum volume) = .00143 m\^3.*

### Other Attributes

In addition to the physical and derived bulk attributes for objects,
there are some flags (booleans) that can be set for objects that affect
how an object behaves; in addition there are some attributes
specifically associated with containers.

#### Immobile

The Immobile flag is a boolean that is set for objects that you wish to
be immovable, even if someone could theoretically pick the object up.
Useful for plants, signs, and other objects that you want fixed in
place.

The immobile flag can be set in the Tree of Woe in the Base:Bulk
section, or by setting the derived property `base:immobile`

Like the other attributes, the immobile flag is inherited through the
ur-parent chain though I highly advocate NOT using that because it would
make an entire class of objects absolutely unable to move.

Instead I suggest each single object be put into its proper place and
then marked:

+setprop torch base:immobile 1

This command freezes that single object into place for all eternity (or
until somebody does +clearprop torch base:immobile).

#### Container: Flexible

The flexible flag is an attribute that is set for objects that are can
be crunched up, like a bag, rather than objects that are rigid, like a
box. Without flexible containers, you cannot create a sack that can hold
1000 liters without it *always* being a cubic meter in volume (like a
large balloon). With the flexible flag, it means that an object only
takes up as much volume as it does itself (its minimum volume) plus the
volume of its inventory.

A SACK (flexible) with a small box inside it, has a volume of its own
minimum volume (just the volume of the actual cloth of the sack,
miniscule) plus the volume of the rigid box inside it.

A BOX (rigid) with a small sack inside it, has a volume of its own
minimum volume (the volume of its walls, bottom and lid) plus the volume
of its capacity.

The flexible flag can only be set in the Tree of Woe in the
Base:Container section; it does not have a derived property yet.

#### Container: Transparent-Container

The transparent-container flag is an attribute that is set for objects
where you want to see a listing of the contents of the object even when
it is closed. This is useful for things like display cases, and is
superior to the SAM tag [DescribeMany](SamSystem#_lt_describemany_gt_)
that was used previously for this purpose, because the objects inside
the container can now be referred to. For instance, if you use a verb
that doesn\'t require close proximity, (e.g., if you tried \"look at the
locked bookcase\'s third book\") it would work, but \"sniff the locked
bookcase\'s third book\" would not.

Note: This is the newest code in the bulk system and the most likely to
be broken somehow. For now, the pouch on S7 is transparent for your
trivial testing needs.

Note: Now luminous objects inside transparent containers will
\'luminate\' their surroundings.

The transparent-container flag can be set in the Tree of Woe in the
Base:Container section, or by setting the derived property
`base:transparent-container`

Note: There is another object attribute called tranparency, with the
derived property `base:transparency` that is unrelated to transparent
container. It is used for clothing that does not obscure other clothing
when it is worn.

#### Container: Public-Container

The public-container flag is an attribute that is set for objects if you
want other people than the holder to be able to see the contents of this
container. It will display its contents to others exactly as it does to
its holder/wearer. Normally the contents of held objects such as pouches
are not visible to other players, but this allows them to be visible.

The public-container flag can be set in the Tree of Woe in the
Base:Container section, or by setting the derived property
`base:public-container`

#### Container: Tight

The tight flag is an attribute that is set for objects if they are tight
enough that they can hold water or a powder. For example, a pouch
probably can\'t hold water, but a balloon probably could. Currently,
this attribute is used by the CombinableSystem.

The tight flag can be set in the Tree of Woe in the Base:Container
section, or by setting the derived property `base:tight`

#### Container: Verb2

The Verb2 attribute should have as a value the verb phrase that the
container should see when the objects within it are being described. For
people this should be \'are carrying\', for animals it can be \'are
carrying in your mouth\', for containers it typically is \'contain\' or
\'hold\'. Some fairly extravagant uses of this are possible. The default
is \'contain\'.

The Verb2 attribute can only be set in the Tree of Woe in the
Base:Container section.

#### Verb3

The Verb3 attribute should have as a value the verb phrase that other
viewers should see when the objects within it are being described. For
people this should be \'is carrying\', for animals it can be \'is
carrying in its mouth\', for containers it typically is \'contains\' or
\'holds\'. Some fairly extravagant uses of this are possible.

The Verb3 attribute can only be set in the Tree of Woe in the
Base:Container section.

### Inheritance of Bulk

Like all other object attributes, bulk attribute values are inherited by
ur-children objects. However, unlike other attributes, if you set a bulk
attribute\'s value in a child object it will not replace the value with
the new value. Instead, it will multiply both values. If there are
ur-parents of ur-parents, every bulk value will be multiplied. Thus by
default, all bulk values are always initialized at 1, so that the
parent\'s bulk values are unchanged because they are only multiplied by
1.

For instance, if an UrCharacter has a mass of 55 kilograms, then its
ur-children UrMale can have its mass be 1.1, and UrFemale 0.9 \-- this
results in the actual mass for UrMale of 60.5 kg, and for UrFemale of
49.5. If UrFemaleElf was an ur-child of UrFemale, and it\'s mass was
also 0.9, then this would result in an actual mass of 44.55 kg
(55x0.9x0.9). The final Tenebrae the Elf ur-child object when spawned
would have a default mass of 1, thus would also have an actual mass of
44.55 kg.

You have to be careful and treat the bulk in ur-parents and ur-children
like utterly different entities. You can choose to set the mass in the
ur-parent, but ONLY if you also adopt the convention that the values in
the children are relative modifications to those supplied by the
ur-parents. In other words, in this scenario, the ur-parent has the
default mass that the class of objects should have, and each child has
1.0 as mass or\--alternatively modifies it by multiplying against a
percentage, e.g. 1.2 for 20%.

\...OR you can choose the other options, where the ur-parents all pretty
much have 1.0 as their values, and the final value is always set in the
ur-child. This is a useful approach for very generic objects or highly
variable objects\...

\... but you CANNOT mix the two. If you set real-world values in the
parents, you cannot set real-world values in the children too. This is
more than an annoyance, it has to become part of your ur-inheritance
world view.

Also note that any change that you make in an ur-parent doesn\'t
immediately propogate to all the ur-children. Any change you make to the
ur-parents is propagated (at a rate of about 2-3 per second) to all
children and children\'s children etc of that parent. For an object like
UrCharacter in Marrach, it can take several hours to propogate.

### Bulk and Consumables

Some objects are marked in the Tree of Woe as being edible or potable.
Verbs that consume, such as eat, drink, etc. will reduce the mass of the
item by 15 grams, or .015kg (about 1/2 ounce) per usage. This means that
it takes about 66 bites or 66 sips to consume a 1kg food item.

The SAM tag
[\<eaten\>](./SamSystem#_lt_eaten_gt_)
is placed in the look and examine of food objects to show if the item
has been partially consumed. In addition, a property `trait.eaten` is
set in foods and drinks once one bite has been taken. Combined, this
allows for the player to see that food has been nibbled into.

For example:

         Look: [*
         An apple{? | $(this.trait:eaten) |. Someone appears to have <eaten what="$(this)"/>it}.
         *]

This results in the following:

         > +spawn Generic:food:fruit:apple
         Christopher Allen's apple arrives.
         A spawn of an apple has been created and teleported into your inventory.
         > look at apple
         An apple.
         > +stat apple "bulk
         -- Bulk --
         Intrinsic Mass: 0.05 kg
         Actual Mass: 0.05 kg
         Intrinsic Density: 0.14
         Actual Density: 0.14
         Intrinsic Capacity: 0 m^3
         Actual Capacity: 0 m^3
         Minimum Volume: 3.5714286e-4 m^3
         Actual Volume: 3.5714286e-4 m^3
         
         > eat my apple
         You take a bite of your apple.
         > look at apple
         An apple. Someone appears to have bitten into it.
         > +stat apple "bulk
         -- Bulk --
         Intrinsic Mass: 0.035 kg
         Actual Mass: 0.035 kg
         Intrinsic Density: 0.14
         Actual Density: 0.14
         Intrinsic Capacity: 0 m^3
         Actual Capacity: 0 m^3
         Minimum Volume: 0.00025 m^3
         Actual Volume: 0.00025 m^3
         
         > eat my apple
         You take a bite of your apple.
         > look at apple
         An apple. Someone appears to have partly eaten it.
         > +stat apple "bulk
         -- Bulk --
         Intrinsic Mass: 0.02 kg
         Actual Mass: 0.02 kg
         Intrinsic Density: 0.14
         Actual Density: 0.14
         Intrinsic Capacity: 0 m^3
         Actual Capacity: 0 m^3
         Minimum Volume: 1.4285714e-4 m^3
         Actual Volume: 1.4285714e-4 m^3
         
         > eat my apple
         You take a bite of your apple.
         > look at apple
         An apple. Someone appears to have mostly eaten it.
         > +stat apple "bulk
         -- Bulk --
         Intrinsic Mass: 0.005 kg
         Actual Mass: 0.005 kg
         Intrinsic Density: 0.14
         Actual Density: 0.14
         Intrinsic Capacity: 0 m^3
         Actual Capacity: 0 m^3
         Minimum Volume: 3.5714286e-5 m^3
         Actual Volume: 3.5714286e-5 m^3
         
         > eat my apple
         You finish eating.
         > look at apple
         You see no apple here.
         >

### Viewing Bulk Values

You can view most of the the values for bulk attributes with the
`+stat <object> "bulk"` command:

    > +stat me "bulk
    -- Bulk --
    Intrinsic Mass: 55 kg
    Actual Mass: 67.49 kg
    Intrinsic Density: 1
    Actual Density: 0.65980741
    Intrinsic Capacity: 1 m^3
    Actual Capacity: 0.95257058 m^3
    Minimum Volume: 0.10228742 m^3
    Actual Volume: 0.10242942 m^3

The attributes immobile, flexible, public-container,
transparent-container, tight, verb2 and verb3 are only visible in the
Tree of Woe.

### Bulk Properties

Many of the Bulk System attributes are now available as [Derived
Properties](DerivedProperties) and can be viewed like any property with
+stat and set with +setprop or +setp.

    -- Properties (*base*)--
    Property: base:actualcapacity = 0.95257058
    Property: base:actualdensity = 0.65980741
    Property: base:actualmass = 67.49
    Property: base:actualvolume = 0.10242942
    Property: base:intrinsiccapacity = 1.0
    Property: base:intrinsiccapacity:local = 1.0
    Property: base:intrinsicdensity = 1.0
    Property: base:intrinsicdensity:local = 1.0
    Property: base:intrinsicmass = 55.0
    Property: base:intrinsicmass:local = 1.0
    Property: base:maxweight = 100.0
    Property: base:maxweight:local = 1.0
    Property: base:minimumvolume = 0.10228742
    Property: base:public-container = 0
    Property: base:tight = 0
    Property: base:transparency = 1
    Property: base:transparency:local = 0
    Property: base:transparent-container = 0

  ------------------------ ---------- ------------------------------ ------------------------------------
  base:actualmass          RO         float                          object\'s perceived mass
  base:actualdensity       RO float   object\'s perceived density    
  base:actualcapacity      RO         float                          object\'s perceived capacity
  base:actualvolume        RO         float                          object\'s perceived volume
  base:minimumvolume       RW         float                          object\'s minimum volume
  base:maxweight           RW         float                          how much mass can the object hold?
  base:intrinsicmass       RW         float                          object\'s intrinsic mass
  base:intrinsicdensity    RW         float                          object\'s intrinsic density
  base:intrinsiccapacity   RW float   object\'s intrinsic capacity   
  ------------------------ ---------- ------------------------------ ------------------------------------

### Bulk Signals

(to be written)

### User Error Messages

The error messages for the Bulk System are described in the
TextIF:ErrorDB node in the Tree of Woe. For example:

        <TextIF:Error name="Error:Take:Mass">
            You cannot carry <describemany what="$(obs)"/>, <obsprep what="$(obs)"/> too heavy.<br/>
        </TextIF:Error>

As it is possible to edit these bulk error messages, and as they are
SAM, it would be possible to greatly extend the reporting of errors to
users using SAM or even inline Merry.

## Examples

### Simple Brick

A very simple object \--
Examples:complete:bulk:brick.

As you can see in KarMode, this object only has one detail with a single
name, two adjectives, and a look description:

        DETAIL [default]
        Brief: brick
        Look: A simple red brick.
        Name: brick/brick
        Adjective: red
        Adjective: simple

When I created the brick, I didn\'t know for sure what its weight or
size was \-- I didn\'t have a brick handy. However, a google search on
the net showed that, dry, they weighed about 2 kg (about 5 pounds). The
density value I found in DensityValues.

        > +spawn Examples:complete:bulk:brick
        Christopher Allen's brick arrives.
        A spawn of a brick has been created and teleported into your inventory.
        
        > look at brick
        A simple red brick.

        > +stat brick "bulk
        -- Bulk --
        Intrinsic Mass: 2 kg
        Actual Mass: 2 kg
        Intrinsic Density: 1.9
        Actual Density: 1.9
        Intrinsic Capacity: 0 m^3
        Actual Capacity: 0 m^3
        Minimum Volume: 0.0010526316 m^3
        Actual Volume: 0.0010526316 m^3

To double-check my values, I used the handy-dandy volume converter at
[www.allmeasures.com](http://www.allmeasures.com/conversion.asp?volume=on&Submit=Converter),
and found that the volume of 0.0010526316 m\^3 was approximately 64
cubic inches, roughly the volume of a 4 inch cube, which is about what I
estimated the size of the brick to be (4\" x 8\" x 2\").

Checking further, I can look at all of the derived bulk properties:

        > +stat brick "name
        Object: [/base/obj/thing#1644]
        Parent: Examples:complete:bulk:brick [/base/obj/thing#10531]
        
        > +stat brick "property:*mass*
        -- Properties (*mass*)--
        Property: base:actualmass = 2.0
        Property: base:intrinsicmass = 2.0
        Property: base:intrinsicmass:local = 1.0
        
        > +stat brick "property:*density*
        -- Properties (*density*)--
        Property: base:actualdensity = 1.9
        Property: base:intrinsicdensity = 1.9
        Property: base:intrinsicdensity:local = 1.0
        
        > +stat brick "property:*capacity*
        -- Properties (*capacity*)--
        Property: base:actualcapacity = 0.0
        Property: base:intrinsiccapacity = 0.0
        Property: base:intrinsiccapacity:local = 1.0
        
        > +stat brick "property:*weight*
        -- Properties (*weight*)--
        Property: base:maxweight = 0.0
        Property: base:maxweight:local = 1.0
        
        > +stat brick "property:*volume*
        -- Properties (*volume*)--
        Property: base:actualvolume = 0.0010526316
        
        > +stat brick "property:*container*
        -- Properties (*container*)--
        Property: base:public-container = 0
        Property: base:transparent-container = 0
        
        > +stat brick "property:*tight*
        -- Properties (*container*)--
        Property: base:tight = 0

Note that the \*:local values of this object are all 1 \-- this is
because when you +spawn\'ed the object from its ur-parent, these
attribute values are set to the default of 1, which when multiplied
against the parent will leave the actual values the same as its
ur-parent.

### Oil Drum

A basic container is the standard 55g oil drum \--
Examples:complete:bulk:drum-oil-standard.

As you can see in KarMode, this object only has one detail with a single
name, two adjectives, and a look description:

        DETAIL [default]
        Brief: oil drum
        Look: A large oil drum.
        Name: drum/drums
        Adjective: large
        Adjective: oil

Searching on the web you\'ll find that the term \'55 gallon drum\' is a
standardized term. It is the amount of gasoline you can load into the
canister for shipment; they actually contain 57 and a bit gallons, are
made of 16 guage steel, and weigh empty about 70 pounds. They\'re just
over 22\" inside diameter, and 34\" tall \-- which works out to 55.65
gallons (the other gallon and a bit probably goes into the rolling
chines, the \'bit over 22\" inside diameter\" etc.).

Converting the pounds to kilograms at [www.allmeasures.com mass
converter](http://www.allmeasures.com/conversion.asp?mass_weight=on&Submit=Converter)
gives the mass of the oil drum as 31.8kg. The drum is made of steel, and
looking that up at [Density
Values](./DensityValues.md)
gives us the density of 8. Using Pi\*r\^2 on the inside dimensions, this
means that it contains 12924.5 cubic inches, converted at
[Container Values](./ContainerValues.md)
results in .212 kg. The last value is MaxWeight, which we have to guess
at. An oil drum cointaining only water would weight 211kg plus the
31.8kg of the drum itself. Presuming that an oil drum can hold something
roughly twice as dense as that, on the order of sand (sandstone\'s
density 2.1) gives us a guess of 450kg.

Last, the container can hold fluids, so \'tight\' is set to be true.

Looking at the container:

        > +spawn Examples:complete:bulk:drum-oil-standard
        Christopher Allen's oil drum arrives.
        A spawn of an oil drum has been created and teleported into your inventory.
        > look at drum
        A large oil drum.
        > +stat drum "bulk
        -- Bulk --
        Intrinsic Mass: 31.8 kg
        Actual Mass: 31.8 kg
        Intrinsic Density: 8
        Actual Density: 8
        Intrinsic Capacity: 0.212 m^3
        Actual Capacity: 0.212 m^3
        Minimum Volume: 0.003975 m^3
        Actual Volume: 0.215975 m^3
        >

Doing a double check, here are all the derived properties for the oil
drum.

        > +stat brick "name
        Object: [/base/obj/thing#1644]
        Parent: Examples:complete:bulk:brick [/base/obj/thing#10531]
        > +stat brick "property:*mass*
        -- Properties (*mass*)--
        Property: base:actualmass = 2.0
        Property: base:intrinsicmass = 2.0
        Property: base:intrinsicmass:local = 1.0
        > +stat brick "property:*density*
        -- Properties (*density*)--
        Property: base:actualdensity = 1.9
        Property: base:intrinsicdensity = 1.9
        Property: base:intrinsicdensity:local = 1.0
        > +stat brick "property:*capacity*
        -- Properties (*capacity*)--
        Property: base:actualcapacity = 0.0
        Property: base:intrinsiccapacity = 0.0
        Property: base:intrinsiccapacity:local = 1.0
        > +stat brick "property:*weight*
        -- Properties (*weight*)--
        Property: base:maxweight = 0.0
        Property: base:maxweight:local = 1.0
        > +stat brick "property:*volume*
        -- Properties (*volume*)--
        Property: base:actualvolume = 0.0010526316
        Property: base:minimumvolume = 0.0010526316
        > +stat brick "property:*container*
        -- Properties (*container*)--
        Property: base:public-container = 0
        Property: base:transparent-container = 0
        > +stat brick "property:*tight*
        -- Properties (*tight*)--
        Property: base:tight = 1
        >

## Tips

### Room Size Rules-of-Thumb

Estimating the capacity and maxweight for rooms can be difficult,
however, some useful rules-of-thumb can make the task easier.

#### Inside Rooms

For smaller rooms, I just compare them to the size of some typical rooms
that I can easily visualize:

* The typical U.S. single door closet is just a bit larger then 1 cubic
meters, and thus maxweight should be 1000 kg.

* The typical D&D dungeon room (10\' x 10\' x 10\') is just a bit
smaller then 30 cubic meters, and maxweight should be 30,000 kg.

* A typical colledge dorm room (15\' x 9\' x 8\') is also about 30
cubic meters, and maxweight of 30,000 kg.

* A 300sf living room (15\' x 20\' x 8\') is about 70 cubic meters,
thus a maxweight of 70,000 kg.

For larger rooms, I mentally compare them to the size of a efficiency,
one, or three bedroom apartment:

* An efficiency is typically around 500sf, thus about 140 cubic meters,
and 140K kg, or about twice that of the living room.

* A one-bedroom apartment is typically around 750sf, thus about 210
cubic meters and 210K kg

* A three-bedroom apartment is typically around 1000sf, thus about 280
cubic meters and 280K kg.

#### Outside Rooms

Outside locations technically have infinite volume; however, unless you
are creating a game with lots of flying creatures, I recommend you
estimate using a height of 3 meters or 10 feet. So then just estimate
the square meters (roughly equal to square yards) of the outside area,
then multiply by 3 to get cubic meters.

### Visualizing Volume

Volume can be somewhat hard to visualize, because we humans aren\'t used
to thinking in three-dimensions. Here\'s a few pieces of advice on the
topic:

**Remember the Difference Between Capacity and An Item\'s Total
Volume.** Capacity is what an item can hold, while minimum volume is
what volume the item takes up in and of itself. Consider a 2 liter
bottle of Coke. The capacity is 2L, but the plastic bottle itself takes
up a tiny bit of volume, perhaps bringing the actual volume of the
container to 2.1L. And, if you included all the \"dead space\" implicit
if you try and stack a bunch of 2 liter bottles together (which is to
say the air in between bottles), the actual volume \"used up\" by each
2L bottle might be 2.5L or so.

**Think Upward.** Always remember that volume is a three-dimensional
measurement, so remember to think upward. A 10\'x10\' room actually has
a height to it; if that were another 10\' the cubic volume would thus be
1000 ft\^3, not 100. Try and visualize not just put objects side-by-side
inside your container, but also stacking them up.

The best way to help visualize volumes is probably to examine examples.

**Coke in a Box.** For example, assume that you have a box that\'s 1
meter on a side, or 1 m\^3 total volume. For the meter-phobes among us,
that\'s about 36 ft\^3, or a box about 3.3\' on a side.

Picture it in your mind. Got it?

Now how many 2L bottles of Coke can you pour into box?

Go ahead, visualize those bubbling, carbonated beverages.

The answer is, very simply 500, because 1 m\^3 = 1000L.

If you\'re having troubles with that visualization, it\'s most likely
because you forgot to pour the Coke *out* of the bottles. As already
noted, those bottles\' actual volumes is a lot higher than than their
capacity, because of both the plastic making up the bottle and the dead
space in between bottles that you\'re stacking up.

If you instead imagine a 2L milk cartons instead of bottles\... those
are about 4\" square (about 0.1 meter square) and about 8\" high (0.2
meter high). You can imagine placing three such cartons side by side and
they\'d be about a foot long\... so ten would be about three feet. This
is true in both dimensions, thus you can place a full 100 cartons on the
bottom of the box. They are 0.2 high (2/3 of a foot) so you can fit five
such layers before the box is full.

A cubic meter is quite a lot. You have to buy a pretty large TV for it
to come in that big a box. A bottle of Coke or a milk carton is pretty
small.

**Bookcases.** If you start out with the simplest examples, you can
start to get a better intuitive grasp of volume. As an example, we can
compute the volume of a bookcase. I\'m going to do this calculation
*backward*, to show how you might figure out the volume of a standard
object from the measurements you can take \... though as you get better
you\'ll be able to figure out this type of volume more intuitively.

A medium-large bookcase is 6\' tall by 3\' wide by 5/6\' deep. That
gives a volume of 15 ft\^3, or .4245 m\^3. However, that\'s the *actual
volume*, because it include\'s both the object\'s displaced volume and
its capacity. We need to work backward a bit to figure out what the
object can actually hold.

The bookcase is made of pine, which has a density of .47. (It\'s a
fairly light wood.) It weighs about 15 kilograms (\~33 pounds).
According to our formula, its minimum volume is thus equal to:

> minimum volume = 15 kg / (.47 \* 1000)

That\'s .032 m\^3. Now\'s where we do the backward thinking. We arrive
at the capacity by subtracted the (derived) minimum volume from the
(measured) actual volume.

> capacity = .4245 m\^3 - .032 m\^3

That comes out to .3925 m\^3 capacity. If you\'d said that the shelves
and structure of a bookcase took up about 10% of the total volume,
you\'d have been right, and well on your way to visualizing volume,
especially as minimum volume and capacity differ.

**Oil Drum** The standard oil drum you might see at a service station or
in a warehouse is known as a 55g drum. It isn\'t precisely 55g (contain
57 and a bit gallons), but that is what this standard size is called.
Visualizing it inside our 1 m\^3 box, you might guess that it fills
about least half of the box, or even more then half. But in fact, it is
only 0.26 m\^3, or only fills 1/4 of the volume.

To look at this more carefully, a 55g oil drum you can envisioned as
being roughly 3\' tall by 2\' in diameter (they are in fact 34\" tall
and a bit over 22\" inside diameter). Calculating the volume of a
cylinder (Pi \* r\^2 \* h) on the rough estimate of 3\' by 2\' diameter,
the 55g oil drum gives about 9.5 cubic feet, which is actually only 0.26
m\^3. As you can see, a cylindrical drum wastes a huge amount of space
due to its circular nature. It fools your brain.

**Kettle** Similarly, spherical objects also waste space. The contents
of 3 foot diameter kettle (1.0m) you might imagine to almost completely
fill a 1 m\^3 drum, and certainly would overfill an oil drum. However,
if you visualize the the kettle as being half a sphere (ie. 1/2 of the
spherical volume calucation of 4/3 \* Pi \* r\^3), you will discover
that the ( 4/3 \* 3.14 \* .125 ) / 2 = .26 \-- almost exactly the same
value as the what appears to be a much smaller cylindrical oil drum!

**Balloon** You can also be useful do spheres in reverse \-- how big is
a sphere that contains 1 m\^3 of space? If you solve the equation of a
sphere for r, you get the cube root of ( y / (4/3 \* Pi)), meaning the
the resulting sphere has to be 0.62m in radius, or 1.24 meters in
diameter to contain the same volume as the 1m\^3 box.

**Math Getting You Down?** If you find this math bothersome, there are
are quite a few volume calculations automated at [www.calculator.net.net](https://www.calculator.net/volume-calculator.html), for instance,
volume of a pyramid can be useful, as can volume of a cone. There are many others there.

### Error: +Spawn \-- Move Into Your Inventory Failed

#### Default Bulk Values

If the following happens:

        > +spawn My:new:object
        A newobject arrives.
        A spawn of a newobject has been created and teleported into your environment, because the move into your inventory failed.
        > look at newobject
        A newobject.
        >

The most typical reason why this happens is because you have left the
default Mass, Density, and Capacity values at 1. This means that the
object is 1 cubic meter in size (imagine a 3 foot cube box), which is
also the typical capacity of a character object. Since you are likely
carrying lots of other things, the +spawn\'ed item can\'t be moved into
your inventory, thus it falls to the ground.

You can spot this easily with the `+stat <objectname> "bulk"` command:

        > +stat newobject "bulk
        -- Bulk --
        Intrinsic Mass: 1 kg
        Actual Mass: 1 kg
        Intrinsic Density: 1
        Actual Density: 1
        Intrinsic Capacity: 1 m^3
        Actual Capacity: 1 m^3
        Minimum Volume: 0.001 m^3
        Actual Volume: 1.001 m^3
        > 

Some people are tempted to up their own character\'s capacity and max
weight to prevent these errors. I recommend that you don\'t, as
otherwise you might not spot these errors.

#### Wrong Units

The next most common reason that this happens is because you have your
capacity units wrong. Capacity is measured in m\^3 (meters cubed) not
liters. The following implies that you might have misentered a liter
value into your object:

        > +stat newobject "bulk
        -- Bulk --
        Intrinsic Mass: 1 kg
        Actual Mass: 1 kg
        Intrinsic Density: 1
        Actual Density: 1
        Intrinsic Capacity: 10 m^3
        Actual Capacity: 10 m^3
        Minimum Volume: 0.001 m^3
        Actual Volume: 10.001 m^3
        > 

10 liters should have been .01 m\^3.

#### Inheritance Multipliers

The next most common reason for receiving a +spawn error is if you have
accidently entered mass values into both children and parent objects,
resulting in them being multiplied and the result being much larger then
what you can carry. This requires some more detective work to identify
the problem.

Using +stat on the +spawn\'ed object will show that the problem is in
the mass:

        > +stat newobject "bulk
        -- Bulk --
        Intrinsic Mass: 625 kg
        Actual Mass: 625 kg
        Intrinsic Density: 1
        Actual Density: 1
        Intrinsic Capacity: 1 m^3
        Actual Capacity: 1 m^3
        Minimum Volume: 0.625 m^3
        Actual Volume: 1.625 m^3
        > 

As this object was +spawn\'ed, looking at its \'local\' mass will not
help, as it is a ur-child of My:new:object, i.e.

    > +stat newobject "property:*mass*
        -- Properties (*mass*)--
        Property: base:actualmass = 625.0
        Property: base:intrinsicmass = 625.0
        Property: base:intrinsicmass:local = 1.0
        > 

Instead, you need to look at at the mass of the Ur-parent:

        > +obstat My:new:object property:base:*mass*
        -- Properties (base:*mass*)--
        Property: base:actualmass = 625.0
        Property: base:intrinsicmass = 625.0
        Property: base:intrinsicmass:local = 25.0
        > 

You can then further investigate by identifying the parent of
My:new:object with the `+obstat <objectname> name` command:

        > +obstat My:new:object name
        Object: My:new:object [/base/obj/thing#11599]
        Parent: My:parent:object [/base/obj/thing#1644]
        > 

Then use the either of the +obstat commands on this parent object:

        > +obstat My:new:parent:object bulk
        -- Bulk --
        Intrinsic Mass: 25 kg
        Actual Mass: 25 kg
        Intrinsic Density: 1
        Actual Density: 1
        Intrinsic Capacity: 100 m^3
        Actual Capacity: 100 m^3
        Minimum Volume: 0.625 m^3
        Actual Volume: 100.625 m^3
        > +obstat My:new:object property:base:*mass*
        -- Properties (base:*mass*)--
        Property: base:actualmass = 25.0
        Property: base:intrinsicmass = 25.0
        Property: base:intrinsicmass:local = 25.0
        >

In this case, as you can see, the ultimate ur-parent object\'s mass is
25 kg, but so it is its ur-child\'s mass, resulting in the mass in the
ultimate ur-child being 625 kg.

### Error: +Spawn - Left in Limbo

If the following happens:

        +spawn My:new:object
        A spawn of a newobject has been duplicated, under the name [My:new:object]#11599 but left in limbo because it could neither move into your inventory nor your environment.
        >

This is most typically caused by the same type of problems that [+Spawn
\-- Move Into Your Inventory
Failed](BulkSystem#Error_Spawn_Move_Into_Your_Inven) discusses, however,
the resulting object was either so huge in volume or so huge in mass
that not only could it not be put in your inventory, it was too big for
the room you are in, so it was put in the limbo of the nil.

To test to see if it is your object that is too big, you can do a
+obstat on the name of the object that showed up in the +spawn error
message:

        > +obstat [My:new:object]#11599 bulk
        -- Bulk --
        Intrinsic Mass: 625 kg
        Actual Mass: 625 kg
        Intrinsic Density: 1
        Actual Density: 1
        Intrinsic Capacity: 100 m^3
        Actual Capacity: 100 m^3
        Minimum Volume: 0.625 m^3
        Actual Volume: 100.625 m^3

If it looks normal, either your room may be too small, or another object
in the room is too big. To test for this you can use the +inv \$here and
and +obstat commands to see if anything isn\'t normal:

        > +inv $here

        Object:      "An empty room" Examples:complete:desc:room-go-nowhere (#10185)
        Inventory:
            T  M        V            Description      Name
        1  x  67.49  102.42942  Yourself          Chatters:LC:ch:allen-christopher (#4803)
        2     1     1.6666667  A toy              [Examples:complete:sam:sam-toy]#11527 (#11527)
        2     1     1000.625    A newobject   [My:new:object]#11527 (#11527)
        
        > +obstat Examples:complete:desc:room-go-nowhere bulk
        -- Bulk --
        Intrinsic Mass: 1 kg
        Actual Mass: 106.49 kg
        Intrinsic Density: 1
        Actual Density: 0.64427164
        Intrinsic Capacity: 28.3 m^3
        Actual Capacity: 27.635571 m^3
        Minimum Volume: 0.16528742 m^3
        Actual Volume: 28.301 m^3

As you can see from the above, a \'newobject\' is in the room which is
quite large, which maybe be the reason why +spawn\'ed items go to the
limbo of nil.

Once you\'ve figured out the problem, you need to destroy or summon your
+spawn\'ed object that ended up in NIL, or else you\'ll forget later.

To destroy the object, you can\'t use +slay, as the object is not
physically in your environment. But you can use `+tool woe view` with
the name that was given you in the error message:

        > +tool woe view %[My:new:object]#11599
        Viewing Woe object in popup window.
        >

\...and click on the \"Destroy\" button

Or you can summon it:

        > +summon [My:new:object]#11599
        A newobject arrives.
        > 

If you see this\...

        > +summon [My:new:object]#11599
        Object was not successfully summoned!
        > 

The object is either still to big for your room, or the room too small.

## State of Development

The Bulk System was released at Skotos first in September of 2000 in the beta of the Castle Marrach game. Speed issues caused by propogating bulk attributes from personal containers into pouches into players and ultimately into rooms caused problems when many players entered a room, caused significant lag, in particular at the first Winter Ball.

Since that time, most of the performance problems have been reduced using a variety of techiques, but may still exist as more simultaneous users enter a room.

Several attributes in the original Marrach Bulk System were also removed because of Admins.StoryBuilder confusion, but are documented in this document both for historical reference, but also in case we ever desire to put some of these features back into the server.

Our prime problems with confusion were:
* **Bad Errors.** Saying \'maxfrontalarea\' is too large really didn\'t help when we should have been saying \'Your dragon is too big to fit through the door into the barn.\' 
* **Some Attributes Were Confusing.** We tried to arrange at a balance between having accurate results and not having to enter too much. Thus we did things like asked for a \"longest side\" value, with the idea being that it\'d give us a maximum volume for an
object. We then would do calculations to arrive at other values. Unfortunately our partial information requests, while less tedious, were also less intuitive.
* **Too Many Values.** We\'d intended from the start to only need a couple of values, then start guessing at the rest. This in-line calculation was never finished, and thus people were left entering more values than we\'d wanted.
* **Metric Units.** Either way we went, metric or English, would have been confusing, and this was just one more element in a complex system. Ideally we should have given people the opportunity to input in either English or metric values, depending on which way their brains worked.


### Current Bulk System Open Issues

These are the open issues

* When you pick something up, should we give some additional info about
it such as: \"It\'s heavy,\" \"It\'s unwieldy,\" \"It flops around,\"
etc.? How about throwing in the \"Touch\" info automatically for the
object?
* In particular games, we may want to display non-metric units.

## Appendices

[MassValues](./MassValues.md)

[Density Values](./DensityValues.md)

[Container Values](./ContainerValues.md)

### Immobile with Integration

This is also particularly useful in combination with the new
\"integration\" capability to have objects in rooms that act like
details, but have their own inventory and merry scripts.

Say you wanted to make the oven in the kitchen to work as a container.
Right now, the oven in the kitchen is a detail, thus if you try to put
anything in it you can\'t (as the room itself is already a container \--
you are in it.) You could create an oven object, but then it would show
up in the rooms inventory, and it is already in the rooms \"look\"
description.

For this new kind of object, create an oven object with the same
information as the oven detail in the kitchen room object, and make it a
container. Then delete the kitchen room object version that is just a
detail.

In the kitchen room object, put a property name into the base:misc
section\'s integration field (can be anything, but maybe
\"trait:hideinkitchen\"). Then you can +spawn your oven object, place it
where you want it, \"+setprop kitchen trait:hideinkitchen 1\" and
\"+setprop oven base:immobile 1\".

Now you now have an oven that will not show up in inventory of the rooms
\"look\" description, but if you \"look at oven\" will give the right
description. You can then do things like \"put dough in oven\" which you
couldn\'t do with the old oven detail. For coders, they can now put
\"react:enter\" scripts in that oven that will test if the object put in
the oven is dough, and if it is, turn it to bread.

Remember, the property portion of the \'integration\' effect should be
set in the room which will contain the object, not in the object itself.
The object contains an attribute \'integration\', editable in Woe, that
you place the name of a property into; the property in the room will
have the same text as it\'s \'name\', and a value of 1.

 