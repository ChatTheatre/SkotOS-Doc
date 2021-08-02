---
sort: 6
---

# Quick Summary: SAM System

SAM (Skotos Active Markup) allows text in descriptions (see [Quick Summary: Description System](QuickSummaryDescriptionSystem.md))
to be dynamic.

### OneOf

The simplest SAM is the OneOf -- basically using a OneOf in your text allows you to randomize the output.

<pre>
   Look: [
      You are inside {a large|an oversize|a} tent.
   ]
   Output(s):
      > look at tent
      You are inside a large tent.
      > look at tent
      You are inside an oversize tent
      > look at tent
      You are inside a tent.
      >
</pre>

### Output a Property

You can also output the value of a property very easily.

<pre>
   Look: [
      The gem is $(this.gemcolor).
   ]
   Output(s):
      > look at gem
      The gem is blue.
      > +setp gem "gemcolor green
      Setting 'gemcolor' in <[Examples:complete:sam:gem]#4544> to "green".
      > look at gem
      The gem is green.
      >
</pre>

In the above example, $(this) refers to the object itself, the gem itself. $(this.gemcolor) refers to the value of the property "gemcolor" inside the gem.

### Arguments

$(this) is only one of many 'arguments' that SAM knows about that is different depending on the circumstance that the SAM is executed.

In almost every situation, the following arguments are available:

   * *<code>$(actor)</code>*  -- The object executing the action, e.g. whomever is taking the sword  
   * *<code>$(action)</code>*  -- The name of the action currently executing, e.g. take
   * *<code>$(this)</code>* -- The object containing the SAM itself, e.g. the sword
   * *<code>$(target)</code>* -- The detail of the object that is the target of the action.
   
In addition, in many situations, the following additional arguments are available:

   * *<code>$(verb)</code>* -- The verb used in the action, e.g. 'polish' in "polish the sword with my cloth"
   * *<code>$(dob)</code>* -- The object that is the direct object of the action, e.g. the sword
   * *<code>$(using)</code>* -- the object that is the indirect object of the action, e.g. the cloth
   
### References

In addition to arguments, you can also reference specific objects.

   * $(Full:Woe:Name) -- the object with the woe name "Full:Woe:Name"
   * $[${Full:Woe:Name}] -- the object that is currently named "Full:Woe:Name", and if the object is renamed, the reference will change with it.
   
 
### Property References

Once you have object defined, either by argument $this or by reference $(Full:Woe:Name) or $[${Full:Woe:Name}], you can directly output the value of properties that are in these objects into your descriptions, just by adding a period followed by the property name:

   * *<code>$(this.trait:variant)</code>*
   * *<code>$(actor.trait:variant)</code>*
   * *<code>$(Full:Woe:Name.trait:variant)</code>*
   * *<code>$[${Full:Woe:Name.trait:variant}]</code>*

Some commonly used properties that output text:
   * *<code>$(this.base:possessive)</code>* -- possessive pronoun e.g. 'his'  
   * *<code>$(this.base:objective)</code>* -- objective pronoun e.g. 'him'  
   * *<code>$(this.base:pronoun)</code>*  -- basic pronoun e.g. 'he'  
   * *<code>$(this.base:light-category)</code>*  -- object's luminosity, e.g. "dark", "dim", or "bright" 
   * *<code>$(this.details:default:description:brief)</code>* -- object's default brief description

Examples of use:

<pre>
   Look: [
      $(this.base:pronoun) looks very fierce. A scar runs from $(this.base:possessive) cheek to $(this.base:possessive) chin, which doesn't seem to bother $(this.base:objective).
   ]
   Output:
      > look at warrior
      She looks very fierce. A scar runs from her cheek to her chin, which doesn't seem to bother her.
      >
</pre>

<pre>
   Look: [
      You are in a $(this.base:light-category) room.
   ]
   Output:
      > look
      You are in a dim room.
      >
</pre>

