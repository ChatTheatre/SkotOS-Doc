# Properties and Values

## Objects, properties, property types and values.

The SkotOS world is made up of objects. Each object contains any number of properties. Each property is of a certain property type, and each property is set to a particular value of that type.

This set up is not unique in any way. If you have experience with any programming languages, especially object oriented ones, you will know that this is the case 90% of the time. 

To draw the programming language parallel a step further, each object in the SkotOS world is like a class. An object can contain functions, just like a class. An object can be instantiated (spawned), just like a class. It can inherit another object (UrParentage), it can override its parent object's functions by defining its own (overriding), etc. The list goes on.

## Definition of a property.

A property is three things.
   1 It's an identifier, a reference used to easily access the property. This is usually a string (e.g. "skill:cut" or "name" or "age", etc.).
   2 It's a pointer to a value.
   2 It's an instance of a property type. 

<table style="border: solid #000000 1px;" cellspacing="0" cellpadding="5">
  <tr><td style="border-bottom: solid #777777 1px;" colspan="4">`Merry:`</td></tr>
  <tr><td style="border-right: solid #777777 1px;">`int `</td>
      <td style="border-right: solid #777777 1px;">`name`</td>
      <td style="border-right: solid #777777 1px;">` = `</td>
      <td>`"Kalle";`</td></tr>
  <tr><td style="border-right: solid #777777 1px;">type</td>
      <td style="border-right: solid #777777 1px;">identifier</td>
      <td style="border-right: solid #777777 1px;">&nbsp;</td>
      <td>value</td></tr>
</table>

## Definition of a property type.

A property type is a set of rules and constraints for the value of a property, as well as an out-of-context definition of what the value represents (admittedly more important to the operating system than to us).

### Basic property types.

<table style="border: solid #000000 1px;" cellspacing="0" cellpadding="5">
  <tr><td colspan="4">`<b>Basic property types:</b>`</td></tr>
  <tr>
   <td>`Name`</td>
   <td>`Constraints`</td>
   <td>`Range`</td>
   <td>`Example`</td>
  </tr><tr>
   <td>`float`</td>
   <td>`Numbers.`</td>
   <td>`1.2 * 10<sup>-38</sup> to 3.4 * 10<sup>38</sup>`</td>
   <td>`3.14`</td>
  </tr><tr>
   <td>`int`</td>
   <td>`Whole numbers only.`</td>
   <td>`-2 147 483 648 to 2 147 483 647`</td>
   <td>`123`</td>
  </tr><tr>
   <td>`object`</td>
   <td>`Object reference.`</td>
   <td>`n/a`</td>
   <td>`&lt;Marrach:players:K:kalle>`</td>
  </tr><tr>
   <td>`string`</td>
   <td>`Text.`</td>
   <td>`1048576 characters`</td>
   <td>`"Kalle"`</td>
  </tr>
</table>

The four basic property types are restricted by their individual constraints and ranges. An int property can never have decimals, nor can it have letters. An object can never have numbers or text, it can only contain a reference to an object, or "nothing" (`nil`). A string can, in fact, not refer to numbers directly. It must be set to a string translation of the number (`"123"` as opposed to `123`). Strings and objects are the only two basic property types which can be set to `nil`.

### Mixed types.

There are **special** property types referred to as `mixed` properties. These properties have the ability to convert themselves into either of the other property types on demand. In Merry, apart from the `mixed` property type, any variables beginning with a dollar-sign (`$`) are automagically `mixed variables`. Consider this example:

<pre>
mixed m;

m = 1;       /* m is now an int */
m = 1.2;     /* m is now a float */
m = "hello"; /* m is now a string */
</pre>


### Arrays (aka vectors).

Each base property type contains "one" element. One value, even if that value is divided into several parts ("Hello", for example, is five letters: 'H', 'e', 'l', 'l', and 'o'). Arrays (or vectors) introduce the concept of being able to give a single property several values ("Hello" and "world", for instance). I won't go into the why-would-you-wanna-do-that's in this document.

<table style="border: solid #000000 1px;" cellspacing="0" cellpadding="5">
  <tr><td colspan="2">`<b>Basic array types:</b>`</td></tr>
  <tr>
   <td>`Name</td>`
   <td>`Example</td>`
  </tr><tr>
   <td>`float*</td>`
   <td>`({ 1.2, 3.4, 5.6 })</td>`
  </tr><tr>
   <td>`int*</td>`
   <td>`({ 1, 2, 3 })</td>`
  </tr><tr>
   <td>`object*</td>`
   <td>`({ &lt;Marrach:players:K:kalle>, &lt;Marrach:players:L:lucy> })</td>`
  </tr><tr>
   <td>`string*</td>`
   <td>`({ "Kalle", "Lucy" })</td>`
  </tr>
