Any physical object can and usually does have
properties, which are general purpose storage containers for values.
Common ways to set properties include the +setprop command, Merry\'s Set() function, and the \<set-property\> SAM tag.
Properties are also copied into a newly spawned object from its
ur-parent\'s InitialProperties.

The system supplies a set of properties that are always present without
being explicitly set. These are called *derived* properties because
their value tends to be computed rather than just fetched from storage.
For example, we might export a property \"skill:average\" which, when
read, computes the average of all the player\'s skills, and returns that
for the value.

When *writing* to a derived property, similarly we do not just copy the
raw data into a table somewhere, but rather execute some sequence of
instructions associated with that property. For example, we might have a
property base:environment which indicates the current environment of the
object: setting this property to another value effectively becomes an
order for the object to *move* into the given environment.

Thus the generalized notion of properties, both derived and otherwise,
becomes a very powerful one, capable of exporting most of the
functionality a developer needs to make their objects interact in
complex ways.

What follows is a table of existing derived properties for physical
objects. All these properties can also be fetched with \":local\"
appended at the end. This suffix tells the system to ignore the
ur-parent chain and fetch the object\'s local value. For example,
Zell\'s \"base:strength\" is 10.0, but \"base:strength:local\" is 1.0.

A recent addition are *methods* which are low-level function calls
exported to the scripting environment. These are used when more
parameters need to be part of a set/query operation than derived
properties can properly encapsulate, or when the parameters are binary
(e.g. object pointers). A table of existing methods follows the tables
of derived properties.


**base properties**