Some property references don't output text, but instead refer to other objects:
   * *<code>$(this.base:environment)</code>* -- object's environment  
   * *<code>$(this.base:worn-by)</code>* -- object's wearer (same as wielded-by)  
   * *<code>$(this.base:wielded-by</code>* -- object's wielder (same as wielded-by)  

These are not that useful to use directly, but in turn you can then use properties with these:

   * *<code>$(this.base:environment.base:possessive)</code>* -- object's environment possessive pronoun
   * *<code>$(this.base:worn-by.base:pronoun)</code>* -- object's wearer's basic pronoun

Details of objects can be output:

  * *<code>$("this.details:default:descriptions:look")</code>* -- the prime detail's look description
  * *<code>$("this.details:lamp:descriptions:brief")</code>* -- the lamp detail's brief description

Some detail IDs have spaces in them. The way to refer to a SAM reference with a space in it is to put it in quotes -- e.g.

   * *<code>$("this.details:exit west:descriptions:look")</code>* -- the look description of exit west

rather than

   * *<code>$(room.details:exit west:descriptions:look)</code>* -- won't work

### XHTML Tags

There are some XHTML formatting tags that can be useful are are available in SAM

   * *<code>&lt;br/&gt;</code>* -- a line break, a single newline
   * *<code>&lt;sbr&gt;</code>* -- single break, inserts &lt;br/&gt; when used in a webpage, or a newline when used elsewhere.
   * *<code>&lt;p/&gt;</code>* -- a paragraph break, two newlines
   * *<code>&lt;pre&gt;text&lt;/pre&gt;</code>* -- will output the text in a monospace font, without formatting
   
   

### Common Sam Tags

There are various times when you need specific output that is not easily available in a property, or the property is in the wrong form. These SAM tags can be useful in these cases:

These are Sam Tags for describing things:

   * *<code>&lt;describe what="$(this)"/&gt;</code>* -- This will output the brief of $(this) object, e.g. "a sword"
   * *<code>&lt;describemany what="$(this.base:inventory)"/&gt;</code>* -- Describe many will output multiple briefs, as if in an inventory, of the objects in $(this.base:inventory).
   * *<code>&lt;describe-holder what="$(this)"/&gt;</code>* -- Equivalent to <code>&lt;describe what="$(foo.base:holder)"/&gt;'s</code> except when the person's name ends in 's' or 'x' in which case it does the right thing and just adds the apostrophe without a trailing s.
   * *<code>&lt;describe-poss what="$(this)"&gt;</code>* -- Describes $(this) in the possessive form, e.g. "his sword"
   * *<code>&lt;describe-prop this="$(this)" what="property:name"/&gt;</code>* -- Adds "a" "the" "an" to the text of the property appropriately.
   * *<code>&lt;describe-view view="$(this)" cap/&gt;</code> -- Will give the full description of the object, including any visible inventory. e.g. "A tall orc, weilding his sword."
   * *<code>&lt;capitalize what="lower"&gt;</code>* -- will initial capitalize the text "lower" into "Lower"
   * *<code>&lt;eaten what="$(this)"/&gt;</code>* -- will output how much of the item has been consumed.
   
Most of these description Sam Tags have a variety of options, see SamSystem for details, but one of the most useful ones is the 'cap' option, which will capitalize the output. For instance:

   * *<code>&lt;describe what="$(this)"/&gt;</code>* -- This will output the brief of $(this) object, e.g. "A sword"

### Client Sam

The following SAM tags are useful for special features in the Alice and Zealous clients:

   * &lt;atag tag="command"&gt; text that you want themed with the color in the 'command' theme &lt;/atag&gt;
   * &lt;acmd tag="command" cmd="open west door"&gt;click here to open the west door.&lt;/acmd&gt;
   

### Simple If Comparison

A simple if statement allows you to output one text if something is true, a different text if false.

<pre>
   Look: [
      A statue of a man. The statue's face {? this.trait:expression |appears to be $(this.trait:expression) at you. |is expressionless. }
   ]
   Result(s):
      > look at statue
      A statue of a man. The statue's face is expressionless.
      > +setp statue "trait:expression similing
      Setting 'trait:expression' in <[Examples:complete:sam:statue]#4586> to "smiling".
      > look at statue
      A statue of a man. The statue's face appears to be smiling at you.
      >
</pre>

In this example, if the property <code>trait:expression</code> doesn't exist (i.e. false), then "is expressionless" is output. If it does exist (true) then it is "appears to be smiling at you" will be output.


### Other Comparisons

There are quite a few inds of comparisons you can do in SAM:

BOOLEAN
<pre>
    {? | $this.trait:variant |
        true text output |
        false text output }

    {? not | $this.trait:variant |
        true text output |
        false text output }
    {? equal | $this.trait:variant | ordinary |
        true text output |
        false text output }

    {? notequal | $this.trait:variant | ordinary |
        true text output |
        false text output }

    {? lessthen | $this.trait:variant | ordinary |
        true text output |
        false text output }

    {? lessthenorequal | $this.trait:variant | ordinary |
        true text output |
        false text output }

    {? greaterthen | $this.trait:variant | ordinary |
        true text output |
        false text output }

    {? greaterthenorequal | $this.trait:variant | ordinary |
        true text output |
        false text output }

    {? range | $this.trait:variant | lowervalue | uppervalue |
        true text output |
        false text output }
    
    Comment: range is exclusive, i.e. 
         {? range | 1 | 3 | 6 | true | false }"
            1   false
            2   false
            3   false
            3.1 true
            4   true
            5   true
            6   true
            6.1 false
            7   false
            8   false
            9   false


    {? when | $this.trait.variant |
        value1 | value1 equal $this.trait:variant |
        value2 | value2 equal $this.trait:variant |
        value3 | value2 equal $this.trait:variant |
        *      | any other value }
</pre>


### Inline Merry

You can put Merry scripts inside of of SAM as follows:

<pre>
   Look: [
      You are on a road. There are $[this.stars_in_sky + this.moons_in_sky] celestial bodies above you.
   ]
</pre>

If the piece of Merry does not end in a semi-colon or a right-brace, it is assumed to be a 'statement' rather than an 'expression'. This means the code needs to explicitly return a value. For example,

<pre>
   You are on a road. There are
     $[
         if (this.stars_in_sky > 5) {
             return "lots of";
         }
         if (this.stars_in_sky > 0) {
             return "a few";
         }
         return "no";
      ]
   stars in the sky.
</pre>

#### Inline Merry and Text

It can often be useful in SAM to manipulate text, so there are some very simple inline Merry functions that can perform this for you.

Text related:
   * *<code>$[capitalize("this is a test")]</code>* -- result: "This is a test"
   * *<code>$[proper("This is a test")]</code>* -- result: "This Is A Test"
   * *<code>$[decapitalize("This Is A Test")]</code>* -- result: "this Is A Test"
   * *<code>$[upper_case("This Is A Test")]</code>* -- result: "THIS IS A TEST"
   * *<code>$[lower_case("this Is A Test")]</code>* -- result: "this is a test"

Number related:
   * *<code>$[desc_cardinal(128)]</code>* -- result: "one hundred twenty-eight"
   * *<code>$[desc_ordinal(128)]</code>* -- result: "one hundred twenty-eighth"
   * *<code>$[comma(1024)]</code>* -- result: "1,024"


### Inline Merry and Comparisons

You can combine arbitrary Merry expressions for tests to use in comparisons, to make very sophisticated output. For example:

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

These can be quite sophisticated, for instance:

<pre>
    {? | $[sizeof(Match($actor, "cigarette"))] |
    Actor has a cigarette. | Actor doesn't have cigarette. }
       Actor has a cigarette.
       Actor doesn't have a cigarette
       
</pre>

### Common Inline Merry Uses

There are many things you can do in SAM by using inline Merry, but these are some of the most common:

   * *<code>$[Set($this, "my:property:name", 1);]</code>* -- Sets the property my:property:name in object $this to 1.
   * *<code>$[Set($this, "my:property:name", Get($this, "my:property:name) + 1); ]</code>* -- Adds 1 to property my:property:name on object $this



(not quite yet working examples)

<pre>
You look at <describe what=$(this)> and your surroundings change!
   $[      EmitIn(Get($actor, "base:environment"), Describe($actor) + " looks at " + Describe($dbob) + " and disappears!\n", $actor);
         $actor."base:environment" = ${Examples:complete:desc:room-go-nowhere};
         $actor."base:proximity" = NewNRef(${Examples:complete:desc:room-go-nowhere}, "floor");
         $actor."base:stancestring" = "lying";
         $actor."base:prepositionstring" = "on";
         EmitIn(Get($actor, "base:environment"), Describe($actor) + " appears out of nowhere lying on the floor!\n", $actor);
   ]
</pre>