</table>

Note: Since a `mixed` property can be <b>anything</b>, it can also be an array.

<pre>
mixed arr;

arr = ({ 1, "x", 3.4 });</pre>

The difference between a basic property type and an array property type is the presence (or absence)  of the `*` (star)-sign in the property type declaration.
<table style="border: solid #000000 1px;">
 <tr>
  <td>Array:</td>
  <td>`int *x;`</td>
 </tr>
 <tr>
  <td>Non-array:</td>
  <td>`int x;`</td>
 </tr>
</table>

All array values are expressed (written) using a uniform syntax, regardless of the underlying property type.<pre>({ &lt;element 1>, &lt;element 2>, &lt;element 3>, ... })</pre>
An array begins with "`({`" and ends with "`})`" The array elements are separated from each other using "`,`" (comma)-signs.

Each element in an array is referenced to through its numerical position in the array, where the first element is at position `0`, the next element is at position `1`, etc.

Arrays are referenced in two ways.
   * As arrays - this is identical to referencing any property of any type.
   * Per element - when referencing an element of an array, the array is referenced like this:<pre>array[element]</pre>Consider the example below.

<pre>
string *names;

names = ({ "Harry", "Lucy", "George" });
</pre>
   * `names` is set to `({ "Harry", "Lucy", "George" })`
   * `names[0]` is set to `"Harry"`
   * `names[1]` is set to `"Lucy"`
   * `names[2]` is set to `"George"`

---+++ Mappings.

Mappings are closely related to arrays. Mappings contain multiple elements, just like arrays. There is a difference, however.

