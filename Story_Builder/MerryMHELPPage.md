&lt;center&gt;&lt;h1&gt;Merry +MHELP reference
page&lt;/h1&gt;&lt;/center&gt;

*This page was automatically created using the +mhelp tool. If anything
in this document is in error, do not edit the document directly --
instead, use +mhelp to modify the topic in question, from within the
client. Also note, if you are on the Skotos Seven server, that changes
you make will currently be lost unless you inform &lt;a
href="[mailto:kalle@mortalis.skotos.net](mailto:kalle@mortalis.skotos.net)"&gt;Kalle&lt;/a&gt;
about the changes you've made, so that the master copy may be updated
accordingly.*

**Table of contents** <span class="twiki-macro TOC"></span>

&lt;hr noshade="1"&gt;&lt;/hr&gt;

## $

### $delay

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;$delay&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;&lt;/font&gt; &lt;font
class="fun"&gt;$delay(&lt;/font&gt;&lt;font class="args"&gt;mixed wait,
mixed return\[, string id\]&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; $delay() is used to prematurely exit a script, and
return to it a set amount of seconds later (wait, 1st argument),
specified as a floating value (up to 60.0) or an integer value (no
limit). &lt;br/&gt; &lt;br/&gt;Not only does the script exit, though,
but if the script was called from another script, that script is
returned the return value (return, 2nd argument). &lt;br/&gt;If the
script is an act/react/witness script, the first time a non-FALSE value
is returned, the action will go through, as pointed out in the
example(s) section below. &lt;br/&gt; &lt;br/&gt;Only the first argument
is required, second is optional, third is automatic. &lt;br/&gt;The
second value defaults to FALSE, the third value becomes a four-digit
unique character identifier for the switch. Make careful note that no
two $delay() statements in a single script may contain two identical
identifiers. The script will fail to compile with a "duplicate case
labels in switch" error. Remove the third argument from the copied
$delay() statements and another identifier will be generated.
&lt;br/&gt;

&lt;br/&gt;Note: only $variables and constants are maintained after a
$delay() returns control to a script. The following script would fail,
&lt;br/&gt; &lt;br/&gt;string s; &lt;br/&gt;s = "Hello world"; /\* s ==
"Hello world" **/ &lt;br/&gt;$delay( 1, FALSE ); /** s is reset **/
&lt;br/&gt;EmitTo( $actor, s ); /** s is nil \*/ &lt;br/&gt;
&lt;br/&gt;- because the variable s is nil after the $delay() call.
&lt;br/&gt;Solve by storing the necessary variables in some appropriate
object, or use $variables. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Example act:smile in the actor:
    ----------------------------
    EmitTo( $actor, "You won't smile ever, cause we return FALSE below." );
    $delay( 1, FALSE );
    ----------------------------

    Example act:smile in the actor:
    ----------------------------
    EmitTo( $actor, "You will smile after seeing this message, because we return TRUE below." );
    $delay( 1, TRUE );
    ----------------------------

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

## A

### acos

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;acos&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;acos(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; float &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: acos(0.0)
    Merry result: 1.5707963

    Merry code: acos( 0.5 )
    Merry result: 1.0471976

    Merry code: acos( 1.0 )
    Merry result: 0.0

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#asin"&gt;asin&lt;/a&gt; and &lt;a
href="\#atan"&gt;atan&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### Act

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Act&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;void&lt;/font&gt;
&lt;font class="fun"&gt;Act(&lt;/font&gt;&lt;font class="args"&gt;object
ob, string action, special arguments&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; void

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Another extremely
powerful function, this is how Merry commands some object to perform an
action, optionally specified by an array of arguments. The argument
$silent can be sent as TRUE in order to suppress all output for
(presumably) all signals. &lt;br/&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt;

&lt;td valign="top"&gt;

    Act( $actor, "drop", $what: sword_objects, $into: container_object );

    (see TWiki page on signals for more verbose information on what exactly you can do with what)

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#Social"&gt;Social&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### allocate

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;allocate&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;mixed \*&lt;/font&gt;
&lt;font class="fun"&gt;allocate(&lt;/font&gt;&lt;font
class="args"&gt;int size&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; mixed \*

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Allocate an array
with size number of elements. All elements are initialized to zero. The
new array is returned. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: allocate(5)
    Merry result: ({ nil, nil, nil, nil, nil })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#sizeof"&gt;sizeof&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### allocate\_float

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;allocate\_float&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;float \*&lt;/font&gt; &lt;font
class="fun"&gt;allocate\_float(&lt;/font&gt;&lt;font class="args"&gt;int
size&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; float \* &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Allocate an array with size
elements. All elements are initialized to 0.0. The new array is
returned. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: allocate_float(5)
    Merry result: ({ 0.0, 0.0, 0.0, 0.0, 0.0 })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#allocate"&gt;allocate&lt;/a&gt;, &lt;a
href="\#allocate\_int"&gt;allocate\_int&lt;/a&gt; and &lt;a
href="\#sizeof"&gt;sizeof&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### allocate\_int

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;allocate\_int&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int \*&lt;/font&gt; &lt;font
class="fun"&gt;allocate\_int(&lt;/font&gt;&lt;font class="args"&gt;int
size&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int \* &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Allocate an array with size elements. All elements are
initialized to 0. The new array is returned. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: allocate_int(5)
    Merry result: ({ 0, 0, 0, 0, 0 })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#allocate"&gt;allocate&lt;/a&gt;, &lt;a
href="\#allocate\_float"&gt;allocate\_float&lt;/a&gt; and &lt;a
href="\#sizeof"&gt;sizeof&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### Arr

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Arr&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed \*&lt;/font&gt; &lt;font
class="fun"&gt;Arr(&lt;/font&gt;&lt;font class="args"&gt;mixed
v&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; mixed \* &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return &lt;v&gt; in the form of an array. If &lt;v&gt;
is an array already, &lt;v&gt; will be returned in its present state,
otherwise ({ &lt;v&gt; }) is returned.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: Arr( "Hello" )
    Merry result: ({ "Hello" })

    Merry code: Arr( ({ "Hello" }) )
    Merry result: ({ "Hello" })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#Str"&gt;Str&lt;/a&gt;,
&lt;a href="\#Int"&gt;Int&lt;/a&gt;, &lt;a
href="\#Flt"&gt;Flt&lt;/a&gt;,

&lt;a href="\#Num"&gt;Num&lt;/a&gt; and &lt;a
href="\#Map"&gt;Map&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### arr\_to\_set

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;arr\_to\_set&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;mapping&lt;/font&gt; &lt;font
class="fun"&gt;arr\_to\_set(&lt;/font&gt;&lt;font class="args"&gt;array
a&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; mapping &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Use arr\_to\_set to convert an array
value to a mapping where each unique property in the array is an indice
(key) in the resulting mapping.&lt;br/&gt;As mappings are automatically
represented in alphabetical order, arr\_to\_set may for instance be used
to sort an array of strings.&lt;br/&gt;As you see in the second example,
applying map\_indices to the result of an arr\_to\_set-call will result
in an identical, but sorted, array.&lt;br/&gt;Take note, however, that
if any two values in an array are identical (which is valid for an
array), these two values will be merged into a single value by
arr\_to\_set, as indices must be unique. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: arr_to_set( ({ "Kalle", "Anders", "Erik", "Maria" }) )
    Merry result: ([ "Anders":1, "Erik":1, "Kalle":1, "Maria":1 ])
    Merry code: map_indices( arr_to_set( ({ "Kalle", "Anders", "Erik", "Maria" }) ))
    Merry result: ({ "Anders", "Erik", "Kalle", "Maria" })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#map\_values"&gt;map\_values&lt;/a&gt;, &lt;a
href="\#map\_indices"&gt;map\_indices&lt;/a&gt; and &lt;a
href="\#reverse\_mapping"&gt;reverse\_mapping&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### ascii\_to\_mixed

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;ascii\_to\_mixed&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;ascii\_to\_mixed(&lt;/font&gt;&lt;font
class="args"&gt;string str&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Convert an ascii value into the appropriate property
type. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: ascii_to_mixed( "15" )
    Merry result: 15

    Merry code: ascii_to_mixed( "({ \"a\", \"cute\", \"array!\" })" )
    Merry result: ({ "a", "cute", "array!" })

    Merry code: ascii_to_mixed( "<Marrach:players:K:kalle>" )
    Merry result: <Marrach:players:K:kalle>

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#mixed\_to\_ascii"&gt;mixed\_to\_ascii&lt;/a&gt; and &lt;a
href="\#dump\_value"&gt;dump\_value&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### ascii\_typeof

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;ascii\_typeof&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;ascii\_typeof(&lt;/font&gt;&lt;font class="args"&gt;mixed
value&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return a string representation of the property type of
value. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    ascii_typeof( nil ) == "nil"
    ascii_typeof( 123 ) == "int"
    ascii_typeof( 3.14 ) == "float"
    ascii_typeof( "abc" ) == "string"
    ascii_typeof( $actor ) == "object"
    ascii_typeof( ({ "a", "b", "c" }) ) == "array"
    ascii_typeof( ([ "foo" : "bar" ]) ) == "mapping"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#typeof"&gt;typeof&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### asin

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;asin&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;float&lt;/font&gt;
&lt;font class="fun"&gt;asin(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; float

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: asin(0.0)
    Merry result: 0.0

    Merry code: asin(0.5)
    Merry result: 0.52359878

    Merry code: asin(1.0)
    Merry result: 1.5707963

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#acos"&gt;acos&lt;/a&gt; and &lt;a
href="\#atan"&gt;atan&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### atan

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;atan&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;atan(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return the arc tangent of the argument.&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: atan(0.0)
    Merry result: 0.0

    Merry code: atan(0.5)
    Merry result: 0.46364761

    Merry code: atan(1.0)
    Merry result: 0.78539816

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#acos"&gt;acos&lt;/a&gt;, &lt;a href="\#asin"&gt;asin&lt;/a&gt;
and &lt;a href="\#atan2"&gt;atan2&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### atan2

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;atan2&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;atan2(&lt;/font&gt;&lt;font class="args"&gt;float y,
float x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return the arc tangent of y/x, using the signs of the arguments to
determine the quadrant of the result.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: atan2(0.0, 0.0)
    Merry result: 0.0

    Merry code: atan2(1.0, 0.0)
    Merry result: 1.5707963

    Merry code: atan2(0.0,1.0)
    Merry result: 0.0

    Merry code: atan2(1.0,1.0)
    Merry result: 0.78539816

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#atan"&gt;atan&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

## B

### base64\_decode

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:**

&lt;/td&gt; &lt;td&gt;base64\_decode&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### Bilbo

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:**

&lt;/td&gt; &lt;td&gt;Bilbo&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;Bilbo(&lt;/font&gt;&lt;font class="args"&gt;object ob,
string signaltype, string signalname, special
arguments&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Merry can call Bilbo directly -- but as Merry at this
point has exceeded bilbo in all/any aspect, it is recommended that you
use this function scarcely; preferably never.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Bilbo( $actor, "react", "smile" ); /* will execute bilbo:react:smile found in $actor */

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### break\_paragraph

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;break\_paragraph&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;break\_paragraph(&lt;/font&gt;&lt;font
class="args"&gt;string head, string str, int len&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; For a fixed-size font, break str into lines each no
longer than len characters, and start all of it with the string head.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: break_paragraph( "You say: ", "sputnik was a  satellite", 20 )
    Merry result: "You say: sputnik was\n           a satellite\n"
    - which renders to
    You say: sputnik was
    a satellite
    (note that "a satellite" is directly below "sputnik was" if pre-formated)

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

## C

### calculate\_stamp

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;calculate\_stamp&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;calculate\_stamp(&lt;/font&gt;&lt;font
class="args"&gt;int year, int month, int day&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Create a UNIX timestamp pointing to
midnight, year &lt;year&gt;, day &lt;day&gt; of month &lt;month&gt;.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: calculate_stamp( 1980, 9, 24 )
    Merry result: 338616000

    Merry code: ctime( 338616000 ) + ", Kalle was born."
    Merry result: "Wed Sep 24 00:00:00 1980, Kalle was born."

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;,

&lt;a href="\#short\_time"&gt;short\_time&lt;/a&gt;, &lt;a
href="\#smalltime"&gt;smalltime&lt;/a&gt;,

&lt;a href="\#get\_day"&gt;get\_day&lt;/a&gt;, &lt;a
href="\#get\_month"&gt;get\_month&lt;/a&gt;,

&lt;a href="\#get\_year"&gt;get\_year&lt;/a&gt;, &lt;a
href="\#get\_hour"&gt;get\_hour&lt;/a&gt;,

&lt;a href="\#get\_minute"&gt;get\_minute&lt;/a&gt; and &lt;a
href="\#get\_second"&gt;get\_second&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### Call

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Call&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;Call(&lt;/font&gt;&lt;font class="args"&gt;object ob,
string script, special arguments&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry's means of calling other Merry functions. If the script argument is e.g. 'checktimer', the property search will be for merry:lib:checktimer; there is no way to avoid the 'lib' portion. All functions that are callable in Merry must exist in the 'lib' namespace. This makes sense, as you will see in time.

    The third argument is on precisely the same format as in Act. For example, if you do

    Call(this, "inflict", $damage: 100);

    then the merry:lib:inflict script will be called, and inside this script $damage will contain the integer value 100. The local value is not changed, so after

    $damage = 50;
    Call(this, "inflict", $damage: 100);
    $damage will still be 50.

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#call\_other"&gt;call\_other&lt;/a&gt;,
&lt;a href="\#call\_out"&gt;call\_out&lt;/a&gt; and &lt;a
href="\#call\_trace"&gt;call\_trace&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### call\_other

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;call\_other&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;varargs mixed&lt;/font&gt; &lt;font
class="fun"&gt;call\_other(&lt;/font&gt;&lt;font class="args"&gt;mixed
obj, string function, mixed args...&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; varargs mixed &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Call a function in an object. The
first argument must be either an object or a string. If it is a string,
call\_object() will be called in the driver object to get the
corresponding object.&lt;br/&gt;Only non-private functions can be called
with call\_other(). If the function is static, the object in which the
function is called must be the same as the object from which the
function is called, or the call will fail.&lt;br/&gt;Any additional
arguments to call\_other() will be passed on to the called
function.&lt;br/&gt;In LPC, obj-&gt;func(arg1, arg2, argn) can be used
as a shorthand for call\_other(obj, "func", arg1, arg2,
argn).&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### call\_out

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;call\_out&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;varargs int&lt;/font&gt;
&lt;font class="fun"&gt;call\_out(&lt;/font&gt;&lt;font
class="args"&gt;string function, int delay, mixed
args...&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; varargs int

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Call a function in
the current object with a delay. The function to be called must not be
private. The delay is specified in seconds.&lt;br/&gt;The minimum delay
is 1 second; if the given delay is less, it is changed into 1
second.&lt;br/&gt;The returned value is the callout handle, an integer
&gt; 0 which must be used if the callout is to be removed.&lt;br/&gt;
&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### call\_trace

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;call\_trace&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; mixed \*\*
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Return the function
call trace as an array. The elements are of the following
format:&lt;br/&gt;&lt;br/&gt;({ objname, progname, function, line,
extern, arg1, ..., argn })&lt;br/&gt;&lt;br/&gt;The line number is 0 if
the function is in a compiled object.&lt;br/&gt;Extern is 1 if the
function was called with call\_other(), and 0 otherwise.&lt;br/&gt;The
last element of the returned array is the trace of the current
function.&lt;br/&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: call_trace()
    Merry result: ({ ({ "/kernel/obj/binary#10769", "/kernel/obj/binary", "receive_message", 85, 1 }), ({ "/kernel/obj/binary#10769", "/kernel/lib/connection", "receive_message", 233, 0 }), ({ "/usr/TextIF/obj/user#10798", "/usr/TextIF/obj/user", "receive_message", 371, 1 }), ({ "/usr/TextIF/obj/user#10798", "/usr/TextIF/obj/user", "receive_line", 720, 0 }), ({ "/usr/TextIF/obj/user#10798", "/kernel/lib/auto", "call_limited", 719, 0 }), ({ "/usr/TextIF/obj/user#10798", "/kernel/lib/auto", "_F_call_limited", 698, 0 }), ({ "/usr/TextIF/obj/user#10798", "/usr/TextIF/obj/user", "parse_command", 812, 1 }), ({ "/usr/TextIF/main", "/usr/TextIF/main", "command", 230, 1 }), ({ "/usr/Tool/sys/tool", "/usr/Tool/sys/tool", "cmd_DEV_tool", 117, 1 }), ({ "/usr/Tool/sys/merry", "/usr/Tool/lib/merry", "cmd_merry_eval", 133, 1 }), ({ "/usr/Tool/sys/merry", "/usr/Tool/lib/merry", "run_merry_code", 45, 0 }), ({ "/usr/SkotOS/data/merry#-1", "/usr/SkotOS/data/merry", "evaluate", 223, 1, ({ <Chatters:LC:ch:allen-christopher>, nil, nil, ([ "actor":<Chatters:LC:ch:allen-christopher>, "body":<Chatters:LC:ch:allen-christopher>, "here":<Examples:complete:desc:room-go-nowhere>, "looker":<Chatters:LC:ch:allen-christopher> ]), nil }) }), ({ "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "/usr/SkotOS/lib/merrynode", "evaluate", 56, 1, <Chatters:LC:ch:allen-christopher>, nil, nil, @14, nil, nil }), ({ "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "merry", 6, 1, nil, nil, "virgin" }), ({ "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "/kernel/lib/auto", "call_trace", 524, 0 }) })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#previous\_object"&gt;previous\_object&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### capitalize

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;capitalize&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;capitalize(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Make sure the first letter of str is capitalized. &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    "zell" -> "Zell"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#lower\_case"&gt;lower\_case&lt;/a&gt;, &lt;a
href="\#upper\_case"&gt;upper\_case&lt;/a&gt;, &lt;a
href="\#decapitalize"&gt;decapitalize&lt;/a&gt; and &lt;a
href="\#proper"&gt;proper&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### cardinal

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;cardinal&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;cardinal(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Convert a string expression of a cardinal number into an integer value.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: cardinal( "one" )
    Merry result: 1

    Merry code: cardinal( "five" )
    Merry result: 5

    Merry code: cardinal( "fiftytwo" )
    Merry result: 52

    Merry code: cardinal( "ninetynine" )
    Merry result: 99

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ordinal"&gt;ordinal&lt;/a&gt;, &lt;a
href="\#desc\_ordinal"&gt;desc\_ordinal&lt;/a&gt; and &lt;a
href="\#desc\_cardinal"&gt;desc\_cardinal&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### catch

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;catch&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;catch(&lt;/font&gt;&lt;font
class="args"&gt;expression&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Execute the code for until an error results, or until execution is
complete. If an error resulted, catch() will return the error message as
a string; otherwise, it will return 0.&lt;br/&gt;Note: catch() is not a
real kfun. catch(a, b) will evaluate the expression (a, b), rather than
"call catch() with arguments a and b".&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#error"&gt;error&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### ceil

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;ceil&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;float&lt;/font&gt;
&lt;font class="fun"&gt;ceil(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; float

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Round the argument
towards positive infinity.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt;

&lt;td valign="top"&gt;

    Merry code: ceil(14.1)
    Merry result: 15.0

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#floor"&gt;floor&lt;/a&gt; and &lt;a
href="\#fmod"&gt;fmod&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### char\_to\_string

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;char\_to\_string&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;&lt;/font&gt; &lt;font
class="fun"&gt;char\_to\_string(&lt;/font&gt;&lt;font
class="args"&gt;int ch&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:**

&lt;/td&gt; &lt;td valign="top"&gt; Convert a numeric character code
value into a string. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: char_to_string( 'A' )
    Merry result: "A"

    Merry code: char_to_string( 65 )
    Merry result: "A"

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### clear\_by\_int

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;clear\_by\_int&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;void&lt;/font&gt;
&lt;font class="fun"&gt;clear\_by\_int(&lt;/font&gt;&lt;font
class="args"&gt;mapping bigmap, int ix&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; void

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Clear the value in
&lt;bigmap&gt; for the indice specified using integer identifier
&lt;ix&gt;, effectively removing the map entry altogether. &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#get\_by\_int"&gt;get\_by\_int&lt;/a&gt;,
&lt;a href="\#set\_by\_int"&gt;set\_by\_int&lt;/a&gt;,

&lt;a href="\#get\_by\_ob"&gt;get\_by\_ob&lt;/a&gt;, &lt;a
href="\#set\_by\_ob"&gt;set\_by\_ob&lt;/a&gt;,

&lt;a href="\#clear\_by\_ob"&gt;clear\_by\_ob&lt;/a&gt;, &lt;a
href="\#get\_by\_str"&gt;get\_by\_str&lt;/a&gt;,

&lt;a href="\#set\_by\_str"&gt;set\_by\_str&lt;/a&gt; and &lt;a
href="\#clear\_by\_str"&gt;clear\_by\_str&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### clear\_by\_ob

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;clear\_by\_ob&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;clear\_by\_ob(&lt;/font&gt;&lt;font
class="args"&gt;mapping bigmap, object ob&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Clear the value in &lt;bigmap&gt; for the indice
specified using object identifier &lt;ob&gt;, effectively removing the
map entry altogether.

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#get\_by\_int"&gt;get\_by\_int&lt;/a&gt;,
&lt;a href="\#set\_by\_int"&gt;set\_by\_int&lt;/a&gt;,

&lt;a href="\#clear\_by\_int"&gt;clear\_by\_int&lt;/a&gt;, &lt;a
href="\#get\_by\_ob"&gt;get\_by\_ob&lt;/a&gt;,

&lt;a href="\#set\_by\_ob"&gt;set\_by\_ob&lt;/a&gt;, &lt;a
href="\#clear\_by\_ob"&gt;clear\_by\_ob&lt;/a&gt;,

&lt;a href="\#get\_by\_str"&gt;get\_by\_str&lt;/a&gt;, &lt;a
href="\#set\_by\_str"&gt;set\_by\_str&lt;/a&gt; and &lt;a
href="\#clear\_by\_str"&gt;clear\_by\_str&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### clear\_by\_str

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;clear\_by\_str&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;clear\_by\_str(&lt;/font&gt;&lt;font
class="args"&gt;mapping bigmap, string str&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Clear the value in &lt;bigmap&gt; for the indice
specified using string identifier &lt;str&gt;, effectively removing the
map entry altogether.

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#get\_by\_int"&gt;get\_by\_int&lt;/a&gt;,
&lt;a href="\#set\_by\_int"&gt;set\_by\_int&lt;/a&gt;,

&lt;a href="\#clear\_by\_int"&gt;clear\_by\_int&lt;/a&gt;, &lt;a
href="\#get\_by\_ob"&gt;get\_by\_ob&lt;/a&gt;,

&lt;a href="\#set\_by\_ob"&gt;set\_by\_ob&lt;/a&gt;, &lt;a
href="\#clear\_by\_ob"&gt;clear\_by\_ob&lt;/a&gt;,

&lt;a href="\#get\_by\_str"&gt;get\_by\_str&lt;/a&gt; and &lt;a
href="\#set\_by\_str"&gt;set\_by\_str&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### comma

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;comma&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;comma(&lt;/font&gt;&lt;font class="args"&gt;int
num&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Make num readable by inserting a comma after every
third digit. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: comma( 1344266 )
    Merry result: "1,344,266"

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### contains

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:**

&lt;/td&gt; &lt;td&gt;contains&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;contains(&lt;/font&gt;&lt;font class="args"&gt;string
str, string sub&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; If sub is a sub-string of str, return TRUE, else
FALSE.&lt;br/&gt;That is, if str contains sub.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: contains( "foobar", "ob" )
    Merry result: TRUE

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#sscanf"&gt;sscanf&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### copy

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;copy&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;copy(&lt;/font&gt;&lt;font class="args"&gt;mixed
var&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; mixed &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
The copy() function is useful when modifying for instance arrays and/or
mappings, to avoid harming the original source. VAR = ARRAY does not
instantly create a copy of ARRAY, which means there is a slight chance
that modifying VAR will also modify ARRAY (the original source).
&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: copy( "abc" )
    Merry result: "abc
    Merry code: copy( ({ "a", "b", "c" }) )
    Merry result: ({ "a", "b", "c" })
    Merry code: copy( $actor )
    Merry result: <Marrach:players:K:kalle>

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### cos

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;cos&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;cos(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the cosine of the argument.&lt;br/&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: cos(0.0)
    Merry result: 1.0

    Merry code: cos(0.5)
    Merry result: 0.87758256

    Merry code: cos(1.0)
    Merry result: 0.54030231

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#sin"&gt;sin&lt;/a&gt;
and &lt;a href="\#kfun"&gt;kfun&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### cosh

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;cosh&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;float&lt;/font&gt;
&lt;font class="fun"&gt;cosh(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; float

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Return the
hyperbolic cosine of the argument.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt;

&lt;td valign="top"&gt;

    Merry code: cosh(0.0)
    Merry result: 1.0

    Merry code: cosh(0.5)
    Merry result: 1.127626

    Merry code: cosh(1.0)
    Merry result: 1.5430806

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#sinh"&gt;sinh&lt;/a&gt; and &lt;a
href="\#tanh"&gt;tanh&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### crypt

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;crypt&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;varargs string&lt;/font&gt; &lt;font
class="fun"&gt;crypt(&lt;/font&gt;&lt;font class="args"&gt;string
passwd, string salt&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; varargs string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Encrypt a password, of which only
the first 8 characters are significant. If the optional second argument
is given, its first two characters are used to perturb the encryption
algorithm additionally; without one, the encryption is perturbed
randomly. The returned string is 13 characters long, the first two of
which are equal to the used salt.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt;

**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: crypt("test")
    Merry result: "MKfcAguU0/rhs"

    Merry code: crypt("test", "te")
    Merry result: "teH0wLIpW0gyQ"

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### ctime

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;ctime&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;ctime(&lt;/font&gt;&lt;font class="args"&gt;int
clock&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Convert the specified time, which is an integer such as is returned by
the kfun time(), into a string of the form "Tue Aug 3 14:40:18
1993".&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: ctime(0)
    Merry result: "Wed Dec 31 19:00:00 1969"

    Merry code: ctime(time())
    Merry result: "Fri Apr  4 19:38:09 2003"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt; and &lt;a
href="\#rfc\_1123\_date"&gt;rfc\_1123\_date&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

## D

### days

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;days&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;days(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Generate a string value representation of the amount of days and hours
since Jan 1st, 1970. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: days( time() )
    Merry result: "12203 d, 12 h"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;,

&lt;a href="\#humanized\_date"&gt;humanized\_date&lt;/a&gt;, &lt;a
href="\#rfc\_1123\_date"&gt;rfc\_1123\_date&lt;/a&gt; and &lt;a
href="\#smalltime"&gt;smalltime&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### decapitalize

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;decapitalize&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt;
&lt;font class="fun"&gt;decapitalize(&lt;/font&gt;&lt;font
class="args"&gt;string str&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; string

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Make sure the first
letter of str is lower case. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    "Chocolate" -> "chocolate"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#lower\_case"&gt;lower\_case&lt;/a&gt;, &lt;a
href="\#upper\_case"&gt;upper\_case&lt;/a&gt;,

&lt;a href="\#capitalize"&gt;capitalize&lt;/a&gt; and &lt;a
href="\#proper"&gt;proper&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### desc\_cardinal

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;desc\_cardinal&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;desc\_cardinal(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Describe the cardinal n in English. &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    123 -> "one hundred twenty-three"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#desc\_ordinal"&gt;desc\_ordinal&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;/table&gt;

### desc\_ordinal

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;desc\_ordinal&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt;
&lt;font class="fun"&gt;desc\_ordinal(&lt;/font&gt;&lt;font
class="args"&gt;int n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Describe the
ordinal n in English. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    123 -> "one hundred twenty-third"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#desc\_cardinal"&gt;desc\_cardinal&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### Describe

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Describe&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;Describe(&lt;/font&gt;&lt;font class="args"&gt;object
o&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Describe() is used to get string
descriptions of objects, like $actor, $target, etc. in a merry script.
&lt;br/&gt;It can take multiple objects simultaneously as ({ object one,
object two, ... }). &lt;br/&gt;It can take an optional second parameter
which will describe o in objective form. &lt;br/&gt;If the second param
is nil and the third parameter is o, Describe() will describe in first
person (you). &lt;br/&gt;If both the second and third parameters are o,
Describe() will describe in possessive first person (yourself).
&lt;br/&gt;The fourth parameter is a flag that can optionally be set to:
&lt;br/&gt;STYLE\_NONPOSS /\* don't do the 'his frog' thing **/
&lt;br/&gt;STYLE\_DEFINITE /** the frog **/ &lt;br/&gt;STYLE\_REL\_LOC
/** the frog in his bag **/ &lt;br/&gt;STYLE\_FIRST\_PERSON /** the frog
in your bag \*/

&lt;br/&gt;STYLE\_REDUCE\_CHUNK /\* avoid look frogs -&gt; four frogs
**/ &lt;br/&gt;STYLE\_PRONOUN /** allow i.e. 'yourself' vs 'you' **/
&lt;br/&gt;STYLE\_NOCLUSTER /** (undocumented) **/
&lt;br/&gt;STYLE\_NO\_SHOW\_INVIS /** don't show unseen objects **/
&lt;br/&gt;STYLE\_WEAK\_LOOKER /** don't replace Zell with You **/
&lt;br/&gt;STYLE\_IGNORE\_VISIBILITY /** ignores luminosity from the
actors p.o.v. \*/ &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Examples using the first and second parameters:
    Describe( $actor ) -> "StoryCoder Kalle"
    Describe( $actor, $actor ) -> "him"
    Describe( $actor, nil, $actor ) -> "you"
    Describe( $actor, $actor, $actor ) -> "yourself"

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### dgd\_version

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;dgd\_version&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: dgd_version()
    Merry result: 12071

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### do

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;do&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Do..while loops work exactly like while-loops except
that the condition is checked AFTER the block is executed, rather than
before. This means the block will be executed at least once regardless.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Example #1:
    -----------
    int i;

    i = 0;
    do {
    i ++;
    EmitTo( $actor, "i is now "+Str(i) );
    } while( i < 10 );
    EmitTo( $actor, Str(i)+" is NOT less than 10, so the do..while-loop has ended." );
    ----------

    Result:
    -------
    i is now 1
    i is now 2
    i is now 3
    i is now 4
    i is now 5
    i is now 6
    i is now 7
    i is now 8
    i is now 9
    i is now 10
    10 is NOT less than 10, so the do..while-loop has ended.
    -------

    Example #2:
    -----------
    int i = 0;
    do {
    i++;
    EmitTo( $actor, "i is "+Str(i) );
    } while( FALSE );
    EmitTo( $actor, "Loop has ended with i at "+Str(i)+"." );
    ----------

    Result:
    -------
    i is 1
    Loop has ended with i at 1.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#for"&gt;for&lt;/a&gt;
and &lt;a href="\#while"&gt;while&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### dump\_value

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;dump\_value&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;dump\_value(&lt;/font&gt;&lt;font class="args"&gt;mixed
value&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Convert any property into a string value. &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: dump_value( $actor )
    Merry result: "<Marrach:players:K:kalle>"

    Merry code: dump_value( args )
    Merry result: "([ \"actor\":<Marrach:players:K:kalle>, \"body\":<Marrach:players:K:kalle>, \"here\":<Marrach:Coders:kalle:rooms:home>, \"looker\":<Marrach:players:K:kalle>, \"this\":<Marrach:players:K:kalle> ])"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ascii\_to\_mixed"&gt;ascii\_to\_mixed&lt;/a&gt; and &lt;a
href="\#mixed\_to\_ascii"&gt;mixed\_to\_ascii&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### Duplicate

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;Duplicate&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;object&lt;/font&gt; &lt;font
class="fun"&gt;Duplicate(&lt;/font&gt;&lt;font class="args"&gt;object
ob&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; object &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

This function makes a copy of an existing object, just like the
"Duplicate" button in WOE works.&lt;br/&gt;For a merryized version of
+spawn, check out Spawn(). &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    $copy_of_Generic_drink_mug_coffee = Duplicate( ${Generic:drink:mug-coffee} );
    $copy_of_Generic_drink_mug_coffee."base:objectname" = "Marrach:Coders:kalle:my_own_coffee_object";

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#Spawn"&gt;Spawn&lt;/a&gt; and &lt;a
href="\#Slay"&gt;Slay&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

## E

### EmitIn

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;EmitIn&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;EmitIn(&lt;/font&gt;&lt;font class="args"&gt;object o,
string s, object exclude\_one, object exclode\_another,
...&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt;

&lt;td valign="top"&gt;

    Merry command to emit a string of text into an environment, such as a room.
    Example:
    EmitIn( $actor."base:environment", "This goes to everyone in the same room as $actor." );
    EmitIn( $actor."base:environment", "This also goes to everyone in $actor's presence, except $actor himself.", $actor );

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#EmitTo"&gt;EmitTo&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### EmitTo

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;EmitTo&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;void&lt;/font&gt;
&lt;font class="fun"&gt;EmitTo(&lt;/font&gt;&lt;font
class="args"&gt;object o, string s&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; void

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Merry command to
emit a string of text to a single object. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    EmitTo( $actor, "Tag! You're it!" );

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#EmitIn"&gt;EmitIn&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### error

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;error&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;error(&lt;/font&gt;&lt;font class="args"&gt;string
errormessage&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Cause an error, which will stop
execution. If the error is caught, execution will continue after the
catch.&lt;br/&gt;&lt;br/&gt;Note that error() and Error() -- with only
error() documented here -- do the exact same thing. &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt;

&lt;td valign="top"&gt; &lt;a href="\#catch"&gt;catch&lt;/a&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### Every

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Every&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;Every(&lt;/font&gt;&lt;font class="args"&gt;string
script, int frequency&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Every() is used to
create an infinitely looping process.&lt;br/&gt;It returns an identifier
string for the process it creates, and it takes two
arguments,&lt;br/&gt;- the timer:-script to execute&lt;br/&gt;- the
frequency in seconds&lt;br/&gt;&lt;br/&gt;There is no need to do any
loops on your own, like while( TRUE ){ ... }, when using Every(), but
take note that the script is actually halted, and all variables it uses
are reset each time it's called.&lt;br/&gt;It is also very important to
keep track of the identifier string it returns, as without it you cannot
ever turn off the loop.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    [Also see C. Allen's example torch at: Examples:complete:light:torch]

    Example script timer:my_loop
    ----------------------------
    /* my_loop is executed once every Nth second, specified
    in the Every() call below. */
    EmitTo( ${Marrach:players:K:kalle}, "Alive and kicking!" );
    /* $actor isn't defined here, so we emit directly instead */
    ----------------------------

    Example script lib:start_my_loop
    --------------------------------
    /* To make sure we don't "screw up" and lose an identifier, we check if a loop is running already, and stop it automagically on our own if it is */
    if( $actor."my_loop:identifier" ) Call( this, "stop_my_loop" );

    EmitTo( $actor, "Initiating loop. Call stop_my_loop to stop it!" );
    $actor."my_loop:identifier" = Every( "my_loop", 60 );
    /* we must remember that identifier...! */
    --------------------------------

    Example script lib:stop_my_loop
    -------------------------------
    EmitTo( $actor, "Stopping loop!" );
    if( !$actor."my_loop:identifier" ){
    EmitTo( $actor, "Whoops! No loop found!" );
    return FALSE;
    }
    Stop( $actor."my_loop:identifier" );
    $actor."my_loop:identifier" = nil;
    EmitTo( $actor, "Done!" );
    -------------------------------

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#Stop"&gt;Stop&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### exp

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;exp&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;exp(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; float &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
Return the exponential value of the given argument.&lt;br/&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: exp(0.0)
    Merry result: 1.0

    Merry code: exp(0.5)
    Merry result: 1.6487213

    Merry code: exp(1.0)
    Merry result: 2.7182818

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#log"&gt;log&lt;/a&gt;,
&lt;a href="\#log10"&gt;log10&lt;/a&gt; and &lt;a
href="\#pow"&gt;pow&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### explode

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;explode&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string \*&lt;/font&gt; &lt;font
class="fun"&gt;explode(&lt;/font&gt;&lt;font class="args"&gt;string str,
string separator&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string \* &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return an array of substrings of str, divided by the given
separator.&lt;br/&gt;The separators that str starts and ends with, if
any, are not taken into account.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: explode("This is a test"," ")
    Merry result: ({ "This", "is", "a", "test" })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#implode"&gt;implode&lt;/a&gt;, &lt;a
href="\#sscanf"&gt;sscanf&lt;/a&gt; and &lt;a
href="\#parse\_string"&gt;parse\_string&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

## F

### fabs

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;fabs&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;fabs(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the absolute value of the argument.&lt;br/&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: fabs(-14.9)
    Merry result: 14.9

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### find\_object

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;find\_object&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;object&lt;/font&gt; &lt;font
class="fun"&gt;find\_object(&lt;/font&gt;&lt;font class="args"&gt;string
obj&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; object
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; The string argument
is resolved as a file path, and the object with the resulting name is
searched for. Either the object, if found, or zero is
returned.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: find_object("/base/obj/thing#4803")
    Merry result: <Chatters:LC:ch:allen-christopher>

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#object\_name"&gt;object\_name&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### FindMerry

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;FindMerry&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;object&lt;/font&gt; &lt;font
class="fun"&gt;FindMerry(&lt;/font&gt;&lt;font class="args"&gt;object
src, string type, string name&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; object &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
FindMerry is used in cases where it is imperative to figure out 1)
whether a particular Merry script is present in an object, and/or 2)
where that Merry script is located. &lt;br/&gt;

&lt;br/&gt;As objects may have references for Merry scripts (aka
"inherits"), the actual location of the script itself is at times not
equal to the object nor either of its UrParents. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: FindMerry( $actor, "react-post", "hit-dob" )
    Merry result: <MGeneric:UrHuman>

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### first\_elements

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;first\_elements&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;mixed \*&lt;/font&gt;
&lt;font class="fun"&gt;first\_elements(&lt;/font&gt;&lt;font
class="args"&gt;mixed arr, int num&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; mixed \*

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Retrieve
&lt;num&gt; number of elements from &lt;arr&gt;, starting at the
beginning and moving toward the end resulting in the first &lt;num&gt;
values of &lt;arr&gt;.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: first_elements( ({ "1", "2", "3", "4" }), 2 )
    Merry result: ({ "1", "2" })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#last\_elements"&gt;last\_elements&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### flatten

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;flatten&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;array&lt;/font&gt; &lt;font
class="fun"&gt;flatten(&lt;/font&gt;&lt;font class="args"&gt;mixed
\*\*value&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; array &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
Convert a two-dimensional array -- e.g. ({ ({ 1 }) }) -- to a regular
array through the use of the flatten() function. &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: flatten( ({ ({ "A1", "B1", "C1" }), ({ "A2", "B2", "C2" }) }) )
    Merry result: ({ "A1", "B1", "C1", "A2", "B2", "C2" })

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### flatten\_structmap

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;flatten\_structmap&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### floor

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;floor&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;floor(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Round the argument towards negative
infinity.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: floor(14.9)
    Merry result: 14.0

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ceil"&gt;ceil&lt;/a&gt; and &lt;a
href="\#fmod"&gt;fmod&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### Flt

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Flt&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;float&lt;/font&gt;
&lt;font class="fun"&gt;Flt(&lt;/font&gt;&lt;font class="args"&gt;mixed
value&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; float

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Convert an
appropriate value to a float.&lt;br/&gt;Note that this does not work
with all properties.&lt;br/&gt;- Strings must begin with a numeric
character, and are truncated at the first non-numeric character (except
points ('.')), including e.g. '+', '-', e.t.c.&lt;br/&gt;- All floats
and integers are applicable.&lt;br/&gt;- No objects, arrays or mappings
are applicable. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt;

**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Flt( 3 ) -> 3.0
    Flt( 3+3 ) -> 6.0
    Flt( 3.14 ) -> 3.14
    Flt( "5.9" ) -> 5.9
    Flt( "15" ) -> 15.0
    Flt( "123 muffins" ) -> 123.0
    Flt( "5+5" ) -> 5.0
    Flt( nil ) -> 0.0
    Flt( "Muffin" ) -> ERROR: cannot convert value to float
    Flt( $actor."base:intrinsiccapacity" ) -> 10.0
    Flt( $actor."base:actualcapacity" ) -> 9.8574127

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#Int"&gt;Int&lt;/a&gt;,
&lt;a href="\#Str"&gt;Str&lt;/a&gt;, &lt;a
href="\#dump\_value"&gt;dump\_value&lt;/a&gt;,

&lt;a href="\#mixed\_to\_ascii"&gt;mixed\_to\_ascii&lt;/a&gt; and &lt;a
href="\#ascii\_to\_mixed"&gt;ascii\_to\_mixed&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### fmod

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;fmod&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;fmod(&lt;/font&gt;&lt;font class="args"&gt;float x, float
y&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the value f, for which there exists an integer k
such that&lt;br/&gt;k \* y + f == x, f has the same sign of x, and the
absolute value of&lt;br/&gt;f is less than the absolute value of
y.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: fmod(25.0,5.0)
    Merry result: 0.0

    Merry code: fmod(25.0,6.0)
    Merry result: 1.0

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#ceil"&gt;ceil&lt;/a&gt; and &lt;a
href="\#floor"&gt;floor&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### foo

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:**

&lt;/td&gt; &lt;td&gt;foo&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### for

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:**

&lt;/td&gt; &lt;td&gt;for&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;&lt;/font&gt; &lt;font
class="fun"&gt;for(&lt;/font&gt;&lt;font class="args"&gt;&lt;once&gt;;
&lt;check&gt;; &lt;do&gt;&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;

&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; for-loops are essentially a compression of the
following:&lt;br/&gt;---&lt;br/&gt;/\* for( &lt;x&gt;; &lt;y&gt;;
&lt;z&gt; ){ &lt;code&gt; } \*/&lt;br/&gt;&lt;x&gt;;&lt;br/&gt;while(
&lt;y&gt;
){&lt;br/&gt;&lt;code&gt;&lt;br/&gt;&lt;z&gt;;&lt;br/&gt;}&lt;br/&gt;---&lt;br/&gt;&lt;br/&gt;They
are traditional and frequently occuring in almost all programming
languages. If the concept of for-loops still elude you, you may wish to
look around on the internet for other, more verbose explanations.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Example #1:
    -----------
    int step;
    for( step = 0; step < 10; step ++ ){
    EmitTo( $actor, "Taking step "+Str( step ));
    }
    EmitTo( $actor, "Done stepping. 'step' is now: "+Str( step ));
    ----------

    Result:
    -------
    Taking step 0
    Taking step 1
    Taking step 2
    Taking step 3
    Taking step 4
    Taking step 5
    Taking step 6
    Taking step 7
    Taking step 8
    Taking step 9
    Done stepping. 'step' is now: 10
    -------

    Example #2:
    -----------
    int i;

    $colors = ({ "red", "green", "blue", "turquoise", "pink", "yellow" })

    EmitTo( $actor, "These colors are available:" );
    for( i = 0; i < sizeof( $colors ); i++ ){
    EmitTo( $actor, $colors[i] );
    }
    -----------

    Result:
    -------
    These colors are available:
    red
    green
    blue
    turquoise
    pink
    yellow
    -------

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#while"&gt;while&lt;/a&gt; and &lt;a
href="\#do"&gt;do&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### format\_float

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;format\_float&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;format\_float(&lt;/font&gt;&lt;font class="args"&gt;float
f, int dec&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return f such that the result has dec decimal points. &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: format_float( 0.3, 4 )
    Merry result: "0.3000"

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### frexp

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;frexp&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;mixed \*&lt;/font&gt; &lt;font
class="fun"&gt;frexp(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; mixed \* &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; The argument is split into a
fraction f and an integer exponent n, such that either f == 0.0, or 0.5
&lt;= \| f \| &lt; 1.0, and f \* 2 \*\* n == x.&lt;br/&gt;({ f, n }) is
returned. If x == 0.0, both f and n will be zero.&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: frexp(1.0)
    Merry result: ({ 0.5, 1 })

    Merry code: frexp(1.1)
    Merry result: ({ 0.55, 1 })

    Merry code: frexp(1.5)
    Merry result: ({ 0.75, 1 })

    Merry code: frexp(2.0)
    Merry result: ({ 0.5, 2 })

    Merry code: frexp(5.0)
    Merry result: ({ 0.625, 3 })

    Merry code: frexp(10.0)
    Merry result: ({ 0.625, 4 })

    Merry code: frexp(100.0)
    Merry result: ({ 0.78125, 7 })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ldexp"&gt;ldexp&lt;/a&gt; and &lt;a
href="\#modf"&gt;modf&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### full\_explode

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;full\_explode&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string \*&lt;/font&gt; &lt;font
class="fun"&gt;full\_explode(&lt;/font&gt;&lt;font
class="args"&gt;string str, string del&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string \* &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: full_explode( "|foo|", "|" )
    Merry result: ({ "", "foo", "" })

    (compared to)

    Merry code: explode( "|foo|", "|" )
    Merry result: ({ "foo" })

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#explode"&gt;explode&lt;/a&gt; and &lt;a
href="\#implode"&gt;implode&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

## G

### Get

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Get&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;Get(&lt;/font&gt;&lt;font class="args"&gt;object ob,
string property&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Get() is used to retrieve a property from an object. It has a built-in
shorter syntax as well,&lt;br/&gt;&lt;br/&gt;Get( x, "y" ) -&gt;
x."y"&lt;br/&gt;&lt;br/&gt;The shorter version only works if y is an
absolute string value ("abc" is absolute, $property is not), otherwise
the Get() function must be used. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    $foo = Get( ob, "prop" ); /* Get the property "prop" from the object ob */
    $foo = Get( $actor, "prop" ); /* Get the property "prop" from the actor */
    $propertyName = "appearance:eyecolor";
    $eye = Get( $actor, $propertyName ); /* Get the property "appearance:eyecolor" (as defined in $propertyName) from $actor */
    $otherProperty = "skin";
    $skin = Get( $actor, "appearance:" + $otherProperty ); /* Get "appearance:skin" (whereas 'skin' is defined in $otherProperty) from $actor.

    $foo = ob."prop"; /* Get property "prop" from object ob (yes, exactly like above) */
    $foo = $actor."prop"; /* Get "prop" from actor */

    Currently, x = Get( y, "z" ); can be shortened to x = y."z";
    But this only works if the property name argument (z) is absolute. That is, we cannot: x = y.$foo;

&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt;
&lt;td valign="top"&gt; &lt;a href="\#Set"&gt;Set&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### get\_by\_int

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;get\_by\_int&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;get\_by\_int(&lt;/font&gt;&lt;font
class="args"&gt;mapping bigmap, int ix&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Get a value from a bigmap mapping from a bigmap indice specified using
an integer identifier. &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#set\_by\_int"&gt;set\_by\_int&lt;/a&gt;,
&lt;a href="\#clear\_by\_int"&gt;clear\_by\_int&lt;/a&gt;,

&lt;a href="\#get\_by\_ob"&gt;get\_by\_ob&lt;/a&gt;, &lt;a
href="\#set\_by\_ob"&gt;set\_by\_ob&lt;/a&gt;,

&lt;a href="\#clear\_by\_ob"&gt;clear\_by\_ob&lt;/a&gt;, &lt;a
href="\#get\_by\_str"&gt;get\_by\_str&lt;/a&gt;,

&lt;a href="\#set\_by\_str"&gt;set\_by\_str&lt;/a&gt; and &lt;a
href="\#clear\_by\_str"&gt;clear\_by\_str&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### get\_by\_ob

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;get\_by\_ob&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;get\_by\_ob(&lt;/font&gt;&lt;font class="args"&gt;mapping
bigmap, object ob&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Get a value from a bigmap mapping from a bigmap indice
specified using an object identifier. &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#get\_by\_int"&gt;get\_by\_int&lt;/a&gt;, &lt;a
href="\#set\_by\_int"&gt;set\_by\_int&lt;/a&gt;,

&lt;a href="\#clear\_by\_int"&gt;clear\_by\_int&lt;/a&gt;, &lt;a
href="\#set\_by\_ob"&gt;set\_by\_ob&lt;/a&gt;,

&lt;a href="\#clear\_by\_ob"&gt;clear\_by\_ob&lt;/a&gt;, &lt;a
href="\#get\_by\_str"&gt;get\_by\_str&lt;/a&gt;,

&lt;a href="\#set\_by\_str"&gt;set\_by\_str&lt;/a&gt; and &lt;a
href="\#clear\_by\_str"&gt;clear\_by\_str&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### get\_by\_str

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;get\_by\_str&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;get\_by\_str(&lt;/font&gt;&lt;font
class="args"&gt;mapping bigmap, string str&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Get a value from a bigmap mapping from a bigmap indice
specified using a string identifier. &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#get\_by\_int"&gt;get\_by\_int&lt;/a&gt;, &lt;a
href="\#set\_by\_int"&gt;set\_by\_int&lt;/a&gt;,

&lt;a href="\#clear\_by\_int"&gt;clear\_by\_int&lt;/a&gt;, &lt;a
href="\#get\_by\_ob"&gt;get\_by\_ob&lt;/a&gt;,

&lt;a href="\#set\_by\_ob"&gt;set\_by\_ob&lt;/a&gt;, &lt;a
href="\#clear\_by\_ob"&gt;clear\_by\_ob&lt;/a&gt;,

&lt;a href="\#set\_by\_str"&gt;set\_by\_str&lt;/a&gt; and &lt;a
href="\#clear\_by\_str"&gt;clear\_by\_str&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### get\_day

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;get\_day&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;get\_day(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Derive the month day from the UNIX timestamp &lt;n&gt;
and return this as an integer value. &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: "Day of the month: " + get_day( time() )
    Merry result: "Day of the month: 12"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;,

&lt;a href="\#smalltime"&gt;smalltime&lt;/a&gt;, &lt;a
href="\#get\_month"&gt;get\_month&lt;/a&gt;,

&lt;a href="\#get\_year"&gt;get\_year&lt;/a&gt;, &lt;a
href="\#get\_hour"&gt;get\_hour&lt;/a&gt;,

&lt;a href="\#get\_minute"&gt;get\_minute&lt;/a&gt;, &lt;a
href="\#get\_second"&gt;get\_second&lt;/a&gt; and &lt;a
href="\#calculate\_stamp"&gt;calculate\_stamp&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### get\_hour

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;get\_hour&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;get\_hour(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the hour as specified in the UNIX timestamp
&lt;n&gt; as an integer value. &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: "Current hour: " + get_hour( time() )
    Merry result: "Current hour: 7"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;,

&lt;a href="\#smalltime"&gt;smalltime&lt;/a&gt;, &lt;a
href="\#get\_day"&gt;get\_day&lt;/a&gt;,

&lt;a href="\#get\_month"&gt;get\_month&lt;/a&gt;, &lt;a
href="\#get\_year"&gt;get\_year&lt;/a&gt;,

&lt;a href="\#get\_minute"&gt;get\_minute&lt;/a&gt;, &lt;a
href="\#get\_second"&gt;get\_second&lt;/a&gt; and &lt;a
href="\#calculate\_stamp"&gt;calculate\_stamp&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### get\_minute

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;get\_minute&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;get\_minute(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the minutes passed since last new hour as
specified in the UNIX timestamp &lt;n&gt; as an integer value.
&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: "Minutes since last new hour: " + get_minute( time() )
    Merry result: "Minutes since last new hour: 40"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;,

&lt;a href="\#smalltime"&gt;smalltime&lt;/a&gt;, &lt;a
href="\#get\_day"&gt;get\_day&lt;/a&gt;,

&lt;a href="\#get\_month"&gt;get\_month&lt;/a&gt;, &lt;a
href="\#get\_year"&gt;get\_year&lt;/a&gt;,

&lt;a href="\#get\_hour"&gt;get\_hour&lt;/a&gt;, &lt;a
href="\#get\_second"&gt;get\_second&lt;/a&gt; and &lt;a
href="\#calculate\_stamp"&gt;calculate\_stamp&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### get\_month

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;get\_month&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;get\_month(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Derive the month of the year from the UNIX timestamp
&lt;n&gt; and return this as an integer value. &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: "Month of the year: " + get_month( time() )
    Merry result: "Month of the year: 5"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;,

&lt;a href="\#smalltime"&gt;smalltime&lt;/a&gt;, &lt;a
href="\#get\_day"&gt;get\_day&lt;/a&gt;,

&lt;a href="\#get\_year"&gt;get\_year&lt;/a&gt;, &lt;a
href="\#get\_hour"&gt;get\_hour&lt;/a&gt;,

&lt;a href="\#get\_minute"&gt;get\_minute&lt;/a&gt;, &lt;a
href="\#get\_second"&gt;get\_second&lt;/a&gt; and &lt;a
href="\#calculate\_stamp"&gt;calculate\_stamp&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### get\_second

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;get\_second&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;get\_second(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the seconds since last new minute as specified
in the UNIX timestamp &lt;n&gt; as an integer value. &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: "Seconds since last new minute: " + get_second( time() )
    Merry result: "Seconds since last new minute: 33"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;,

&lt;a href="\#smalltime"&gt;smalltime&lt;/a&gt;, &lt;a
href="\#get\_day"&gt;get\_day&lt;/a&gt;,

&lt;a href="\#get\_month"&gt;get\_month&lt;/a&gt;, &lt;a
href="\#get\_year"&gt;get\_year&lt;/a&gt;,

&lt;a href="\#get\_hour"&gt;get\_hour&lt;/a&gt;, &lt;a
href="\#get\_minute"&gt;get\_minute&lt;/a&gt; and &lt;a
href="\#calculate\_stamp"&gt;calculate\_stamp&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### get\_year

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;get\_year&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;get\_year(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the year as specified in the UNIX timestamp
&lt;n&gt; as an integer value. &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: get_year( time() )
    Merry result: 2004

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;,

&lt;a href="\#smalltime"&gt;smalltime&lt;/a&gt;, &lt;a
href="\#get\_day"&gt;get\_day&lt;/a&gt;,

&lt;a href="\#get\_month"&gt;get\_month&lt;/a&gt;, &lt;a
href="\#get\_hour"&gt;get\_hour&lt;/a&gt;,

&lt;a href="\#get\_minute"&gt;get\_minute&lt;/a&gt;, &lt;a
href="\#get\_second"&gt;get\_second&lt;/a&gt; and &lt;a
href="\#calculate\_stamp"&gt;calculate\_stamp&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### GetVar

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;GetVar&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;GetVar(&lt;/font&gt;&lt;font class="args"&gt;string
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; GetVar() is used to retrieve the value of a variable
with a name reference, usually used when the variable's name itself is
unresolved at compile time. &lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt;

**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    $name = "address";
    $address = "Skogsb. 27";
    EmitTo( $actor, GetVar( $name ));
    /*
     * emits "Skogsb. 27", found in $address, to $actor
     */

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#SetVar"&gt;SetVar&lt;/a&gt;, &lt;a href="\#Set"&gt;Set&lt;/a&gt;
and &lt;a href="\#Get"&gt;Get&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

## H

### hash\_crc16

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;hash\_crc16&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;hash\_crc16(&lt;/font&gt;&lt;font class="args"&gt;string
str, string extra...&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Compute the 16 bit Cyclic Redundancy Code of the
concatenation of all string arguments, with
polynomial:&lt;br/&gt;&lt;br/&gt;X^16 + X^12 + X^5 +
1&lt;br/&gt;&lt;br/&gt;CRC-16 is considered suitable for strings of up
to a total of 4096 characters.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: hash_crc16("text")
    Merry result: 49980

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#hash\_md5"&gt;hash\_md5&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### hash\_md5

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;hash\_md5&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;hash\_md5(&lt;/font&gt;&lt;font class="args"&gt;string
str, string extra...&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Compute the 128 bit
MD5 message digest of the concatenation of all string arguments. The
result is a string of 16 characters.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    (test cases as per http://www.ietf.org/rfc/rfc1321.txt )

    Merry code: to_hex(hash_md5(""))
    Merry result: "d41d8cd98f00b204e9800998ecf8427e"

    Merry code: to_hex(hash_md5("a"))
    Merry result: "0cc175b9c0f1b6a831c399e269772661"

    Merry code: to_hex(hash_md5("abc"))
    Merry result: "900150983cd24fb0d6963f7d28e17f72"

    Merry code: to_hex(hash_md5("message digest"))
    Merry result: "f96b697d7cb7938d525a2f31aaf161d0"

    Merry code: to_hex(hash_md5("abcdefghijklmnopqrstuvwxyz"))
    Merry result: "c3fcd3d76192e4007dfb496cca67e13b"

    Merry code: to_hex(hash_md5("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"))
    Merry result: "d174ab98d277d9f5a5611c2c9f419d9f"

    Merry code: to_hex(hash_md5("12345678901234567890123456789012345678901234567890123456789012345678901234567890"))
    Merry result: "57edf4a22be3c955ac49da2e2107b67a"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#hash\_crc16"&gt;hash\_crc16&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### hex\_digit

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;hex\_digit&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;hex\_digit(&lt;/font&gt;&lt;font class="args"&gt;int
nibble&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Return the hexadecimal character of
nibble, smaller than 16. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    11 -> 'b'

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#string\_to\_hex"&gt;string\_to\_hex&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### humanized\_date

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;humanized\_date&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;humanized\_date(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Extract a humanized date from a unix timestamp integer
value, such as the one retrieved from time(). &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: humanized_date( time() )
    Merry result: "8:19 AM, May 31st, 2003"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;,

&lt;a href="\#rfc\_1123\_date"&gt;rfc\_1123\_date&lt;/a&gt;, &lt;a
href="\#days"&gt;days&lt;/a&gt; and &lt;a
href="\#smalltime"&gt;smalltime&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

## I

### if

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;if&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;&lt;/font&gt; &lt;font
class="fun"&gt;if(&lt;/font&gt;&lt;font
class="args"&gt;&lt;condition&gt;&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt;

&lt;td valign="top"&gt; Mastering if-statements is an absolute necessity
for any programmer of almost any language.&lt;br/&gt;If-statements occur
regularly and are used to control and specify how a piece of code should
react and handle various 'situations' (conditions) by scanning
conditions and variables and acting based on the
results.&lt;br/&gt;Below are a good amount of examples describing a good
amount (but not all) of the various ways if-cases can be used in
merry.&lt;br/&gt;Take note, however, that things such as AND, OR, etc.
are not exclusively used in if-statements (hence, it's not at all a bad
idea to learn them all as soon as you can). &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Example #1: (simple if)
    -----------
    if( 1 + 1 == 2 ) EmitTo( $actor, "Believe it or not! 1+1 is 2!" );
    /* note that we use two equal-signs ('=='), since one ('=') is reserved for setting properties (like $a = 2) */
    -----------

    Result:
    -------
    Believe it or not! 1+1 is 2!
    -------

    Example #2: (not equals)
    -----------
    if( "abc" != "def" ) EmitTo( $actor, "'abc' is not 'def'" ); /* TRUE */
    if( 123 != 456 )      EmitTo( $actor, "123 is not 456." );   /* TRUE */
    if( 1+2+3+4 != 10 )  EmitTo( $actor, "1+2+3+4 is not 10." ); /* FALSE */
    /* == means equals. != means NOT equals, thus in the above if statements, we're asking if the left value is NOT equal to the right value */
    -----------

    Result:
    -------
    'abc' is not 'def'
    123 is not 456.
    -------

    Example #3: (less than, greater than, less/greater than or equal to)
    -----------
    if( 5 + 5 > 10 ) EmitTo( $actor, "5+5 is greater than 10" ); /* FALSE */
    if( 10*3 > 20 ) EmitTo( $actor, "10 times 3 is greater than 20" ); /* TRUE */
    if( 50 / 5 < 20 ) EmitTo( $actor, "50 divided by 5 is less than 20" ); /* TRUE */
    if( 10 >= 5 + 5 ) EmitTo( $actor, "10 is more than or equal to 5+5" ); /* TRUE */
    if( 50 <= 25 * 2 ) EmitTo( $actor, "50 is less than or equal to 25*2" ); /* TRUE */
    -----------

    Result:
    -------
    10 times 3 is greater than 20
    50 divided by 5 is less than 20
    10 is more than or equal to 5+5
    50 is less than or equal to 25*2
    -------

    Example #4: (if ... else ...)
    -----------
    if( 10 > 20 ) {
    EmitTo( $actor, "10 is more than 20." ); /* wrong */
    } else {
    EmitTo( $actor, "10 isn't more than 20." ); /* right */
    }
    if( "George" == "James" ) {
    EmitTo( $actor, "George is James." ); /* wrong */
    } else {
    EmitTo( $actor, "George is not James." ); /* right */
    }
    -----------

    Result:
    -------
    10 isn't more than 20.
    George is not James.
    -------

    Example #5: (multiple condition prerequisites; AND)
    -----------
    if( 1 + 2 == 3 && 5 > 4 ) EmitTo( $actor, "1+2 is 3, and 5 is more than 4." ); /* TRUE */
    if( 5 == 2 + 3 && "kalle" == "you" ) EmitTo( $actor, "5 is 2+3 and 'kalle' is 'you'." ); /* FALSE */
    if( 1+1 == 2 && 1+2 == 3 && 10*10 == 100 ) EmitTo( $actor, "1+1 is 2, 1+2 is 3 and 10*10 is 100." ); /* TRUE */
    /* && represents AND */
    -----------

    Result:
    -------
    1+2 is 3, and 5 is more than 4.
    1+1 is 2, 1+2 is 3 and 10*10 is 100.
    -------

    Example #6: (multiple condition prerequisites; OR)
    -----------
    if( "kalle" == "you" || "you" == "you" ) EmitTo( $actor, "Either 'kalle' is 'you', or 'you' is 'you'." ); /* TRUE */
    if( 50 - 1 == 40 || 9 > 9 || 1+2+3 == 6 ) EmitTo( $actor, "50-1 is 40, or 9 is more than 9, or 1+2+3 is 6. Either one works (though only one is of course true)." ); /* TRUE */
    /* || represents OR */
    -----------

    Result:
    -------
    Either 'kalle' is 'you', or 'you' is 'you'.
    50-1 is 40, or 9 is more than 9, or 1+2+3 is 6. Either one works (though only one is of course true).
    -------

    Example #7: (multiple condition prerequisites; parenthesis in if statements)
    -----------
    if( 15 == 7+8 || (1 == 2 && 2 == 3) ) EmitTo( $actor, "15 is 7+8, or 1 is 2 and 2 is 3." ); /* TRUE */
    -----------

    Result:
    -------
    15 is 7+8, or 1 is 2 and 2 is 3.
    -------

    Example #8: (variables in conditions)
    -----------
    $name = "Kalle";
    if( $name == "Kalle" ) EmitTo( $actor, "Hi Kalle!" ); else EmitTo( $actor, "You're not Kalle." );

    $number = 123;
    if( $number == 100 + 20 + 3 ) EmitTo( $actor, Str( $number )+" is 100 + 20 + 3." );

    $snack = ({ "muffin" });
    if( $snack[0] == "muffin" ) EmitTo( $actor, "Element 0 in the array $snack is 'muffin'! Mmm!" );
    if( sizeof( $snack ) > 0 ) EmitTo( $actor, "Array $snack is not empty. It has at LEAST one element." );
    -----------

    Result:
    -------
    Hi Kalle!
    123 is 100 + 20 + 3.
    Element 0 in the array $snack is 'muffin'! Mmm!
    Array $snack is not empty. It has at LEAST one element.
    -------

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#switch"&gt;switch&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### implode

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;implode&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;implode(&lt;/font&gt;&lt;font class="args"&gt;string
\*arr, string separator&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return a string, consisting of all string elements of the array arr
concatenated, separated by the string separator.&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: implode(({ "This", "is", "a", "test" }), " ")
    Merry result: "This is a test"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#explode"&gt;explode&lt;/a&gt;, &lt;a
href="\#sscanf"&gt;sscanf&lt;/a&gt; and &lt;a
href="\#parse\_string"&gt;parse\_string&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### In

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;In&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### index

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;index&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;The index value in &lt;a&gt; for the first
occurence of the value &lt;val&gt;.&lt;/font&gt; &lt;font
class="fun"&gt;index(&lt;/font&gt;&lt;font class="args"&gt;mixed val,
array a&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

The index value in &lt;a&gt; for the first occurence of the value
&lt;val&gt;. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; The index()
function is used to retrieve the index position in an array of the first
occurence of a value.&lt;br/&gt;index() will return the integer index
position, or -1 if the value is not found anywhere in the array.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: $array = ({ "Kalle", "Jess", "Jim", "Bob" }); EmitTo($actor, dump_value(index("Bob", $array)));
    Return value: 3
    Merry code: $array = ({ "Kalle", "Jess", "Jim", "Bob" }); EmitTo($actor, dump_value(index("George", $array)));
    Return value: -1

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#member"&gt;member&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### Int

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Int&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;Int(&lt;/font&gt;&lt;font class="args"&gt;mixed
value&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Convert an appropriate value to an
integer.&lt;br/&gt;Note that this does not work with all
properties.&lt;br/&gt;- Strings must begin with a numeric character, and
are truncated at the first non-numeric character, including e.g. '+',
'-', e.t.c. AND points ('.'), which are taken into account in
Flt().&lt;br/&gt;- All floats and integers are applicable.&lt;br/&gt;-
No objects, arrays or mappings are applicable. &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Int( 3.4 ) -> 3
    Int( 3.5 ) -> 4
    Int( 123 ) -> 123
    Int( "5.9" ) -> 5
    Int( "15" ) -> 15
    Int( "15+1" ) -> 15 /* note math operation unresolved */
    Int( "abc" ) -> ERROR: cannot convert value to integer
    Int( $actor."base:intrinsiccapacity" ) -> 10
    Int( "1" + "0" ) -> 10
    Int( "22 years old" ) -> 22
    Int( nil ) -> 0

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt;

&lt;td valign="top"&gt; &lt;a href="\#Flt"&gt;Flt&lt;/a&gt;, &lt;a
href="\#Str"&gt;Str&lt;/a&gt;, &lt;a
href="\#dump\_value"&gt;dump\_value&lt;/a&gt;,

&lt;a href="\#mixed\_to\_ascii"&gt;mixed\_to\_ascii&lt;/a&gt; and &lt;a
href="\#ascii\_to\_mixed"&gt;ascii\_to\_mixed&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

## L

### last\_elements

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;last\_elements&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;mixed \*&lt;/font&gt; &lt;font
class="fun"&gt;last\_elements(&lt;/font&gt;&lt;font
class="args"&gt;mixed arr, int num&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; mixed \* &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Retrieve &lt;num&gt; number of elements from
&lt;arr&gt;, starting at the end and moving toward the beginning
resulting in the last &lt;num&gt; values of &lt;arr&gt;.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: last_elements( ({ "1", "2", "3", "4" }), 2 )
    Merry result: ({ "3", "4" })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#first\_elements"&gt;first\_elements&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### ldexp

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;ldexp&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;ldexp(&lt;/font&gt;&lt;font class="args"&gt;float x, int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; float &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
Return the value x \* 2 \*\* n.&lt;br/&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: ldexp(4.0, 0)
    Merry result: 4.0

    Merry code: ldexp(4.0, 1)
    Merry result: 8.0

    Merry code: ldexp(4.0, 2)
    Merry result: 16.0

    Merry code: ldexp(4.0, 3)
    Merry result: 32.0

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#frexp"&gt;frexp&lt;/a&gt; and &lt;a
href="\#modf"&gt;modf&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### log

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;log&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;log(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return the natural logarithm of the argument.&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: log(0.5)
    Merry result: -0.69314718

    Merry code: log(1.0)
    Merry result: 0.0

    Merry code: log(2.0)
    Merry result: 0.69314718

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#exp"&gt;exp&lt;/a&gt;, &lt;a href="\#log10"&gt;log10&lt;/a&gt;
and &lt;a href="\#pow"&gt;pow&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### log10

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;log10&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;log10(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return the logarithm of the argument to base 10.&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: log10(0.5)
    Merry result: -0.30103

    Merry code: log10(1.0)
    Merry result: 0.0

    Merry code: log10(2.0)
    Merry result: 0.30103

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#exp"&gt;exp&lt;/a&gt;, &lt;a href="\#log"&gt;log&lt;/a&gt; and
&lt;a href="\#pow"&gt;pow&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### lower\_case

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;lower\_case&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;lower\_case(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Downcase each letter in str. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    "SkotOS" -> "skotos"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#upper\_case"&gt;upper\_case&lt;/a&gt;, &lt;a
href="\#capitalize"&gt;capitalize&lt;/a&gt;,

&lt;a href="\#decapitalize"&gt;decapitalize&lt;/a&gt; and &lt;a
href="\#proper"&gt;proper&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

## M

### make\_url

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;make\_url&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;make\_url(&lt;/font&gt;&lt;font class="args"&gt;string
base, mapping args, varargs int secure&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

The make\_url() function creates a string URL which includes page
(&lt;base&gt;) and any amount of arguments (&lt;args&gt;). &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: make_url( "some_page", ([ "some property" : "some value", "other property" : "other value", "actor" : $actor, "year" : 2004 ]) )
    Merry result: "some_page?actor=Marrach%3Aplayers%3AK%3Akalle&other property=other+value&some property=some+value&year=2004"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#url\_decode"&gt;url\_decode&lt;/a&gt;, &lt;a
href="\#url\_encode"&gt;url\_encode&lt;/a&gt; and &lt;a
href="\#url\_absolute"&gt;url\_absolute&lt;/a&gt; &lt;/td&gt;

&lt;/tr&gt; &lt;/table&gt;

### map\_indices

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;map\_indices&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt;

**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;mixed
\*&lt;/font&gt; &lt;font
class="fun"&gt;map\_indices(&lt;/font&gt;&lt;font
class="args"&gt;mapping map&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt;

&lt;td valign="top"&gt; mixed \* &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return an array containing the indices of mapping
map.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: map_indices(([ "Monday" : "Meatloaf", "Tuesday" : "Chicken", "Wednesday" : "Tater tots", "Thursday" : "Fish", "Friday" : "Leftovers", ]))
    Merry result: ({ "Friday", "Monday", "Thursday", "Tuesday", "Wednesday" })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#map\_values"&gt;map\_values&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### map\_sizeof

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;map\_sizeof&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;map\_sizeof(&lt;/font&gt;&lt;font class="args"&gt;mapping
map&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; int

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; map\_sizeof() is
used to determine the size of a mapping. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: map_sizeof( ([ "foo" : "bar", "george" : "hamster" ]) )
    Merry result: 2

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#sizeof"&gt;sizeof&lt;/a&gt; and &lt;a
href="\#strlen"&gt;strlen&lt;/a&gt; &lt;/td&gt;

&lt;/tr&gt; &lt;/table&gt;

### map\_values

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;map\_values&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt;

**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;mixed
\*&lt;/font&gt; &lt;font
class="fun"&gt;map\_values(&lt;/font&gt;&lt;font class="args"&gt;mapping
map&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt;

&lt;td valign="top"&gt; mixed \* &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: map_values(([ "Monday" : "Meatloaf", "Tuesday" : "Chicken", "Wednesday" : "Tater tots", "Thursday" : "Fish", "Friday" : "Leftovers", ]))
    Merry result: ({ "Leftovers", "Meatloaf", "Fish", "Chicken", "Tater tots" })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#map\_indices"&gt;map\_indices&lt;/a&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### Match

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;Match&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;NRef \*&lt;/font&gt; &lt;font
class="fun"&gt;Match(&lt;/font&gt;&lt;font class="args"&gt;object ob,
string name, varargs object looker, string adj...&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; NRef \* &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Match a name (name) and any amount of adjectives (adj...) with a
source's inventory (ob). &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    $black_cats = Match($actor, "cat", $actor, "black");
    EmitTo($actor, 
      "The following black cats are in your inventory: " +
        Describe($black_cats));

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#MatchPlural"&gt;MatchPlural&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### MatchPlural

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;MatchPlural&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;NRef \*&lt;/font&gt; &lt;font
class="fun"&gt;MatchPlural(&lt;/font&gt;&lt;font class="args"&gt;object
ob, string pname, varargs object looker, string
adj...&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; NRef \* &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Match a pname (plural name) and any amount of
adjectives (adj...) with a source's inventory (ob). &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    $black_cats = MatchPlural( $actor, "cats", $actor, "black" );
    EmitTo($actor, 
      "The following black cats are in your inventory: " + 
      Describe($black_cats));

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt;

&lt;td valign="top"&gt; &lt;a href="\#Match"&gt;Match&lt;/a&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### member

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;member&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;member(&lt;/font&gt;&lt;font class="args"&gt;mixed m,
array a&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; To figure out whether an array
contains a certain value, you use member(). The
following:&lt;br/&gt;for( i = 0; i &lt; sizeof( a ); i++ )&lt;br/&gt;if(
a\[i\] == val ) {&lt;br/&gt;/\* found it!
**/&lt;br/&gt;}&lt;br/&gt;Could instead be written as:&lt;br/&gt;if(
member( val, a )) {&lt;br/&gt;/** found it! \*/&lt;br/&gt;}

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry result: 1
    Merry code: member( "a", ({ "a", "b", "c" }) )

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### millitime

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;millitime&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

mixed \* &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Return the current
time as an array ({ time, fraction }), where time is an integer denoting
the current time in seconds, and fraction is a float in range \[0.0 ..
1.0&gt;, denoting the fraction of the current second that has passed,
with a resolution of 0.001.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: millitime()
    Merry result: ({ 1049514170, 0.983 })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#time"&gt;time&lt;/a&gt; and &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### mixed\_to\_ascii

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;mixed\_to\_ascii&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;mixed\_to\_ascii(&lt;/font&gt;&lt;font
class="args"&gt;mixed value&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Convert any property to a string value.&lt;br/&gt;Note
that this function is a clone of dump\_value().&lt;br/&gt;For examples
and further information, read the 'dump\_value' reference. &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a
href="\#ascii\_to\_mixed"&gt;ascii\_to\_mixed&lt;/a&gt; and &lt;a
href="\#dump\_value"&gt;dump\_value&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### modf

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;modf&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;float
\*&lt;/font&gt; &lt;font class="fun"&gt;modf(&lt;/font&gt;&lt;font
class="args"&gt;float x&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; float \* &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Split the argument into a fraction f and an integer part n, such that \|
f \| &lt; 1.0, and f + n == x. ({ f, n }) is returned. Note that n is
returned as a float, and may not be representable in type
int.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: modf(0.0)
    Merry result: ({ 0.0, 0.0 })

    Merry code: modf(0.5)
    Merry result: ({ 0.5, 0.0 })

    Merry code: modf(1.0)
    Merry result: ({ 0.0, 1.0 })

    Merry code: modf(2.0)
    Merry result: ({ 0.0, 2.0 })

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#frexp"&gt;frexp&lt;/a&gt; and &lt;a
href="\#ldexp"&gt;ldexp&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

## N

### NewNRef

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;NewNRef&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;NRef&lt;/font&gt; &lt;font
class="fun"&gt;NewNRef(&lt;/font&gt;&lt;font class="args"&gt;object obj,
string detail&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; NRef &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Create a new NRef for an object. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: NewNRef( $actor, "nose" )
    Merry result: (43)O(/base/data/nref#-1, <Marrach:players:K:kalle>, "nose")

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#NRefOb"&gt;NRefOb&lt;/a&gt; and &lt;a
href="\#NRefDetail"&gt;NRefDetail&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### NRefDetail

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;NRefDetail&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;NRefDetail(&lt;/font&gt;&lt;font class="args"&gt;NRef
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Find out the detail ID an NRef is referring to. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry condition: Actor is smiling at someone's arm ($target). To figure out which part of 'someone' the actor is smiling at:
    Merry code: NRefDetail( $target )
    Merry result: "arm

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#NRefOb"&gt;NRefOb&lt;/a&gt; and &lt;a
href="\#NewNRef"&gt;NewNRef&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### NRefOb

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;NRefOb&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;object&lt;/font&gt; &lt;font
class="fun"&gt;NRefOb(&lt;/font&gt;&lt;font class="args"&gt;NRef
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; object &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Figure out which object an NRef is referring to. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry condition: Actor is smiling at someone's arm ($target). To figure out who 'someone' is:
    Merry code: NRefOb( $target )
    Merry result: (object reference for 'someone')

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#NRefDetail"&gt;NRefDetail&lt;/a&gt; and &lt;a
href="\#NewNRef"&gt;NewNRef&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### NRefsEqual

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;NRefsEqual&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;NRefsEqual(&lt;/font&gt;&lt;font class="args"&gt;NRef
left, NRef right&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

NRefsEqual is used to check whether two NRefs are equal.&lt;br/&gt;Note
that 'if( NRef1 == NRef2 )' will always return FALSE,
regardless.&lt;br/&gt;Hence, you must do 'if( NRefsEqual( NRef1, NRef2
))' instead. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: NRefsEqual( NewNRef( $actor, "nose" ), NewNRef( $actor, "nose" ))
    Merry result: 1
    Merry code: NRefsEqual( NewNRef( $actor, "default" ), $actor ))
    Merry result: 1
    Merry code: NRefsEqual( $actor, $actor )
    Merry result: 1
    Merry code: NRefsEqual( $actor, NewNRef( $actor, "ear" ))
    Merry result: 0

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#NRefOb"&gt;NRefOb&lt;/a&gt;, &lt;a
href="\#NRefDetail"&gt;NRefDetail&lt;/a&gt; and &lt;a
href="\#NewNRef"&gt;NewNRef&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### Num

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Num&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;Num(&lt;/font&gt;&lt;font class="args"&gt;mixed
v&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Turn a string value &lt;v&gt; into a float or integer
value. The function will cause an error if &lt;v&gt; is not convertable.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: Num( "4" )
    Merry result: 4

    Merry code: Num( "4.5" )
    Merry result: 4.5

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#Str"&gt;Str&lt;/a&gt;,
&lt;a href="\#Int"&gt;Int&lt;/a&gt;, &lt;a
href="\#Flt"&gt;Flt&lt;/a&gt;,

&lt;a href="\#Arr"&gt;Arr&lt;/a&gt; and &lt;a
href="\#Map"&gt;Map&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### number\_digit

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;number\_digit&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;number\_digit(&lt;/font&gt;&lt;font class="args"&gt;int
hexvalue&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Convert any numeric value into a one-digit number,
based on the character code position (ASCII, in this case), into the
numeric value it represents. &lt;br/&gt;'5', the char, equals 53, the
numeric value. &lt;br/&gt;number\_digit( 53 ) equals 5, the numeric
value. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: number_digit( 1 )
    Merry result: 0

    Merry code: number_digit( 50 )
    Merry result: 2

    Merry code: number_digit( 51 )
    Merry result: 3

    Merry code: number_digit( 52 )
    Merry result: 4

    Merry code: number_digit( 57 )
    Merry result: 9

    Merry code: number_digit( 58 )
    Merry result: 0

    Merry code: number_digit( '5' )
    Merry result: 5

    Merry code: number_digit( '9' )
    Merry result: 9

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

## O

### Obj

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Obj&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;object&lt;/font&gt; &lt;font
class="fun"&gt;Obj(&lt;/font&gt;&lt;font class="args"&gt;string
s&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; object &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Obj() is used to retrieve an object's reference through the object's
string-name.&lt;br/&gt;For instance, if you have a string objectname,
which contains the name of an object you need to access, you could do ob
= Obj( objectname );&lt;br/&gt;If the objectname is user-specified, you
mustn't count on its validity; if the object &lt;objectname&gt; does not
exist, Obj() will return nil. if( ob ) /\* object not exist error
handling \*/&lt;br/&gt;If the object is static, i.e. the name of the
object is predetermined and won't ever change, you are encouraged to use
the syntax ${objectname} instead. This is the exact same thing as Obj()
except that a reference in ${}'s will be updated automatically if the
object is ever renamed. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: Obj( "Generic:UrMale" )
    Merry result: <Generic:UrMale>

    Merry code: Obj( "Something:nonexistent" )
    Merry result: nil

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### object\_name

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;object\_name&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;object\_name(&lt;/font&gt;&lt;font class="args"&gt;object
obj&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Return the name of
object obj.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code:  object_name($actor)
    Runtime error: object_name() is replaced by name() and ur_name()

    Merry code:  name($actor)
    Merry result:  "Chatters:LC:ch:allen-christopher"

    Merry code:  ur_name($actor)
    Merry result:  "/base/obj/thing#4803"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#find\_object"&gt;find\_object&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### obstat

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;obstat&lt;/td&gt;

&lt;/tr&gt;

&lt;/table&gt;

### oneof

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;oneof&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;oneof(&lt;/font&gt;&lt;font class="args"&gt;string alt1,
string alt2, ...&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Similar to the SAM
oneof, {One\|two\|three}, oneof() can be used to produce a random string
based on a number of alternatives. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    oneof( "George", "James", "John" ) -> either "George", "James" or "John".
    "Mr. " + oneof( "George", "James", "John" ) + " " + oneof( "Georgeson", "Jameson", "Johnson" ) -> Mr. George/James/John Georgeson/Jameson/Johnson, e.g. Mr. George Johnson.

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### ordinal

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;ordinal&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;ordinal(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Convert a string expression of an ordinal number into an integer value.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: ordinal( "first" )
    Merry result: 1

    Merry code: ordinal( "fifth" )
    Merry result: 5

    Merry code: ordinal( "tenth" )
    Merry result: 10

    Merry code: ordinal( "ninetyninth" )
    Merry result: 99

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#cardinal"&gt;cardinal&lt;/a&gt;, &lt;a
href="\#desc\_ordinal"&gt;desc\_ordinal&lt;/a&gt; and &lt;a
href="\#desc\_cardinal"&gt;desc\_cardinal&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

## P

### pad\_left

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;pad\_left&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;pad\_left(&lt;/font&gt;&lt;font class="args"&gt;string
var, int size&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Pad var with spaces to the left, so that the result is size long.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: pad_left( "foo", 8 )
    Merry result: "   foo"
    (note that the result above contains five spaces, but only one is displayed in non-pre style)

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#strip\_left"&gt;strip\_left&lt;/a&gt;, &lt;a
href="\#strip\_right"&gt;strip\_right&lt;/a&gt;, &lt;a
href="\#strip"&gt;strip&lt;/a&gt; and &lt;a
href="\#pad\_right"&gt;pad\_right&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### pad\_right

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;pad\_right&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;pad\_right(&lt;/font&gt;&lt;font class="args"&gt;string
var, int size&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Pad var with spaces to the right, so that the result is size long.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: pad_right( "foo", 8 )
    Merry result: "foo    "
    (note that the result above contains five spaces, but only one is displayed in non-pre style)

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#strip\_left"&gt;strip\_left&lt;/a&gt;, &lt;a
href="\#strip\_right"&gt;strip\_right&lt;/a&gt;, &lt;a
href="\#strip"&gt;strip&lt;/a&gt; and &lt;a
href="\#pad\_left"&gt;pad\_left&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### parse\_string

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;parse\_string&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;parse\_string(&lt;/font&gt;&lt;font
class="args"&gt;string format, string str&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Parse a string as described by the grammar. The format of the grammar is
described in the document called 'Parsing'. If parsing is successful,
the parse tree is returned as an array. The optional third argument
specifies the number of alternative parse trees to integrate in the
result, if the grammar is ambiguous. parse\_string() uses internal
object storage to cache grammars and generated automatons, which is not
removed until the object is destructed.&lt;br/&gt;This function cannot
be used from a user or editor
object.&lt;br/&gt;&lt;br/&gt;Note:&lt;br/&gt;The parse\_string kfun is a
very powerful parser to which you supply a grammar of your choice. It's
reminiscent of lex and yacc if you've used them before. DGD's
parse\_string, unlike most parsers, keeps track of all your ambiguous
matches. That fact is both a great power and a great
responsibility.&lt;br/&gt;&lt;br/&gt;What that means is that if your
grammar allows something to be parsed a couple of different ways then
DGD will keep track of them all while parsing. If there are two ways to
parse a double-if statement with else (the else can go with either if)
in your grammar, and you feed parse\_string a chunk with fifteen of
those, you'll find that DGD is keeping track of 2^15 (that's around
32,000) different interpretations of your file. Then it will cheerfully
return only the first. That's slow, just in case you hadn't
guessed.&lt;br/&gt;&lt;br/&gt;However, sometimes you want ambiguous
parsing. For instance, you may have a natural language parser for player
commands, and you'd like the player to be able to type "get down" and
have it mean either of "get down from the platform" or "take the down
pillow" according to two different grammar rules. DGD's parse\_string
will return both parses, and you can decide which makes more sense where
the player is standing at the time. Most parsers won't do this for you.
Lucky you found DGD, hey?&lt;br/&gt;&lt;br/&gt;A fellow named Steve
Foley has graciously put together a tutorial on parse\_string, with the
aid of our own Nino (Erwin Harte). You can find it at
<http://www.mindspring.com/~zeppo1/parse_string.html>&lt;br/&gt;
&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt;

&lt;a href="\#sscanf"&gt;sscanf&lt;/a&gt;, &lt;a
href="\#explode"&gt;explode&lt;/a&gt; and &lt;a
href="\#implode"&gt;implode&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### ParseXML

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;ParseXML&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;ParseXML(&lt;/font&gt;&lt;font class="args"&gt;string
XML&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; mixed &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

ParseXML() is used to convert an XML string to the appropriate value (a
SAM-string, for instance).&lt;br/&gt;Like the Bilbo $sam(), ParseXML()
used with UnSAM() constitute Merry's portal to the XML/SAM engine. It's
not going to be used as much as Bilbo's is, because SAM has few
abilities that Merry does not have natively. To emulate $sam(foo), use
UnSAM(ParseXML("foo")).&lt;br/&gt;&lt;br/&gt;The real use of UnSAM() is
to handle binary SAM data stored in e.g. descriptions. If you have a
room with a description containing oneof's, for example, and you want to
create a text representation of this, you'd want to do something
like,&lt;br/&gt;str = UnSAM(Get(this,
"details:default:description:examine")); &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: ParseXML( "{sam-style|one|of}" )
    Merry result: X[S] {sam-style|one|of}

    Merry code: ParseXML( "<describe what=\"$actor\"/>" )
    Merry result: X[S] <describe what="$(actor)"/>

    Merry code: UnSAM( ParseXML( "<describe what=\"$actor\"/>" )
    Merry result: "StoryCoder Kalle"

    Merry code: ParseXML( "You are <describe what=\"$actor\"/>, the {heroic|fantastic|extraordinary|hulkhoganish|awesome|illiterate|analphabetic|dyslectic} {thief|villain|joe|wizard|viking|lord|knight|master} {of|from} {Sweden|Norway|York|Denmark|London|Scandinavia}!" )
    Merry result: X[S] You are <describe what="$(actor)"/>, the {heroic|fantastic|extraordinary|hulkhoganish|awesome|illiterate|analphabetic|dyslectic} {thief|villain|joe|wizard|viking|lord|knight|master} {of|from} {Sweden|Norway|York|Denmark|London|Scandinavia}!

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#UnSAM"&gt;UnSAM&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### Popup

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Popup&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;void&lt;/font&gt;
&lt;font class="fun"&gt;Popup(&lt;/font&gt;&lt;font
class="args"&gt;object recipient, object source, string
what&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; void

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; There is a new
Merry function called Popup(). If the user is running an official Skotos
client (Java, Zealous or Alice) this will cause a browser window to pop
up for the player, filled with whatever content you specify. For
example,&lt;br/&gt;&lt;br/&gt;Popup($actor, $actor."base:environment",
"painting");&lt;br/&gt;will popup a window to $actor, displaying the
contents of the property html:painting in the actor's current
room.&lt;br/&gt;&lt;br/&gt;Unsurprisingly, popup window content is
written in HTML, and we're lucky in that SAM -- which we normally use to
write text description -- is closely related to
HTML.&lt;br/&gt;&lt;br/&gt;As an example, we might
have...&lt;br/&gt;&lt;br/&gt;room.html:painting =
X\[S\]&lt;br/&gt;&lt;BODY bgcolor="black"&gt;&lt;br/&gt;&lt;IMG
src="<http://www.mydomain.com/images/painting.jpg%22/%3E>;&lt;br/&gt;&lt;/BODY&gt;&lt;br/&gt;&lt;br/&gt;which
wouldn't look good -- it'd be up to you to do cook up some nice looking
stylesheet, or something -- but you get the
idea.&lt;br/&gt;&lt;br/&gt;Of course, SAM can do more than just
represent static HTML. SAM for popups can use the same active tags that
it does for text... we can pull values from the room and apply logic to
the values. For example, display different paintings depending on the
light level of the room...&lt;br/&gt;&lt;br/&gt;room.html:painting =
X\[S\]&lt;br/&gt;&lt;BODY
bgcolor="$(this.painting:bgcolor)"&gt;&lt;br/&gt;{? \| $this.base:dark
\|&lt;br/&gt;&lt;IMG
src="<http://www.mydomain.com/images/painting-in-dark.jpg%22/%3E>;
\|&lt;br/&gt;&lt;IMG
src="<http://www.mydomain.com/images/painting-in-light.jpg%22/%3E>;&lt;br/&gt;}&lt;br/&gt;&lt;/BODY&gt;&lt;br/&gt;&lt;br/&gt;Again,
you get the basic idea.&lt;br/&gt;&lt;br/&gt;These popups are built on
top of a general way for browsers to fetch the value of a property from
an in-game object. This system a special form of the basic URL syntax
you are used to from browsing the web. A URL that fetches the property
'html:painting' from 'Zell:Rooms:PaintingRoom' and displays it would
look like, /SAM/Prop/Zell:Rooms:PaintingRoom/painting and that is in
fact precisely the URL constructed by the Popup() call in Merry,
above.&lt;br/&gt;&lt;br/&gt;The special format of this URL allows us to
use relative linking in a very handy way. Let's add a hyperlink to our
example:&lt;br/&gt;&lt;br/&gt;room.html:painting =
X\[S\]&lt;br/&gt;&lt;BODY
bgcolor="$(this.painting:bgcolor)"&gt;&lt;br/&gt;&lt;A
href="painting-closeup"&gt;&lt;br/&gt;{? \| $this.base:dark
\|&lt;br/&gt;&lt;IMG
src="<http://www.mydomain.com/images/painting-in-dark.jpg%22/%3E>;
\|&lt;br/&gt;&lt;IMG
src="<http://www.mydomain.com/images/painting-in-light.jpg%22/%3E>;&lt;br/&gt;}&lt;br/&gt;&lt;/A&gt;&lt;br/&gt;&lt;/BODY&gt;&lt;br/&gt;&lt;br/&gt;You
will note that the 'href' attribute of the link is a relative URL. The
browser will automatically expand this to
/SAM/Prop/Zell:Rooms:PaintingRoom/painting-closeup and so if you click
on the link, you will be taken to the contents of the property
'html:painting-closeup' in the same object as 'html:painting' is already
defined. This makes it easy to create links that navigate between web
properties in a single object.&lt;br/&gt;&lt;br/&gt;For further
complexity, Merry can now be embedded anywhere in SAM -- either to be
included in the stream of text, or as attribute value to another SAM
tag. For example, let's say we want to automate the example above with
different paintings even further. We could dynamically create the URL
from the derived property
base:light-category:&lt;br/&gt;&lt;br/&gt;room.html:painting =
X\[S\]&lt;br/&gt;&lt;BODY bgcolor="black"&gt;&lt;br/&gt;&lt;IMG
src='$\[&lt;br/&gt;/\* MERRY: add the light category into the middle of
the URL \*/&lt;br/&gt;"http://www.mydomain.com/images/painting-"
+&lt;br/&gt;$this."base:light-category"
+&lt;br/&gt;".jpg"&lt;br/&gt;\]'/&gt;&lt;br/&gt;&lt;/BODY&gt;&lt;br/&gt;&lt;br/&gt;Things
get -really- exciting when you begin to use the zform and zact SAM tags,
which allow a Merry script to be executed on the server when the user
hits a submit button or a link. This means popups can contain controls,
such as start story configuration panels.

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### pow

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;pow&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;pow(&lt;/font&gt;&lt;font class="args"&gt;float x, float
y&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; float
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Return x to the
power y.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: pow(10.0, 3.0)
    Merry result: 1000.0

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt;

&lt;a href="\#exp"&gt;exp&lt;/a&gt;, &lt;a href="\#log"&gt;log&lt;/a&gt;
and &lt;a href="\#log10"&gt;log10&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### PRE

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;PRE&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;PRE(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Use PRE() to get the equivalent of the HTML &lt;PRE&gt; tag. &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#TAG"&gt;TAG&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;/table&gt;

### prefixed\_map

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;prefixed\_map&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;mapping&lt;/font&gt;
&lt;font class="fun"&gt;prefixed\_map(&lt;/font&gt;&lt;font
class="args"&gt;mapping map, string prefix&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; mapping

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Extract all
elements from map where the indice (key) begins with
prefix.&lt;br/&gt;There are known issues with mappings that contain
non-alphanumeric characters, that may result in invalid results for this
specific function. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt;

&lt;td valign="top"&gt;

    Merry code: prefixed_map( ([ "Monday" : "Meatloaf", "Tuesday" : "Chicken", "Wednesday" : "Tater tots", "Thursday" : "Fish", "Friday" : "Leftovers" ]), "Monday" )
    Merry result: ([ "Monday":"Meatloaf" ])

    Merry code: prefixed_map( ([ "ape" : "monkey", "adam" : "pig", "bertram" : "prince" ]), "a" )
    Merry result: ([ "adam":"pig", "ape":"monkey" ])

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### previous\_object

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:**

&lt;/td&gt; &lt;td&gt;previous\_object&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;varargs object&lt;/font&gt; &lt;font
class="fun"&gt;previous\_object(&lt;/font&gt;&lt;font
class="args"&gt;int n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; varargs object &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Return the object n+1 (default: 1)
steps back in the call\_other chain.&lt;br/&gt;If the object is
destructed, or the number of steps is larger than the number of
call\_others involved, zero is returned.&lt;br/&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: previous_object()
    Merry result: </usr>

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#call\_other"&gt;call\_other&lt;/a&gt;, &lt;a
href="\#this\_object"&gt;this\_object&lt;/a&gt; and &lt;a
href="\#call\_trace"&gt;call\_trace&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### previous\_program

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;previous\_program&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;previous\_program(&lt;/font&gt;&lt;font
class="args"&gt;varargs int n&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return the name of the object with the function n+1 (default: 1) steps
back in the function call chain. If the number of steps is larger than
the number of function calls involved, nil is returned.&lt;br/&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: previous_program()
    Merry result: "/usr/SkotOS/lib/merrynode"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#previous\_object"&gt;previous\_object&lt;/a&gt; and &lt;a
href="\#call\_trace"&gt;call\_trace&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### proper

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;proper&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;proper(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Make sure the first letter of each space-delimited word in str is
capitalized. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    "the kingdom of sweden" -> "The Kingdom Of Sweden"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#lower\_case"&gt;lower\_case&lt;/a&gt;, &lt;a
href="\#upper\_case"&gt;upper\_case&lt;/a&gt;, &lt;a
href="\#capitalize"&gt;capitalize&lt;/a&gt; and &lt;a
href="\#decapitalize"&gt;decapitalize&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

## Q

### query\_editor

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;query\_editor&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;query\_editor(&lt;/font&gt;&lt;font
class="args"&gt;object obj&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return the editor status of an object. This is either "command", if the
editor instance is in command mode, "insert", if the editor instance is
in input mode, or 0, if there is no editor instance for the given
object.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: query_editor($actor)
    Merry result: nil

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### query\_ip\_name

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;query\_ip\_name&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt;
&lt;font class="fun"&gt;query\_ip\_name(&lt;/font&gt;&lt;font
class="args"&gt;object user&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; string

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Return the IP name
of a user, as a string, or nil if the given object is not a user object.
If the IP name could not be resolved, the IP number is returned,
instead.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#query\_ip\_number"&gt;query\_ip\_number&lt;/a&gt;, &lt;a
href="\#send\_datagram"&gt;send\_datagram&lt;/a&gt;,

&lt;a href="\#send\_message"&gt;send\_message&lt;/a&gt;, &lt;a
href="\#this\_user"&gt;this\_user&lt;/a&gt; and &lt;a
href="\#users"&gt;users&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### query\_ip\_number

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;query\_ip\_number&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;query\_ip\_number(&lt;/font&gt;&lt;font
class="args"&gt;object user&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; string &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Return the ip number of a user, as a
string, or 0 if the given object is not a user object. &lt;/td&gt;
&lt;/tr&gt;

&lt;/table&gt;

## R

### random

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;random&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;random(&lt;/font&gt;&lt;font class="args"&gt;int
mod&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return a positive random number between 0 and integer specified within
() minus 1. &lt;br/&gt;The example would return a random number between
1 and 5 due to the modifier of +1. &lt;br/&gt;If modifier is less than
1, 0 is returned. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    random(5)+1

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### replace\_html

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;replace\_html&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt;
&lt;font class="fun"&gt;replace\_html(&lt;/font&gt;&lt;font
class="args"&gt;string str&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; string

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Use replace\_html()
to escape HTML. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    "foo & bar" -> "foo &amp; bar"

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### replace\_strings

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;replace\_strings&lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;replace\_strings(&lt;/font&gt;&lt;font
class="args"&gt;string str, string swaps...&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Replace substrings in str given in swaps. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: replace_strings( "You, someone, must something!", "someone", "Kalle", "something", "jump" )
    Merry result: "You, Kalle, must jump!"

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### replace\_xml

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;replace\_xml&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;replace\_xml(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Escape a string, adding a backslash
character before any character significant to SAM. &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code:      ParseXML( "1<2 & 3>2" )
    Runtime error:   XML: file N/A line 1: unexpected token

    Merry code: replace_xml( "1<2 & 3>2" )
    Merry result: "1\\&lt;2 \\&amp; 3\\&gt;2"

    Merry code: ParseXML( replace_xml( "1<2 & 3>2" ))
    Merry result: X[S] 1\&lt;2 \&amp; 3\&gt;2

    Merry code: UnSAM( ParseXML( replace_xml( "1<2 & 3>2" )))
    Merry result: "1&lt;2 &amp; 3&gt;2"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ParseXML"&gt;ParseXML&lt;/a&gt; and &lt;a
href="\#UnSAM"&gt;UnSAM&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### restore\_object

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;restore\_object&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;restore\_object(&lt;/font&gt;&lt;font
class="args"&gt;string file&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; int

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Restore all global
variables in an object that are not private or static from a file. All
variables which qualify, but were not restored and do not contain object
values, will be set to 0. 1 is returned if the variables could be
restored, 0 otherwise.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#save\_object"&gt;save\_object&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### reverse

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;reverse&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed \*&lt;/font&gt; &lt;font
class="fun"&gt;reverse(&lt;/font&gt;&lt;font class="args"&gt;mixed
\*orig&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; mixed \* &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Reverse the array &lt;orig&gt;, result being an array
listing the values of &lt;orig&gt; backwards.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: reverse( ({ "ape", "monkey", "giraffe" }) )
    Merry result: ({ "giraffe", "monkey", "ape" })

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#reverse\_mapping"&gt;reverse\_mapping&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### reverse\_lookup

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;reverse\_lookup&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;mixed&lt;/font&gt; &lt;font
class="fun"&gt;reverse\_lookup(&lt;/font&gt;&lt;font
class="args"&gt;mapping map, mixed val&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; mixed &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
Mappings are sequences of pairs, each pair containing an indice (key)
and a value. The ordinary way to read from a map is to read the values
by providing the indice - map\[&lt;indice&gt;\] == &lt;value&gt;. The
reverse\_lookup function is used to read the indices by providing the
values.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: reverse_lookup( ([ "a":1, "b":2, "c":3 ]), 2 )
    Merry result: "b"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#map\_indices"&gt;map\_indices&lt;/a&gt; and &lt;a
href="\#map\_values"&gt;map\_values&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### reverse\_mapping

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;reverse\_mapping&lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;mapping&lt;/font&gt; &lt;font
class="fun"&gt;reverse\_mapping(&lt;/font&gt;&lt;font
class="args"&gt;mapping map&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; mapping &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Reverse a mapping by setting indice-&gt;value, and
value-&gt;indice.&lt;br/&gt;Note that if a mapping contains several
identical values, such as (\[ "foo" : "bar", "foo2" : "bar" \]), a call
to reverse\_mapping will result in a "mapping is not injective" runtime
error. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: reverse_mapping( ([ "foo" : "bar", "name" : "kalle" ]) )
    Merry result: ([ "bar":"foo", "kalle":"name" ])

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### rfc\_1123\_date

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;rfc\_1123\_date&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt;

**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;rfc\_1123\_date(&lt;/font&gt;&lt;font class="args"&gt;int
n&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt;

&lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
Extract a UNIX time stamp date as a string, formatted RFC-1123
compliant. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: rfc_1123_date( time() )
    Merry result: "Sat, 31 May 2003 14:21:43 GMT"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;,

&lt;a href="\#humanized\_date"&gt;humanized\_date&lt;/a&gt;, &lt;a
href="\#days"&gt;days&lt;/a&gt; and &lt;a
href="\#smalltime"&gt;smalltime&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

## S

### save\_object

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;save\_object&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;save\_object(&lt;/font&gt;&lt;font class="args"&gt;string
file&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Save all global variables in an object that are not
private or static to a file. Only non-zero and non-object values are
actually saved.&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### Set

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Set&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;void&lt;/font&gt;
&lt;font class="fun"&gt;Set(&lt;/font&gt;&lt;font class="args"&gt;object
ob, string property, mixed value&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; void

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Set() is used to
set a property in an object to a value. It has a built-in shorter syntax
as well,&lt;br/&gt;&lt;br/&gt;Set( x, "y", z ) -&gt; x."y" =
z;&lt;br/&gt;&lt;br/&gt;The shorter version only works if y is an
absolute string value ("abc" is absolute, $property is not), otherwise
the Set() function must be used. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    $foo = "I'ma value.";
    Set( ob, "prop", $foo ); /* Set "prop" in ob to "I'ma value." (as defined in $foo) */
    Set( $actor, "prop", $foo ); /* Set "prop" in actor to "I'ma value." (as defined in $foo) */
    $changeWhat = "appearance:eyecolor";
    $value = "rainbow";
    Set( $actor, $changeWhat, $value ); /* Set "appearance:eyecolor" (as defined in $changeWhat) in $actor to "rainbow" (as defined in $value) */
    $changeSomethingElse = "skin";
    $value = "pink with blue dots";
    Set( $actor, "appearance:" + $changeSomethingElse, $value ); /* Set "appearance:skin" in $actor to "pink with blue dots" */

    ob."prop" = $foo; /* Set "prop" in ob to "I'ma value." */
    $actor."prop" = $foo;

    Currently, Set( x, "y", z ); can be shortened to x."y" = z;
    But this only works if the property name argument (y) is absolute. That is, we cannot: x.$foo = z;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#Get"&gt;Get&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### set\_by\_int

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;set\_by\_int&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;set\_by\_int(&lt;/font&gt;&lt;font
class="args"&gt;mapping bigmap, int ix, mixed val&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Set the value in &lt;bigmap&gt; for the indice
specified using integer identifier &lt;ix&gt; to &lt;val&gt;.

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#get\_by\_int"&gt;get\_by\_int&lt;/a&gt;,
&lt;a href="\#clear\_by\_int"&gt;clear\_by\_int&lt;/a&gt;,

&lt;a href="\#get\_by\_ob"&gt;get\_by\_ob&lt;/a&gt;, &lt;a
href="\#set\_by\_ob"&gt;set\_by\_ob&lt;/a&gt;,

&lt;a href="\#clear\_by\_ob"&gt;clear\_by\_ob&lt;/a&gt;, &lt;a
href="\#get\_by\_str"&gt;get\_by\_str&lt;/a&gt;,

&lt;a href="\#set\_by\_str"&gt;set\_by\_str&lt;/a&gt; and &lt;a
href="\#clear\_by\_str"&gt;clear\_by\_str&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### set\_by\_ob

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;set\_by\_ob&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;set\_by\_ob(&lt;/font&gt;&lt;font class="args"&gt;mapping
bigmap, string str, mixed val&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Set the value in &lt;bigmap&gt; for the indice
specified using object identifier &lt;ob&gt; to &lt;val&gt;.

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#get\_by\_int"&gt;get\_by\_int&lt;/a&gt;,
&lt;a href="\#set\_by\_int"&gt;set\_by\_int&lt;/a&gt;,

&lt;a href="\#clear\_by\_int"&gt;clear\_by\_int&lt;/a&gt;, &lt;a
href="\#get\_by\_ob"&gt;get\_by\_ob&lt;/a&gt;,

&lt;a href="\#clear\_by\_ob"&gt;clear\_by\_ob&lt;/a&gt;, &lt;a
href="\#get\_by\_str"&gt;get\_by\_str&lt;/a&gt;,

&lt;a href="\#set\_by\_str"&gt;set\_by\_str&lt;/a&gt; and &lt;a
href="\#clear\_by\_str"&gt;clear\_by\_str&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### set\_by\_str

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;set\_by\_str&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;set\_by\_str(&lt;/font&gt;&lt;font
class="args"&gt;mapping bigmap, string str, mixed
val&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Set the value in &lt;bigmap&gt; for the indice
specified using string identifier &lt;str&gt; to &lt;val&gt;.

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#get\_by\_int"&gt;get\_by\_int&lt;/a&gt;,
&lt;a href="\#set\_by\_int"&gt;set\_by\_int&lt;/a&gt;,

&lt;a href="\#clear\_by\_int"&gt;clear\_by\_int&lt;/a&gt;, &lt;a
href="\#get\_by\_ob"&gt;get\_by\_ob&lt;/a&gt;,

&lt;a href="\#set\_by\_ob"&gt;set\_by\_ob&lt;/a&gt;, &lt;a
href="\#clear\_by\_ob"&gt;clear\_by\_ob&lt;/a&gt;,

&lt;a href="\#get\_by\_str"&gt;get\_by\_str&lt;/a&gt;, &lt;a
href="\#set\_by\_str"&gt;set\_by\_str&lt;/a&gt; and &lt;a
href="\#clear\_by\_str"&gt;clear\_by\_str&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### SetVar

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;SetVar&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;&lt;/font&gt; &lt;font
class="fun"&gt;SetVar(&lt;/font&gt;&lt;font class="args"&gt;string n,
mixed v&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:**

&lt;/td&gt; &lt;td valign="top"&gt; SetVar() is used to set the value of
a variable with a possibly constructed name, usually used when the
variable's name is unresolved at compile time. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    $property = "address";
    $value = "Skogsb. 27";
    SetVar( $property, $value );
    EmitTo( $actor, $address );
    /*
     * Emits "Skogsb. 27", found in $address, to $actor. 
     */

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#GetVar"&gt;GetVar&lt;/a&gt;, &lt;a
href="\#Set"&gt;Set&lt;/a&gt; and &lt;a href="\#Get"&gt;Get&lt;/a&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### short\_time

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;short\_time&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;short\_time(&lt;/font&gt;&lt;font class="args"&gt;int
stamp&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Extract a brief string version of a UNIX timestamp date
(stamp). &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: short_time( time() )
    Merry result: "May 31 08:28"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#humanized\_date"&gt;humanized\_date&lt;/a&gt;,

&lt;a href="\#rfc\_1123\_date"&gt;rfc\_1123\_date&lt;/a&gt;, &lt;a
href="\#days"&gt;days&lt;/a&gt; and &lt;a
href="\#smalltime"&gt;smalltime&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### sin

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;sin&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;sin(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the sine of the argument.&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: sin(0.0)
    Merry result: 0.0

    Merry code: sin(0.5)
    Merry result: 0.47942554

    Merry code: sin(1.0)
    Merry result: 0.84147098

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#cos"&gt;cos&lt;/a&gt;
and &lt;a href="\#tan"&gt;tan&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### sinh

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;sinh&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;sinh(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the hyperbolic sine of the argument.&lt;br/&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: sinh(0.0)
    Merry result: 0.0

    Merry code: sinh(0.5)
    Merry result: 0.52109531

    Merry code: sinh(1.0)
    Merry result: 1.1752012

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#cosh"&gt;cosh&lt;/a&gt; and &lt;a
href="\#tanh"&gt;tanh&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### sizeof

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;sizeof&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;sizeof(&lt;/font&gt;&lt;font class="args"&gt;mixed
\*arr&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; sizeof() is used to determine the size of an array.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: sizeof( ({ "foo", "bar", "george", "hamster" }) )
    Merry result: 4

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#map\_sizeof"&gt;map\_sizeof&lt;/a&gt; and &lt;a
href="\#strlen"&gt;strlen&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### Slay

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Slay&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;Slay(&lt;/font&gt;&lt;font class="args"&gt;object
ob&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Slay() undoes what Spawn() does.&lt;br/&gt;A word of
warning though: there is no such thing as a 'trashcan'.&lt;br/&gt;Know
what you're doing. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Slay( $steaming_hot_cup_of_java );

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#Spawn"&gt;Spawn&lt;/a&gt; and &lt;a
href="\#Duplicate"&gt;Duplicate&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### smalltime

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;smalltime&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;smalltime(&lt;/font&gt;&lt;font class="args"&gt;int
stamp&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the hour and minute of the UNIX timestamp date
(stamp). &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: smalltime( time () )
    Merry result: "08:29"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt;, &lt;a
href="\#time"&gt;time&lt;/a&gt;, &lt;a
href="\#humanized\_date"&gt;humanized\_date&lt;/a&gt;,

&lt;a href="\#rfc\_1123\_date"&gt;rfc\_1123\_date&lt;/a&gt;, &lt;a
href="\#days"&gt;days&lt;/a&gt; and &lt;a
href="\#short\_time"&gt;short\_time&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### Social

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;Social&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;Social(&lt;/font&gt;&lt;font class="args"&gt;object ob,
string verb, string adverb, string evoke, string prep1, NRef \*obs1,
string prep2, NRef \*obs2, ...&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Social() is a shortcut for what could actually be
accomplished through the use of Act(), by calling the "social" action.
However, the social action is complex enough and socials are so common
that this convenience function is quite warranted. Note that this
executes real socials, not just emits. This means all the signals and
scripts associated with the social are run as well.&lt;br/&gt;Social()
can take a good amount of argument and can generate any results with the
parser that any regular player can.&lt;br/&gt;Only the first two
arguments are required: the object to command, and the verb to execute.
The adverbs and evokes should be straight-forward. The last string of
arguments specify the different targets and at least for now, more than
one pair of preposition and object should be quite rare.&lt;br/&gt;In
some cases, though, when a Social() doesn't seem to do what you ask, you
may have to look into Act().&lt;br/&gt;&lt;br/&gt;(Hack) Set the
property $(adverb:position) to one of the following, right before the
call to Social() to determine the position of the
adverb:&lt;br/&gt;PRE\_VERB = "pv" e.g. 'happily wave the
sword'&lt;br/&gt;PRE\_ROLE = "pr" e.g. 'wave happily to the
creature'&lt;br/&gt;PRE\_PREP = "pp" e.g. 'wave the sword angrily at the
mutant'&lt;br/&gt;PRE\_EVOKE = "pe" e.g. 'wave the sword at the mutant
angrily'&lt;br/&gt;&lt;br/&gt;E.g.:&lt;br/&gt;$(adverb:position) =
PRE\_VERB;&lt;br/&gt;Social( $actor, "smile", "happily", "Hi Charles" );
-&gt; You happily smile, "Hi Charles"&lt;br/&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Social( $actor, "smile" ); -> You smile.
    Social( $actor, "smile", "happily" ); -> You smile happily.
    Social( $actor, "smile", "happily", "G'day everyone!" ); -> You smile happily, "G'day everyone!"
    Social( $actor, "smile", "happily", nil, "at", $actor ); -> You smile happily at yourself.
    Social( $actor, "smile", "happily", nil, "at", ({ $actor, NewNRef( $actor, "toe" ) }) ); -> You smile happily at yourself and your toe.
    Social( $actor, "turn", "seriously", nil, nil, NewNRef( $actor, "head" ), "to", NewNRef( $actor, "feet" ) ); -> You turn seriously your head to your feet.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#Act"&gt;Act&lt;/a&gt;,
&lt;a href="\#EmitTo"&gt;EmitTo&lt;/a&gt; and &lt;a
href="\#EmitIn"&gt;EmitIn&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### spaces

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;spaces&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;spaces(&lt;/font&gt;&lt;font class="args"&gt;int
num&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return a string of num spaces. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: spaces( 5 )
    Merry result: "   "
    (note that the result above contains five spaces, but only one is displayed in non-pre style)

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#pad\_left"&gt;pad\_left&lt;/a&gt; and &lt;a
href="\#pad\_right"&gt;pad\_right&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### Spawn

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;Spawn&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;object&lt;/font&gt; &lt;font
class="fun"&gt;Spawn(&lt;/font&gt;&lt;font class="args"&gt;object
ob&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; object &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Extremely straight-forward, this is how we generate new objects. Merry
can only create spawns of existing ur-objects, though this limitation
may go out the door in time. The spawn behaves exactly as spawns do
throughout the Skotos system. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    $steaming_hot_cup_of_java = Spawn( ${Generic:drink:mug-coffee} );

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#Duplicate"&gt;Duplicate&lt;/a&gt; and &lt;a
href="\#Slay"&gt;Slay&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### sqrt

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt;

**Function:** &lt;/td&gt; &lt;td&gt;sqrt&lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;sqrt(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return the square root of the argument.&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: sqrt(2.0)
    Merry result: 1.4142136

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### sscanf

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;sscanf&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;sscanf(&lt;/font&gt;&lt;font class="args"&gt;string str,
string fmt, ...&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; int

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Parse the string
str, using the format string fmt. The following character sequences have
a special meaning in the format string:&lt;br/&gt;&lt;br/&gt;%s match a
substring&lt;br/&gt;%d match a number&lt;br/&gt;%f match a
floating-point number&lt;br/&gt;%c match a character&lt;br/&gt;%% match
single %&lt;br/&gt;&lt;br/&gt;Other characters must be matched exactly.
%\*s, %\*d, %\*f and %\*c can be used to match without assignment.
Matched substrings and numbers are assigned to the successive lvalue
arguments following the format string. The number of matched substrings
and numbers is returned.&lt;br/&gt; &lt;/td&gt;

&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a
href="\#parse\_string"&gt;parse\_string&lt;/a&gt;, &lt;a
href="\#explode"&gt;explode&lt;/a&gt; and &lt;a
href="\#implode"&gt;implode&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### status

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;status&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;varargs mixed
\*&lt;/font&gt; &lt;font class="fun"&gt;status(&lt;/font&gt;&lt;font
class="args"&gt;object obj&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; varargs mixed \*

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Called without an
argument, this kfun returns information about resources used by the
system. With an object as argument, resource usage by that object is
given. The returned value is an array, the fields of which are described
in the include file .&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Example(s):** &lt;/td&gt;

&lt;td valign="top"&gt;

    Merry code: status()
    Merry result: ({ "DGD 1.2.55p2s", 997809254, 1046300140, 51470076, 1048576, 112323, 1024, 0, 0, 25037884, 24893744, 124032000, 118680792, 262144, 11447, 10000, 15, 41, 400, 40, 1048576, 8192, 243, 499975398, ({  }), "198.232.133.147" })

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### Stop

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:**

&lt;/td&gt; &lt;td&gt;Stop&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;void&lt;/font&gt; &lt;font
class="fun"&gt;Stop(&lt;/font&gt;&lt;font class="args"&gt;string
identifier&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; void &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Stop() is used to terminate a running loop,
instantiated using the Every() function.&lt;br/&gt;It takes the
identifier string returned by the Every() function as single argument.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    [Also see C. Allen's example torch at: Examples:complete:light:torch]

    See the Every() function reference for an example.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#Every"&gt;Every&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### Str

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;Str&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;Str(&lt;/font&gt;&lt;font class="args"&gt;mixed
value&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
Convert an appropriate value to a string.&lt;br/&gt;Note that this does
not work with all properties.&lt;br/&gt;- All strings, floats, integers
and objects are applicable.&lt;br/&gt;- No arrays or mappings are
applicable.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Str( 3 ) -> "3"
    Str( 3+3 ) -> "6"
    Str( 3.14 ) -> "3.14"
    Str( "5.9" ) -> "5.9"
    Str( "15" ) -> "15"
    Str( "123 muffins" ) -> "123 muffins"
    Str( "5+5" ) -> "5+5"
    Str( nil ) -> ""
    Str( "Muffin" ) -> "Muffin"
    Str( $actor."base:intrinsiccapacity" ) -> "10.0"
    Str( $actor."base:actualcapacity" ) -> "9.8574127"
    Str( $actor ) -> "Marrach:players:K:kalle"
    Str( ({ "a", "b", "c" }) ) -> ERROR: cannot convert value to string

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a href="\#Int"&gt;Int&lt;/a&gt;,
&lt;a href="\#Flt"&gt;Flt&lt;/a&gt;, &lt;a
href="\#dump\_value"&gt;dump\_value&lt;/a&gt;, &lt;a
href="\#mixed\_to\_ascii"&gt;mixed\_to\_ascii&lt;/a&gt; and &lt;a
href="\#ascii\_to\_mixed"&gt;ascii\_to\_mixed&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### string\_to\_hex

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;string\_to\_hex&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;string\_to\_hex(&lt;/font&gt;&lt;font
class="args"&gt;string bytes&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; string &lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt; Return the hexadecimal
representation of bytes. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    'FOO' -> 464f4f

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#hex\_digit"&gt;hex\_digit&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### strip

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;strip&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;strip(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Strip whitespace from both sides of str. &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    "  abc " -> "abc"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#strip\_left"&gt;strip\_left&lt;/a&gt;, &lt;a
href="\#strip\_right"&gt;strip\_right&lt;/a&gt;,

&lt;a href="\#pad\_left"&gt;pad\_left&lt;/a&gt; and &lt;a
href="\#pad\_right"&gt;pad\_right&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### strip\_left

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;strip\_left&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;strip\_left(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Strip whitespace from the left of str. &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    "    abc    " --> "abc  "

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#strip\_right"&gt;strip\_right&lt;/a&gt;, &lt;a
href="\#strip"&gt;strip&lt;/a&gt;,

&lt;a href="\#pad\_left"&gt;pad\_left&lt;/a&gt; and &lt;a
href="\#pad\_right"&gt;pad\_right&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### strip\_right

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;strip\_right&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;strip\_right(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Strip whitespace from the right of str. &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    "   abc " --> " abc"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#strip\_left"&gt;strip\_left&lt;/a&gt;, &lt;a
href="\#strip"&gt;strip&lt;/a&gt;,

&lt;a href="\#pad\_left"&gt;pad\_left&lt;/a&gt; and &lt;a
href="\#pad\_right"&gt;pad\_right&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### strlen

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;strlen&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;strlen(&lt;/font&gt;&lt;font class="args"&gt;string
s&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; Return the length of string s. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: strlen( "test" )
    Merry result: 4

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#map\_sizeof"&gt;map\_sizeof&lt;/a&gt; and &lt;a
href="\#sizeof"&gt;sizeof&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### structure\_propmap

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;structure\_propmap&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### switch

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;switch&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;
&lt;font class="ret"&gt;&lt;/font&gt; &lt;font
class="fun"&gt;switch(&lt;/font&gt;&lt;font class="args"&gt;mixed
value&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:**

&lt;/td&gt; &lt;td valign="top"&gt; The switch() statement is in a way
an extension of if(). For example,&lt;br/&gt;if( $a == 1 ) EmitTo(
$actor, "One" );&lt;br/&gt;if( $a == 2 ) EmitTo( $actor, "Two"
);&lt;br/&gt;if( $a == 3 ) EmitTo( $actor, "Three" );&lt;br/&gt;- can
also be written as,&lt;br/&gt;switch( $a ){&lt;br/&gt;case 1: EmitTo(
$actor, "One" ); break;&lt;br/&gt;case 2: EmitTo( $actor, "Two" );
break;&lt;br/&gt;case 3: EmitTo( $actor, "Three" );
break;&lt;br/&gt;}&lt;br/&gt;&lt;br/&gt;Within the switch() block, the
case and default keywords are used to check conditions, both concluded
using the break keyword. Several case statements can be made in which
case the code after the first TRUE case statement is executed regardless
until the next break. Example:&lt;br/&gt;&lt;br/&gt;switch( $a
){&lt;br/&gt;case 1: EmitTo( $actor, "One." ); /\* no break;
\*/&lt;br/&gt;case 2: EmitTo( $actor, "Two." ); break;&lt;br/&gt;case 3:
EmitTo( $actor, "Three." ); break;&lt;br/&gt;}&lt;br/&gt;If $a is 1, the
output will be "One." followed by "Two." but if $a is 2 the output will
be "Two." only.&lt;br/&gt;If $a is 3, the output will be "Three." only.

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Example #1:
    -----------
    $i = 2;
    switch( $i ){
    case 0:
    EmitTo( $actor, "Zero value." );
    break;

    case 1:
    EmitTo( $actor, "Value is one." );
    break;

    case 2:
    EmitTo( $actor, "Value is two." );
    break;

    default:
    EmitTo( $actor, "It's not 0, not 1, not 2." );
    break;
    }
    -----------

    Result:
    -------
    Value is two.
    -------

    Example #2: (advanced)
    -----------
    /* Compare two values, $left and $right, regardless of value type.
    We call this script lib:compare in this (since we will be calling ourselves further down) */

    if( typeof( $left ) != typeof( $right ))
    /* They're not even the same type, so we check their dump values and just compare those. */
    return dump_value( $left ) == dump_value( $right );

    switch( typeof( $left )){
    case T_ARRAY: /* this is an array, so we do some special checks, cause in this compare function, ({ "a", "b" }) is the same as ({ "b", "a" }) */
    /* firstly, check if the size of both is the same (if not, they're not similar) */
    if( sizeof( $left ) != sizeof( $right )) return FALSE;

    /* We sort'em. */
    $left = map_indices( arr_to_set( $left ));
    $right = map_indices( arr_to_set( $right ));

    /* and step through'em each to see if we find any differences */
    for( $i = 0; $i < sizeof( $left ); $i++ )
    /* Here we call ourselves recursively on each element in the array, and if we get a "not similar" anywhere, we have reached the conclusion that the two properties aren't similar */
    if( !Call( this, "compare", $left: $left[$i], $right: $right[$i] )) return FALSE;
    break;

    case T_MAPPING: /* this is a mapping, so we need to do some other special checks */
    /* size check, like we did with the arrays above, but we use 'map_sizeof' since we're dealing with mappings */
    if( map_sizeof( $left ) != map_sizeof( $right )) return FALSE;

    /* Okay, sizes are right. Let's extract indices and values, and do a check on both */
    $left_indices = map_indices( $left ); /* ([ "foo" : "bar" ]) becomes ({ "foo" }) */
    $right_indices = map_indices( $right );
    for( $i = 0; $i < sizeof( $left_indices ); $i++ )
    if( !Call( this, "compare", $left: $left_indices[$i], $right: $right_indices[$i] )) return FALSE;

    /* indices seem to be the same; checking values now ... */
    $left_values = map_values( $left ); /* ([ "foo" : "bar" ]) becomes ({ "bar" }) */
    $right_values = map_values( $right );
    for( $i = 0; $i < sizeof( $left_values ); $i++ )
    if( !Call( this, "compare", $left: $left_values[$i], $right: $right_values[$i] )) return FALSE;

    break;

    default: /* anything that wasn't caught above (arrays and mappings) is caught here */
    return $left == $right; /* simple enough, neh? */
    break;

    }
    return TRUE;
    -----------

    Comment:
    --------
    The above function, while a little long, is a perfect example for what switch() may be used for. Try putting the function in for instance your body and call it like:
    +tool merry eval Call( $actor, "compare", $left: ([ ({ "a", "b", "c" }) : ([ "foo" : "bar" ]) ]), $right : ([ ({ "c", "b", "a" }) : ([ "foo" : "bar" ]) ]) )
    (which will result in a '1' which means TRUE (they are the same))
    --------

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#if"&gt;if&lt;/a&gt; and &lt;a
href="\#break"&gt;break&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

## T

### tabulate

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;tabulate&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;tabulate(&lt;/font&gt;&lt;font class="args"&gt;mixed
\*arrlist...&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

For a fixed-sized font, render the arrays in arrlist in a table.
&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### TAG

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;TAG&lt;/td&gt;

&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Syntax:** &lt;/td&gt;
&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;TAG(&lt;/font&gt;&lt;font class="args"&gt;string str,
string tag&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Use TAG() to
colorize text using the client user's preset theme colors. &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#PRE"&gt;PRE&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### tan

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;tan&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;tan(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return the tangent of the
argument.&lt;br/&gt;&lt;br/&gt;Note:&lt;br/&gt;For values close to a
multiple of PI/2, the result may be inaccurate.&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: tan(0.0)
    Merry result: 0.0

    Merry code: tan(0.5)
    Merry result: 0.54630249

    Merry code: tan(1.5)
    Merry result: 14.10142

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#cos"&gt;cos&lt;/a&gt; and &lt;a
href="\#sin"&gt;sin&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### tanh

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;tanh&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;float&lt;/font&gt; &lt;font
class="fun"&gt;tanh(&lt;/font&gt;&lt;font class="args"&gt;float
x&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; float &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Description:**
&lt;/td&gt; &lt;td valign="top"&gt;

Return the hyperbolic tangent of the argument.&lt;br/&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: tanh(0.0)
    Merry result: 0.0

    Merry code: tanh(0.5)
    Merry result: 0.46211716

    Merry code: tanh(1.5)
    Merry result: 0.90514825

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;

**See also:** &lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#cosh"&gt;cosh&lt;/a&gt; and &lt;a
href="\#sinh"&gt;sinh&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### this\_object

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;this\_object&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; object &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; The this\_object() function returns the internal object
name for 'this'. &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: this_object()
    Merry result: </usr/SkotOS/merry/4a6e774b0814ac8f2c8c693ec75c0e5b>

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#previous\_object"&gt;previous\_object&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### time

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;time&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Return value(s):** &lt;/td&gt; &lt;td valign="top"&gt; int

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Return the current
time as an integer. The time can be converted into a string with the
kfun ctime().&lt;br/&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Example(s):** &lt;/td&gt;

&lt;td valign="top"&gt;

    Merry code: time()
    Merry result: 1049521697

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ctime"&gt;ctime&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### to\_hex

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;to\_hex&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:**

&lt;/td&gt; &lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt;
&lt;font class="fun"&gt;to\_hex(&lt;/font&gt;&lt;font
class="args"&gt;string bytes&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):** &lt;/td&gt; &lt;td
valign="top"&gt; string

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Description:** &lt;/td&gt; &lt;td valign="top"&gt; Transform a
sequence of characters (a string) into a sequence of hexadecimal values.
&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    Merry code: to_hex( "Kalle" )
    Merry result: "4b616c6c65"

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

### typeof

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;

&lt;td&gt;typeof&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;int&lt;/font&gt; &lt;font
class="fun"&gt;typeof(&lt;/font&gt;&lt;font class="args"&gt;mixed
value&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):** &lt;/td&gt;
&lt;td valign="top"&gt; int &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
Return the type of a value. The return values are declared in the
include file. &lt;br/&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt;
**Example(s):** &lt;/td&gt; &lt;td valign="top"&gt;

    typeof( nil ) == 0 /* T_NIL */
    typeof( 123 ) == 1 /* T_INT */
    typeof( 3.14 ) == 2 /* T_FLOAT */
    typeof( "abc" ) == 3 /* T_STRING */
    typeof( $actor ) == 4 /* T_OBJECT */
    typeof( ({ "a", "b", "c" }) ) == 5 /* T_ARRAY */
    typeof( ([ "foo" : "bar" ]) ) == 6 /* T_MAPPING */

&lt;/td&gt; &lt;/tr&gt;

&lt;/table&gt;

## U

### UnSAM

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;UnSAM&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt;

&lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;UnSAM(&lt;/font&gt;&lt;font class="args"&gt;mixed
SAM&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt; &lt;td
valign="top"&gt; UnSAM() is used to convert a SAM-string into a regular
string.&lt;br/&gt;Like the Bilbo $sam(), ParseXML() used with UnSAM()
constitute Merry's portal to the XML/SAM engine. It's not going to be
used as much as Bilbo's is, because SAM has few abilities that Merry
does not have natively. To emulate $sam(foo), use
UnSAM(ParseXML("foo")).&lt;br/&gt;&lt;br/&gt;The real use of UnSAM() is
to handle binary SAM data stored in e.g. descriptions. If you have a
room with a description containing oneof's, for example, and you want to
create a text representation of this, you'd want to do something
like,&lt;br/&gt;str = UnSAM(Get(this,
"details:default:description:examine")); &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt;

&lt;td valign="top"&gt;

    Merry code: UnSAM( ParseXML( "{sam-style|one|of}" ))
    Merry result: "sam-style"
    or:          "one"
    or:          "of"

    Merry code: UnSAM( ParseXML( "<describe what=\"$actor\"/>" ))
    Merry result: "StoryCoder Kalle"

    Merry code:   UnSAM( ParseXML( "You are <describe what=\"$actor\"/>, the {heroic|fantastic|extraordinary|hulkhoganish|awesome|illiterate|analphabetic|dyslectic} {thief|villain|joe|wizard|viking|lord|knight|master} {of|from} {Sweden|Norway|York|Denmark|London|Scandinavia}!" )
    Example result: "You are StoryCoder Kalle, the fanatic lord from Scandinavia!"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#ParseXML"&gt;ParseXML&lt;/a&gt; &lt;/td&gt;

&lt;/tr&gt; &lt;/table&gt;

### upper\_case

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;upper\_case&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt;

**Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;upper\_case(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt;

&lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Description:** &lt;/td&gt; &lt;td valign="top"&gt;
Capitalize (uppercase) every letter in str. &lt;/td&gt; &lt;/tr&gt;
&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**

&lt;/td&gt; &lt;td valign="top"&gt;

    "SkotOS" -> "SKOTOS"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#lower\_case"&gt;lower\_case&lt;/a&gt;, &lt;a
href="\#capitalize"&gt;capitalize&lt;/a&gt;,

&lt;a href="\#decapitalize"&gt;decapitalize&lt;/a&gt; and &lt;a
href="\#proper"&gt;proper&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

### url\_absolute

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;url\_absolute&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;url\_absolute(&lt;/font&gt;&lt;font
class="args"&gt;string url&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Return value(s):**

&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: url_absolute( "/page?somearg=somevalue" )
    Merry result: "http://marrach.skotos.net:8080/page?somearg=somevalue"

&lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#url\_decode"&gt;url\_decode&lt;/a&gt;,
&lt;a href="\#url\_encode"&gt;url\_encode&lt;/a&gt; and &lt;a
href="\#make\_url"&gt;make\_url&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt;
&lt;/table&gt;

### url\_decode

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;url\_decode&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt;

&lt;td&gt; &lt;font class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;url\_decode(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return value(s):**
&lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;

&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt; &lt;td
valign="top"&gt;

    Merry code: url_decode( "Hi,+I'm+Kalle+%26+this+is+an+evil+smiley%3A+%3E%3A-)" )
    Merry result: "Hi, I'm Kalle & this is an evil smiley: >:-)"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**

&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#url\_encode"&gt;url\_encode&lt;/a&gt;, &lt;a
href="\#make\_url"&gt;make\_url&lt;/a&gt; and &lt;a
href="\#url\_absolute"&gt;url\_absolute&lt;/a&gt; &lt;/td&gt;
&lt;/tr&gt; &lt;/table&gt;

### url\_encode

&lt;table border="0" cellpadding="5" cellspacing="0"&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;url\_encode&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td
valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;string&lt;/font&gt; &lt;font
class="fun"&gt;url\_encode(&lt;/font&gt;&lt;font class="args"&gt;string
str&lt;/font&gt;&lt;font class="fun"&gt;)&lt;/font&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Return
value(s):** &lt;/td&gt; &lt;td valign="top"&gt; string &lt;/td&gt;
&lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Example(s):** &lt;/td&gt;

&lt;td valign="top"&gt;

    Merry code: url_encode( "Hi, I'm Kalle & this is an evil smiley: >:-)" )
    Merry result: "Hi,+I'm+Kalle+%26+this+is+an+evil+smiley%3A+%3E%3A-)"

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **See also:**
&lt;/td&gt; &lt;td valign="top"&gt; &lt;a
href="\#url\_decode"&gt;url\_decode&lt;/a&gt;, &lt;a
href="\#make\_url"&gt;make\_url&lt;/a&gt; and &lt;a
href="\#url\_absolute"&gt;url\_absolute&lt;/a&gt;

&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

## W

### while

&lt;table border="0" cellpadding="5" cellspacing="0"&gt; &lt;tr&gt;
&lt;td valign="top"&gt; **Function:** &lt;/td&gt;
&lt;td&gt;while&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **Syntax:** &lt;/td&gt; &lt;td&gt; &lt;font
class="ret"&gt;&lt;/font&gt; &lt;font
class="fun"&gt;while(&lt;/font&gt;&lt;font
class="args"&gt;&lt;condition&gt;&lt;/font&gt;&lt;font
class="fun"&gt;)&lt;/font&gt; &lt;/td&gt; &lt;/tr&gt;

&lt;tr&gt; &lt;td valign="top"&gt; **Description:** &lt;/td&gt;

&lt;td valign="top"&gt; While-loops are used when a block of code needs
to be repeated until certain condition requirements are met. &lt;/td&gt;
&lt;/tr&gt; &lt;tr&gt; &lt;td valign="top"&gt; **Example(s):**
&lt;/td&gt; &lt;td valign="top"&gt;

    Example #1:
    -----------
    int i;

    i = 0;
    while( i < 10 ){
    i ++;
    EmitTo( $actor, Str(i)+" is less than 10." );
    }
    EmitTo( $actor, Str(i)+" is NOT less than 10, so the while-loop has ended." );
    ----------

    Result:
    -------
    0 is less than 10.
    1 is less than 10.
    2 is less than 10.
    3 is less than 10.
    4 is less than 10.
    5 is less than 10.
    6 is less than 10.
    7 is less than 10.
    8 is less than 10.
    9 is less than 10.
    10 is NOT less than 10, so the while-loop has ended.
    -------

    Example #2:
    -----------
    int i = 0;
    while( TRUE ){
    i++;
    }
    /* Warning: this script will loop eternally, or rather -- until an "Out of ticks" error occurs. It is not recommended to test it. */
    ----------

&lt;/td&gt; &lt;/tr&gt; &lt;tr&gt;

&lt;td valign="top"&gt; **See also:** &lt;/td&gt; &lt;td
valign="top"&gt; &lt;a href="\#for"&gt;for&lt;/a&gt; and &lt;a
href="\#do"&gt;do&lt;/a&gt; &lt;/td&gt; &lt;/tr&gt; &lt;/table&gt;

-- Main.KalleAlm - 1 Feb 2005
