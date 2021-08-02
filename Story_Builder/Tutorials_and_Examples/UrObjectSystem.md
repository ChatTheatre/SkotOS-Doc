%META:TOPICINFO{author=\"ChristopherAllen\" date=\"1057352700\"
format=\"1.0\" version=\"1.10\"}% \<h1\>The Ur-object System - A
Technical Summary\</h1\>

Back to Skotos.TechnicalSummaries

See Also: Skotos.UrDiscussion

------------------------------------------------------------------------

\<h2\>UrObject\</h2\>

\<h3\>The Problem\</h3\>

We wish to create a sixpack of Asahi beer.

Now, somebody else has done all the work of describing the Asahi in
great detail; creating a single bottle of reference Asahi configured
with all the proper values necessary. The reference bottle sits in a
completely safe place somewhere. All we want to do is create a sixpack
of good Asahi that we can have with our meal.

The obvious solution would be to create six exact copies of the
reference Asahi. Each one would be a perfectly good physical object in
its own right and their fates would start diverging independently; as we
start drinking the beer, some attribute specifying how much beer is in
the bottle will start decreasing, but in all other respects the object
data remains precisely the same.

The problem with copying the reference object is that there are six full
copies of a very space-consuming in-depth description of all the
properties of Asahi beer, where only one is really necessary. We\'re
wasting memory.

It\'s not just beer. Practically every physical object out in the world
is an instance of a *type* of object; the six bottles are instances of
the platonic idea of Asahi beer, of the Asahi ur-beer; 6135 long sword
instances of a generic ur-sword, each instance having a varying degrees
of sharpness, wear & tear, but still sharing the same properties of
steel, the same hilt design, the same descriptions. So how can we share
the common data between the 6135 swords while allowing them to diverge
as they please when they change?

No-one will be surprised to hear we will use a general notion of
ur-objects. This gets technical, by the way. It is a technical problem.

\<h3\>Existing Approaches\</h3\>

The general idea of sharing is common in the computer science world and
there are many ways of accomplishing it. In LPC, the most primal way to
share e.g. descriptions would be to include them in a program \--
asahi.c, say \-- which turns them into string constants, which are
automatically shared by all clones of the asahi blueprint object.
However, we do not wish to create an asahi.c file, nor is this even
remotely general enough a solution for us.

Many LPMud programmers writing large areas have probably had ideas in
the direction of the Skotos solution, but they are not known to me, and
are probably custom-fitted to the specific problem.

------------------------------------------------------------------------

\<h2\>Dataspace Inheritance\</h2\>

The next obvious solution is the one we adapt. The object class in
question has an extensible set of properties. It also has the ability to
point to another object of its own class. For example, physical objects
can have an ur-pointer to another physical object.

Whenever a property is looked-up in an object, the object\'s own set of
properties is examined first. If the property is not found there, the
ur-pointer is followed and the property set of the ur-object is examined
instead, and returned if found. If a property is set on the object, is
is set locally. The ur-pointed is never used for modifications to an
object.

Tadaa! All done. The sixpack of asahi beer start out as physical objects
with an empty set of properties and a pointer to the ur-asahi. As we
drink a bottle, we modify it, and the modifications increasingly shadow
the ur-object data. However, unless we paint the bottle blue and fill it
with porridge, most of the descriptions and data will still be shared.

What we\'ve just described is a basic scope system extended to
inter-object scope. The potential rewards are enormous. For a game the
size of Alvatia, an ur-object system -must- be in place.

There is a pleasant side-effect of this solution. Once we\'ve made
thousands of half-drunk bottles of Asahi, strewn across the lands of
Alvatia, we realize we forgot to put the alcohol into the beer. We
quickly run to the stashed-away ur-Asahi and edit it, giving it an
intoxicating effect. Immediately, all objects across the land are
upgraded. The generalization: we have a potential hierarchy of objects
that can be tweaked for balance issues.

\<hr\>

Further thoughts: a trivial example, a sword.

\* urSword.Desc: \* A simple but effective steel blade. It is in
\$(Condition) condition and looks to be worth about \$(Value) dollars.
\* urSword.Condition: \* immaculate \* urSword.Value: \* 100,000

A newly sold sword: \* newSword.UrObject: \* urSword

An old, used sword: \* usedSword.UrObject: \* urSword \*
usedSword.Condition: \* tolerable \* usedSword.Value: \* 3,000

For a more complex example, see Skotos.UrDiscussion!

\<h2\>State of Development\</h2\>

There is no code.

\<h3\>Open Issues in the Builders.UrObjectSystem\</h3\>

\* What level of \"genericness\" do we use: ur-garb, ur-shirt, ur-red
shirt, ur-red shirt with stain?

\<HR\>

\<H2\>Technical Requirements\</H2\>

**General Requirements:**

1 Objects **Must (Dependent)** be able to point to ur-objects to inherit
data. 3 Objects **Must (Dependent)** be able to overload values from the
ur-object. 2 Details **Should** be able to point to ur-objects to
inherit data. 4 Details **Should** be able to overload values from the
ur-object. 5 Ur-object inheritance **May** be more than one level deep.

Objects need to be able to store a pointer to their ur-parent. (What
about details? Shouldn\'t we consider ur-detail support for common
details?) The game engine needs to be able to search an object and then
the object\'s ur-parent when trying to resolve property references. Need
to decide if this can be more than one level deep. Probably not, since
things can get too complicated, especially for story builders that are
new to object-oriented paradigms.

**Property Requirements:**

1 Ur-objects **Should** be able to inherit special characteristics or
properties. 2 Properties **Should** be prioritized.

This gets around the multi-level inheritance problem by introducing a
second type of variable: the characteristic or property. These are the
building blocks which an ur-object is composed of. For example, if you
have a silk-blue-shirt ur-object, you would inherit the silk
characteristic (describing how the fabric feels, how quickly it breaks
down, and that it\'s wrecked by water); the shirt characteristic
(describing what body parts it covers); and the blue characteristic
(describing what light levels the object is visible at). These
characteristics are **not** complete objects. They\'re bits and pieces
that each offer a few characteristics to the ur-object as a whole. It\'s
possible that multiple characteristics will try and modify the same
values\--for example, silk might also describe what light levels the
object is visible at. A clear system of precedence needs to be
established for this\--optimally through the characteristics themselves,
which describe how important they are on some global scale, or possibly
by a simple rule, such as the order in which the characteristics are
arranged.

    EXAMPLE:

                                        ur-silk-blue-shirt
    silk characteristic --------> SILK
    blue characteristic --------> BLUE
    shirt characteristic -------> SHIRT
                                            OTHER VARIABLES
                                             |
                                             |
                                            \_/
                                        my-old-ragged-silk-blue-shirt

**Error Requirements:**

1 **Must** handle broken links. 2 **Must** handle broken references.

The game engine needs to be able to handle broken links\--what happens
when the ur-parent doesn\'t exist? Likewise, the game engine needs to be
able to handle broken references\--what happens when a value referenced
doesn\'t exist in the parent or child ur-object?

------------------------------------------------------------------------

------------------------------------------------------------------------

**Area below not part of article, but just for notes and such when
we\'re putting the article together**

------------------------------------------------------------------------

------------------------------------------------------------------------

------------------------------------------------------------------------

------------------------------------------------------------------------

References:

\* Other systems that impact Ur Objects:

\* Or systems the Ur Objects impact:

------------------------------------------------------------------------

------------------------------------------------------------------------

Put old text references here, between rulers.

------------------------------------------------------------------------

More references

\* for example: the ur-shirt might have lists of materials: \$CLOTH:
cotton, silk, wool; and DEFAULT: cotton. Damage as \$IMPERFECTIONS:
damaged, burnt, torn, poorly-made, moth-eaten; and DEFAULT: \[blank\].
The ur-shirt description might be DESC: A \$IMPERFECTIONS \$CLOTH shirt.

------------------------------------------------------------------------

------------------------------------------------------------------------

%META:TOPICMOVED{by=\"ChristopherAllen\" date=\"1057352585\"
from=\"Skotos.UrObjectSystem\" to=\"Builders.UrObjectSystem\"}%