| Local | Property name                | Access | Type      | Description |
|-------|------------------------------|--------|-----------|-------------|
|       | base:gender                  | RW     | int       | object\'s gender |
|       | base:possessive              | RO     | string    | possessive pronoun e.g. \'his\' | 
|       | base:objective               | RO     | string    | objective pronoun e.g. \'him\' | 
|       | base:pronoun                 | RO     | string    | basic pronoun e.g. \'he\' | 
|       | base:genderstring            | RO     | string    | gender string e.g. \'male\' | 
| X     | base:maxfatigue              | RW     | float     | object\'s max fatigue | 
| X     | base:strength                | RW     | float     | object\'s strength | 
|       | base:possessor               | RW     | object    | object possessing us | 
|       | base:possessee               | RW     | object    | object possessed by us | 
|       | base:actualmass              | RO     | float     | object\'s perceived mass | 
|       | base:actualdensity           | RO     | float     | object\'s perceived density | 
|       | base:actualcapacity          | RO     | float     | object\'s perceived capacity | 
|       | base:actualvolume            | RO     | float     | object\'s perceived volume | 
|       | base:minimumvolume           | RW     | float     | object\'s minimum volume | 
|       | base:urparent                | RW     | object    | object\'s ur parent | 
|       | base:firsturchild            | RO     | object    | first object in ur-child linked list | 
|       | base:nextursibling           | RO     | object    | next object in ur-sibling linked list | 
|       | base:previousursibling       | RO     | object    | previous object in ur-sibling linked list | 
|       | base:objectname              | RW     | string    | object\'s name woe or (fallback) base name | 
|       | base:scriptrunner            | RW     | boolean   | does this object receieve witness script events? | 
|       | base:environment             | RW     | object    | object\'s environment | 
|       | base:inventory               | RO     | object \* | object\'s inventory | 
|       | base:proximity               | RW     | NRef      | object\'s proximity | 
|       | base:holder                  | RO     | object    | object\'s volitional super-environment | 
|       | base:deep-inventory          | RO     | object \* | object\'s recursive inventory | 
|       | base:proximates              | RW     | object \* | objects proximate to object | 
|       | base:offered-to              | RO     | object    | object we\'re being offered to, if any | 
|       | base:offered-by              | RO     | object    | object we\'re being offered by, if any | 
|       | base:incoming-offers         | RO     | mapping   | complex: offerer -\> objects offered us | 
|       | base:outgoing-offers         | RO     | mapping   | complex: offeee -\> objects offered them | 
|       | base:worn-by                 | RW     | object    | object\'s wearer (wielded-by alias) | 
|       | base:wielded-by              | RW     | object    | object\'s wielder (worn-by alias) | 
| X     | base:parts-covered           | RO     | string \* | bodyparts covered by object when worn | 
| X     | base:parts-covered:foo       | RW     | boolean   | true if \'foo\' is in parts-covered | 
|       | base:clothes-worn            | RO     | object \* | object\'s currently worn clothing | 
|       | base:weapons                 | RO     | object ** | object\'s currently wielded weapons | 
|       | base:light                   | RO     | float     | object\'s perceived light level | 
|       | base:light-category          | RO     | string    | \"dark\", \"dim\", or \"bright\" | 
|       | base:dark                    | RO     | boolean   | true if the light level is \"dark\" | 
|       | base:dim                     | RO     | boolean   | true if the light level is \"dim\" | 
|       | base:bright                  | RO     | boolean   | true if the light level is \"bright\" | 
|       | base:stance                  | RW     | int       | object\'s current stance | 
|       | base:stancestring(\*)        | RW     | string    | as above, but english-language string |
|       | base:preposition             | RW     | int       | object\'s current preposition |
|       | base:prepositionstring(\*\*) | RW     | string    | as above, but english-language string |
| X     | base:gait                    | RW     | string    | object\'s gait |
| X     | base:weapon                  | RW     | boolean   | object\'s a weapon |
| X     | base:combinable              | RW     | boolean   | object\'s combinable |
| X     | base:unsafe                  | RW     | boolean   | object\'s unsafe to quit in |
| X     | base:safe                    | RW     | boolean   | object\'s safe to quit in |
| X     | base:clothesexpected         | RW     | boolean   | object\'s expected to be dressed |
| X     | base:maxweight               | RW     | float     | how much mass can the object hold? |
| X     | base:edible                  | RW     | boolean   | object\'s edible |
| X     | base:potable                 | RW     | boolean   | object\'s potable |
| X     | base:intrinsicmass           | RW     | float     | object\'s intrinsic mass |
| X     | base:intrinsicdensity        | RW     | float     | object\'s intrinsic density |
| X     | base:intrinsiccapacity       | RW     | float     | object\'s intrinsic capacity |
| X     | base:public-container        | RW     | int       | skip the holder check when displaying guts? |
| X     | base:transparent-container   | RW     | int       | skip the open/close check when displaying guts? |
| X     | base:immobile                | RW     | int       | should all movement be forbidden? |
| X     | base:transparency            | RW     | boolean   | object\'s transparent |
| X     | base:details                 | RO     | string \* | names of object\'s details |
| X     | base:dirs                    | RO     | string \* | exit directions given in object\'s details |
| X     | base:doors                   | RO     | string \* | details in the object that are doors |
| X     | base:opendoors               | RO     | string \* | details in the object that are open doors 
| X     | base:closeddoors             | RO     | string \* | details in the object that are closed doors |
|-------|------------------------------|--------|-----------|-------------|

**detail properties**                   

