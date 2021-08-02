# SAM System - A Technical Summary

See Also: DescriptionSystem, SignalSystem

## The Problem of Dynamic Text

SkotOS is largely concerned with presenting text to users. In a dynamic, interactive system such as ours, environments and occurences are forever changing, yet they must be described in consistent ways, even artistic ways, to the inhabitants of the virtual world:

<pre>
   You are kneeling next to Fred in a dingy hut.  Jane stands near the door. A
   long, black sword lies at her feet. The rain pours down outside.
</pre>

This is a description which is clearly associated with the hut in which we are kneeling, yet refers to current occupants, items on the floor, and the weather outside: the description mingles static text with dynamic data. The system's ability to do this well is absolutely vital to making the user's experience in the world a good one.

### A Solution

Since the program that serves the user with the description is the same one in which the dynamic data resides, there is a simple solution to the quandary above. Let the descriptive text contain special codes that instruct the world server to calculate and embed dynamic descriptions. This could be part of the description of a statue you find in a room:

<pre>
   "The statue appears to be $(this.expression) at you."
</pre>

This statue is alive, it turns out, and can either frown at you or smile, depending on whether or not you've kept up your sacrifices to the local dark lord. Thus when a user looks at the statue, the server knows to query the expression property of the statue. The definition of this property in the statue includes some logic that investigates the user staring at it, and sends back either 'frowning' or 'smiling'.

This is the core of SAM: the developer writes static descriptions that contain active markup. The markup is evaluated by the server at each time the user actually observes the description. The perceived description is populated with current data.

### SAM Everywhere

Once we came up with this idea of marked-up text, a whole world of possibilities opened up before us. We look further than description; since web pages are essentially text, why not use this same system to generate web pages on the fly, populated with up-to-date world data:

<pre>
   Welcome to Sir John's village status page!

   Johnsville currently has 612 inhabitants. The weather is cold
   and sunny. Thirty-one cows graze the fields. Alewife Christina
   made her latest batch of ale approximately nine hours ago.
</pre>

The SAM in this case would underlie HTML rather than straight text, but to the server there is no difference.

## More Power

The more we play with SAM, the more its potential power became apparant to us, and the more we added to it. Early on we decided to
add conditional functionality:

<pre>
   This is a long black sword with intricate carvings.
   <if val="$(greaterthan lhs='$looker.skill:weapon-lore' rhs='5')">
      <true>
         . You recognize the make as Alvatian.
      </true>
      <false>
         It is nighttime.
      </false>
   </if>
</pre>

where the user will only be told of the sword's make if he has studied his weapon lore.

We also add iteration, e.g.

<pre>
   Welcome to Sir John's cow status page! Here's who's grazing
   the fields today:
   <for var="cow" val="$(Cows)">
      $(Cow.CapitalizedName) is grazing in $(Cow.Pasture) and is
      feeling $(Cow.Contendedness).
   </for>
</pre>

where $(Cows) is an array of, yes, cows, and the SAM within the for loop is  executed once for each element of this array. The result is a list of cows,  their whereabouts, and how happy they are at the moment.

We've introduced new syntax here; readers may recognize it as similar to HTML.  It is in fact XML, a close relative, and it is the syntactic model we have  chosen to express SAM.

### Shortcuts for SAM

As we used more and more SAM, the extra "text" in the shortcuts required for XML often made reading descriptions more difficult. To address this, we created SAM Shortcuts. These are alternative ways to use SAM but with shorter tags, making it descriptions easier to read.

For example, in the Black Sword example above, the following SAM shortcut works exactly the same way:

<pre>
   This is a long black sword with intricate carvings.
   {? greaterthan | $looker.skill:weapon-lore | 5 |
      . You recognize the make as Alvatian.|
      .}
</pre>

Technically this is not XML markup, but internally SkotOS converts this to XML.

### Existing Approaches

(We need someone to write up how LPMuds and other MUDs have tried to do this in the past)

### Problems Solved by Skotos SAM System

Ok, there are many different problems that can be solved related to XYZ, but these are the ones that we specifically are addressing in this implementation of the XYZ System.

### State of Development

The SAM System is relatively mature and complete. Much of the fundamental power of it was proven in Castle Marrach, and now is being used more fully in various Skotos-Seven games.

### Open Issues in the SAM System

There are very few major issues with SAM itself, due to its maturity and several years of development. However, there are some related systems that have weaknesses that affect SAM:

* Right now brief/glance/look/examine descriptions (and their all/dark/dim/bright/superbright variants) are not actually socials, so they do not get as many arguments as do the social tags. Useful information that is lacking includes which verb was used, the distance the actor is from the detail being viewed, etc. As soon as these commands are converted to Merry, all of these useful arguments will be available to these descriptions as well.
* There are quite a few commands that are not converted to Merry yet, so can't be used with signal descriptions written in SAM.
* The combinables system may have impact on SAM tags, as not all 'objects' will be single objects anymore.

SEE ALSO: [Quick Summary of the SAM System](QuickSummarySAMSystem.md)

# Practical SAM

## SAM Arguments and References

### SAM Arguments

These default arguments are available when objects are being described in brief, glance, look, examine, and their dim/dark/bright/superbright descriptions:

<pre>
    $(actor)  - Person this object is being described to, an OBJECT
    $(looker) - Whoever is looking at the object, an OBJECT
    $(this)   - The object being described, an OBJECT
    #(target) - The detail of of the object being described, a NREF
</pre>

Here are some useful arguments are typically available when signal descriptions are triggered in objects:

<pre>
    $(actor)        - Object that triggered the action, an OBJECT
    $(target)       - The object that was acted upon, an OBJECT
    $(verb)         - The verb used by the actor, a STRING
    $(adverb)       - The adverb used by the actor (if any), a STRING
</pre>

If you use these arguments directly in SAM, you'll typically get output like:

<pre>
   actor: OBJ(Chatters:LC:ch:allen-christopher)
   target: NREF([Examples:complete:sam:sam-toy]#11527|button)
   verb: pull
   adverb: carefully
</pre>

When you see OBJ() or NREF(), this means that these values are intended for use inside other same tags. For instance, the following will output the brief description of the actor:

<pre>
   <describe what=$actor />
</pre>

There are also a number other arguements, and sub-arguments that you might find useful:

<pre>
    $(preps)        - Prepositions used by the actor (if any), an ARRAY
</pre>

There are other arguments that are available to many signals, however, they may not be available to all signals. Even $verb may not be set if the action was not triggered by a social.

The best way to see what arguments are available, you can  put inline Merry in descriptions to see every argument that is available to SAM in a particular description:

<pre>
   Look: [*
      $[dump_value( args )]
   *]

   > look at toy's button
   ([ "actor":<Chatters:LC:ch:allen-christopher>,
      "looker":<Chatters:LC:ch:allen-christopher>,
      "node":</usr/SkotOS/data/merry#-1>,
      "target":(43)O(/base/data/nref#-1, <[Examples:complete:sam:sam-toy]#11527>, "button"),
      "this":<[Examples:complete:sam:sam-toy]#11527> ])
   >


   React-post:push-dob: [*
      $[dump_value( args )]
   *]

   > push toy's button carefully
   You push a button.
   ([ "actor":<Chatters:LC:ch:allen-christopher>,
      "adverb":"carefully",
      "adverb:position":"pp",
      "dob":({ (43)O(/base/data/nref#-1, <[Examples:complete:sam:sam-toy #11527>, "button") }),
      "dob:description":"push",
      "dob:distance":3,
      "imperative":"push",
      "ldef":X[S] $(you) $(verb) $(dobname).,
      "node":</usr/SkotOS/data/merry#-1>,
      "obscurity":0,
      "origtarget":"none",
      "parts":({ ({ "V" }), ({ "O", ({ (43)O(/base/data/nref#-1, <[Examples:complete:sam:sam-toy]#11527>, "button") }) }) }),
      "preps":([ ]), "privacy":0, "rob":</base/data/result#-1>,
      "roles":({ "dob" }),
      "target":(43)O(/base/data/nref#-1, <[Examples:complete:sam:sam-toy]#11527>, "button"),
      "this":<[Examples:complete:sam:sam-toy]#11527>,
      "verb":"push",
      "vob":<Socials:Verbs:push>,
      "witnesses":({ <Examples:complete:desc:room-go-nowhere>, ({ }) }) ])
      >
</pre>

You can even use +tool has arguements available to it:

<pre>
   > +tool sam exec $[dump_value( args )]

   Original input:
           $[dump_value( args )]

   Output:
           "([ \"actor\":<Chatters:LC:ch:allen-christopher>, \
                "body\":<Chatters:LC:ch:allen-christopher>, \
                "here\":<Examples:complete:desc:room-go-nowhere>, \
                "looker\":<Chatters:LC:ch:allen-christopher>, \
                "node\":</usr/SkotOS/data/merry#-1> ])"

   > +tool merry exec EmitTo( $actor, dump_value( args ) ) ;
   ([ "actor":<Chatters:LC:ch:allen-christopher>,
      "body":<Chatters:LC:ch:allen-christopher>,
      "here":<Examples:complete:desc:room-go-nowhere>,
      "looker":<Chatters:LC:ch:allen-christopher> ])

   Merry code:   EmitTo( $actor, dump_value( args ) ) ;
   Merry result: nil

</pre>

### SAM References

#### Pronouns References

Pronouns are those words that replace nouns: he, him, his, that type of thing. They exist in three different forms:

   * *Direct Object*  The pronoun you use when the noun you're replacing is active. He, she, it, they.
   * *Indirect Object*  The pronoun you use whn the noun you're replacing is being acted upon. Him, her, it, them.
   * *Possessive* The pronoun you use when the noun you're replacing is owning something. His, her, its, their.

You may use SAM references to replace objects in a sentence with the appropriate pronouns, in order to create more beautiful output. The SAM references that do this are $(object.base:pronoun) for direct object pronouns;  $(object:base:objective) for indirect object pronouns; and $(object.base:possessive) for possessive pronouns. 

The $(object) is usually a general SAM reference like $(actor) or $(target) or one specific to an individual verb or skill like $(teacher) or $(student). Currently these pronoun SAM references may only be used with singular objects.

#### Object References

In addition, you can directly refer to objects named in Woe, either directly:

<pre>
    $(woe:object:name)
</pre>

Or indirectly (meaning if the object name changes, the reference changes with it):

<pre>
    $[${woe:object:name}]
</pre>

With these any of these, you can directly output properties that are in these objects into your descriptions, just by adding a period followed by the property name:

<pre>
    $(this.trait:variant)
    $(actor.trait:variant)
    $(Full:Woe:Name.trait:variant)
    $[${Full:Woe:Name.trait:variant}]
</pre>

----

The way to refer to a SAM reference with a space in it is to put it in
quotes -- e.g.

   $("room.details:exit west:descriptions:look")

rather than

   $(room.details:exit west:descriptions:look)


-----

OBSOLETE INFORMATION:


<blockquote><font=purple>
<pre>
These are the SAM references and suffixes that are assigned by default.

Refs:

$(this)                     This object
$(actor)                    Person using this object
$(target)                   Target of this object
$(everyone)                 All volitionals in the room
$(all)                      Everything in the room
$(looker)                   Depricated.. use $(actor)
$(third)                    $(all) minus $(actor)

Suffixes:

.env                        The room this object is in
.room                       The room this object is in
.inv                        This object's inventory
.inventory                  This object's inventory
.prox                       This object's prox object
.prep                       This object's prox prep (near, on, etc)
.stance                     This object's stance prep (standing, sitting)
.tname                      This object's true name
.ur                         This object's Ur object

----
(also)

If $(actor) has been set then:

    $(target) - If there is a 2nd party. This is it. Not always set.
    $(everyone) - Everyone in the room but the $(actor)
    $(all) - Everyone in the room.
    $(third) - Everyone in the room.

----
(also)
The one tag you didn't include is a hack by Wesley
that we'll hopefully rip out some day, 'obsprep', it tries to
figure out if what's sent into the 'what' attribute is plural or
not. It outputs 'is' or 'are' depending... but it's a cheesy hack.

</pre></font></blockquote>

Heh. The pre-computation of $everyone, $all and $third were the sole cause of almost a year's worth of Marrach lag. That's exactly the kind of variable that should never, ever be precomputed and thus cannot be present in a simple $foo style lookup (i.e. placed into 'args' before the SAM engine takes over).

This makes me a little nervous. You can't print out the contents of args and assume that everything you find there is going to be consistently provided in every situation... in fact, 'args' picks up contents from every step of the chain from user input to action... through all the various events that can be triggered... until you finally get to see it in your own event handler. It could contain all kinds of junk.

Specifically, 'witnesses' is a Merry-specific thing, and if anything it should probably be ripped out. It consists of the objects that saw the current action -and- which have the 'script_runner' flag turned on, i.e. a rather specialized array of objects of little use to any other code.

Again, precomputing the inventory of the room into a $foo variable would be a bad mistake.

You don't even need Merry to get at the on-the-fly versions of those variables -- $everyone and $all would be

   $actor.base:inventory


and inline Merry for $third would be

   $[ $actor."base:inventory" - ({ $actor }) ]

(the document is wrong: $third is the one that should exclude the actor).

-- Main.ParWinzell - 13 March 2003 <br>

Old SAM references -- many are for if statements, many should now use base properties instead:

<pre>
$(break text="foo" margin="length")
Keep 'text' restricted to length of 'margin'.
QUESTION: Does this work? Shouldn't this be a SAM tag not a function?

It works, but is obsoleted by the inline Merry, e.g.

     $[ break_string($text, 80) ]

which will return $text with newlines inserted between words, so that no line is longer than 80 characters.

-- Main.ParWinzell - 18 March 2003


$(mapref map="foo" index="bar")
Returns the value of foo[bar].

Obsoleted by Merry:
    $[ $foo["bar"] ]
or even more generally
    $[ somemapping[someindex] ]

-- Main.ParWinzell - 18 March 2003

$(lessthan lhs="foo" rhs="bar")
Returns the result of 'foo < bar'.
Note: 'lhs' and 'rhs' should be integers.

The integer restriction has been removed. This is available as SAM sugar
now.

-- Main.ParWinzell - 18 March 2003


$(greaterthan lhs="foo" rhs="bar")
Returns the result of 'foo > bar'.
Note: 'lhs' and 'rhs' should be integers.

The integer restriction has been removed. This is available as SAM sugar
now.
-- Main.ParWinzell - 18 March 2003


$(range val="blah" start="foo" finish="bar")
Returns TRUE is 'val' is in the range of 'start' to 'finish'.
Note: 'val', 'start', and 'finish' should be integers.

The integer restriction has been removed. This is available as SAM sugar
now.
-- Main.ParWinzell - 18 March 2003


$(mapmake)
Returns an empty initialized mapping.

obsoleted by $[ ([ ]) ]
-- Main.ParWinzell - 18 March 2003


$(equal left="foo" right="bar")
Returns the result of 'left == right'.

$(foo.0)
If $(foo) is an array, returns the first item of that array. $(foo) can even be a property, so $(object.property:namearray.0) would return the first item in the property named "property:namearray".

This is available as SAM sugar now.
-- Main.ParWinzell - 18 March 2003

$(foo.even)
Does $(Foo) have an even number of elements?

$(foo.odd)
Does $(Foo) have an odd number of elements?

Both work... No harm in keeping them I guess.

-- Main.ParWinzell - 18 March 2003



$(foo.isfile)
Is $(Foo) a file?

This is completely useless and will only confuse a developer who will
never, ever, ever see it used. It's not been in the code since 2000.
-- Main.ParWinzell - 18 March 2003


$(foo.isobject)
Is $(Foo) an object?

$(foo.isnref)
Is $(Foo) an NRef?

Both exist & are useful.
-- Main.ParWinzell - 18 March 2003



$(foo.nrefob)
Returns the object of this NRef.
QUESTION: What is foo, text?

$(Foo.nrefdetail)
Returns the detail of the NRef.
QUESTION: What is foo, text?

Foo is an NRef, e.g. $target. Exists as $[ NRefOb($foo) ] but no harm in
keeping them, since they are probably somewhat common in SAM.
-- Main.ParWinzell - 18 March 2003



$(foo.size)
Returns size. If $(Foo) is an array then the number of elements will be
returned. If $(Foo) is a string then the string length will be returned.
If $(Foo) is a mapping then the size of the indices list is returned.

Yep, works.
-- Main.ParWinzell - 18 March 2003


$(object.environment)
$(object.env)
$(object.room)
Returns the environment object of $(object)
OBSOLETE: Use $(object.base:environment) instead.


$(object.inventory)
$(object.inv)
Returns the inventory array of $(object)
OBSOLETE: Use $(object.base:inventory) instead.


$(object.prox)
Returns the NRef proximity of $(object)
OBSOLETE: Use $(object.base:proximity) instead.

Yes, those are all obsolete because the derived properties are available.
-- Main.ParWinzell - 18 March 2003


$(object.prep)
Returns the string preposition of $(object).
COMMENT: There doesn't seem to be an equivalent derived property, probably should add one, and mark this obsolete

There most certainly is --

     integer: base:preposition
     string:  base:prepositionstring

They are both documented in TWiki's

     http://troll.skotos.net/twiki/bin/view/Builders/DerivedProperties
-- Main.ParWinzell - 18 March 2003

$(object.stance)
Returns the integer stance of $(object).
COMMENT: There doesn't seem to be an equivalent derived property, probably should add one, plus maybe one that returns the text value of the stance, and mark this obsolete

There most certainly is --

     integer: base:stance
     string:  base:stancestring

They are both documented in TWiki's

     http://troll.skotos.net/twiki/bin/view/Builders/DerivedProperties
-- Main.ParWinzell - 18 March 2003


$(object.Ur)
Returns the Ur object of $(object).
OBSOLETE: Use $(object.base:urparent) instead.


$(object.tname)
Returns the string object name of $(object).
OBSOLETE: Use $(object.base:objectname) instead


$(object.property:name)
Returns the value of property 'property:name' in $(object).


---
There are no newer SAM references -- there's virtually no reason for any
of these anymore and if we didn't have to keep them for backwards compat
they should all be erased.
-- Main.ParWinzell - 18 March 2003

</pre>

### SAM Shortcuts

**** This is copied from above, needs to be rephrased

As we used more and more SAM, the extra "text" in the shortcuts required for XML often made reading descriptions more difficult. To address this, we created SAM Shortcuts. These are alternative ways to use SAM but with shorter tags, making it descriptions easier to read.

For example, in the Black Sword example above, the following SAM shortcut works exactly the same way:

<pre>
   This is a long black sword with intricate carvings.
   {? greaterthen | $looker.skill:weapon-lore | 5 |
      . You recognize the make as Alvatian.|
      .}
</pre>

Technically this is not XML markup, but internally Admins.SkotOS converts this to XML.

****

#### SAM Shortcuts List

Here is a list of SAM shortcuts that can be useful:

##### Oneof Shortcuts
<pre>
    { random text 1 | random text 2 | random text 3 | etc. }
</pre>

BOOLEAN
<pre>
    {? | $this.trait.variant |
        true text output |
        false text output }

    {? not | $this.trait.variant |
        true text output |
        false text output }
</pre>

##### Comparison Shortcuts
<pre>
    {? equal | $this.trait:variant | ordinary |
        true text output |
        false text output }

    {? notequal | $this.trait.variant | ordinary |
        true text output |
        false text output }

    {? lessthen | $this.trait:variant | ordinary |
        true text output |
        false text output }

    {? lessthenorequal | $this.trait.variant | ordinary |
        true text output |
        false text output }

    {? greaterthen | $this.trait:variant | ordinary |
        true text output |
        false text output }

    {? greaterthenorequal | $this.trait.variant | ordinary |
        true text output |
        false text output }

    {? range | $this.trait.variant | lowervalue | uppervalue |
        true text output |
        false text output }

    {? when | $this.trait.variant |
        value1 | value1 equal $this.trait.variant |
        value2 | value2 equal $this.trait.variant |
        value3 | value2 equal $this.trait.variant |
        *      | any other value }
</pre>

Note: The ? when SAM shortcut is similar to the case and switch comparisons in other languages.


##### Merry Shortcuts
You can also now put arbitrary Merry expressions for tests, as in the following:

<pre>
    {? | $[this.foo == "bar"] |
        true text output |
        false text output }

    {? | $[random(100)] |
        true one in 100 times. |
        false text output }

    {? | $[random(6)+random(6)+random(6)+3 == 18] |
        You rolled 3 sixes! |
        You didn't roll 3 sixes. }

    {? range | $[random(100)] | 25 | 75 |
        You rolled in the middle of the range. |
        You rolled outside the range. }
</pre>


### SAM and Perceptions

For general perception where you either perceive it or don't, the following technique of putting SAM into an examine description would work:

<pre>
    A fine steel dagger
    <if val="$(actor.IronClaw:isasniffer)">
        <true>
            , which smells of fine steel and expensive metal oil, with a slight
            odor of raccoon.
        </true>
        <false>
            .
        </false>
    </if>
</pre>

It is the same technique that is used on Marrach for <code>seesmagic</code> such that those who can perceive magic will see things glow if they examine them.

You should note that there is now a SAM shortcut to make this a little easier. The example below will work exactly as above:

<pre>
    A fine steel dagger
        {? | $(actor.IronClaw:isasniffer)|
        , which smells of fine steel and expensive metal oil, with a slight odor
        of raccoon.|
        .}
</pre>

This technique can be used for anything where the false value is 0 or nil -- any other value is always true (a number, some text, etc.)

I'd recommend against putting a description into just plain look or glance descriptions -- instead, require the player to do an actual smelling command. Only with examine should someone get a non-visual description.

This same technique can also be used in description named <code>react-post:sense/smell-dob</code> that will give output whenever someone uses a verb that is related to smelling, such as sniff. This would look like:

<pre>
    The fine steel dagger {? | $(actor.IronClaw:isasniffer)| smells of fine
    steel and expensive metal oil, with a slight odor of raccoon.| has a slight
    smell of oil.}
</pre>

A similar description name <code>react-post:sense/hear-dob</code> can be used for any use of a verb related to hearing, such as listen and hear. This would look like:

<pre>
    The fine steel dagger {? | $(actor.IronClaw:goodhearing)| is speaking a
    word, 'Morias' over and over again.| has a faint hum.}
</pre>

It can be useful to combine this SAM shortcut with OneOfs. The classic Marrach "seesmagic" SAM looks like this in look descriptions, giving the magic-perceptive viewer a slight chance of seeing magic. Just replace the last period of a look description with the following SAM.

<pre>
    A normal look description without a final period{.|.|.|.|.|.|{? |
    $(actor.skill:seesmagic)|. You see <pronoun what="$(this)"/> give off a
    {slight|faint} {glimmer|glow|aura}{{ "{{"}} of| that you recognize as} magic|}.|.}
</pre>

This technique is not that useful for non-boolean ranges of perceptions, but there is a SAM shortcut for that as well:

<pre>
    A fine steel dagger{? range | $(actor.IronClaw:isasniffer)| 5 | 10 | , which
    smells of fine steel and expensive metal oil, with a slight odor of
    raccoon.|.}
</pre>

In this case, if IronClaw:isasniffer is false only if the value is between 5 and 10 (inclusive) will the true statement work.

If you want to be even more granular and want to specify each, there is the {? when statement:

<pre>
    {? when | $actor.IronClaw:HasGreatHearing |
        0 | You hear a creaking noise. |
        1 | Something beneath you creaks. |
        2 | The boards under your feet creak. |
        3 | The boards under your feet creak ominously. |
        * | The boards under your feet creak and you hear the
            wood splintering.}
</pre>

---

### Using SAM with Merry

#### to be written

     processed_string = UnSAM(ParseXML("You are {happy|sad}."));

This is equivalent to $sam(You are {happy|sad}.) in Bilbo. The ParseXML call translates a string into the binary format (which is what is stored in e.g. object descriptions) and UnSAM is the call that renders a string from it.


### Using SAM with BILBO

#### Using Oneof's

Oneof's can be used inside Bilbo emit statements just like in any other SAM text. For example:

<pre>
   bilbo:react:kiss:0050 emit.actor Spot is a {furry|fluffy|sweaty} dog.
</pre>

#### The Variables

Regardless of which mode the script is in ("act" or "react"), the following Bilbo variables always refer to the following things:

<pre>
   $(this) = The object containing the script
   $(other) = The other object, interacting with this object
   $(actor) = The object doing the action
   $(target) = The recipient of the action
</pre>

If the script is in "act" mode, $(this) and $(actor) are the same object, and $(other) and $(target) are the same.

If the script is in "react" mode, $(this) is $(target), and $(other) is $(actor).

(Note that these arguments are not necessarily the same exact arguments that are available to SAM or Merry, for instance $other is not a valid argument in Merry or ordinary SAM. This is because Bilbo was written pre-Merry)

Basic Examples:

<pre>
bilbo:react:kiss:0080 emit.actor This object is called a <describe what="$(this)"/>.
bilbo:react:kiss:0090 emit.actor The person who kissed this object is named <describe what="$(other)"/>
</pre>

---

### Miscellania

#### +tool

Nino's +tool has a number of SAM related functionality

   +tool sam info
   +tool sam info tagname
   +tool sam parse samtext
   +tool sam exec samtext

#### Test a client

How to test in a .sam page if a client is using ActiveX:

<pre>
&lt;if val="$(UDat.ActiveX)"&gt;&lt;true&gt;
   Your are running ActiveX.
&lt;/true>&lt;/if&gt;
</pre>

#### Test if a user has chatmode enabled

<pre>
&lt;if val="$(UDat.ChatMode)"&gt;&lt;true&gt;
   You have chat mode enabled.
&lt;/true>&lt;/if&gt;
</pre>

#### Output the chatmode char (if in chatmode)

If you are in chatmode $(UDat.ChatChar) will output the chat prefix character (typically a slash /) otherwise an empty string.

-- Main.ChristopherAllen - 01 Aug 2001 <br>

---
---

*Area below not part of system documen, but just for notes and such when we're putting the article together*

---
---

Requirements:
   * list requirements
   * list requirements
   * list requirements

---
---

References:

   * Other systems that impacts XYZ

   * Or systems the XYZ impacts

---
---

Put old text references here, between rulers.

---

More references

---
---

***




---
---


<h1>SAM Language Docs</h1>

SAM, short for Skotos Active Markup, is a language which can be used to produce dynamic text. Some textual abilities available in the Developer Interface such as [[DevDocs6OneOfs][One Ofs]] are actually syntactic sugar for underlying SAM code. SAM is primarily used within text descriptions entered into the Developer interface.

There are two types of markup in SAM, tags and references. The below lists provide information on each. They're very rough right now, without much explanation on how they work. This section of docs needs to be expanded out to make more sense.

_Planned expansions: an introduction page, talking about what SAM is, why to use it, how to use it, etc; this page as a separate reference page; an example page showing SAM in real usage._

---+ SAM Tags Reference

|*Generic SAM tags*|||
|*Tag*|*Required*|*Optional*|
|[[#Capitalize][capitalize]]|what|&nbsp;|
|[[#Describe][describe]]|what|actor, cap, looker, lookers, nonposs|
|[[#Describeprop][describe-prop]]|this, what|cap, def|
|[[#Describeprops][describe-props]]|which|cap, noun, delim|
|[[#Describemany][describemany]]|what|actor, cap, looker, lookers, style|
|[[#Describeprep][describeprep]]|what|cap|
|[[#Dump][dump]]|val|&nbsp;|
|[[#Eaten][eaten]]|what|cap|
|[[#Mapset][mapset]]|index, map, to|&nbsp;|
|[[#Objective][objective]]|what|cap|
|[[#Obsprep][obsprep]]|what|&nbsp;|
|[[#Possessive][possessive]]|what|cap|
|[[#Pronoun][pronoun]]|what|cap|

|*Flow control SAM tags*|||
|*Tag*|*Required*|*Optional*|
|[[#And][and]]|val|&nbsp;|
|[[#False][false]]|&nbsp;|&nbsp;|
|[[#For][for]]|val, var|&nbsp;|
|[[#If][if]]|val|&nbsp;|
|[[#Oneof][oneof]]|&nbsp;|&nbsp;|
|[[#Or][or]]|val|&nbsp;|
|[[#True][true]]|&nbsp;|&nbsp;|

|*Text formatting SAM tags*|||
|*Tag*|*Required*|*Optional*|
|[[#TagBr][br]]|&nbsp;|&nbsp;|
|[[#TagP][p]]|&nbsp;|&nbsp;|
|[[#TagSbr][sbr]]|&nbsp;|&nbsp;|
|[[#TagSpc2][spc2]]|&nbsp;|&nbsp;|
|[[#TagSpc3][spc3]]|&nbsp;|&nbsp;|
|[[#TagSpc4][spc4]]|&nbsp;|&nbsp;|
|[[#TagSpc5][spc5]]|&nbsp;|&nbsp;|
|[[#TagSpc6][spc6]]|&nbsp;|&nbsp;|
|[[#TagSpc7][spc7]]|&nbsp;|&nbsp;|
|[[#TagSpc8][spc8]]|&nbsp;|&nbsp;|
|[[#TagTab][tab]]|&nbsp;|&nbsp;|
|[[#TagHelplink][helplink]]|&nbsp;|&nbsp;|

|*Set & query SAM tags*|||
|*Tag*|*Required*|*Optional*|
|[[#TagAddadj][add-adj]]|adjective, obj|detail|
|[[#TagAddname][add-name]]|name, obj|detail, pname|
|[[#TagAdjustproperty][adjust-property]]|prop, val, what|&nbsp;|
|[[#TagGetdesc][get-desc]]|obj, type|detail|
|[[#TagRemadj][rem-adj]]|adjective, obj|detail|
|[[#TagRemname][rem-name]]|name, obj|detail|
|[[#TagSetdesc][set-desc]]|desc, obj, type|detail|
|[[#TagSetproperty][set-property]]|prop, val, what|&nbsp;|
|[[#TagSocial][social]]|form, verb|&nbsp;|

|*Undocumented SAM tags*|||
|*Tag*|*Required*|*Optional*|
|[[#TagAcmd][acmd]]|&nbsp;|&nbsp;|
|[[#TagAtag][atag]]|&nbsp;|&nbsp;|
|[[#TagComment][comment]]|&nbsp;|&nbsp;|
|[[#TagDescribeholder][describe-holder]]|&nbsp;|&nbsp;|
|[[#TagDescribeposs][describe-poss]]|&nbsp;|&nbsp;|
|[[#TagDescribeview][describe-view]]|&nbsp;|&nbsp;|
|[[#TagQuote][quote]]|&nbsp;|&nbsp;|

------

#TagAcmd
### *&lt;acmd&gt;*
   <B>Category</B>: Text Formatting
   <B>Description</B>: Allows the client to have clickable text that sends a command to the server.
   <B>Parameters</B>: \
      <I>tag</I>: (optional) The theme that the this tag should use. (? What is the default used if no <i>tag</i> is specified?)
      <I>cmd</I>: (required) The command that should be sent to the server when the user clicks on it. The most common example of this is a parser command, say @help swords. When the user clicks on the highlighted text, the command "@help swords" is sent to the server. If echo is on in the client the user will see the command sent.
   <B>Syntax</B>: &lt;acmd cmd="@help swords"&gt;click here to learn more about swords.&lt;/acmd&gt;, &lt;acmd tag="assist" cmd="verb"&gt;verb colored using assist theme&lt;/acmd&gt;

#TagAddadj
### *&lt;add-adj&gt;*
   <B>Category</B>: Set
   <B>Description</B>: Add an adjective to an object detail.  If the 'obj'
                       parameter is an object, by default the primary
                       detail will be used, unless the 'detail' parameter
                       is used as well.
   <B>Parameters</B>: \

      <I>adjective</I>: The adjective to add.
      <I>detail&nbsp;(optional)</I>: The specific detail for which to add
                                     the adjective.  Only used if the 'obj'
                                     parameter isn't an NRef.
      <I>obj</I>: The object or NRef in which to add the adjective.
   <B>Example</B>: \
<pre>
    <add-adj adjective="dove" obj="$(this)"/>
</pre>

   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To add an adjective to an object or detail, use the following inline Merry instead of the obsolete addadj tag:

To add an adjective $adj to NRef $what,

  $[ Set($what, "detail:adjectives:" + $adj, TRUE); ]

To add an adjective $adj to detail $det on object $ob,

  $[ Set($ob, "details:" + $det + ":adjectives:" + $adj, TRUE); ]

This duality between setting detail: on an NRef and details: on an
object/detail pair works the same way for all these snippets and I will
not explicitly repeat those variants below.

***EXAMPLES REQUIRED***


#TagAddname
### *&lt;add-name&gt;*
   <B>Category</B>: Set & query
   <B>Description</B>: Add a name to an object detail.  If the 'obj'
                       parameter is an object, by default the primary
                       detail will be used unless the 'detail' parameter is
                       used as well.
   <B>Parameters</B>: \

      <I>detail&nbsp;(optional)</I>: The specific detail for which to add
                                     the name.  Only used if the 'obj'
                                     parameter isn't an NRef.
      <I>name</I>: The name to add.
      <I>obj</I>: The object or NRef in which to add the name.
      <I>pname&nbsp;(optional)</I>: An optional plural-name to go along
                                    with the (singular) name.
   <B>Example</B>: \
<pre>
    <add-name name="dove" pname="doves" obj="$(this)"/>
</pre>

   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To add an new name to an object or detail, use the following inline Merry instead of the obsolete addname tag:

To add a name $sname to NRef $what,

  $[ Set($what, "detail:snames:" + $sname, TRUE); ]

To add a name $sname to detail $det on object $ob,

  $[ Set($ob, "details:" + $det + ":snames:" + $sname, TRUE); ]

To add a name $sname with plural version $pname to NRef $what,

  $[ Set($what, "detail:snames:" + $sname, $pname); ]

To add a name $sname with a plural version $pname to detail $det on object $ob,

  $[ Set($ob, "details:" + $det + ":snames:" + $sname, $pname); ]

***EXAMPLES REQUIRED***



#TagAdjustproperty
### *&lt;adjust-property&gt;*
   <B>Category</B>: Set & query
   <B>Description</B>: Set the property in the given object to a new value.
                        This differs from set-property in that it checks if
                       the current property-value is an integer, in which
                       case it will attempt to cast the new value to an
                       integer as well.
   <B>Parameters</B>: \

      <I>prop</I>: The name of the property that needs to be changed.
      <I>val</I>: The new value for the property.
      <I>what</I>: The object in which to change the property.
   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To add to a numeric property in an object, you don't need this tag any more: use inline Merry instead.

To add 1 to property $prop on object $ob,

  $[ Set($ob, $prop, Get($ob, $prop) + 1); ]

***EXAMPLE REQUIRED***


#TagAnd
### *&lt;and&gt;*
   <B>Category</B>: Flow control
   <B>Description</B>: Used as sub-tag for the &lt;if&gt; tag, to be able
                       to build more complex conditions.
   <B>Parameters</B>: \

      <I>val</I>: The and-condition.
   <B>Examples</B>: \
The new AND and OR tags for SAM are now available on all servers (Marrach, S7, Welcome, and RPGnet) -- this should make doing SAM tags much easier.

As an example, in a number of places in Marrach to currently do outside day and night descriptions (used in many of the outside views):

<pre>
    <if val="$(greaterthan lhs='$(system.hour)' rhs='5')">
        <true>
            <if val="$(lessthan lhs='$(system.hour)' rhs='18')">
                <true>
                   It is daytime.
                </true>
                <false>
                   It is nighttime.
                </false>
            </if>
        </true>
        <false>
            It is nighttime.
        </false>
    </if>
</pre>

This can be confusing, and can be error prone, as you might add some more code and if statements in the first FALSE tag but forget to make identical changes to the second FALSE tag.

There is the same test done with the new AND tag:

<pre>
    <if val="$(greaterthan lhs='$(system.hour)' rhs='5')">
        <and val="$(lessthan lhs='$(system.hour)' rhs='18')">
            <true>
                It is daytime.
            </true>
            <false>
                It is nighttime.
            </false>
        </and>
    </if>
</pre>

Or with the OR tag:

<pre>
    <if val="$(equal left='$(system.hour)' right='6')">
        <or val="$(equal left='$(system.hour)' right='7')">
        <or val="$(equal left='$(system.hour)' right='8')">
        <or val="$(equal left='$(system.hour)' right='9')">
        <or val="$(equal left='$(system.hour)' right='10')">
        <or val="$(equal left='$(system.hour)' right='11')">
        <or val="$(equal left='$(system.hour)' right='12')">
        <or val="$(equal left='$(system.hour)' right='13')">
        <or val="$(equal left='$(system.hour)' right='14')">
        <or val="$(equal left='$(system.hour)' right='15')">
        <or val="$(equal left='$(system.hour)' right='16')">
        <or val="$(equal left='$(system.hour)' right='17')">
            <true>
                It is daytime.
            </true>
            <false>
                It is nighttime.
            </false>
        </or>
        </or>
        </or>
        </or>
        </or>
        </or>
        </or>
        </or>
        </or>
        </or>
        </or>
    </if>
</pre>

   <B>Status</B>: DATED
   <B>Comments</B>: Though and tags can be useful, using inline merry is now often a lot easier.


#TagAtag
### *&lt;atag&gt;*
   <B>Category</B>: Text Formatting
   <B>Description</B>: Sets the 'theme' of the text, allowing it to be colored by the Client
                       theme
   <B>Parameters</B>: \
      <I>tag</I>: The theme that the this tag should use.
   <B>Syntax</B> &lt;atag tag="theme"&gt; text tha you want themed &lt;/atag&gt;


#TagBr
### *&lt;br&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Adds a newline to the output.


#TagCapitalize
### *&lt;capitalize&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Capitalizes the contents of the 'what' parameter.
   <B>Parameters</B>: \
      <I>what</I>: That which needs to be capitalized.
      <I>strip</I>: If "1", strip the string before capitalizing it.
      
<font color=red>Note that capitalize was rewritten in Merry July 25, 2006. It is now nil-insensitive (no longer [NIL]) and allows the attribute strip="1", which strips the result before capitalizing. --Kalle)</font>

#TagCase
### *&lt;case&gt;*
   <B>Category</B>: Flow control
   <B>Description</B>:  Depending on the value of the val parameter,
                        the correct <case> tag is picked from the
                        contents of the tag and inserted into the output.
   <B>Parameters</B>: \
      <I>val</i>: The value by which to select.


#TagConfigure-chatter
### *&lt;configure-chatter&gt;*

This is associated with Theatres. The configure-chatter samtag
works in conjuction with the Theatre-specific start-story stuff with the
SSNuggets and whatnot... it sets all the properties given in the Edit
form, and then calls descsub in the body. It's a nasty nasty hack -- we
really shouldn't have LPC calling Bilbo 
-- Main.ParWinzell - 18 March 2003


#TagCreate-chatter
### *&lt;create-chatter&gt;*


This is associated with Theatres. The create-chatter tag is -the- way to
create a body for a player on a
theatre. It sets all the relevant theatre values, sets the name to the
right Chatters: directory, sets the gender, registers the body centrally
so that pages work, sets the linkdeath room, etc. It cannot currently be
duplicated in Merry -- there's some calls that are not exported to that
development layer. Yet.
-- Main.ParWinzell - 18 March 2003


#TagDescribe
### *&lt;describe&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Describe an object.
   <B>Parameters</B>: \

      <I>actor&nbsp;(optional)</I>: The acting party.
      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output or not.
      <I>looker&nbsp;(optional)</I>: From whose perspective to describe the
                                     item.
      <I>lookers&nbsp;(optional)</I>: If 'looker' isn't used, the first
                                      entry from 'lookers' is used instead.
      <I>nonposs&nbsp;(optional)</I>: Adjust the style in which the
                                      description is written.
      <I>what</I>: The item you want to describe.
      <I>detail&nbsp;(optional)</I>: The detail of the item you want to describe.
   <B>Syntax</b>&lt;describe what="$(object)" looker="$(object)" cap/&gt;
   <B>Comments</B>: \
   * If the detail is not defined, it will describe the default detail. looker is optional, but is highly suggested that it is set and set to be the actor.


#TagDescribemany
### *&lt;describemany&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Describe a collection of objects.
   <B>Parameters</B>: \

      <I>actor&nbsp;(optional)</I>: The acting party.
      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output or not.
      <I>looker&nbsp;(optional)</I>: From whose perspective to describe the
                                     item(s).
      <I>lookers&nbsp;(optional)</I>: If 'looker' isn't used, the first
                                      entry from 'lookers' is used instead.
      <I>style&nbsp;(optional)</I>: Adjust the style in which the
                                    description is written.  Default is
                                    'STYLE_NONPOSS'.
      <I>what</I>: The item(s) you want to describe.
   <B>Syntax</B>: &lt;describemany what="$(object)" lookers="$(arrayofobject)" looker="$(object)" cap/&lt;
   <B>Examples</B>: \
   * This tag is typically used in descriptions where you wish to show the contents of item even if the item is closed (say behind glass doors), or of a room that is on the other side of a window. For example:
<pre>
Behind the glass doors you can see <describemany what="$(this.base:inventory)"/>.
</pre>


#TagDescribeprep
### *&lt;describeprep&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Describe the current proximity preposition of an
                       object, i.e. against, before, behind, beside,
                       close, inside, near, on, over, under,
   <B>Parameters</B>: \

      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output or not.
      <I>what</I>: The object whose preposition you want.
   <B>Syntax</B>: &lt;describeprep what="$(object)" cap/&lt;

   <B>Category</B>: Generic
   <B>Description</B>: 
   

#TagDescribe-Holder
### *&lt;describe-holder&gt;*
If $what is an object held by some person named "Bubba", then this tag
will output "Bubba's". It can imagine it used like this:

   <describe what="$(foo)"/> is not yours, it's
   <describe-holder what="$(foo)"/>.

It's pretty much equivalent to

   <describe what="$(foo.base:holder)"/>'s

except when the person's name ends in 's' or 'x' in which case it does
the right thing and just adds the apostrophe without a trailing s.
-- Main.ParWinzell - 18 March 2003



#TagDescribe-poss
### *&lt;describe-poss&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Describes 'what' in a possessive tense. 
   <B>Parameters</B>: \
      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output or not.
      <I>what</I>: The object(s) you want described.
      <I>actor</I>: The object which "acts", and should be described e.g. as "his" or "hers"
      <I>looker</I>: The object which "looks", and should be described as "yours".


#TagDescribeprop
### *&lt;describe-prop&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Describe the object that is the content of the
                       property.
   <B>Parameters</B>: \

      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output.
      <I>def&nbsp;(optional)</I>: Whether to describe it in a definite way
                                  or not.
      <I>this</I>: The object in which you want to query the property.
      <I>what</I>: The name of the property.

      <b>describe-prop</b>
   <B>Syntax</B>: &lt;describe-prop what="property:name" cap def/&gt;
   <B>Comments</B>: Adds "a" "the" "an" to the property appropriately. 'def' will force "the" onto the output. Defaults to the $(this) object.



#TagDescribeprops
### *&lt;describe-props&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Describe the strings in the space-separated list of
                       properties, in the object.
   <B>Parameters</B>: \

      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output.
      <I>noun&nbsp;(optional)</I>: A noun to append after the properties and potentially a/an, 
                                   if none of the defined properties are set.
      <I>delim&nbsp;(optional)</I>: Defaults to " "; if set, this is used to delimit properties.
      <strike><I>def&nbsp;(optional)</I>: Whether to describe it in a definite way
                                  or not.</strike>
      <I>which</I>: The list of properties, space-separated (e.g. "trait:color trait:material")

      <b>describe-props</b>
   <B>Syntax</B>: &lt;describe-props which="property:name other:property an:other" noun="something" delim="delimiter" cap def/&gt;
   <B>Comments</B>: 
   * Adds "a" <strike>"the"</strike> "an" to the properties appropriately.
   * "Trims" the resulting value appropriately; in which="propthatis:nil propthatis:green" the result will be "a green"
   * If noun attribute is set, it is appended to the resulting value;
      * &lt;describe-props which="propthatis:nil propthatis:nil" noun="gown"/&gt; &rarr; "a gown"
      * &lt;describe-props which="propthatis:orange propthatis:wool" noun="gown"/&gt; &rarr; "an orange wool gown"
   * If delim attribute is set, it is used to delimit the resulting value, if multiple properties are non-nil;
      * &lt;describe-props which="propthatis:orange propthatis:wool" delim=", "/&gt; &rarr; "an orange, wool"
      * &lt;describe-props which="propthatis:clean propthatis:orange propthatis:wool" delim=", "/&gt; &rarr; "a clean, orange, wool"
   * If noun and delim attributes are set, the delim value is used to separate multiple properties, but " " is always used to delimit properties from the noun;
      * &lt;describe-props which="propthatis:orange propthatis:wool" delim=", " noun="gown"/&gt; &rarr; "an orange, wool gown"
      * &lt;describe-props which="propthatis:clean propthatis:orange propthatis:wool" delim=", " noun="gown"/&gt; &rarr; "a clean, orange, wool gown"



#TagDescribe-view
### *&lt;describe-view&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Deeply describes the object.
   <B>Parameters</B>: \
      <I>view</I>: The item you want to describe.
      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output or not.
      <I>uncap&nbsp;(optional)</I>: Whether to force the resulting
                                    output to lower case.
   <B>Syntax</B>: &lt;describe-view view="$(object)" cap/&lt;
   <B>Examples</B>: \
      An example from Kalle. If you would like to describe a view of a specific detail you could do: 
       <pre>
        <describe-view view="NREF(Mortalis:hosts:k:kalle|nose)" type="look"/>
       </pre>
      Or you could use
        <pre>
        $[$the_detail = NewNRef($this, "nose");] <describe-view view="$(the_detail)" type="look"/>
        </pre> \
   <B>Comments</B>: \
   * Deeply describes 'view'. The description is similar to using the examine command. 'cap' will capitalize the output. 'cap' is optional.


#TagDisabledetail
### *&lt;disable-detail&gt;*
   <B>Category</B>: Get & Set
   <B>Description</B>: Hides a detail from all interaction
   <B>Parameters</B>: \

           <I>what</I>: The NREF you wish hidden.

   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To hide a detail, you don't need this tag any more -- use inline Merry instead.

To disable NRef $what,

  $[ $what."detail:hidden" = TRUE; ]

***EXAMPLE REQUIRED***


#TagDump
### *&lt;dump&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Dump in an easily readable format the data-structure
                       found in the 'val' parameter, whether it is an
                       object, array, or mapping.
   <B>Parameters</B>: \
      <I>val</I>: The data-structure which you want to examine.
   <B>Syntax</B>: &lt;dump val="something"/&gt;
   <B>Comments</B>: (none)


#TagEaten
### *&lt;eaten&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Describe how much of the object has been eaten,
                       assuming that this is described by how much mass the
                       object has lost since it was created.
   <B>Parameters</B>: \

      <I>cap&nbsp;(optional)</I>: Capitalize the resulting output.
      <I>what</I>: The object that you want to describe.
   <B>Syntax</B>: &lt;eaten what="$(this)" cap/&gt;
   <B>Status</B>: Current
   <B>Comments</B>: \
   * This one may become obsolete soon. We don't export the 'original mass' used for the calculation. The design is currently dubious though and should probably be replaced with a script in e.g. MGeneric sometime. -- Skotos.ParWinzell - 13 Mar 2003 <br>


#TagEnableDetail
## *&lt;enable-detail&gt;*
   <B>Category</B>: Get & Set
   <B>Description</B>: Enables a detail that was previous disabled
   <B>Parameters</B>: \

           <I>what</I>: The NREF you wish hidden.

   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To enable a hidden detail, you don't need this tag any more -- use inline Merry instead.

To disable NRef $what,

  $[ $what."detail:hidden" = FALSE; ]

***EXAMPLE REQUIRED***



#TagFalse
### *&lt;false&gt;*
   <B>Category</B>: Flow control
   <B>Description</B>: To be used inside an &lt;if&gt; SAM tag.  The contents of this
                       tag are inserted into the output if the if-condition
                       in combination with any and-conditions or
                       or-conditions evaluates to false.
   <B>Parameters</B>: \
      <i>none</i>
   <B>Syntax</B>:      <code>&lt;false&gt; false output text &lt;/false&gt;</code>
   <B>Comments</B>:    See Also [[SamSystem#Comparison_Shortcuts][Comparison Shortcuts]]


#TagFor
### *&lt;for&gt;*
   <B>Category</B>: Flow control
   <B>Description</B>: Evaluate the contents of the tag, while assigning
                       the variable as indicated in the 'var' parameter
                       with a new value from the 'val' parameter, while
                       also setting the 'iteration' variable to whichever
                       iteration it is (starting at 1).
   <B>Parameters</B>: \
      <I>val</I>: The values you want to assign to 'var'.
      <I>var</I>: The name of the variable that you want to contain the
                  different values from 'val'.
   <B>Syntax</b>:      <code>&lt;for var="name" val="arr"&gt; stuff to do &lt;/for&gt;</code>
   <B>Questions</B>: Is 'iteration' a parameter that can be set, for instance iteration=5 would start the iteration at 5?
   <B>Comments</B>:   (none)



#TagGetdesc
### *&lt;get-desc&gt;*
   <B>Category</B>: Set & query
   <B>Description</B>: Get the description of a certain type from an object
                       or its detail.
   <B>Parameters</B>: \

      <I>detail&nbsp;(optional)</I>: The detail for which you want to get
                                     the description.  Only used if the
                                     'obj' parameter isn't an NRef.
      <I>obj</I>: The object or NRef from which to get the description.
      <I>type</I>: The type of description that you want to get.
   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To get a description, you don't need this tag any more -- use inline Merry instead.

To fetch description type $type from NRef $what,

   $[ Get($what, "detail:descriptions:" + $type) ]


#TagIf
### *&lt;if&gt;*
   <B>Category</B>: Flow control
   <B>Description</B>: Depending on the value of the val parameter, the
                       &lt;true&gt;...&lt;/true&gt; or the
                       &lt;false&gt;...&lt;/false&gt; branch is inserted
                       into the output.  Possible direct subtags are
                       &lt;true&gt;, &lt;false&gt;, &lt;and&gt;, and
                       &lt;or&gt;.
   <B>Parameters</B>: \
      <I>val</I>: The if-condition.
   <B>Syntax</b>:      <code>&lt;if val="condition"&gt; some true false and or tags &lt;/for&gt;</code>
   <B>Comments</B>: (none)


#TagIndex
### *&lt;index&gt;*
   <B>Category</B>: Flow control
   <B>Description</B>: ?
This indexes an array, and is obsoleted by $[ arr[ix] ]
-- Main.ParWinzell - 18 March 2003


#TagInsert
### *&lt;insert&gt;*

<b>insert</b>
   <B>Category</B>: Text Formatting
   <B>Description</B>: Inserts a SAM file.
   <B>Syntax</B>: &lt;insert page="sam file"/&gt;


#TagMapset
### *&lt;mapset&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Assign a value in a mapping at the given index.  The
                       mapping needs to already have been initialized.
   <B>Parameters</B>: \

      <I>index</I>: The index value.
      <I>map</I>: The name of the mapping variable.
      <I>to</I>: The value to be associated with the index.
   <B>Syntax</B>: &lt;mapset map="mapping" index="string" to="value"/&gt;


#TagObjective
### *&lt;objective&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Get the objective pronoun for the given item(s),
                       which can be 'him', 'her', 'it' or 'them'.
   <B>Parameters</B>: \

      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output or not.
      <I>what</I>: The item(s) for which you want to get an objective
                   pronoun.

   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To get the objective pronoun of object $ob, you don't need this tag any more, or even need Merry, just use the SAM property reference to the base:objective property with <code>$(ob.base:objective)</code>.
</pre>

For example, in <code>Examples:complete:sam:sam-toy|default</code>:

<pre>
   Look: [*
      React-post:squeeze-dob: [
        After you squeeze $(this.base:objective), you get the odd feeling that it doesn't like being squeezed tightly.
   *]

   > squeeze toy
   You squeeze a toy.
   After you squeeze it, you get the odd feeling that it doesn't like being squeezed tightly.
</pre>

If you need a objective capitalized, you can put it in a capitalize tag, i.e. <code>&lt;capitalize what="$(this.base:objective)/&gt;</code>.


#TagObsprep
### *&lt;obsprep&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Generates the appropriate preposition
                       'is' or 'are' depending on what 'what'
                       refers to.
   <B>Parameters</B>: \
      <I>what</I>: The object(s) you are referring to.
   <B>Syntax</b>: &lt;obsprep what="objects" cap/&gt;


#TagOneof
### *&lt;oneof&gt;*
   <B>Category</B>: Flow control
   <B>Description</B>: This tag has the effect of taking the sub-tags,
                       picking one randomly and inserting its contents
                       after evaluating it, while ignoring comment-tags in
                       the random selection.
   <B>Syntax</B>: \
   * Long: &lt;oneof&lt; &lt;z&gt; stuff1 &lt;/z&gt; &lt;z&gt; stuff2 &lt;/z&gt; &lt;z&gt; ...stuffN &lt;/z&gt; &lt;/oneof&lt;
   * Shortcut: { stuff 1 | stuff 2 | stuff 3 }

usage: Chooses one element randomly.

   <B>Examples</B>: \

In the old days you would do OneOf's as tagged XML, i.e. in this example, randomly 'feline' or 'catlike' will be output:

<pre>
   <oneof>
      <z>
         feline
      </z>
      <z>
         catlike
      </z>
   </oneof>
</pre>

However, this became cumbersome, so you may now use a SAM shortcut for it. The much simpler to write <code>{feline|catlike}</code> is now exactly equivalent to the above example.

   <B>Status</B>: CURRENT, SHORCUT AVAILABLE
   <B>Comments</B>:

One ofs are a powerful technique that allow you to create variable descriptions. You can tell the server to use one of several different words and phrases in a specific place in the text of a description of an object. This is most commonly used in the four main descriptions: brief, glance, look, or examine. However, it can also be used in other places that you output descriptions to the users--such as within the SAM functions that we'll describe later.

To use a one of, separate the list of possibilities by pipe "|" symbols, and put them all inside of curley-cue brackets "{}". Here's an example from Castle Marrach. This is a third-person die message for a mug of beer:

<pre>
   An empty beer {mug|vessel} {disappears|evaporates|dissolves|dissipates} into
   {a soft mist|a mist|a misty vapor|mist}.
</pre>

One ofs can also be embedded in one another:

<pre>
   An empty beer {mug|vessel} {disappears|evaporates|dissolves|dissipates} into
   {a soft {mist|cloud|vapor}|a mist|a misty vapor|mist}.
</pre>

A more intricate one of could change around the order of the sentence to really make different versions look different:

</pre>
   {An empty beer {mug|vessel} {disappears|evaporates|dissolves|dissipates}
   into {a soft {mist|cloud|vapor}|a mist|a misty vapor|mist}.|
   A {soft {mist|cloud|vapor}|mist|misty vapor} engulfs the beer
   {mug|vessel} which disappears!|
   {Mists|Vapors} rise about the beer mug and when they
   {disappear|evaporate|dissolve} the mug is gone.}
</pre>

Note that this has been spaced out to increase readability. As with HTML, the amount of white space you use does not matter--though the developer interface will often gobble up your white space after you've saved your object.

One ofs are particularly useful:
   * If you want to include a variety of description into a short amount of space.
   * If you are writing a message or description that players will see frequently.
   * If you would like a particular bit of information to only appear part of the time.

-- Skotos.ShannonAppel - 26 Oct 2000 <br>

<h3>Christopher Allen's Notes on OneOfs</h3>

The OneOf capability is probably the simplest of the various interactive text capabilities that we call Active Markup. Yet, in this simplicity surprisingly elegant prose can be created.

The best way to start is to take an existing description:

"You are in a large tent. There is a red glow coming from a pot in the center of the tent. The air smells of smoke.  There is a flap leading out."

I start by looking at the adjectives, adverbs, and other qualifiers, and try to give look at the object from a slighly different perspective. I looked up the words up in a thesaurus (thesaurus.com is wonderful) and in dictionaries. Are there any other words that are similar that maybe have better connotations?

For instance, this tent is large. What does that mean? Is it relevant to everyone? I decided to use the synonym oversize was a better connotation. However, I felt that once you were inside, you might be used to it and not think it overly large all the time. Thus...

"You are inside {a large|an oversize|a} tent."

You continue this process for each of the major qualifiers:

"You are {in|inside} {a large|an oversize|a} tent. There is a {faint|slight|dim|} {red|} glow coming from a pot in the {center|middle} {of the tent.|.} {The {tent|air} {smells of smoke.|is slightly hazy with smoke} |A {faint|slight} haze of smoke fills the
{air.|tent.} |} There is { {a tent|a} flap leading out. | {a single|an} exit leading out - a tent flap.}"

You will find that the first time you do this that it took you some time. However, the more practice you have, you'll find that writing the more common ones like {in|inside} are so easy that you'll just start writing new descriptions from scratch using them.

The next decision is if you want to hide some of the information. Normally a 'look' description is defined as what you can see in a fairly brief amount of time (a second or two) without deep examination. An 'examine' has more detail, and a 'search' description even yet more detail. However, sometimes something falls between these that you want some percentage of people to see. In this case, just use empty OneOfs like:

{||||. You notice some scratches on the wall}.

In this case, 1 in 5 times the object is viewed, the extra information is revealed.

The last decision is if you want to do nested OneOfs. They are much more work, so I only do these on objects or places that I think players are going to be spending a lot of time in, and each time they should see something different. This is particularly useful with major NPCs, as it can show subtle things different that would not be evident from a single examination. For example:

"You {see|notice|observe} {that {he|Twilight} is|} a {feline|catlike|} {being|creature} {with|covered from head to {toe|foot} with} grey fur {. |. He has {deep grey eyes. |grey eyes {and|with} a long grey mane {covering |enveloping } his head, running down his shoulders and along his back {and down to {the base of ||} his tail||}. } |, a long grey mane {covering |enveloping} his head, running down his shoulders and along his back {and down to {the base of ||} his tail ||}, {and|with} deep grey eyes. }"

Or:

"You {see|notice|observe} {that {he|Twilight} has a|a} {long|} tail covered in grey fur {.|.|that {twitches occasionally|twitches occasionally} at the {tip|end}.| {that trails down to|whose tip wraps around} his ankles.|which follows {behind|} him as {he|Twilight} moves.}"

Also a note to folks that wonder how OneOf's fit into XML -- they are actually not valid XML, however, since they are so common they are converted to XML internally. The actual format they are converted to internally is:

<pre>
   <oneof>
    <z>
     feline
    </z>
    <z>
     catlike
    </z>
   </oneof>
</pre>

-- Skotos.ChristopherAllen - 26 Oct 2000 <br>

> Hmm, in your old docs, you say about the <oneof/> tag: "This tag has the
> effect of taking the sub-tags, picking one randomly and inserting its
> contents after evaluating it, while ignoring comment-tags in the random
> selection." What do you mean by "ignoring comment tags" -- yet you don't say
> in the docs that comment is an paramenter. Do you mean you can do:
>
>     <oneof comment="My comment">
>     <z>
>      feline
>     </z>
>     <z>
>      catlike
>     </z>
>    </oneof>

I'm not sure I wrote that documentation. I seem to recall Nino making a
pass over all the SAM tags, writing up brief documentation. There was a
time when we had an explicit comment tag, like this:

   <oneof>
     <comment>This is the first possibility</comment>
     <z>feline</z>
     <comment>This is the second</comment>
     <z>catlike</z>
   </oneof>

The oneof tag explicitly wipes out any embedded 'comment' tags when
assembling the list of choices for the randomization.


> Also, does this stuff automatically get converted to the {feline|catlike} form
> if I use it? If I use <if> will it convert to the appropriate {? form?

Depending on what you mean by 'this stuff', yes or no. If you put in a
well-formed oneof in the long form -- as above -- then yes, it will be
presented in the {feline|catlike} form:

   > +tool sam parse <oneof><z>foo</z><z>bar</z></oneof>

   Original input:
           <oneof><z>foo</z><z>bar</z></oneof>

   Parsed format:
           X[S] {foo|bar}

If you put in a badly formed 'oneof', e.g. with other tags than 'z'
inside it, the behaviour is unspecified.. there are some sanity checks
but you might get an error. The same holds for 'if'. As long as you do
not make mistakes with the long form, it'll be appropriately collapsed
to the short form.

-- Skotos.ParWinzell - 13 Mar 2003 <br>


#TagOr
### *&lt;or&gt;*
   <B>Category</B>: Flow control
   <B>Description</B>: Used as sub-tag for the &lt;if&gt; tag, to be able
                       to build more complex conditions.
   <B>Parameters</B>: \

      <I>val</I>: The or-condition.
Sometimes you'll want to create more complex If statements. You might want to output text if one of two things is true. For example, you might create a sign written in the magical language, and allow people to read it if they are magicians or if they know the magical language. Alternatively, you might want to output only if two or more things are all true.

<pre>
   <if val=blah>
      <or val=blah>
         <or val=blah>
            <true>
               foo and bar
            </true>
         </or>
      </or>
   </if>

</pre>
usage: Outputs the information within the nested &lt;true&gt; if either the &lt;if&gt; or any of the nested &lt;or&gt;s is true. Ouputs the information within the nested &lt;false&gt; if neither the &lt;if&gt; nor any of the nested &lt;or&gt;s is true.


#TagP
### *&lt;p&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Nothing special, just insert two newlines to
                       separate paragraphs from each other.
   <B>Parameters</B>:\
      None
      

#TagPossessive
### *&lt;possessive&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Get the possessive pronoun for the given item(s),
                       which can be 'his', 'her', 'its', or 'their'.
   <B>Parameters</B>: \

      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output or not.
      <I>what</I>: The item(s) for which want to get the possessive
                   pronoun.

   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To get the possessive pronoun of object $ob, you don't need this tag any more, or even need Merry, just use the SAM property reference to the base:possessive property with <code>$(ob.base:possessive)</code>.
</pre>

For example, in <code>Examples:complete:sam:sam-toy|lapel-flower</code>:

<pre>
   Look: [*
     A small embroidered flower is on the lapel of $(this.base:possessive) suit.
   *]

   > look at toy's flower
   A small embroidered flower is on the lapel of its suit.
</pre>

If you need a possessive capitalized, you can put it in a capitalize tag, i.e. <code>&lt;capitalize what="$(this.base:possessive)/&gt;</code>.


#TagPre
### *&lt;pre&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Displays text without any formatting.
   <B>Syntax</B>: &lt;pre&gt; pre-formatted text &lt;/pre&gt;


#TagPronoun
### *&lt;pronoun&gt;*
   <B>Category</B>: Generic
   <B>Description</B>: Get the pronoun for the given item(s), which can be
                       'he', 'she', 'it' or 'they'.
   <B>Parameters</B>: \

      <I>cap&nbsp;(optional)</I>: Whether to capitalize the resulting
                                  output or not.
      <I>what</I>: The item(s) for which you want to get a pronoun.
   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To get the pronoun of object $ob, you don't need this tag any more, or even need Merry, just use the SAM property reference to the base:possessive property with <code>$(ob.base:pronoun)</code>.
</pre>

For example, in <code>Examples:complete:sam:sam-toy|default</code>:

<pre>
   Examine: [*
     A cute little toy, shaped like a hobbit. $(this.base:pronoun) is wearing a
     tuxedo with a embroidered flower on its lapel. On the toy's back is a ring
     with a string on it.
   *]

   > examine toy
   You begin to examine a toy.
   A cute little toy, shaped like a hobbit. it is wearing a tuxedo with a
   embroidered flower on its lapel. On the toy's back is a ring with a string on
   it.
   >
</pre>

If you need a pronoun capitalized, you can put it in a capitalize tag, i.e. <code>&lt;capitalize what="$(this.base:possessive)/&gt;</code>.


#TagRename-Body
### *&lt;rename-body&gt;*
This simply renames $body to be called $new. It's actually the only way
for Theatres to do this now: This Tag should be deprecated and replaced
with a Merry call, but right now it is useful.
-- Main.ParWinzell - 18 Mar 2003


#TagRedirect
### *&lt;redirect&gt;*
Relevant only for HTTP connections, i.e. webpage SAM, this sends back a
HTTP redirect. It's THE way to end an <ACTION> segment inside e.g. a
<ZFORM>... otherwise, the user hits 'commit' and the browser never does
anything. At the end of a commit, you need to redirect the browser to
something, even if it's just back to the same page.
-- Main.ParWinzell - 18 Mar 2003


#TagRem-adj
### *&lt;rem-adj&gt;*
   <B>Category</B>: Set & query
   <B>Description</B>: Remove an adjective from an object detail.  If the
                       'obj' parameter is an object, by default the primary
                       detail will be used, unless the 'detail' parameter
                       is used as well.
   <B>Parameters</B>: \

      <I>adjective</I>: The adjective to remove.
      <I>detail&nbsp;(optional)</I>: The specific detail from which to
                                     remove the adjective.  Only used if
                                     the 'obj' parameter isn't an NRef.
      <I>obj</I>: The object or NRef from which to remove the adjective.
   <B>Example</B>: \
<pre>
    <rem-adj adjective="dove" obj="$(this)"/>
</pre>
   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To remove an adjective to an object or detail, use the following inline Merry instead of the obsolete remadj tag:

To add an adjective $adj to NRef $what,

  $[ Set($what."detail:adjectives:" + $adj, FALSE); ]

To add an adjective $adj to detail $det on object $ob,

  $[ Set($ob, "details:" + $det + ":adjectives:" + $adj, FALSE); ]

***EXAMPLES REQUIRED***



#TagRem-name
### *&lt;rem-name&gt;*
   <B>Category</B>: Set & query
   <B>Description</B>: Remove a name from an object detail.  If the 'obj'
                       parameter is an object, by default the primary
                       detail will be used, unless the 'detail' parameter
                       is used as well.
   <B>Parameters</B>: \

      <I>detail&nbsp;(optional)</I>: The specific detail from which to
                                     remove the name.  Only used if the
                                     'obj' parameter isn't an NRef.
      <I>name</I>: The name remove.
      <I>obj</I>: The object or NRef from which to remove the name.
   <B>Example</B>: \
<pre>
    <rem-name name="dove" obj="$(this)"/>
</pre>
   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To delete a name from detail, use the following inline Merry instead of the obsolete remname name tag:

To add a name $sname to NRef $what,

  $[ Set($what, "detail:snames:" + $sname, FALSE); ]

To add a name $sname to detail $det on object $ob,

  $[ Set($ob, "details:" + $det + ":snames:" + $sname, FALSE); ]

***EXAMPLES REQUIRED***


#TagSbr
### *&lt;sbr&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Convenience, inserts &lt;BR&gt; when used in a
                       webpage, or a newline when used elsewhere.


#TagSetdesc
### *&lt;set-desc&gt;*
   <B>Category</B>: Set & query
   <B>Description</B>: Set the description of a certain type for an object
                       or its detail.
   <B>Parameters</B>: \

      <I>desc</I>: The (new) description.
      <I>detail&nbsp;(optional)</I>: The detail for which you want to set
                                     the description.  Only used if the
                                     'obj' parameter isn't an NRef.
      <I>obj</I>: The object or NRef in which to set the description.
      <I>type</I>: The type of description that you want to set.
   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: To get set a property in an object, you don't need this tag any more: use inline Merry instead.

To set description type $type on NRef $what to $desc,

<pre>
$[ Set($what, "detail:descriptions:" + $type, $desc); ]
</pre>

***EXAMPLES REQUIRED***


#TagSetproperty
### *&lt;set-property&gt;*
   <B>Category</B>: Set & query
   <B>Description</B>: Set the property to a (new) value.
   <B>Parameters</B>: \

      <I>prop</I>: The name of the property that needs to be set.
      <I>val</I>: The value for the property.
      <I>what</I>: The object in which to set the property.
   <B>Syntax</B>: &lt;set-property what="$(object)" prop="property:name" val="value"/&gt;
   <B>Examples</B>: \
      This is the classic SAM tag that was used in Marrach for one-time tips, for example when you entered into the Tailor's room for the first time:
<pre>
   Glance: [*
      The tailors' storage room, a long, narrow space for storing and dispensing
      clothing. {? | $(actor.marrach:tailortip) ||<br/><br/>[TIP: The tailor
      makes clothing. Type "ask tailor" to get a list of clothing. Type "ask
      tailor for tunic" to get that specific piece of clothing. Type "help
      tailor" for more information.]<set-property what="$(looker)"
      prop="marrach:tailortip" val="true"/>}
   *]
</pre>

In this example, the property tailortip is tested, and if it is false, a tip is given and the tailortip property is set so that the player will never see this tip again.

   <B>Status</B>: OBSOLETE -- not to be used in any new objects
   <B>Comments</B>: \
To get set a property in an object, you don't need this tag any more: use inline Merry instead.

For example, in <code>Examples:complete:sam:sam-toy|default</code>:

<pre>
   React-post:hug-dob: [*
     After you hug the toy, you get the odd feeling that you are loved back in return. $[Set($actor, "examples:sam-hug", 1);]
   *]

   > +stat me "property:examples*
   -- Properties (examples*)--
   > hug sam
   You hug a toy.
   After you hug the toy, you get the odd feeling that you are loved back in
   return.
   > +stat me "property:example*
   -- Properties (example*)--
   Property: examples:sam-hug = 1
   >
</pre>



#TagSocial
### *&lt;social&gt;*
   <B>Category</B>: Set & Query
   <B>Description</B>: Generate the requested form of a given verb.
   <B>Parameters</B>: \

      <I>form</I>: Which form you want (first, second, third)
      <I>verb</I>: The verb for which you want to get the relevant form.
   <B>Examples</B>: \
      There are times when you are responding to a verb action but don't know what verb was used by the player. This often happens when you want to have a reaction to a sense signal that everyone can see, such as <code>sense/smell</code>.

For example, in <code>Examples:complete:sam:sam-toy|lapel-flower</code>:

<pre>
   React-desc:sense/smell-dob: [*
     You $(verb) <describe what="$(target)"/> and sneeze.
   *]
   React3-desc:sense/smell-dob: [*
     <describe what="$(actor)" cap="1"/> <social verb="$(verb)" form="third"/> <describe what="$(target)"/> and sneezes.
   *]

   > sniff sam's lapel
   You sniff the a lapel flower and sneeze.
   > smell sam's lapel
   You smell the a lapel flower and sneeze.
   > +force cat "sniff sam's lapel
   Forcing a cat to: sniff sam's lapel
   A cat sniffs the a lapel flower and sneezes.
   > +force cat "smell sam's lapel
   Forcing a cat to: sniff sam's lapel
   A cat sniffs the a lapel flower and sneezes.
</pre>

   <B>Status</B>: OBSOLETE (?)
   <B>Comments</B>: Zell recommends that this tag become obsolete and to use inline-Merry instead, i.e. to fetch e.g. the second person singular form of the verb $verb,
<pre>
   $[
      object *obs;

      /* find out which verb objects match $verb */
      obs = Get(${SkotOS:Socials:Socials}, "verbs:" + $verb);

      if (!obs || !sizeof(obs)) {
         error("no verbs found for: " + $verb);
      }
      return obs[0]."verb:second";
   ]
</pre>

I finds this tag useful as is, especially as we start writing more sense/* descriptions. Maybe make a $(verb2) and $(verb3) be available instead?

-- Main.ChristopherAllen - 13 March 2003

What about $vob.verb:second

-- Main.ParWinzell - 13 March 2003

#TagSpc2
### *&lt;spc2&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Generate exactly two spaces in the output.

#TagSpc3
### *&lt;spc3&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Generate exactly three spaces in the output.

#TagSpc4
### *&lt;spc4&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Generate exactly four spaces in the output.

#TagSpc5
### *&lt;spc5&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Generate exactly 5 spaces in the output.

#TagSpc6
### *&lt;spc6&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Generate exactly 6 spaces in the output.

#TagSpc7
### *&lt;spc7&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Generate exactly seven spaces in the output.

#TagSpc8
### *&lt;spc8&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Generate exactly eight spaces in the output.

#TagTab
### *&lt;tab&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Generate exactly eight spaces in the output.
   
#TagHelplink
### *&lt;helplink&gt;*
   <B>Category</B>: Text formatting
   <B>Description</B>: Shortcut to refer to help topics.
   <B>Syntax</B>: &lt;helplink to="[topic]"/&gt;
   Optionally: &lt;helplink to="[topic]"&gt;[link text]&lt;helplink&gt;

note: If the [link text] is excluded, [topic] will be used.

#TagTrue
### *&lt;true&gt;*
   <B>Category</B>: Flow control
   <B>Description</B>: To be used inside an &lt;if&gt; SAM tag.  The
                     contents of this tag are inserted into the output if the 
                     if-condition in combination with any and-conditions or 
                     or-conditions evaluates to false.
   <B>Syntax</B>: &lt;true&gt; text output when true &lt;/true&gt;

usage: Used with <if> SAM tag, the enclosed code will be executed if the
       <if> SAM tag returns true.

#TagUnregister-body
### *&lt;Unregister-body&gt;*
This is essentially the 'remove body from roster' functionality of Marrach.
-- Main.ParWinzell - 18 Mar 2003


#TagDebug
### *&lt;debug&gt;*

OBSOLETE: not to be used in any new objects

I don't think was ever made public, but if it was: to output a debug
string describing the contents of $val. Use this inline Merry instead:

<pre>
   $[ dump_value($val) ]
</pre>

#TagZ
### *&lt;Z&gt;*
   <B>Category</B>: General
   <B>Description</B>: this tag does basically nothing, it is just there to group text for other tags.
   <B>Syntax</B>: &lt;z&gt; stuff &lt;/z&gt;

#TagZbitmap
### *&lt;Zbitmap&gt;*
This tag is used experimentally for displaying the results of the
cellular automata stuff. If we ever look at that seriously again we
should probably redo it as Merry calls somehow... I advise removing this
from the document, or labelling it 'internal prototype' or something.
-- Main.ParWinzell - 18 Mar 2003

#TagZact
### *&lt;Zact&gt;*

These are three of the most important SAM tags for popup and they
deserve an entire document to themselves. Please remind me to write such
a document soon. Briefly:

ZLINK: This is just a simple way to create a link to another page that
automatically collapses variables to be transported across. Example:

   <ZLINK base="/MyGame/ViewCharacter.sam" char=$(char)>Go!</ZLINK>

will generate a link so that $char is set to the right thing when
ViewCharacter.sam is examined. This tag also uses the server's internal
approach to transporting arguments: instead of generating a URL like:

   /MyGame/ViewCharacter.sam?char=Zell

it generates something like

   /Request?__id=10349234

and associates 'char' with "Zell" in the storage allocated under the ID
of 10349234. This is a way for SAM pages to communicate with each other
without generating URL's that give out sensitive information.
-- Main.ParWinzell - 18 Mar 2003


#TagZform
### *&lt;Zform&gt;*
ZFORM: Should be used in place of a FORM element. Everything that is
usually found inside a HTML FORM element goes inside a ZFORM element --
TEXTAREA, INPUT, BUTTON, ... the difference is that inside of the usual
attributes to FORM which govern what happens when the form is submitted,
there is a bunch of SAM inside an ACTION tag. This SAM is executed on
the server when the user commits the form. EXAMPLE:

<pre>
   <ZFORM>
    <INPUT type="text" name="nickname"/>
    <INPUT type="submit" value="SUBMIT NEW NICKNAME"/>
    <ACTION>
      $[ $actor."trait:nickname" = $nickname; ]
      <REDIRECT base="http://www.skotos.net/"/>
    </ACTION>
   </ZFORM>
</pre>
-- Main.ParWinzell - 18 Mar 2003

#TagZlink
### *&lt;Zform&gt;*

ZACT: Same as ZFORM, except it creates a link instead of a form.
-- Main.ParWinzell - 18 Mar 2003


----
----

### List of SAM Tags

(as of 11 Mar 2003)

<pre>
./usr/DevSys/samtags:
escape-attribute.c
escape-html.c

./usr/HTTP/samtags:
redirect.c

./usr/SAM/samtags:
and.c
br.c
capitalize.c
case.c
comment.c
dump.c
false.c
for.c
if.c
index.c
insert.c
mapset.c
oneof.c
or.c
p.c
quote.c
sbr.c
signal.c
spc2.c
spc3.c
spc4.c
spc5.c
spc6.c
spc7.c
spc8.c
tab.c
to.c
true.c
z.c
zact.c
zbitmap.c
zform.c
zlink.c

./usr/SkotOS/samtags:
acmd.c

atag.c
describe-holder.c
describe-poss.c
describe-prop.c
describe-view.c
describe.c
describemany.c
describeprep.c
eaten.c
obsprep.c
rename-body.c
unregister-body.c

add-adj.c               OBSOLETE: not to be used in any new objects
add-name.c              OBSOLETE: not to be used in any new objects
adjust-property.c       OBSOLETE: not to be used in any new objects
disable-detail.c        OBSOLETE: not to be used in any new objects
enable-detail.c         OBSOLETE: not to be used in any new objects
get-desc.c              OBSOLETE: not to be used in any new objects
objective.c             OBSOLETE: not to be used in any new objects
possessive.c            OBSOLETE: not to be used in any new objects
pronoun.c               OBSOLETE: not to be used in any new objects
rem-adj.c               OBSOLETE: not to be used in any new objects
rem-name.c              OBSOLETE: not to be used in any new objects
set-desc.c              OBSOLETE: not to be used in any new objects
set-property.c          OBSOLETE: not to be used in any new objects
social.c                OBSOLETE: not to be used in any new objects
xdebug.c                OBSOLETE: not to be used in any new objects

./usr/Theatre/samtags:
configure-chatter.c     Will soon be replaced by inline Merry.
create-chatter.c        Used to create a new body & link it to user
</pre>

---

## Random Text Snippets to be Integrated or Discarded

In the text output, it can be useful to use some of these SAM tags so that the
output can be different depending on who performed the action and where the
action is being targeted to:

<pre>
    <describe what="$(this)"/>              the brief of $(this)
    <describe what="$(this)" cap="1"/>      Capitalized version of the brief

    <pronoun what="$(this)"/>               he/she/it
    <pronoun what="$(this)" cap="1"/>       He/She/It

    <objective what="$(this)"/>             him/her/it
    <objective what="$(this)" cap="1"/>     Him/Her/It

    <possessive what="$(this)"/>            his/her/its
    <possessive what="$(this)" cap="1"/>    His/Her/Its
</pre>

### Quick Note: To get similar in Merry for an emit:

<pre>
    Describe($actor) = the brief of $actor; ex: a horse
    capitalize(Describe($actor)) = Capitalized version of the brief, ex: A horse
    $actor."base:nominative" = he/she/it
    capitalize($actor."base:nominative") = He/She/It
    $actor:"base:objective" = him/her/it
    capitalize($actor."base:nominative") = Him/Her/It
    $actor:"base:possessive" = his/her/its
    capitalize($actor:"base:possessive") = His/Her/Its
</pre>