<pre>
   <b>array</b>                    <b>mapping</b>
   [ 0 ] -> [ &lt;value> ],    [ &lt;indice> ]    -> [ &lt;value> ],
   [ 1 ] -> [ &lt;value #2> ], [ &lt;indice #2> ] -> [ &lt;value #2> ],
   [ 2 ] -> [ &lt;value #3> ]  [ &lt;indice #3> ] -> [ &lt;value #3> ]
   ...                         ...
</pre>

Arrays are restrained to a numerical index. Each element in the array is aligned across the index, in a linear fashion. 

Mappings are unrestrained in that sense. Each element of a mapping consists of an indice (key) and a value. Each indice in itself is a property.

The indices and values of all mappings are always of the `mixed` property type.

Mappings are expressed (written) using a slightly different syntax than arrays.<pre>([ &lt;indice #1> : &lt;value #1>, &lt;indice #2> : &lt;value #2>, ... ])</pre>
A mapping begins with "`([`" and ends with "`])`" Each indice is separated from its value using a "`:`" (colon)-sign. The indice-value pairs which make up the mapping are separated using "`,`" (comma)-signs, just like elements of an array.

Consider this example:

<pre>
mapping m;

m = ([ "name"  : "Harry", 
       "age"   : 34,
       "phone" : "1-234-567-890" ]);
</pre>

While array values are referenced using the corresponding index position, mapping values are referenced by the value of the indice. In the above example, consider this: `m["name"] /* "Harry" */`

### Multi-dimensional arrays (e.g. matrices) and mappings.

So far, we've seen things like `string *foo` and `mapping m`. `string *` would look something like this:

<pre>
<b>0</b>   text
<b>1</b>   text
<b>2</b>   text
<b>3</b>   text
<b>4</b>   text
<b>5</b>   text
<b>6</b>   text
<b>7</b>   text
<b>8</b>   text
<b>9</b>   text
...
</pre>

Simply put, a "line", with positions (indexes) and values (text). What, then, would this look like: `string **foo`

<pre>
<b>   0    1    2    3    4    5    6    7    8    9</b>
<b>0</b>  text text text text text text text text text text 
<b>1</b>  text text text text text text text text text text 
<b>2</b>  text text text text text text text text text text 
<b>3</b>  text text text text text text text text text text 
<b>4</b>  text text text text text text text text text text 
<b>5</b>  text text text text text text text text text text 
<b>6</b>  text text text text text text text text text text 
<b>7</b>  text text text text text text text text text text 
<b>8</b>  text text text text text text text text text text 
<b>9</b>  text text text text text text text text text text 
</pre>

Look, a map (aka a matrix)! To refer to e.g. the 4th row's 3rd column, we would use<pre>foo[4][3]</pre>

---

## Properties in objects.

Each object contains any number of properties. In fact, each object can be seen as a mapping, with a list of indices and values.

In general, object properties are divided into "spaces" called property namespaces. Each namespace is separated from its properties using, traditionally, a "`:`" (colon)-sign. An example of such a namespace would be `"skill"` Other examples are `"base"`, `"core"`, `"details"`, etc.

A namespace may also <i>contain</i> namespaces, apart from properties. For example, each physical body (object) in the SkotOS world has a `details` namespace. The `details` namespace is divided into <i>details</i>, each of which has its own <i>detail ID</i>. These ID's are the namespaces under which each individual detail's settings reside.

<table border="0" cellspacing="0" cellpadding="0"><tr><td valign="top">
<table style="border: solid #000000 1px;" cellspacing="0" cellpadding="5">
 <tr>
  <td style="border: solid #999999 1px;">
   `details`
  </td>
  <td style="border: solid #999999 1px;">
   `default`
  </td>
  <td style="border: solid #999999 1px;">
   `description`
  </td>
  <td style="border: solid #999999 1px;">
   `brief`
  </td>
  <td style="border: solid #999999 1px;">
   `"chair"`
  </td>
 </tr>
 <tr>
  <td>
   namespace
  </td>
  <td>
   namespace
  </td>
  <td>
   namespace
  </td>
  <td>
   property
  </td>
  <td>
   value
  </td>
 </tr>
</table>
</td><td valign="center"> --> `details:default:description:brief == "chair"`</td></tr>
</table>

Some namespaces are "special," used specifically for certain purposes. For instance the `export` namespace.

<pre>
[object A] is the UrParent for [object B]

We set export:foo to "bar" in [object A]

foo is now automagically "bar" in [object B]
</pre>

We can access properties by namespace, both from the SkotOS client itself, and from within Merry, as a mapping.

<pre>
[client]
> +stat lucy "property:details:default:*"
-- Properties (details:default:*)--
Property: details:default:abstract = 0
Property: details:default:abstract:local = 0
Property: details:default:adjectives = ({ "female" })
Property: details:default:adjectives:local = 0
Property: details:default:definite = 1
Property: details:default:definite:local = 0
[...]
Property: details:default:snames = ({ "lucy", "sera", "woman", "person", "human", "pc", "female", 
"mammal", "primate", "being" })
Property: details:default:snames:local = ({ "lucy" })

[merry]
mapping m;

m = prefixed_map($actor."*", "details:default:");
</pre>

---

## Expression syntax.

Each type of variable has its own syntax. This syntax is used by the system to figure out which property type you are trying to express. Consider this:

<pre>
[client]
> +setp lucy "age 25"
> +setp lucy "eyesight 0.25"
> +setp lucy "pointer <Marrach:players:L:lucy>"
> +setp lucy "shopping:list ({ "eggs", "milk", "cookies" })"
</pre>

   * On the first line (`+setp lucy "age 25"`) we set the property "`age`" in Lucy to the `integer` value `25`.
   * The second line (`+setp lucy "eyesight 0.25"`) sets the property "`eyesight`" to the `<b>float</b>` value `0.25`. 
   * The third line (`+setp lucy "pointer &lt;Marrach:players:L:lucy>"`) sets the property "`pointer`" to the `object` value `&lt;Marrach:players:L:lucy>`.
   * The fourth line (`+setp lucy "shopping:list ({ "eggs", "milk", "cookies" })"`) sets the property "`shopping:list`" (or, to be exact, the property "`list`" in the namespace "`shopping`") to the `array` value `({ "eggs", "milk", "cookies" })`. 

How can it _know_ this? How does it know which type of property I want? Well, it doesn't. But it's a pretty good guesser.

   * If you type a sequence of numbers without a decimal point, it will set your property to an `integer`.
   * If you type a sequence of numbers followed by a decimal point (dot), followed by at least one number, it will set the property type to a `float`.
   * If the first character is a less-than sign (`&lt;`), followed by the woename to an existing (!) object, followed by a greater-than sign (`&gt;`), it will set the property type to `object`.
   * etc.

This syntax is similar throughout the SkotOS system, except in one case. Merry does not resolve `object` expressions the same way the rest of SkotOS does this. Consider these two property expressions:

<pre>
[client]
<Marrach:players:G:george>

[merry]
${Marrach:players:G:george}
</pre>


-- KalleAlm - 23 May 2004