| Local | Property name                  | Access | Type           | Description |
|-------|--------------------------------|--------|----------------|-------------|
| X     | details:foo:prime              | RW     | boolean        | detail \'foo\' is prime |
| X     | details:foo:face               | RW     | string         | detail \'foo\' has the given face |
| X     | details:foo:abstract           | RW     | boolean        | detail \'foo\' is abstract |
| X     | details:foo:definite           | RW     | boolean        | detail \'foo\' is definite |
| X     | details:foo:plural             | RW     | boolean        | detail \'foo\' is plural |
|       | details:foo:prepositions       | RO     | string \*      | prepositions associated with detail \'foo\' \-- currently broken |
| X     | details:foo:description:brief  | RW     | SAM            | description type \'brief\' in detail \'foo\' |
|       | details:foo:prepositions       | RO     | string \*      | prepositions associated with detail \'foo\' \-- currently broken |
|       | details:foo:preposition:up     | RW     | boolean        | preposition \'up\' is associated with detail \'foo\' \-- currently broken |
| X     | details:foo:snames             | RO     | string \*      | snames associated with detail \'foo\' |
| X     | details:foo:sname:wound        | RW     | boolean/string | sname \'wound\' is associated with detail \'foo\'; the value is e.g. \'wounds\' or TRUE for snames without pnames |
| X     | details:foo:pnames             | RO     | string \*      | pnames associated with detail \'foo\' |
| X     | details:foo:pname:wounds       | RW     | boolean        | pname \'wounds\' is associated with detail \'foo\' |
| X     | details:foo:adjectives         | RO     | string \*      | adjectives associated with detail \'foo\' |
| X     | details:foo:adjective:blue     | RW     | boolean        | adjective \'blue\' is associated with detail \'foo\' |
| X     | details:foo:hidden             | RW     | boolean        | detail \'foo\' is hidden |
| X     | details:foo:never-obvious      | RW     | boolean        | detail \'foo\' is never obvious |
| X     | details:foo:obvious-when-open  | RW     | boolean        | detail \'foo\' is only obvious when open |
| X     | details:foo:hidden-when-closed | RW     | boolean        | detail \'foo\' is hidden when closed |
| X     | details:foo:climbable          | RW     | NREF           | detail \'foo\' is climbable with the given destination |
| X     | details:foo:exit:dest          | RW     | NREF           | detail \'foo\' is an exit leading to the given destination |
| X     | details:foo:exit:directions    | RO     | string \*      | directions associated with exit detail \'foo\' |
| X     | details:foo:exit:direction:up  | RW     | boolean        | direction \'up\' is valid for exit detail \'foo\' |
| X     | details:foo:exit:door          | RW     | boolean        | exit detail \'foo\' has a door |
|       | details:foo:exit:closed        | RW     | boolean        | door detail \'foo\' is closed |
|       | details:foo:exit:locked        | RW     | boolean        | door detail \'foo\' is locked |
| X     | details:foo:exit:keycode       | RW     | string         | door detail \'foo\' has a lock with the given keycode |
| X     | details:foo:luminosity         | RW     | float          | detail \'foo\' has the given luminosity |
|-------|--------------------------------|--------|----------------|-------------|

\*) Available stance strings: \* {crouching, kneeling, lying, sitting,
standing} (floating and hanging also)

\*\*) Available prepositions strings: \* {close to, against, beneath,
on, in, near, above, behind, in front of, next to}

Currently missing that should not be missing: \* you can\'t get a list
of description types

This is a table of existing methods:

|                      |           |      |           |                                 |
|----------------------|-----------|------|-----------|---------------------------------|
| base:addoffer        | void      | from | object    | who is offering the objects?    |
|                      |           | what | object \* | what objects are being offered? |
| base:removeoffer     | void      | from | object    | remove offer from whom?         |
| base:removefromoffer | void      | what | object    | remove which offered object?    |
|                      |           | from | object    | who is offering the object?     |
| base:getoffersfrom   | object \* | from | object    | objects offered us by \'from\'  |
| base:getoffersto     | object \* | to   | object    | objects we\'re offering \'to\'  |
|----------------------|-----------|------|-----------|---------------------------------|

In Merry, these methods would be used like e.g.

```
      Call($target, "base:addoffer", $what: ({ sword_ob }), $from: $actor);

```

For moving into its own document soon:

    Date: Wed, 14 May 2003 15:23:32 -0500
    From: Par Winzell <zell@skotos.net>
    To: List for Skotos Seven developers and their cohorts <skotos-seven@skotos.net>
    Subject: Re: [skotos-seven] Naming request

    OK! On S7 and Marrach both, Merry-callable functions in the object /usr/System/sys/idd (which has no higher level object name because, well, it IS the higher level object name database, and I don't want to get recursive on it)...

      idd:get-folders
      idd:get-objects

    where $folder is expected; if empty, the root folder is assumed.

      +tool merry eval Call(${/usr/System/sys/idd}, "idd:get-folders", $folder: "Zell")
      Merry result: ({ "MiniCombat", "Test", "Tutorial" })
      +tool merry eval Call(${/usr/System/sys/idd}, "idd:get-objects", $folder: "Zell")
      Merry result: ({ "GunfightDB", "luminometer" }) 

------------------------------------------------------------------------

\* See NamingAnUnnamedObject for an example of change the
base:objectname derived property

------------------------------------------------------------------------

The following base:\* properties are in use in Castle Marrach, but are
**not** derived properties, and are not inherited. We should eventually
phase them out.

\* base:keycode - a key\'s keycode \* base:combat:weapon (currently
wielded weapon? unsure of support) \* base:initialspawner - set in
object created from InitialContents \* base:initialcontents - set in
object with InitialContents

\-- Main.ChristopherAllen - 28 Aug 2002

------------------------------------------------------------------------

## Emails

    ----- Original Message ----- 
    From: "Par Winzell" <zell@skotos.net>
    To: <skotos-seven@skotos.net>
    Sent: Wednesday, September 11, 2002 9:59 AM
    Subject: [skotos-seven] nrefs get properties!


    Hi folks,

    Among those of you who have worked with Merry, a fair portion have
    probably written cumbersome expressions like maybe

        Get(NRefOb($what), "details:" + NRefDetail($what) + ":exit:dest")

    which means $what is an nref and you're trying to retrieve its exit
    destination. You look up the relevant details: derived property in the
    nref's actual object.

    Pretty annoying.

    So, I've introduced a new derived property namespace to automate the
    above, using the namespace 'detail:'. The really interesting part is
    that these properties can be looked up on the nrefs themselves -- no
    need to explicitly go to the NRefOb().

    Thus the equivalent of the above using the new paradigm is

        $what."detail:exit:dest"

    which, one must say, is rather an improvement.

    I dunno about you guys, but I'm going to go back and simplify a lot of
    old Merry code now.

    This is in effect both on Marrach and S7.

    Cheers,

    Zell

------------------------------------------------------------------------

    ----- Original Message ----- 
    From: "Christopher Allen" <ChristopherA@skotos.net>
    To: <skotos-seven@skotos.net>
    Sent: Tuesday, April 15, 2003 10:42 AM
    Subject: [skotos-seven] Alternative Way to Refer to Detail Properties


    I discovered an undocumented feature for referring to details that is causing me
    to go back and rewrite some of my recently examples in Examples:complete:*

    Basically the way that TWiki document DerivedProperties had documented how to
    get and set various properties of details was to use the format:

         $this.details:detail-id:detailproperty

    For example:

        {? | $this.details:lamp:luminosity | The lamp is lit | The lamp is unlit.}

    The problem with this technique is that you have to know what the detail ID is,
    and if you are a novice builder and try to copy this script to another object,
    it will not work unless you remember to change :lamp: to the new detail name.
    You can also run into problems if the detail ID has a space in it, you have to
    remember then to encapsulate the reference:

        {? | $("this.details:lamp ceiling:luminosity") | The lamp is lit | The lamp
    is unlit.}

    ...which is easy to forget.

    With this alternative way to reference detail properties, you can now refer to
    directly to the details without knowing the detail ID if you have an NREF
    argument available that points to the detail rather then just a OBJ argument.
    NREFs contain the name of the object, plus the name of the detail. In most
    signals this argument would be $target rather then $this.

    This makes the above example look like this:

        {? | $target.detail:luminosity | The lamp is lit | The lamp is unlit.}

    You'll still need the original reference technique of
    $this.details:detail-id:detailproperty when you want to refer to properties of
    details other then what your signal has an easily available NREF for. For
    instance, my toggle scripts are typically located in a "switch" detail, but they
    test and toggle a "lamp" detail, thus they have to use the older reference
    technique.

    -- Christopher Allen
