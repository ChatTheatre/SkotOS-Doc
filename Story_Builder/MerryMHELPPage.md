<center><h1>Merry +MHELP reference
page</h1></center>

*This page was automatically created using the +mhelp tool. If anything
in this document is in error, do not edit the document directly --
instead, use +mhelp to modify the topic in question, from within the
client. Also note, if you are on the Skotos Seven server, that changes
you make will currently be lost unless you inform <a
href="[mailto:kalle@mortalis.skotos.net](mailto:kalle@mortalis.skotos.net)">Kalle</a>
about the changes you've made, so that the master copy may be updated
accordingly.*

<hr noshade="1"></hr>

## $

### $delay

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>$delay</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret"></font> <font
class="fun">$delay(</font><font class="args">mixed wait,
mixed return\[, string id\]</font><font
class="fun">)</font>

</td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> $delay() is used to prematurely exit a script, and
return to it a set amount of seconds later (wait, 1st argument),
specified as a floating value (up to 60.0) or an integer value (no
limit). <br/> <br/>Not only does the script exit, though,
but if the script was called from another script, that script is
returned the return value (return, 2nd argument). <br/>If the
script is an act/react/witness script, the first time a non-FALSE value
is returned, the action will go through, as pointed out in the
example(s) section below. <br/> <br/>Only the first argument
is required, second is optional, third is automatic. <br/>The
second value defaults to FALSE, the third value becomes a four-digit
unique character identifier for the switch. Make careful note that no
two $delay() statements in a single script may contain two identical
identifiers. The script will fail to compile with a "duplicate case
labels in switch" error. Remove the third argument from the copied
$delay() statements and another identifier will be generated.
<br/>

<br/>Note: only $variables and constants are maintained after a
$delay() returns control to a script. The following script would fail,
<br/> <br/>string s; <br/>s = "Hello world"; /* s ==
"Hello world" **/ <br/>$delay( 1, FALSE ); /** s is reset **/
<br/>EmitTo( $actor, s ); /** s is nil */ <br/>
<br/>- because the variable s is nil after the $delay() call.
<br/>Solve by storing the necessary variables in some appropriate
object, or use $variables. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

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

</td> </tr>

</table>

## A

### acos

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>acos</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">acos(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> float </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: acos(0.0)
    Merry result: 1.5707963

    Merry code: acos( 0.5 )
    Merry result: 1.0471976

    Merry code: acos( 1.0 )
    Merry result: 0.0

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#asin">asin</a> and <a
href="#atan">atan</a> </td> </tr>

</table>

### Act

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Act</td> </tr> <tr> <td valign="top">
**Syntax:**

</td> <td> <font class="ret">void</font>
<font class="fun">Act(</font><font class="args">object
ob, string action, special arguments</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> void

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Another extremely
powerful function, this is how Merry commands some object to perform an
action, optionally specified by an array of arguments. The argument
$silent can be sent as TRUE in order to suppress all output for
(presumably) all signals. <br/> </td> </tr> <tr>
<td valign="top"> **Example(s):** </td>

<td valign="top">

    Act( $actor, "drop", $what: sword_objects, $into: container_object );

    (see TWiki page on signals for more verbose information on what exactly you can do with what)

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#Social">Social</a> </td> </tr>
</table>

### allocate

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>allocate</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">mixed *</font>
<font class="fun">allocate(</font><font
class="args">int size</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> mixed *

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Allocate an array
with size number of elements. All elements are initialized to zero. The
new array is returned. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: allocate(5)
    Merry result: ({ nil, nil, nil, nil, nil })

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#sizeof">sizeof</a> </td> </tr>
</table>

### allocate_float

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>allocate_float</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">float *</font> <font
class="fun">allocate_float(</font><font class="args">int
size</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> float * </td>

</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Allocate an array with size
elements. All elements are initialized to 0.0. The new array is
returned. </td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: allocate_float(5)
    Merry result: ({ 0.0, 0.0, 0.0, 0.0, 0.0 })

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#allocate">allocate</a>, <a
href="#allocate_int">allocate_int</a> and <a
href="#sizeof">sizeof</a>

</td> </tr> </table>

### allocate_int

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>allocate_int</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int *</font> <font
class="fun">allocate_int(</font><font class="args">int
size</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int * </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Allocate an array with size elements. All elements are
initialized to 0. The new array is returned. </td> </tr>
<tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    Merry code: allocate_int(5)
    Merry result: ({ 0, 0, 0, 0, 0 })

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#allocate">allocate</a>, <a
href="#allocate_float">allocate_float</a> and <a
href="#sizeof">sizeof</a>

</td> </tr> </table>

### Arr

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Arr</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed *</font> <font
class="fun">Arr(</font><font class="args">mixed
v</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> mixed * </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return <v> in the form of an array. If <v>
is an array already, <v> will be returned in its present state,
otherwise ({ <v> }) is returned.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: Arr( "Hello" )
    Merry result: ({ "Hello" })

    Merry code: Arr( ({ "Hello" }) )
    Merry result: ({ "Hello" })

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a href="#Str">Str</a>,
<a href="#Int">Int</a>, <a
href="#Flt">Flt</a>,

<a href="#Num">Num</a> and <a
href="#Map">Map</a> </td> </tr> </table>

### arr_to_set

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>arr_to_set</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">mapping</font> <font
class="fun">arr_to_set(</font><font class="args">array
a</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> mapping </td>

</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Use arr_to_set to convert an array
value to a mapping where each unique property in the array is an indice
(key) in the resulting mapping.<br/>As mappings are automatically
represented in alphabetical order, arr_to_set may for instance be used
to sort an array of strings.<br/>As you see in the second example,
applying map_indices to the result of an arr_to_set-call will result
in an identical, but sorted, array.<br/>Take note, however, that
if any two values in an array are identical (which is valid for an
array), these two values will be merged into a single value by
arr_to_set, as indices must be unique. </td> </tr>
<tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    Merry code: arr_to_set( ({ "Kalle", "Anders", "Erik", "Maria" }) )
    Merry result: ([ "Anders":1, "Erik":1, "Kalle":1, "Maria":1 ])
    Merry code: map_indices( arr_to_set( ({ "Kalle", "Anders", "Erik", "Maria" }) ))
    Merry result: ({ "Anders", "Erik", "Kalle", "Maria" })

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#map_values">map_values</a>, <a
href="#map_indices">map_indices</a> and <a
href="#reverse_mapping">reverse_mapping</a>

</td> </tr> </table>

### ascii_to_mixed

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>ascii_to_mixed</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">ascii_to_mixed(</font><font
class="args">string str</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> mixed </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Convert an ascii value into the appropriate property
type. </td> </tr> <tr> <td valign="top">
**Example(s):**

</td> <td valign="top">

    Merry code: ascii_to_mixed( "15" )
    Merry result: 15

    Merry code: ascii_to_mixed( "({ \"a\", \"cute\", \"array!\" })" )
    Merry result: ({ "a", "cute", "array!" })

    Merry code: ascii_to_mixed( "<Marrach:players:K:kalle>" )
    Merry result: <Marrach:players:K:kalle>

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#mixed_to_ascii">mixed_to_ascii</a> and <a
href="#dump_value">dump_value</a>

</td> </tr> </table>

### ascii_typeof

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>ascii_typeof</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">ascii_typeof(</font><font class="args">mixed
value</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return a string representation of the property type of
value. </td> </tr> <tr> <td valign="top">
**Example(s):**

</td> <td valign="top">

    ascii_typeof( nil ) == "nil"
    ascii_typeof( 123 ) == "int"
    ascii_typeof( 3.14 ) == "float"
    ascii_typeof( "abc" ) == "string"
    ascii_typeof( $actor ) == "object"
    ascii_typeof( ({ "a", "b", "c" }) ) == "array"
    ascii_typeof( ([ "foo" : "bar" ]) ) == "mapping"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#typeof">typeof</a> </td> </tr>

</table>

### asin

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>asin</td> </tr> <tr> <td valign="top">
**Syntax:**

</td> <td> <font class="ret">float</font>
<font class="fun">asin(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> float

</td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: asin(0.0)
    Merry result: 0.0

    Merry code: asin(0.5)
    Merry result: 0.52359878

    Merry code: asin(1.0)
    Merry result: 1.5707963

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#acos">acos</a> and <a
href="#atan">atan</a> </td> </tr> </table>

### atan

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>atan</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">float</font> <font
class="fun">atan(</font><font class="args">float
x</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> float </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return the arc tangent of the argument.<br/> </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: atan(0.0)
    Merry result: 0.0

    Merry code: atan(0.5)
    Merry result: 0.46364761

    Merry code: atan(1.0)
    Merry result: 0.78539816

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#acos">acos</a>, <a href="#asin">asin</a>
and <a href="#atan2">atan2</a> </td> </tr>
</table>

### atan2

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>atan2</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">atan2(</font><font class="args">float y,
float x</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> float </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return the arc tangent of y/x, using the signs of the arguments to
determine the quadrant of the result.<br/> </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: atan2(0.0, 0.0)
    Merry result: 0.0

    Merry code: atan2(1.0, 0.0)
    Merry result: 1.5707963

    Merry code: atan2(0.0,1.0)
    Merry result: 0.0

    Merry code: atan2(1.0,1.0)
    Merry result: 0.78539816

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#atan">atan</a> </td> </tr> </table>

## B

### base64_decode

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:**

</td> <td>base64_decode</td> </tr>

</table>

### Bilbo

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:**

</td> <td>Bilbo</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">Bilbo(</font><font class="args">object ob,
string signaltype, string signalname, special
arguments</font><font class="fun">)</font> </td>

</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Merry can call Bilbo directly -- but as Merry at this
point has exceeded bilbo in all/any aspect, it is recommended that you
use this function scarcely; preferably never.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Bilbo( $actor, "react", "smile" ); /* will execute bilbo:react:smile found in $actor */

</td> </tr>

</table>

### break_paragraph

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>break_paragraph</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td>

<font class="ret">string</font> <font
class="fun">break_paragraph(</font><font
class="args">string head, string str, int len</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> string </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> For a fixed-size font, break str into lines each no
longer than len characters, and start all of it with the string head.
</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: break_paragraph( "You say: ", "sputnik was a  satellite", 20 )
    Merry result: "You say: sputnik was\n           a satellite\n"
    - which renders to
    You say: sputnik was
    a satellite
    (note that "a satellite" is directly below "sputnik was" if pre-formated)

</td> </tr>

</table>

## C

### calculate_stamp

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>calculate_stamp</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">int</font> <font
class="fun">calculate_stamp(</font><font
class="args">int year, int month, int day</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top">

**Return value(s):** </td> <td valign="top"> int </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Create a UNIX timestamp pointing to
midnight, year <year>, day <day> of month <month>.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: calculate_stamp( 1980, 9, 24 )
    Merry result: 338616000

    Merry code: ctime( 338616000 ) + ", Kalle was born."
    Merry result: "Wed Sep 24 00:00:00 1980, Kalle was born."

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#time">time</a>, <a
href="#ctime">ctime</a>,

<a href="#short_time">short_time</a>, <a
href="#smalltime">smalltime</a>,

<a href="#get_day">get_day</a>, <a
href="#get_month">get_month</a>,

<a href="#get_year">get_year</a>, <a
href="#get_hour">get_hour</a>,

<a href="#get_minute">get_minute</a> and <a
href="#get_second">get_second</a>

</td> </tr> </table>

### Call

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Call</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">Call(</font><font class="args">object ob,
string script, special arguments</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> mixed </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry's means of calling other Merry functions. If the script argument is e.g. 'checktimer', the property search will be for merry:lib:checktimer; there is no way to avoid the 'lib' portion. All functions that are callable in Merry must exist in the 'lib' namespace. This makes sense, as you will see in time.

    The third argument is on precisely the same format as in Act. For example, if you do

    Call(this, "inflict", $damage: 100);

    then the merry:lib:inflict script will be called, and inside this script $damage will contain the integer value 100. The local value is not changed, so after

    $damage = 50;
    Call(this, "inflict", $damage: 100);
    $damage will still be 50.

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#call_other">call_other</a>,
<a href="#call_out">call_out</a> and <a
href="#call_trace">call_trace</a> </td> </tr>
</table>

### call_other

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>call_other</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">varargs mixed</font> <font
class="fun">call_other(</font><font class="args">mixed
obj, string function, mixed args...</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> varargs mixed </td>

</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Call a function in an object. The
first argument must be either an object or a string. If it is a string,
call_object() will be called in the driver object to get the
corresponding object.<br/>Only non-private functions can be called
with call_other(). If the function is static, the object in which the
function is called must be the same as the object from which the
function is called, or the call will fail.<br/>Any additional
arguments to call_other() will be passed on to the called
function.<br/>In LPC, obj->func(arg1, arg2, argn) can be used
as a shorthand for call_other(obj, "func", arg1, arg2,
argn).<br/> </td> </tr>

</table>

### call_out

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>call_out</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">varargs int</font>
<font class="fun">call_out(</font><font
class="args">string function, int delay, mixed
args...</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> varargs int

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Call a function in
the current object with a delay. The function to be called must not be
private. The delay is specified in seconds.<br/>The minimum delay
is 1 second; if the given delay is less, it is changed into 1
second.<br/>The returned value is the callout handle, an integer
> 0 which must be used if the callout is to be removed.<br/>
</td> </tr>

</table>

### call_trace

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>call_trace</td> </tr> <tr> <td
valign="top">

**Return value(s):** </td> <td valign="top"> mixed **
</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Return the function
call trace as an array. The elements are of the following
format:<br/><br/>({ objname, progname, function, line,
extern, arg1, ..., argn })<br/><br/>The line number is 0 if
the function is in a compiled object.<br/>Extern is 1 if the
function was called with call_other(), and 0 otherwise.<br/>The
last element of the returned array is the trace of the current
function.<br/>

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: call_trace()
    Merry result: ({ ({ "/kernel/obj/binary#10769", "/kernel/obj/binary", "receive_message", 85, 1 }), ({ "/kernel/obj/binary#10769", "/kernel/lib/connection", "receive_message", 233, 0 }), ({ "/usr/TextIF/obj/user#10798", "/usr/TextIF/obj/user", "receive_message", 371, 1 }), ({ "/usr/TextIF/obj/user#10798", "/usr/TextIF/obj/user", "receive_line", 720, 0 }), ({ "/usr/TextIF/obj/user#10798", "/kernel/lib/auto", "call_limited", 719, 0 }), ({ "/usr/TextIF/obj/user#10798", "/kernel/lib/auto", "_F_call_limited", 698, 0 }), ({ "/usr/TextIF/obj/user#10798", "/usr/TextIF/obj/user", "parse_command", 812, 1 }), ({ "/usr/TextIF/main", "/usr/TextIF/main", "command", 230, 1 }), ({ "/usr/Tool/sys/tool", "/usr/Tool/sys/tool", "cmd_DEV_tool", 117, 1 }), ({ "/usr/Tool/sys/merry", "/usr/Tool/lib/merry", "cmd_merry_eval", 133, 1 }), ({ "/usr/Tool/sys/merry", "/usr/Tool/lib/merry", "run_merry_code", 45, 0 }), ({ "/usr/SkotOS/data/merry#-1", "/usr/SkotOS/data/merry", "evaluate", 223, 1, ({ <Chatters:LC:ch:allen-christopher>, nil, nil, ([ "actor":<Chatters:LC:ch:allen-christopher>, "body":<Chatters:LC:ch:allen-christopher>, "here":<Examples:complete:desc:room-go-nowhere>, "looker":<Chatters:LC:ch:allen-christopher> ]), nil }) }), ({ "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "/usr/SkotOS/lib/merrynode", "evaluate", 56, 1, <Chatters:LC:ch:allen-christopher>, nil, nil, @14, nil, nil }), ({ "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "merry", 6, 1, nil, nil, "virgin" }), ({ "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "/kernel/lib/auto", "call_trace", 524, 0 }) })

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#previous_object">previous_object</a> </td>
</tr> </table>

### capitalize

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>capitalize</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">capitalize(</font><font class="args">string
str</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Make sure the first letter of str is capitalized. </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    "zell" -> "Zell"

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#lower_case">lower_case</a>, <a
href="#upper_case">upper_case</a>, <a
href="#decapitalize">decapitalize</a> and <a
href="#proper">proper</a> </td> </tr>
</table>

### cardinal

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>cardinal</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">cardinal(</font><font class="args">string
str</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> int </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Convert a string expression of a cardinal number into an integer value.
</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: cardinal( "one" )
    Merry result: 1

    Merry code: cardinal( "five" )
    Merry result: 5

    Merry code: cardinal( "fiftytwo" )
    Merry result: 52

    Merry code: cardinal( "ninetynine" )
    Merry result: 99

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#ordinal">ordinal</a>, <a
href="#desc_ordinal">desc_ordinal</a> and <a
href="#desc_cardinal">desc_cardinal</a> </td>
</tr> </table>

### catch

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>catch</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">catch(</font><font
class="args">expression</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Execute the code for until an error results, or until execution is
complete. If an error resulted, catch() will return the error message as
a string; otherwise, it will return 0.<br/>Note: catch() is not a
real kfun. catch(a, b) will evaluate the expression (a, b), rather than
"call catch() with arguments a and b".<br/> </td>
</tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#error">error</a> </td>
</tr> </table>

### ceil

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>ceil</td> </tr> <tr> <td valign="top">
**Syntax:**

</td> <td> <font class="ret">float</font>
<font class="fun">ceil(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> float

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Round the argument
towards positive infinity.<br/> </td> </tr> <tr>
<td valign="top"> **Example(s):** </td>

<td valign="top">

    Merry code: ceil(14.1)
    Merry result: 15.0

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#floor">floor</a> and <a
href="#fmod">fmod</a>

</td> </tr> </table>

### char_to_string

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>char_to_string</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret"></font> <font
class="fun">char_to_string(</font><font
class="args">int ch</font><font
class="fun">)</font> </td> </tr>

<tr> <td valign="top"> **Description:**

</td> <td valign="top"> Convert a numeric character code
value into a string. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: char_to_string( 'A' )
    Merry result: "A"

    Merry code: char_to_string( 65 )
    Merry result: "A"

</td> </tr>

</table>

### clear_by_int

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>clear_by_int</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">void</font>
<font class="fun">clear_by_int(</font><font
class="args">mapping bigmap, int ix</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> void

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Clear the value in
<bigmap> for the indice specified using integer identifier
<ix>, effectively removing the map entry altogether. </td>
</tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#get_by_int">get_by_int</a>,
<a href="#set_by_int">set_by_int</a>,

<a href="#get_by_ob">get_by_ob</a>, <a
href="#set_by_ob">set_by_ob</a>,

<a href="#clear_by_ob">clear_by_ob</a>, <a
href="#get_by_str">get_by_str</a>,

<a href="#set_by_str">set_by_str</a> and <a
href="#clear_by_str">clear_by_str</a>

</td> </tr> </table>

### clear_by_ob

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>clear_by_ob</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">clear_by_ob(</font><font
class="args">mapping bigmap, object ob</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Clear the value in <bigmap> for the indice
specified using object identifier <ob>, effectively removing the
map entry altogether.

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#get_by_int">get_by_int</a>,
<a href="#set_by_int">set_by_int</a>,

<a href="#clear_by_int">clear_by_int</a>, <a
href="#get_by_ob">get_by_ob</a>,

<a href="#set_by_ob">set_by_ob</a>, <a
href="#clear_by_ob">clear_by_ob</a>,

<a href="#get_by_str">get_by_str</a>, <a
href="#set_by_str">set_by_str</a> and <a
href="#clear_by_str">clear_by_str</a>

</td> </tr> </table>

### clear_by_str

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>clear_by_str</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">clear_by_str(</font><font
class="args">mapping bigmap, string str</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Clear the value in <bigmap> for the indice
specified using string identifier <str>, effectively removing the
map entry altogether.

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#get_by_int">get_by_int</a>,
<a href="#set_by_int">set_by_int</a>,

<a href="#clear_by_int">clear_by_int</a>, <a
href="#get_by_ob">get_by_ob</a>,

<a href="#set_by_ob">set_by_ob</a>, <a
href="#clear_by_ob">clear_by_ob</a>,

<a href="#get_by_str">get_by_str</a> and <a
href="#set_by_str">set_by_str</a>

</td> </tr> </table>

### comma

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>comma</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">comma(</font><font class="args">int
num</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Make num readable by inserting a comma after every
third digit. </td> </tr> <tr> <td valign="top">
**Example(s):**

</td> <td valign="top">

    Merry code: comma( 1344266 )
    Merry result: "1,344,266"

</td> </tr>

</table>

### contains

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:**

</td> <td>contains</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">contains(</font><font class="args">string
str, string sub</font><font class="fun">)</font>
</td>

</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> If sub is a sub-string of str, return TRUE, else
FALSE.<br/>That is, if str contains sub.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: contains( "foobar", "ob" )
    Merry result: TRUE

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#sscanf">sscanf</a> </td> </tr>
</table>

### copy

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>copy</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">copy(</font><font class="args">mixed
var</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> mixed </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
The copy() function is useful when modifying for instance arrays and/or
mappings, to avoid harming the original source. VAR = ARRAY does not
instantly create a copy of ARRAY, which means there is a slight chance
that modifying VAR will also modify ARRAY (the original source).
</td>

</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: copy( "abc" )
    Merry result: "abc
    Merry code: copy( ({ "a", "b", "c" }) )
    Merry result: ({ "a", "b", "c" })
    Merry code: copy( $actor )
    Merry result: <Marrach:players:K:kalle>

</td> </tr>

</table>

### cos

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>cos</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td>

<font class="ret">float</font> <font
class="fun">cos(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> float </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the cosine of the argument.<br/>
</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: cos(0.0)
    Merry result: 1.0

    Merry code: cos(0.5)
    Merry result: 0.87758256

    Merry code: cos(1.0)
    Merry result: 0.54030231

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a href="#sin">sin</a>
and <a href="#kfun">kfun</a> </td> </tr>

</table>

### cosh

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>cosh</td> </tr> <tr> <td valign="top">
**Syntax:**

</td> <td> <font class="ret">float</font>
<font class="fun">cosh(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> float

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Return the
hyperbolic cosine of the argument.<br/> </td> </tr>
<tr> <td valign="top"> **Example(s):** </td>

<td valign="top">

    Merry code: cosh(0.0)
    Merry result: 1.0

    Merry code: cosh(0.5)
    Merry result: 1.127626

    Merry code: cosh(1.0)
    Merry result: 1.5430806

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#sinh">sinh</a> and <a
href="#tanh">tanh</a>

</td> </tr> </table>

### crypt

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>crypt</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">varargs string</font> <font
class="fun">crypt(</font><font class="args">string
passwd, string salt</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top"> **Return
value(s):**

</td> <td valign="top"> varargs string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Encrypt a password, of which only
the first 8 characters are significant. If the optional second argument
is given, its first two characters are used to perturb the encryption
algorithm additionally; without one, the encryption is perturbed
randomly. The returned string is 13 characters long, the first two of
which are equal to the used salt.<br/> </td> </tr>
<tr> <td valign="top">

**Example(s):** </td> <td valign="top">

    Merry code: crypt("test")
    Merry result: "MKfcAguU0/rhs"

    Merry code: crypt("test", "te")
    Merry result: "teH0wLIpW0gyQ"

</td> </tr>

</table>

### ctime

<table border="0" cellpadding="5" cellspacing="0"> <tr>

<td valign="top"> **Function:** </td>
<td>ctime</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">ctime(</font><font class="args">int
clock</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Convert the specified time, which is an integer such as is returned by
the kfun time(), into a string of the form "Tue Aug 3 14:40:18
1993".<br/> </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: ctime(0)
    Merry result: "Wed Dec 31 19:00:00 1969"

    Merry code: ctime(time())
    Merry result: "Fri Apr  4 19:38:09 2003"

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#time">time</a>, <a
href="#short_time">short_time</a> and <a
href="#rfc_1123_date">rfc_1123_date</a> </td>
</tr> </table>

## D

### days

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>days</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">days(</font><font class="args">int
n</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Generate a string value representation of the amount of days and hours
since Jan 1st, 1970. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: days( time() )
    Merry result: "12203 d, 12 h"

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#ctime">ctime</a>, <a
href="#time">time</a>, <a
href="#short_time">short_time</a>,

<a href="#humanized_date">humanized_date</a>, <a
href="#rfc_1123_date">rfc_1123_date</a> and <a
href="#smalltime">smalltime</a> </td> </tr>

</table>

### decapitalize

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>decapitalize</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">string</font>
<font class="fun">decapitalize(</font><font
class="args">string str</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> string

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Make sure the first
letter of str is lower case. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    "Chocolate" -> "chocolate"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#lower_case">lower_case</a>, <a
href="#upper_case">upper_case</a>,

<a href="#capitalize">capitalize</a> and <a
href="#proper">proper</a>

</td> </tr> </table>

### desc_cardinal

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>desc_cardinal</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">desc_cardinal(</font><font class="args">int
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Describe the cardinal n in English. </td>
</tr> <tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    123 -> "one hundred twenty-three"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#desc_ordinal">desc_ordinal</a> </td>
</tr>

</table>

### desc_ordinal

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>desc_ordinal</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">string</font>
<font class="fun">desc_ordinal(</font><font
class="args">int n</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Describe the
ordinal n in English. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    123 -> "one hundred twenty-third"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#desc_cardinal">desc_cardinal</a> </td>
</tr> </table>

### Describe

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Describe</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">string</font> <font
class="fun">Describe(</font><font class="args">object
o</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> string </td>

</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Describe() is used to get string
descriptions of objects, like $actor, $target, etc. in a merry script.
<br/>It can take multiple objects simultaneously as ({ object one,
object two, ... }). <br/>It can take an optional second parameter
which will describe o in objective form. <br/>If the second param
is nil and the third parameter is o, Describe() will describe in first
person (you). <br/>If both the second and third parameters are o,
Describe() will describe in possessive first person (yourself).
<br/>The fourth parameter is a flag that can optionally be set to:
<br/>STYLE_NONPOSS /* don't do the 'his frog' thing **/
<br/>STYLE_DEFINITE /** the frog **/ <br/>STYLE_REL_LOC
/** the frog in his bag **/ <br/>STYLE_FIRST_PERSON /** the frog
in your bag */

<br/>STYLE_REDUCE_CHUNK /* avoid look frogs -> four frogs
**/ <br/>STYLE_PRONOUN /** allow i.e. 'yourself' vs 'you' **/
<br/>STYLE_NOCLUSTER /** (undocumented) **/
<br/>STYLE_NO_SHOW_INVIS /** don't show unseen objects **/
<br/>STYLE_WEAK_LOOKER /** don't replace Zell with You **/
<br/>STYLE_IGNORE_VISIBILITY /** ignores luminosity from the
actors p.o.v. */ </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Examples using the first and second parameters:
    Describe( $actor ) -> "StoryCoder Kalle"
    Describe( $actor, $actor ) -> "him"
    Describe( $actor, nil, $actor ) -> "you"
    Describe( $actor, $actor, $actor ) -> "yourself"

</td> </tr>

</table>

### dgd_version

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>dgd_version</td>

</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> int </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: dgd_version()
    Merry result: 12071

</td> </tr>

</table>

### do

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>do</td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Do..while loops work exactly like while-loops except
that the condition is checked AFTER the block is executed, rather than
before. This means the block will be executed at least once regardless.
</td> </tr> <tr> <td valign="top">
**Example(s):**

</td> <td valign="top">

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

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a href="#for">for</a>
and <a href="#while">while</a>

</td> </tr> </table>

### dump_value

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>dump_value</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">dump_value(</font><font class="args">mixed
value</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Convert any property into a string value. </td>
</tr> <tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    Merry code: dump_value( $actor )
    Merry result: "<Marrach:players:K:kalle>"

    Merry code: dump_value( args )
    Merry result: "([ \"actor\":<Marrach:players:K:kalle>, \"body\":<Marrach:players:K:kalle>, \"here\":<Marrach:Coders:kalle:rooms:home>, \"looker\":<Marrach:players:K:kalle>, \"this\":<Marrach:players:K:kalle> ])"

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#ascii_to_mixed">ascii_to_mixed</a> and <a
href="#mixed_to_ascii">mixed_to_ascii</a> </td>
</tr> </table>

### Duplicate

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>Duplicate</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">object</font> <font
class="fun">Duplicate(</font><font class="args">object
ob</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> object </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

This function makes a copy of an existing object, just like the
"Duplicate" button in WOE works.<br/>For a merryized version of
+spawn, check out Spawn(). </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    $copy_of_Generic_drink_mug_coffee = Duplicate( ${Generic:drink:mug-coffee} );
    $copy_of_Generic_drink_mug_coffee."base:objectname" = "Marrach:Coders:kalle:my_own_coffee_object";

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#Spawn">Spawn</a> and <a
href="#Slay">Slay</a> </td> </tr> </table>

## E

### EmitIn

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>EmitIn</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">EmitIn(</font><font class="args">object o,
string s, object exclude_one, object exclode_another,
...</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> void </td>
</tr>

<tr> <td valign="top"> **Example(s):** </td>

<td valign="top">

    Merry command to emit a string of text into an environment, such as a room.
    Example:
    EmitIn( $actor."base:environment", "This goes to everyone in the same room as $actor." );
    EmitIn( $actor."base:environment", "This also goes to everyone in $actor's presence, except $actor himself.", $actor );

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#EmitTo">EmitTo</a> </td> </tr>
</table>

### EmitTo

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>EmitTo</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">void</font>
<font class="fun">EmitTo(</font><font
class="args">object o, string s</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> void

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Merry command to
emit a string of text to a single object. </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    EmitTo( $actor, "Tag! You're it!" );

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#EmitIn">EmitIn</a> </td> </tr>
</table>

### error

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>error</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">void</font> <font
class="fun">error(</font><font class="args">string
errormessage</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> void </td>

</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Cause an error, which will stop
execution. If the error is caught, execution will continue after the
catch.<br/><br/>Note that error() and Error() -- with only
error() documented here -- do the exact same thing. </td>
</tr>

<tr> <td valign="top"> **See also:** </td>

<td valign="top"> <a href="#catch">catch</a>
</td> </tr> </table>

### Every

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Every</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">string</font> <font
class="fun">Every(</font><font class="args">string
script, int frequency</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top">

**Return value(s):** </td> <td valign="top"> string
</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Every() is used to
create an infinitely looping process.<br/>It returns an identifier
string for the process it creates, and it takes two
arguments,<br/>- the timer:-script to execute<br/>- the
frequency in seconds<br/><br/>There is no need to do any
loops on your own, like while( TRUE ){ ... }, when using Every(), but
take note that the script is actually halted, and all variables it uses
are reset each time it's called.<br/>It is also very important to
keep track of the identifier string it returns, as without it you cannot
ever turn off the loop.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

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

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#Stop">Stop</a> </td> </tr> </table>

### exp

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>exp</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">exp(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> float </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
Return the exponential value of the given argument.<br/>

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: exp(0.0)
    Merry result: 1.0

    Merry code: exp(0.5)
    Merry result: 1.6487213

    Merry code: exp(1.0)
    Merry result: 2.7182818

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a href="#log">log</a>,
<a href="#log10">log10</a> and <a
href="#pow">pow</a> </td> </tr> </table>

### explode

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>explode</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string *</font> <font
class="fun">explode(</font><font class="args">string str,
string separator</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string * </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return an array of substrings of str, divided by the given
separator.<br/>The separators that str starts and ends with, if
any, are not taken into account.<br/> </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: explode("This is a test"," ")
    Merry result: ({ "This", "is", "a", "test" })

</td> </tr> <tr>

<td valign="top"> **See also:** </td> <td
valign="top"> <a href="#implode">implode</a>, <a
href="#sscanf">sscanf</a> and <a
href="#parse_string">parse_string</a> </td>
</tr> </table>

## F

### fabs

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>fabs</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td>

<font class="ret">float</font> <font
class="fun">fabs(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> float </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the absolute value of the argument.<br/>
</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: fabs(-14.9)
    Merry result: 14.9

</td> </tr>

</table>

### find_object

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>find_object</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">object</font> <font
class="fun">find_object(</font><font class="args">string
obj</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top">

**Return value(s):** </td> <td valign="top"> object
</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> The string argument
is resolved as a file path, and the object with the resulting name is
searched for. Either the object, if found, or zero is
returned.<br/> </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: find_object("/base/obj/thing#4803")
    Merry result: <Chatters:LC:ch:allen-christopher>

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#object_name">object_name</a> </td> </tr>
</table>

### FindMerry

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>FindMerry</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">object</font> <font
class="fun">FindMerry(</font><font class="args">object
src, string type, string name</font><font
class="fun">)</font> </td> </tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> object </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
FindMerry is used in cases where it is imperative to figure out 1)
whether a particular Merry script is present in an object, and/or 2)
where that Merry script is located. <br/>

<br/>As objects may have references for Merry scripts (aka
"inherits"), the actual location of the script itself is at times not
equal to the object nor either of its UrParents. </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: FindMerry( $actor, "react-post", "hit-dob" )
    Merry result: <MGeneric:UrHuman>

</td> </tr>

</table>

### first_elements

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>first_elements</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">mixed *</font>
<font class="fun">first_elements(</font><font
class="args">mixed arr, int num</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> mixed *

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Retrieve
<num> number of elements from <arr>, starting at the
beginning and moving toward the end resulting in the first <num>
values of <arr>.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: first_elements( ({ "1", "2", "3", "4" }), 2 )
    Merry result: ({ "1", "2" })

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#last_elements">last_elements</a> </td>
</tr> </table>

### flatten

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>flatten</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">array</font> <font
class="fun">flatten(</font><font class="args">mixed
**value</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> array </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
Convert a two-dimensional array -- e.g. ({ ({ 1 }) }) -- to a regular
array through the use of the flatten() function. </td>

</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: flatten( ({ ({ "A1", "B1", "C1" }), ({ "A2", "B2", "C2" }) }) )
    Merry result: ({ "A1", "B1", "C1", "A2", "B2", "C2" })

</td> </tr>

</table>

### flatten_structmap

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>flatten_structmap</td> </tr>

</table>

### floor

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>floor</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td>

<font class="ret">float</font> <font
class="fun">floor(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> float </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Round the argument towards negative
infinity.<br/> </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: floor(14.9)
    Merry result: 14.0

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#ceil">ceil</a> and <a
href="#fmod">fmod</a> </td> </tr>

</table>

### Flt

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Flt</td> </tr> <tr> <td valign="top">
**Syntax:**

</td> <td> <font class="ret">float</font>
<font class="fun">Flt(</font><font class="args">mixed
value</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> float

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Convert an
appropriate value to a float.<br/>Note that this does not work
with all properties.<br/>- Strings must begin with a numeric
character, and are truncated at the first non-numeric character (except
points ('.')), including e.g. '+', '-', e.t.c.<br/>- All floats
and integers are applicable.<br/>- No objects, arrays or mappings
are applicable. </td> </tr> <tr> <td
valign="top">

**Example(s):** </td> <td valign="top">

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

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a href="#Int">Int</a>,
<a href="#Str">Str</a>, <a
href="#dump_value">dump_value</a>,

<a href="#mixed_to_ascii">mixed_to_ascii</a> and <a
href="#ascii_to_mixed">ascii_to_mixed</a>

</td> </tr> </table>

### fmod

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>fmod</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">fmod(</font><font class="args">float x, float
y</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> float </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the value f, for which there exists an integer k
such that<br/>k * y + f == x, f has the same sign of x, and the
absolute value of<br/>f is less than the absolute value of
y.<br/> </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: fmod(25.0,5.0)
    Merry result: 0.0

    Merry code: fmod(25.0,6.0)
    Merry result: 1.0

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#ceil">ceil</a> and <a
href="#floor">floor</a> </td> </tr> </table>

### foo

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:**

</td> <td>foo</td> </tr>

</table>

### for

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:**

</td> <td>for</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret"></font> <font
class="fun">for(</font><font class="args"><once>;
<check>; <do></font><font
class="fun">)</font> </td>

</tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> for-loops are essentially a compression of the
following:<br/>---<br/>/* for( <x>; <y>;
<z> ){ <code> } */<br/><x>;<br/>while(
<y>
){<br/><code><br/><z>;<br/>}<br/>---<br/><br/>They
are traditional and frequently occuring in almost all programming
languages. If the concept of for-loops still elude you, you may wish to
look around on the internet for other, more verbose explanations.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

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

</td> </tr> <tr>

<td valign="top"> **See also:** </td> <td
valign="top"> <a href="#while">while</a> and <a
href="#do">do</a> </td> </tr> </table>

### format_float

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>format_float</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">format_float(</font><font class="args">float
f, int dec</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return f such that the result has dec decimal points. </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: format_float( 0.3, 4 )
    Merry result: "0.3000"

</td> </tr>

</table>

### frexp

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>frexp</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">mixed *</font> <font
class="fun">frexp(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> mixed * </td>

</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> The argument is split into a
fraction f and an integer exponent n, such that either f == 0.0, or 0.5
<= \| f \| < 1.0, and f * 2 ** n == x.<br/>({ f, n }) is
returned. If x == 0.0, both f and n will be zero.<br/> </td>
</tr> <tr> <td valign="top">

**Example(s):** </td> <td valign="top">

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

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#ldexp">ldexp</a> and <a
href="#modf">modf</a>

</td> </tr> </table>

### full_explode

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>full_explode</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string *</font> <font
class="fun">full_explode(</font><font
class="args">string str, string del</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> string * </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: full_explode( "|foo|", "|" )
    Merry result: ({ "", "foo", "" })

    (compared to)

    Merry code: explode( "|foo|", "|" )
    Merry result: ({ "foo" })

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#explode">explode</a> and <a
href="#implode">implode</a> </td> </tr>
</table>

## G

### Get

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Get</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">Get(</font><font class="args">object ob,
string property</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> mixed </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Get() is used to retrieve a property from an object. It has a built-in
shorter syntax as well,<br/><br/>Get( x, "y" ) ->
x."y"<br/><br/>The shorter version only works if y is an
absolute string value ("abc" is absolute, $property is not), otherwise
the Get() function must be used. </td> </tr> <tr>
<td valign="top"> **Example(s):** </td> <td
valign="top">

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

</td>

</tr> <tr> <td valign="top"> **See also:** </td>
<td valign="top"> <a href="#Set">Set</a> </td>
</tr> </table>

### get_by_int

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>get_by_int</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">get_by_int(</font><font
class="args">mapping bigmap, int ix</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> mixed </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Get a value from a bigmap mapping from a bigmap indice specified using
an integer identifier. </td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#set_by_int">set_by_int</a>,
<a href="#clear_by_int">clear_by_int</a>,

<a href="#get_by_ob">get_by_ob</a>, <a
href="#set_by_ob">set_by_ob</a>,

<a href="#clear_by_ob">clear_by_ob</a>, <a
href="#get_by_str">get_by_str</a>,

<a href="#set_by_str">set_by_str</a> and <a
href="#clear_by_str">clear_by_str</a>

</td> </tr> </table>

### get_by_ob

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>get_by_ob</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">get_by_ob(</font><font class="args">mapping
bigmap, object ob</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top"> **Return
value(s):**

</td> <td valign="top"> mixed </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Get a value from a bigmap mapping from a bigmap indice
specified using an object identifier. </td> </tr>

<tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#get_by_int">get_by_int</a>, <a
href="#set_by_int">set_by_int</a>,

<a href="#clear_by_int">clear_by_int</a>, <a
href="#set_by_ob">set_by_ob</a>,

<a href="#clear_by_ob">clear_by_ob</a>, <a
href="#get_by_str">get_by_str</a>,

<a href="#set_by_str">set_by_str</a> and <a
href="#clear_by_str">clear_by_str</a>

</td> </tr> </table>

### get_by_str

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>get_by_str</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">get_by_str(</font><font
class="args">mapping bigmap, string str</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> mixed </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Get a value from a bigmap mapping from a bigmap indice
specified using a string identifier. </td> </tr>

<tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#get_by_int">get_by_int</a>, <a
href="#set_by_int">set_by_int</a>,

<a href="#clear_by_int">clear_by_int</a>, <a
href="#get_by_ob">get_by_ob</a>,

<a href="#set_by_ob">set_by_ob</a>, <a
href="#clear_by_ob">clear_by_ob</a>,

<a href="#set_by_str">set_by_str</a> and <a
href="#clear_by_str">clear_by_str</a>

</td> </tr> </table>

### get_day

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>get_day</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">get_day(</font><font class="args">int
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Derive the month day from the UNIX timestamp <n>
and return this as an integer value. </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: "Day of the month: " + get_day( time() )
    Merry result: "Day of the month: 12"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#time">time</a>, <a
href="#ctime">ctime</a>, <a
href="#short_time">short_time</a>,

<a href="#smalltime">smalltime</a>, <a
href="#get_month">get_month</a>,

<a href="#get_year">get_year</a>, <a
href="#get_hour">get_hour</a>,

<a href="#get_minute">get_minute</a>, <a
href="#get_second">get_second</a> and <a
href="#calculate_stamp">calculate_stamp</a>

</td> </tr> </table>

### get_hour

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>get_hour</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">get_hour(</font><font class="args">int
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the hour as specified in the UNIX timestamp
<n> as an integer value. </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: "Current hour: " + get_hour( time() )
    Merry result: "Current hour: 7"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#time">time</a>, <a
href="#ctime">ctime</a>, <a
href="#short_time">short_time</a>,

<a href="#smalltime">smalltime</a>, <a
href="#get_day">get_day</a>,

<a href="#get_month">get_month</a>, <a
href="#get_year">get_year</a>,

<a href="#get_minute">get_minute</a>, <a
href="#get_second">get_second</a> and <a
href="#calculate_stamp">calculate_stamp</a>

</td> </tr> </table>

### get_minute

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>get_minute</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">get_minute(</font><font class="args">int
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the minutes passed since last new hour as
specified in the UNIX timestamp <n> as an integer value.
</td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: "Minutes since last new hour: " + get_minute( time() )
    Merry result: "Minutes since last new hour: 40"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#time">time</a>, <a
href="#ctime">ctime</a>, <a
href="#short_time">short_time</a>,

<a href="#smalltime">smalltime</a>, <a
href="#get_day">get_day</a>,

<a href="#get_month">get_month</a>, <a
href="#get_year">get_year</a>,

<a href="#get_hour">get_hour</a>, <a
href="#get_second">get_second</a> and <a
href="#calculate_stamp">calculate_stamp</a>

</td> </tr> </table>

### get_month

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>get_month</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">get_month(</font><font class="args">int
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Derive the month of the year from the UNIX timestamp
<n> and return this as an integer value. </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: "Month of the year: " + get_month( time() )
    Merry result: "Month of the year: 5"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#time">time</a>, <a
href="#ctime">ctime</a>, <a
href="#short_time">short_time</a>,

<a href="#smalltime">smalltime</a>, <a
href="#get_day">get_day</a>,

<a href="#get_year">get_year</a>, <a
href="#get_hour">get_hour</a>,

<a href="#get_minute">get_minute</a>, <a
href="#get_second">get_second</a> and <a
href="#calculate_stamp">calculate_stamp</a>

</td> </tr> </table>

### get_second

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>get_second</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">get_second(</font><font class="args">int
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the seconds since last new minute as specified
in the UNIX timestamp <n> as an integer value. </td>
</tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: "Seconds since last new minute: " + get_second( time() )
    Merry result: "Seconds since last new minute: 33"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#time">time</a>, <a
href="#ctime">ctime</a>, <a
href="#short_time">short_time</a>,

<a href="#smalltime">smalltime</a>, <a
href="#get_day">get_day</a>,

<a href="#get_month">get_month</a>, <a
href="#get_year">get_year</a>,

<a href="#get_hour">get_hour</a>, <a
href="#get_minute">get_minute</a> and <a
href="#calculate_stamp">calculate_stamp</a>

</td> </tr> </table>

### get_year

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>get_year</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">get_year(</font><font class="args">int
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the year as specified in the UNIX timestamp
<n> as an integer value. </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: get_year( time() )
    Merry result: 2004

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#time">time</a>, <a
href="#ctime">ctime</a>, <a
href="#short_time">short_time</a>,

<a href="#smalltime">smalltime</a>, <a
href="#get_day">get_day</a>,

<a href="#get_month">get_month</a>, <a
href="#get_hour">get_hour</a>,

<a href="#get_minute">get_minute</a>, <a
href="#get_second">get_second</a> and <a
href="#calculate_stamp">calculate_stamp</a>

</td> </tr> </table>

### GetVar

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>GetVar</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">GetVar(</font><font class="args">string
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> mixed </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> GetVar() is used to retrieve the value of a variable
with a name reference, usually used when the variable's name itself is
unresolved at compile time. <br/> </td> </tr>
<tr> <td valign="top">

**Example(s):** </td> <td valign="top">

    $name = "address";
    $address = "Skogsb. 27";
    EmitTo( $actor, GetVar( $name ));
    /*
     * emits "Skogsb. 27", found in $address, to $actor
     */

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#SetVar">SetVar</a>, <a href="#Set">Set</a>
and <a href="#Get">Get</a>

</td> </tr> </table>

## H

### hash_crc16

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>hash_crc16</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">hash_crc16(</font><font class="args">string
str, string extra...</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top"> **Return
value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Compute the 16 bit Cyclic Redundancy Code of the
concatenation of all string arguments, with
polynomial:<br/><br/>X^16 + X^12 + X^5 +
1<br/><br/>CRC-16 is considered suitable for strings of up
to a total of 4096 characters.<br/> </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: hash_crc16("text")
    Merry result: 49980

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#hash_md5">hash_md5</a> </td> </tr>
</table>

### hash_md5

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>hash_md5</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">string</font> <font
class="fun">hash_md5(</font><font class="args">string
str, string extra...</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top">

**Return value(s):** </td> <td valign="top"> string
</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Compute the 128 bit
MD5 message digest of the concatenation of all string arguments. The
result is a string of 16 characters.<br/> </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

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

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#hash_crc16">hash_crc16</a> </td>
</tr> </table>

### hex_digit

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>hex_digit</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">int</font> <font
class="fun">hex_digit(</font><font class="args">int
nibble</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top">

**Return value(s):** </td> <td valign="top"> int </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Return the hexadecimal character of
nibble, smaller than 16. </td> </tr> <tr>

<td valign="top"> **Example(s):** </td> <td
valign="top">

    11 -> 'b'

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#string_to_hex">string_to_hex</a>

</td> </tr> </table>

### humanized_date

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>humanized_date</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">humanized_date(</font><font class="args">int
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Extract a humanized date from a unix timestamp integer
value, such as the one retrieved from time(). </td> </tr>
<tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    Merry code: humanized_date( time() )
    Merry result: "8:19 AM, May 31st, 2003"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#ctime">ctime</a>, <a
href="#time">time</a>, <a
href="#short_time">short_time</a>,

<a href="#rfc_1123_date">rfc_1123_date</a>, <a
href="#days">days</a> and <a
href="#smalltime">smalltime</a>

</td> </tr> </table>

## I

### if

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>if</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret"></font> <font
class="fun">if(</font><font
class="args"><condition></font><font
class="fun">)</font> </td> </tr>

<tr> <td valign="top"> **Description:** </td>

<td valign="top"> Mastering if-statements is an absolute necessity
for any programmer of almost any language.<br/>If-statements occur
regularly and are used to control and specify how a piece of code should
react and handle various 'situations' (conditions) by scanning
conditions and variables and acting based on the
results.<br/>Below are a good amount of examples describing a good
amount (but not all) of the various ways if-cases can be used in
merry.<br/>Take note, however, that things such as AND, OR, etc.
are not exclusively used in if-statements (hence, it's not at all a bad
idea to learn them all as soon as you can). </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

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

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#switch">switch</a> </td> </tr>
</table>

### implode

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>implode</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">implode(</font><font class="args">string
*arr, string separator</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return a string, consisting of all string elements of the array arr
concatenated, separated by the string separator.<br/> </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: implode(({ "This", "is", "a", "test" }), " ")
    Merry result: "This is a test"

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#explode">explode</a>, <a
href="#sscanf">sscanf</a> and <a
href="#parse_string">parse_string</a> </td>
</tr> </table>

### In

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>In</td> </tr>

</table>

### index

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>index</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td>

<font class="ret">The index value in <a> for the first
occurence of the value <val>.</font> <font
class="fun">index(</font><font class="args">mixed val,
array a</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top">

The index value in <a> for the first occurence of the value
<val>. </td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> The index()
function is used to retrieve the index position in an array of the first
occurence of a value.<br/>index() will return the integer index
position, or -1 if the value is not found anywhere in the array.
</td> </tr> <tr>

<td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: $array = ({ "Kalle", "Jess", "Jim", "Bob" }); EmitTo($actor, dump_value(index("Bob", $array)));
    Return value: 3
    Merry code: $array = ({ "Kalle", "Jess", "Jim", "Bob" }); EmitTo($actor, dump_value(index("George", $array)));
    Return value: -1

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#member">member</a>

</td> </tr> </table>

### Int

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Int</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">Int(</font><font class="args">mixed
value</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Convert an appropriate value to an
integer.<br/>Note that this does not work with all
properties.<br/>- Strings must begin with a numeric character, and
are truncated at the first non-numeric character, including e.g. '+',
'-', e.t.c. AND points ('.'), which are taken into account in
Flt().<br/>- All floats and integers are applicable.<br/>-
No objects, arrays or mappings are applicable. </td>

</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

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

</td> </tr> <tr> <td valign="top"> **See also:**
</td>

<td valign="top"> <a href="#Flt">Flt</a>, <a
href="#Str">Str</a>, <a
href="#dump_value">dump_value</a>,

<a href="#mixed_to_ascii">mixed_to_ascii</a> and <a
href="#ascii_to_mixed">ascii_to_mixed</a> </td>
</tr> </table>

## L

### last_elements

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>last_elements</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td>

<font class="ret">mixed *</font> <font
class="fun">last_elements(</font><font
class="args">mixed arr, int num</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> mixed * </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Retrieve <num> number of elements from
<arr>, starting at the end and moving toward the beginning
resulting in the last <num> values of <arr>.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: last_elements( ({ "1", "2", "3", "4" }), 2 )
    Merry result: ({ "3", "4" })

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#first_elements">first_elements</a> </td>
</tr> </table>

### ldexp

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>ldexp</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">ldexp(</font><font class="args">float x, int
n</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> float </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
Return the value x * 2 ** n.<br/>

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: ldexp(4.0, 0)
    Merry result: 4.0

    Merry code: ldexp(4.0, 1)
    Merry result: 8.0

    Merry code: ldexp(4.0, 2)
    Merry result: 16.0

    Merry code: ldexp(4.0, 3)
    Merry result: 32.0

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#frexp">frexp</a> and <a
href="#modf">modf</a> </td> </tr> </table>

### log

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>log</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">float</font> <font
class="fun">log(</font><font class="args">float
x</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> float </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return the natural logarithm of the argument.<br/> </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: log(0.5)
    Merry result: -0.69314718

    Merry code: log(1.0)
    Merry result: 0.0

    Merry code: log(2.0)
    Merry result: 0.69314718

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#exp">exp</a>, <a href="#log10">log10</a>
and <a href="#pow">pow</a> </td> </tr>
</table>

### log10

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>log10</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">log10(</font><font class="args">float
x</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> float </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return the logarithm of the argument to base 10.<br/> </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: log10(0.5)
    Merry result: -0.30103

    Merry code: log10(1.0)
    Merry result: 0.0

    Merry code: log10(2.0)
    Merry result: 0.30103

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#exp">exp</a>, <a href="#log">log</a> and
<a href="#pow">pow</a> </td> </tr>
</table>

### lower_case

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>lower_case</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">lower_case(</font><font class="args">string
str</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Downcase each letter in str. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    "SkotOS" -> "skotos"

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#upper_case">upper_case</a>, <a
href="#capitalize">capitalize</a>,

<a href="#decapitalize">decapitalize</a> and <a
href="#proper">proper</a> </td> </tr>
</table>

## M

### make_url

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>make_url</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">make_url(</font><font class="args">string
base, mapping args, varargs int secure</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

The make_url() function creates a string URL which includes page
(<base>) and any amount of arguments (<args>). </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: make_url( "some_page", ([ "some property" : "some value", "other property" : "other value", "actor" : $actor, "year" : 2004 ]) )
    Merry result: "some_page?actor=Marrach%3Aplayers%3AK%3Akalle&other property=other+value&some property=some+value&year=2004"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#url_decode">url_decode</a>, <a
href="#url_encode">url_encode</a> and <a
href="#url_absolute">url_absolute</a> </td>

</tr> </table>

### map_indices

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>map_indices</td> </tr> <tr> <td
valign="top">

**Syntax:** </td> <td> <font class="ret">mixed
*</font> <font
class="fun">map_indices(</font><font
class="args">mapping map</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td>

<td valign="top"> mixed * </td> </tr> <tr>
<td valign="top"> **Description:** </td> <td
valign="top"> Return an array containing the indices of mapping
map.<br/> </td> </tr> <tr> <td
valign="top"> **Example(s):**

</td> <td valign="top">

    Merry code: map_indices(([ "Monday" : "Meatloaf", "Tuesday" : "Chicken", "Wednesday" : "Tater tots", "Thursday" : "Fish", "Friday" : "Leftovers", ]))
    Merry result: ({ "Friday", "Monday", "Thursday", "Tuesday", "Wednesday" })

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#map_values">map_values</a> </td> </tr>

</table>

### map_sizeof

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>map_sizeof</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">int</font> <font
class="fun">map_sizeof(</font><font class="args">mapping
map</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> int

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> map_sizeof() is
used to determine the size of a mapping. </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: map_sizeof( ([ "foo" : "bar", "george" : "hamster" ]) )
    Merry result: 2

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#sizeof">sizeof</a> and <a
href="#strlen">strlen</a> </td>

</tr> </table>

### map_values

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>map_values</td> </tr> <tr> <td
valign="top">

**Syntax:** </td> <td> <font class="ret">mixed
*</font> <font
class="fun">map_values(</font><font class="args">mapping
map</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td>

<td valign="top"> mixed * </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: map_values(([ "Monday" : "Meatloaf", "Tuesday" : "Chicken", "Wednesday" : "Tater tots", "Thursday" : "Fish", "Friday" : "Leftovers", ]))
    Merry result: ({ "Leftovers", "Meatloaf", "Fish", "Chicken", "Tater tots" })

</td> </tr> <tr>

<td valign="top"> **See also:** </td> <td
valign="top"> <a href="#map_indices">map_indices</a>
</td> </tr> </table>

### Match

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>Match</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">NRef *</font> <font
class="fun">Match(</font><font class="args">object ob,
string name, varargs object looker, string adj...</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> NRef * </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Match a name (name) and any amount of adjectives (adj...) with a
source's inventory (ob). </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    $black_cats = Match($actor, "cat", $actor, "black");
    EmitTo($actor, 
      "The following black cats are in your inventory: " +
        Describe($black_cats));

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#MatchPlural">MatchPlural</a> </td> </tr>
</table>

### MatchPlural

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>MatchPlural</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">NRef *</font> <font
class="fun">MatchPlural(</font><font class="args">object
ob, string pname, varargs object looker, string
adj...</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> NRef * </td> </tr> <tr>
<td valign="top"> **Description:** </td> <td
valign="top"> Match a pname (plural name) and any amount of
adjectives (adj...) with a source's inventory (ob). </td>

</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    $black_cats = MatchPlural( $actor, "cats", $actor, "black" );
    EmitTo($actor, 
      "The following black cats are in your inventory: " + 
      Describe($black_cats));

</td> </tr> <tr> <td valign="top"> **See also:**
</td>

<td valign="top"> <a href="#Match">Match</a>
</td> </tr> </table>

### member

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>member</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">int</font> <font
class="fun">member(</font><font class="args">mixed m,
array a</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top">

**Return value(s):** </td> <td valign="top"> int </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> To figure out whether an array
contains a certain value, you use member(). The
following:<br/>for( i = 0; i < sizeof( a ); i++ )<br/>if(
a\[i\] == val ) {<br/>/* found it!
**/<br/>}<br/>Could instead be written as:<br/>if(
member( val, a )) {<br/>/** found it! */<br/>}

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry result: 1
    Merry code: member( "a", ({ "a", "b", "c" }) )

</td> </tr>

</table>

### millitime

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>millitime</td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top">

mixed * </td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Return the current
time as an array ({ time, fraction }), where time is an integer denoting
the current time in seconds, and fraction is a float in range \[0.0 ..
1.0>, denoting the fraction of the current second that has passed,
with a resolution of 0.001.<br/> </td> </tr>
<tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    Merry code: millitime()
    Merry result: ({ 1049514170, 0.983 })

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#time">time</a> and <a
href="#ctime">ctime</a>

</td> </tr> </table>

### mixed_to_ascii

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>mixed_to_ascii</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">mixed_to_ascii(</font><font
class="args">mixed value</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Convert any property to a string value.<br/>Note
that this function is a clone of dump_value().<br/>For examples
and further information, read the 'dump_value' reference. </td>
</tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a
href="#ascii_to_mixed">ascii_to_mixed</a> and <a
href="#dump_value">dump_value</a> </td> </tr>
</table>

### modf

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>modf</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font class="ret">float
*</font> <font class="fun">modf(</font><font
class="args">float x</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> float * </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Split the argument into a fraction f and an integer part n, such that \|
f \| < 1.0, and f + n == x. ({ f, n }) is returned. Note that n is
returned as a float, and may not be representable in type
int.<br/> </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: modf(0.0)
    Merry result: ({ 0.0, 0.0 })

    Merry code: modf(0.5)
    Merry result: ({ 0.5, 0.0 })

    Merry code: modf(1.0)
    Merry result: ({ 0.0, 1.0 })

    Merry code: modf(2.0)
    Merry result: ({ 0.0, 2.0 })

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#frexp">frexp</a> and <a
href="#ldexp">ldexp</a> </td> </tr> </table>

## N

### NewNRef

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>NewNRef</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">NRef</font> <font
class="fun">NewNRef(</font><font class="args">object obj,
string detail</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> NRef </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Create a new NRef for an object. </td> </tr> <tr>
<td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: NewNRef( $actor, "nose" )
    Merry result: (43)O(/base/data/nref#-1, <Marrach:players:K:kalle>, "nose")

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#NRefOb">NRefOb</a> and <a
href="#NRefDetail">NRefDetail</a> </td> </tr>
</table>

### NRefDetail

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>NRefDetail</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">NRefDetail(</font><font class="args">NRef
n</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Find out the detail ID an NRef is referring to. </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry condition: Actor is smiling at someone's arm ($target). To figure out which part of 'someone' the actor is smiling at:
    Merry code: NRefDetail( $target )
    Merry result: "arm

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#NRefOb">NRefOb</a> and <a
href="#NewNRef">NewNRef</a> </td> </tr>
</table>

### NRefOb

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>NRefOb</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">object</font> <font
class="fun">NRefOb(</font><font class="args">NRef
n</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> object </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Figure out which object an NRef is referring to. </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry condition: Actor is smiling at someone's arm ($target). To figure out who 'someone' is:
    Merry code: NRefOb( $target )
    Merry result: (object reference for 'someone')

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#NRefDetail">NRefDetail</a> and <a
href="#NewNRef">NewNRef</a> </td> </tr>
</table>

### NRefsEqual

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>NRefsEqual</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">int</font> <font
class="fun">NRefsEqual(</font><font class="args">NRef
left, NRef right</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> int </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

NRefsEqual is used to check whether two NRefs are equal.<br/>Note
that 'if( NRef1 == NRef2 )' will always return FALSE,
regardless.<br/>Hence, you must do 'if( NRefsEqual( NRef1, NRef2
))' instead. </td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: NRefsEqual( NewNRef( $actor, "nose" ), NewNRef( $actor, "nose" ))
    Merry result: 1
    Merry code: NRefsEqual( NewNRef( $actor, "default" ), $actor ))
    Merry result: 1
    Merry code: NRefsEqual( $actor, $actor )
    Merry result: 1
    Merry code: NRefsEqual( $actor, NewNRef( $actor, "ear" ))
    Merry result: 0

</td> </tr> <tr>

<td valign="top"> **See also:** </td> <td
valign="top"> <a href="#NRefOb">NRefOb</a>, <a
href="#NRefDetail">NRefDetail</a> and <a
href="#NewNRef">NewNRef</a> </td> </tr>
</table>

### Num

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Num</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td>

<font class="ret">mixed</font> <font
class="fun">Num(</font><font class="args">mixed
v</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> mixed </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Turn a string value <v> into a float or integer
value. The function will cause an error if <v> is not convertable.
</td> </tr> <tr> <td valign="top">

**Example(s):** </td> <td valign="top">

    Merry code: Num( "4" )
    Merry result: 4

    Merry code: Num( "4.5" )
    Merry result: 4.5

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a href="#Str">Str</a>,
<a href="#Int">Int</a>, <a
href="#Flt">Flt</a>,

<a href="#Arr">Arr</a> and <a
href="#Map">Map</a>

</td> </tr> </table>

### number_digit

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>number_digit</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">number_digit(</font><font class="args">int
hexvalue</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Convert any numeric value into a one-digit number,
based on the character code position (ASCII, in this case), into the
numeric value it represents. <br/>'5', the char, equals 53, the
numeric value. <br/>number_digit( 53 ) equals 5, the numeric
value. </td> </tr> <tr>

<td valign="top"> **Example(s):** </td> <td
valign="top">

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

</td> </tr>

</table>

## O

### Obj

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>Obj</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font
class="ret">object</font> <font
class="fun">Obj(</font><font class="args">string
s</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> object </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Obj() is used to retrieve an object's reference through the object's
string-name.<br/>For instance, if you have a string objectname,
which contains the name of an object you need to access, you could do ob
= Obj( objectname );<br/>If the objectname is user-specified, you
mustn't count on its validity; if the object <objectname> does not
exist, Obj() will return nil. if( ob ) /* object not exist error
handling */<br/>If the object is static, i.e. the name of the
object is predetermined and won't ever change, you are encouraged to use
the syntax ${objectname} instead. This is the exact same thing as Obj()
except that a reference in ${}'s will be updated automatically if the
object is ever renamed. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: Obj( "Generic:UrMale" )
    Merry result: <Generic:UrMale>

    Merry code: Obj( "Something:nonexistent" )
    Merry result: nil

</td> </tr>

</table>

### object_name

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>object_name</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">string</font> <font
class="fun">object_name(</font><font class="args">object
obj</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top">

**Return value(s):** </td> <td valign="top"> string
</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Return the name of
object obj.<br/> </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code:  object_name($actor)
    Runtime error: object_name() is replaced by name() and ur_name()

    Merry code:  name($actor)
    Merry result:  "Chatters:LC:ch:allen-christopher"

    Merry code:  ur_name($actor)
    Merry result:  "/base/obj/thing#4803"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#find_object">find_object</a> </td>
</tr> </table>

### obstat

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>obstat</td>

</tr>

</table>

### oneof

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>oneof</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">string</font> <font
class="fun">oneof(</font><font class="args">string alt1,
string alt2, ...</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top">

**Return value(s):** </td> <td valign="top"> string
</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Similar to the SAM
oneof, {One\|two\|three}, oneof() can be used to produce a random string
based on a number of alternatives. </td> </tr> <tr>

<td valign="top"> **Example(s):** </td> <td
valign="top">

    oneof( "George", "James", "John" ) -> either "George", "James" or "John".
    "Mr. " + oneof( "George", "James", "John" ) + " " + oneof( "Georgeson", "Jameson", "Johnson" ) -> Mr. George/James/John Georgeson/Jameson/Johnson, e.g. Mr. George Johnson.

</td> </tr>

</table>

### ordinal

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>ordinal</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">ordinal(</font><font class="args">string
str</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> int </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Convert a string expression of an ordinal number into an integer value.
</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: ordinal( "first" )
    Merry result: 1

    Merry code: ordinal( "fifth" )
    Merry result: 5

    Merry code: ordinal( "tenth" )
    Merry result: 10

    Merry code: ordinal( "ninetyninth" )
    Merry result: 99

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#cardinal">cardinal</a>, <a
href="#desc_ordinal">desc_ordinal</a> and <a
href="#desc_cardinal">desc_cardinal</a> </td>
</tr> </table>

## P

### pad_left

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>pad_left</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">pad_left(</font><font class="args">string
var, int size</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Pad var with spaces to the left, so that the result is size long.
</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: pad_left( "foo", 8 )
    Merry result: "   foo"
    (note that the result above contains five spaces, but only one is displayed in non-pre style)

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#strip_left">strip_left</a>, <a
href="#strip_right">strip_right</a>, <a
href="#strip">strip</a> and <a
href="#pad_right">pad_right</a> </td> </tr>
</table>

### pad_right

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>pad_right</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">pad_right(</font><font class="args">string
var, int size</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Pad var with spaces to the right, so that the result is size long.
</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: pad_right( "foo", 8 )
    Merry result: "foo    "
    (note that the result above contains five spaces, but only one is displayed in non-pre style)

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#strip_left">strip_left</a>, <a
href="#strip_right">strip_right</a>, <a
href="#strip">strip</a> and <a
href="#pad_left">pad_left</a> </td> </tr>
</table>

### parse_string

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>parse_string</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">parse_string(</font><font
class="args">string format, string str</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> mixed </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Parse a string as described by the grammar. The format of the grammar is
described in the document called 'Parsing'. If parsing is successful,
the parse tree is returned as an array. The optional third argument
specifies the number of alternative parse trees to integrate in the
result, if the grammar is ambiguous. parse_string() uses internal
object storage to cache grammars and generated automatons, which is not
removed until the object is destructed.<br/>This function cannot
be used from a user or editor
object.<br/><br/>Note:<br/>The parse_string kfun is a
very powerful parser to which you supply a grammar of your choice. It's
reminiscent of lex and yacc if you've used them before. DGD's
parse_string, unlike most parsers, keeps track of all your ambiguous
matches. That fact is both a great power and a great
responsibility.<br/><br/>What that means is that if your
grammar allows something to be parsed a couple of different ways then
DGD will keep track of them all while parsing. If there are two ways to
parse a double-if statement with else (the else can go with either if)
in your grammar, and you feed parse_string a chunk with fifteen of
those, you'll find that DGD is keeping track of 2^15 (that's around
32,000) different interpretations of your file. Then it will cheerfully
return only the first. That's slow, just in case you hadn't
guessed.<br/><br/>However, sometimes you want ambiguous
parsing. For instance, you may have a natural language parser for player
commands, and you'd like the player to be able to type "get down" and
have it mean either of "get down from the platform" or "take the down
pillow" according to two different grammar rules. DGD's parse_string
will return both parses, and you can decide which makes more sense where
the player is standing at the time. Most parsers won't do this for you.
Lucky you found DGD, hey?<br/><br/>A fellow named Steve
Foley has graciously put together a tutorial on parse_string, with the
aid of our own Nino (Erwin Harte). You can find it at
<http://www.mindspring.com/~zeppo1/parse_string.html><br/>
</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top">

<a href="#sscanf">sscanf</a>, <a
href="#explode">explode</a> and <a
href="#implode">implode</a> </td> </tr>
</table>

### ParseXML

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>ParseXML</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">mixed</font> <font
class="fun">ParseXML(</font><font class="args">string
XML</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> mixed </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

ParseXML() is used to convert an XML string to the appropriate value (a
SAM-string, for instance).<br/>Like the Bilbo $sam(), ParseXML()
used with UnSAM() constitute Merry's portal to the XML/SAM engine. It's
not going to be used as much as Bilbo's is, because SAM has few
abilities that Merry does not have natively. To emulate $sam(foo), use
UnSAM(ParseXML("foo")).<br/><br/>The real use of UnSAM() is
to handle binary SAM data stored in e.g. descriptions. If you have a
room with a description containing oneof's, for example, and you want to
create a text representation of this, you'd want to do something
like,<br/>str = UnSAM(Get(this,
"details:default:description:examine")); </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: ParseXML( "{sam-style|one|of}" )
    Merry result: X[S] {sam-style|one|of}

    Merry code: ParseXML( "<describe what=\"$actor\"/>" )
    Merry result: X[S] <describe what="$(actor)"/>

    Merry code: UnSAM( ParseXML( "<describe what=\"$actor\"/>" )
    Merry result: "StoryCoder Kalle"

    Merry code: ParseXML( "You are <describe what=\"$actor\"/>, the {heroic|fantastic|extraordinary|hulkhoganish|awesome|illiterate|analphabetic|dyslectic} {thief|villain|joe|wizard|viking|lord|knight|master} {of|from} {Sweden|Norway|York|Denmark|London|Scandinavia}!" )
    Merry result: X[S] You are <describe what="$(actor)"/>, the {heroic|fantastic|extraordinary|hulkhoganish|awesome|illiterate|analphabetic|dyslectic} {thief|villain|joe|wizard|viking|lord|knight|master} {of|from} {Sweden|Norway|York|Denmark|London|Scandinavia}!

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#UnSAM">UnSAM</a> </td> </tr>

</table>

### Popup

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Popup</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">void</font>
<font class="fun">Popup(</font><font
class="args">object recipient, object source, string
what</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> void

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> There is a new
Merry function called Popup(). If the user is running an official Skotos
client (Java, Zealous or Alice) this will cause a browser window to pop
up for the player, filled with whatever content you specify. For
example,<br/><br/>Popup($actor, $actor."base:environment",
"painting");<br/>will popup a window to $actor, displaying the
contents of the property html:painting in the actor's current
room.<br/><br/>Unsurprisingly, popup window content is
written in HTML, and we're lucky in that SAM -- which we normally use to
write text description -- is closely related to
HTML.<br/><br/>As an example, we might
have...<br/><br/>room.html:painting =
X\[S\]<br/><BODY bgcolor="black"><br/><IMG
src="<http://www.mydomain.com/images/painting.jpg%22/%3E>;<br/></BODY><br/><br/>which
wouldn't look good -- it'd be up to you to do cook up some nice looking
stylesheet, or something -- but you get the
idea.<br/><br/>Of course, SAM can do more than just
represent static HTML. SAM for popups can use the same active tags that
it does for text... we can pull values from the room and apply logic to
the values. For example, display different paintings depending on the
light level of the room...<br/><br/>room.html:painting =
X\[S\]<br/><BODY
bgcolor="$(this.painting:bgcolor)"><br/>{? \| $this.base:dark
\|<br/><IMG
src="<http://www.mydomain.com/images/painting-in-dark.jpg%22/%3E>;
\|<br/><IMG
src="<http://www.mydomain.com/images/painting-in-light.jpg%22/%3E>;<br/>}<br/></BODY><br/><br/>Again,
you get the basic idea.<br/><br/>These popups are built on
top of a general way for browsers to fetch the value of a property from
an in-game object. This system a special form of the basic URL syntax
you are used to from browsing the web. A URL that fetches the property
'html:painting' from 'Zell:Rooms:PaintingRoom' and displays it would
look like, /SAM/Prop/Zell:Rooms:PaintingRoom/painting and that is in
fact precisely the URL constructed by the Popup() call in Merry,
above.<br/><br/>The special format of this URL allows us to
use relative linking in a very handy way. Let's add a hyperlink to our
example:<br/><br/>room.html:painting =
X\[S\]<br/><BODY
bgcolor="$(this.painting:bgcolor)"><br/><A
href="painting-closeup"><br/>{? \| $this.base:dark
\|<br/><IMG
src="<http://www.mydomain.com/images/painting-in-dark.jpg%22/%3E>;
\|<br/><IMG
src="<http://www.mydomain.com/images/painting-in-light.jpg%22/%3E>;<br/>}<br/></A><br/></BODY><br/><br/>You
will note that the 'href' attribute of the link is a relative URL. The
browser will automatically expand this to
/SAM/Prop/Zell:Rooms:PaintingRoom/painting-closeup and so if you click
on the link, you will be taken to the contents of the property
'html:painting-closeup' in the same object as 'html:painting' is already
defined. This makes it easy to create links that navigate between web
properties in a single object.<br/><br/>For further
complexity, Merry can now be embedded anywhere in SAM -- either to be
included in the stream of text, or as attribute value to another SAM
tag. For example, let's say we want to automate the example above with
different paintings even further. We could dynamically create the URL
from the derived property
base:light-category:<br/><br/>room.html:painting =
X\[S\]<br/><BODY bgcolor="black"><br/><IMG
src='$\[<br/>/* MERRY: add the light category into the middle of
the URL */<br/>"http://www.mydomain.com/images/painting-"
+<br/>$this."base:light-category"
+<br/>".jpg"<br/>\]'/><br/></BODY><br/><br/>Things
get -really- exciting when you begin to use the zform and zact SAM tags,
which allow a Merry script to be executed on the server when the user
hits a submit button or a link. This means popups can contain controls,
such as start story configuration panels.

</td> </tr>

</table>

### pow

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>pow</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">float</font> <font
class="fun">pow(</font><font class="args">float x, float
y</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top">

**Return value(s):** </td> <td valign="top"> float
</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Return x to the
power y.<br/> </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: pow(10.0, 3.0)
    Merry result: 1000.0

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top">

<a href="#exp">exp</a>, <a href="#log">log</a>
and <a href="#log10">log10</a> </td> </tr>
</table>

### PRE

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>PRE</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">string</font> <font
class="fun">PRE(</font><font class="args">string
str</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Use PRE() to get the equivalent of the HTML <PRE> tag. </td>
</tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#TAG">TAG</a> </td>
</tr>

</table>

### prefixed_map

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>prefixed_map</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">mapping</font>
<font class="fun">prefixed_map(</font><font
class="args">mapping map, string prefix</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> mapping

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Extract all
elements from map where the indice (key) begins with
prefix.<br/>There are known issues with mappings that contain
non-alphanumeric characters, that may result in invalid results for this
specific function. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td>

<td valign="top">

    Merry code: prefixed_map( ([ "Monday" : "Meatloaf", "Tuesday" : "Chicken", "Wednesday" : "Tater tots", "Thursday" : "Fish", "Friday" : "Leftovers" ]), "Monday" )
    Merry result: ([ "Monday":"Meatloaf" ])

    Merry code: prefixed_map( ([ "ape" : "monkey", "adam" : "pig", "bertram" : "prince" ]), "a" )
    Merry result: ([ "adam":"pig", "ape":"monkey" ])

</td> </tr>

</table>

### previous_object

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:**

</td> <td>previous_object</td> </tr> <tr>
<td valign="top"> **Syntax:** </td> <td> <font
class="ret">varargs object</font> <font
class="fun">previous_object(</font><font
class="args">int n</font><font class="fun">)</font>
</td>

</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> varargs object </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Return the object n+1 (default: 1)
steps back in the call_other chain.<br/>If the object is
destructed, or the number of steps is larger than the number of
call_others involved, zero is returned.<br/>

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: previous_object()
    Merry result: </usr>

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#call_other">call_other</a>, <a
href="#this_object">this_object</a> and <a
href="#call_trace">call_trace</a> </td> </tr>
</table>

### previous_program

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>previous_program</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">previous_program(</font><font
class="args">varargs int n</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return the name of the object with the function n+1 (default: 1) steps
back in the function call chain. If the number of steps is larger than
the number of function calls involved, nil is returned.<br/>
</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: previous_program()
    Merry result: "/usr/SkotOS/lib/merrynode"

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#previous_object">previous_object</a> and <a
href="#call_trace">call_trace</a> </td> </tr>
</table>

### proper

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>proper</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">proper(</font><font class="args">string
str</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Make sure the first letter of each space-delimited word in str is
capitalized. </td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    "the kingdom of sweden" -> "The Kingdom Of Sweden"

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#lower_case">lower_case</a>, <a
href="#upper_case">upper_case</a>, <a
href="#capitalize">capitalize</a> and <a
href="#decapitalize">decapitalize</a> </td> </tr>
</table>

## Q

### query_editor

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>query_editor</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">query_editor(</font><font
class="args">object obj</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return the editor status of an object. This is either "command", if the
editor instance is in command mode, "insert", if the editor instance is
in input mode, or 0, if there is no editor instance for the given
object.<br/> </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: query_editor($actor)
    Merry result: nil

</td> </tr>

</table>

### query_ip_name

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>query_ip_name</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">string</font>
<font class="fun">query_ip_name(</font><font
class="args">object user</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> string

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Return the IP name
of a user, as a string, or nil if the given object is not a user object.
If the IP name could not be resolved, the IP number is returned,
instead.<br/> </td> </tr>

<tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#query_ip_number">query_ip_number</a>, <a
href="#send_datagram">send_datagram</a>,

<a href="#send_message">send_message</a>, <a
href="#this_user">this_user</a> and <a
href="#users">users</a> </td> </tr> </table>

### query_ip_number

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>query_ip_number</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">string</font> <font
class="fun">query_ip_number(</font><font
class="args">object user</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> string </td>

</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Return the ip number of a user, as a
string, or 0 if the given object is not a user object. </td>
</tr>

</table>

## R

### random

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>random</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">random(</font><font class="args">int
mod</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> int </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return a positive random number between 0 and integer specified within
() minus 1. <br/>The example would return a random number between
1 and 5 due to the modifier of +1. <br/>If modifier is less than
1, 0 is returned. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    random(5)+1

</td> </tr>

</table>

### replace_html

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>replace_html</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">string</font>
<font class="fun">replace_html(</font><font
class="args">string str</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> string

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Use replace_html()
to escape HTML. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    "foo & bar" -> "foo &amp; bar"

</td> </tr>

</table>

### replace_strings

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>replace_strings</td>
</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">string</font> <font
class="fun">replace_strings(</font><font
class="args">string str, string swaps...</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Replace substrings in str given in swaps. </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: replace_strings( "You, someone, must something!", "someone", "Kalle", "something", "jump" )
    Merry result: "You, Kalle, must jump!"

</td> </tr>

</table>

### replace_xml

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>replace_xml</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">string</font> <font
class="fun">replace_xml(</font><font class="args">string
str</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> string </td>

</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Escape a string, adding a backslash
character before any character significant to SAM. </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code:      ParseXML( "1<2 & 3>2" )
    Runtime error:   XML: file N/A line 1: unexpected token

    Merry code: replace_xml( "1<2 & 3>2" )
    Merry result: "1\\<2 \\&amp; 3\\>2"

    Merry code: ParseXML( replace_xml( "1<2 & 3>2" ))
    Merry result: X[S] 1\<2 \&amp; 3\>2

    Merry code: UnSAM( ParseXML( replace_xml( "1<2 & 3>2" )))
    Merry result: "1<2 &amp; 3>2"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#ParseXML">ParseXML</a> and <a
href="#UnSAM">UnSAM</a> </td> </tr> </table>

### restore_object

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>restore_object</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">int</font> <font
class="fun">restore_object(</font><font
class="args">string file</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> int

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Restore all global
variables in an object that are not private or static from a file. All
variables which qualify, but were not restored and do not contain object
values, will be set to 0. 1 is returned if the variables could be
restored, 0 otherwise.<br/> </td> </tr>

<tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#save_object">save_object</a> </td> </tr>
</table>

### reverse

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>reverse</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed *</font> <font
class="fun">reverse(</font><font class="args">mixed
*orig</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> mixed * </td> </tr> <tr>
<td valign="top"> **Description:** </td> <td
valign="top"> Reverse the array <orig>, result being an array
listing the values of <orig> backwards.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: reverse( ({ "ape", "monkey", "giraffe" }) )
    Merry result: ({ "giraffe", "monkey", "ape" })

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#reverse_mapping">reverse_mapping</a> </td>
</tr> </table>

### reverse_lookup

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>reverse_lookup</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">mixed</font> <font
class="fun">reverse_lookup(</font><font
class="args">mapping map, mixed val</font><font
class="fun">)</font> </td> </tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> mixed </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
Mappings are sequences of pairs, each pair containing an indice (key)
and a value. The ordinary way to read from a map is to read the values
by providing the indice - map\[<indice>\] == <value>. The
reverse_lookup function is used to read the indices by providing the
values.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: reverse_lookup( ([ "a":1, "b":2, "c":3 ]), 2 )
    Merry result: "b"

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#map_indices">map_indices</a> and <a
href="#map_values">map_values</a> </td> </tr>
</table>

### reverse_mapping

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>reverse_mapping</td>
</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">mapping</font> <font
class="fun">reverse_mapping(</font><font
class="args">mapping map</font><font
class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> mapping </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Reverse a mapping by setting indice->value, and
value->indice.<br/>Note that if a mapping contains several
identical values, such as (\[ "foo" : "bar", "foo2" : "bar" \]), a call
to reverse_mapping will result in a "mapping is not injective" runtime
error. </td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: reverse_mapping( ([ "foo" : "bar", "name" : "kalle" ]) )
    Merry result: ([ "bar":"foo", "kalle":"name" ])

</td> </tr>

</table>

### rfc_1123_date

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>rfc_1123_date</td> </tr> <tr> <td
valign="top">

**Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">rfc_1123_date(</font><font class="args">int
n</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td>

<td valign="top"> string </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
Extract a UNIX time stamp date as a string, formatted RFC-1123
compliant. </td> </tr> <tr> <td valign="top">
**Example(s):**

</td> <td valign="top">

    Merry code: rfc_1123_date( time() )
    Merry result: "Sat, 31 May 2003 14:21:43 GMT"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#ctime">ctime</a>, <a
href="#time">time</a>, <a
href="#short_time">short_time</a>,

<a href="#humanized_date">humanized_date</a>, <a
href="#days">days</a> and <a
href="#smalltime">smalltime</a>

</td> </tr> </table>

## S

### save_object

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>save_object</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">save_object(</font><font class="args">string
file</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Save all global variables in an object that are not
private or static to a file. Only non-zero and non-object values are
actually saved.<br/> </td> </tr>

</table>

### Set

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Set</td> </tr> <tr> <td valign="top">
**Syntax:**

</td> <td> <font class="ret">void</font>
<font class="fun">Set(</font><font class="args">object
ob, string property, mixed value</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> void

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Set() is used to
set a property in an object to a value. It has a built-in shorter syntax
as well,<br/><br/>Set( x, "y", z ) -> x."y" =
z;<br/><br/>The shorter version only works if y is an
absolute string value ("abc" is absolute, $property is not), otherwise
the Set() function must be used. </td> </tr> <tr>
<td valign="top">

**Example(s):** </td> <td valign="top">

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

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a href="#Get">Get</a>

</td> </tr> </table>

### set_by_int

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>set_by_int</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">set_by_int(</font><font
class="args">mapping bigmap, int ix, mixed val</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Set the value in <bigmap> for the indice
specified using integer identifier <ix> to <val>.

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#get_by_int">get_by_int</a>,
<a href="#clear_by_int">clear_by_int</a>,

<a href="#get_by_ob">get_by_ob</a>, <a
href="#set_by_ob">set_by_ob</a>,

<a href="#clear_by_ob">clear_by_ob</a>, <a
href="#get_by_str">get_by_str</a>,

<a href="#set_by_str">set_by_str</a> and <a
href="#clear_by_str">clear_by_str</a>

</td> </tr> </table>

### set_by_ob

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>set_by_ob</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">set_by_ob(</font><font class="args">mapping
bigmap, string str, mixed val</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Set the value in <bigmap> for the indice
specified using object identifier <ob> to <val>.

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#get_by_int">get_by_int</a>,
<a href="#set_by_int">set_by_int</a>,

<a href="#clear_by_int">clear_by_int</a>, <a
href="#get_by_ob">get_by_ob</a>,

<a href="#clear_by_ob">clear_by_ob</a>, <a
href="#get_by_str">get_by_str</a>,

<a href="#set_by_str">set_by_str</a> and <a
href="#clear_by_str">clear_by_str</a>

</td> </tr> </table>

### set_by_str

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>set_by_str</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">set_by_str(</font><font
class="args">mapping bigmap, string str, mixed
val</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Set the value in <bigmap> for the indice
specified using string identifier <str> to <val>.

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#get_by_int">get_by_int</a>,
<a href="#set_by_int">set_by_int</a>,

<a href="#clear_by_int">clear_by_int</a>, <a
href="#get_by_ob">get_by_ob</a>,

<a href="#set_by_ob">set_by_ob</a>, <a
href="#clear_by_ob">clear_by_ob</a>,

<a href="#get_by_str">get_by_str</a>, <a
href="#set_by_str">set_by_str</a> and <a
href="#clear_by_str">clear_by_str</a>

</td> </tr> </table>

### SetVar

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>SetVar</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret"></font> <font
class="fun">SetVar(</font><font class="args">string n,
mixed v</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Description:**

</td> <td valign="top"> SetVar() is used to set the value of
a variable with a possibly constructed name, usually used when the
variable's name is unresolved at compile time. </td> </tr>
<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    $property = "address";
    $value = "Skogsb. 27";
    SetVar( $property, $value );
    EmitTo( $actor, $address );
    /*
     * Emits "Skogsb. 27", found in $address, to $actor. 
     */

</td> </tr> <tr>

<td valign="top"> **See also:** </td> <td
valign="top"> <a href="#GetVar">GetVar</a>, <a
href="#Set">Set</a> and <a href="#Get">Get</a>
</td> </tr> </table>

### short_time

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>short_time</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td>

<font class="ret">string</font> <font
class="fun">short_time(</font><font class="args">int
stamp</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> string </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Extract a brief string version of a UNIX timestamp date
(stamp). </td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: short_time( time() )
    Merry result: "May 31 08:28"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#ctime">ctime</a>, <a
href="#time">time</a>, <a
href="#humanized_date">humanized_date</a>,

<a href="#rfc_1123_date">rfc_1123_date</a>, <a
href="#days">days</a> and <a
href="#smalltime">smalltime</a>

</td> </tr> </table>

### sin

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>sin</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">sin(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> float </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the sine of the argument.<br/> </td>
</tr> <tr> <td valign="top">

**Example(s):** </td> <td valign="top">

    Merry code: sin(0.0)
    Merry result: 0.0

    Merry code: sin(0.5)
    Merry result: 0.47942554

    Merry code: sin(1.0)
    Merry result: 0.84147098

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a href="#cos">cos</a>
and <a href="#tan">tan</a>

</td> </tr> </table>

### sinh

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>sinh</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">sinh(</font><font class="args">float
x</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> float </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the hyperbolic sine of the argument.<br/>
</td> </tr> <tr> <td valign="top">

**Example(s):** </td> <td valign="top">

    Merry code: sinh(0.0)
    Merry result: 0.0

    Merry code: sinh(0.5)
    Merry result: 0.52109531

    Merry code: sinh(1.0)
    Merry result: 1.1752012

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#cosh">cosh</a> and <a
href="#tanh">tanh</a>

</td> </tr> </table>

### sizeof

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>sizeof</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">sizeof(</font><font class="args">mixed
*arr</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> sizeof() is used to determine the size of an array.
</td> </tr> <tr> <td valign="top">
**Example(s):**

</td> <td valign="top">

    Merry code: sizeof( ({ "foo", "bar", "george", "hamster" }) )
    Merry result: 4

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#map_sizeof">map_sizeof</a> and <a
href="#strlen">strlen</a>

</td> </tr> </table>

### Slay

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Slay</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">Slay(</font><font class="args">object
ob</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Slay() undoes what Spawn() does.<br/>A word of
warning though: there is no such thing as a 'trashcan'.<br/>Know
what you're doing. </td> </tr> <tr>

<td valign="top"> **Example(s):** </td> <td
valign="top">

    Slay( $steaming_hot_cup_of_java );

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#Spawn">Spawn</a> and <a
href="#Duplicate">Duplicate</a>

</td> </tr> </table>

### smalltime

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>smalltime</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">smalltime(</font><font class="args">int
stamp</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the hour and minute of the UNIX timestamp date
(stamp). </td> </tr> <tr> <td valign="top">
**Example(s):**

</td> <td valign="top">

    Merry code: smalltime( time () )
    Merry result: "08:29"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#ctime">ctime</a>, <a
href="#time">time</a>, <a
href="#humanized_date">humanized_date</a>,

<a href="#rfc_1123_date">rfc_1123_date</a>, <a
href="#days">days</a> and <a
href="#short_time">short_time</a>

</td> </tr> </table>

### Social

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>Social</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">Social(</font><font class="args">object ob,
string verb, string adverb, string evoke, string prep1, NRef *obs1,
string prep2, NRef *obs2, ...</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Social() is a shortcut for what could actually be
accomplished through the use of Act(), by calling the "social" action.
However, the social action is complex enough and socials are so common
that this convenience function is quite warranted. Note that this
executes real socials, not just emits. This means all the signals and
scripts associated with the social are run as well.<br/>Social()
can take a good amount of argument and can generate any results with the
parser that any regular player can.<br/>Only the first two
arguments are required: the object to command, and the verb to execute.
The adverbs and evokes should be straight-forward. The last string of
arguments specify the different targets and at least for now, more than
one pair of preposition and object should be quite rare.<br/>In
some cases, though, when a Social() doesn't seem to do what you ask, you
may have to look into Act().<br/><br/>(Hack) Set the
property $(adverb:position) to one of the following, right before the
call to Social() to determine the position of the
adverb:<br/>PRE_VERB = "pv" e.g. 'happily wave the
sword'<br/>PRE_ROLE = "pr" e.g. 'wave happily to the
creature'<br/>PRE_PREP = "pp" e.g. 'wave the sword angrily at the
mutant'<br/>PRE_EVOKE = "pe" e.g. 'wave the sword at the mutant
angrily'<br/><br/>E.g.:<br/>$(adverb:position) =
PRE_VERB;<br/>Social( $actor, "smile", "happily", "Hi Charles" );
-> You happily smile, "Hi Charles"<br/>

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Social( $actor, "smile" ); -> You smile.
    Social( $actor, "smile", "happily" ); -> You smile happily.
    Social( $actor, "smile", "happily", "G'day everyone!" ); -> You smile happily, "G'day everyone!"
    Social( $actor, "smile", "happily", nil, "at", $actor ); -> You smile happily at yourself.
    Social( $actor, "smile", "happily", nil, "at", ({ $actor, NewNRef( $actor, "toe" ) }) ); -> You smile happily at yourself and your toe.
    Social( $actor, "turn", "seriously", nil, nil, NewNRef( $actor, "head" ), "to", NewNRef( $actor, "feet" ) ); -> You turn seriously your head to your feet.

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a href="#Act">Act</a>,
<a href="#EmitTo">EmitTo</a> and <a
href="#EmitIn">EmitIn</a> </td> </tr>
</table>

### spaces

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>spaces</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">spaces(</font><font class="args">int
num</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return a string of num spaces. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: spaces( 5 )
    Merry result: "   "
    (note that the result above contains five spaces, but only one is displayed in non-pre style)

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#pad_left">pad_left</a> and <a
href="#pad_right">pad_right</a> </td> </tr>
</table>

### Spawn

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>Spawn</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">object</font> <font
class="fun">Spawn(</font><font class="args">object
ob</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> object </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Extremely straight-forward, this is how we generate new objects. Merry
can only create spawns of existing ur-objects, though this limitation
may go out the door in time. The spawn behaves exactly as spawns do
throughout the Skotos system. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    $steaming_hot_cup_of_java = Spawn( ${Generic:drink:mug-coffee} );

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#Duplicate">Duplicate</a> and <a
href="#Slay">Slay</a> </td> </tr> </table>

### sqrt

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top">

**Function:** </td> <td>sqrt</td> </tr>
<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret">float</font> <font
class="fun">sqrt(</font><font class="args">float
x</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> float </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return the square root of the argument.<br/> </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: sqrt(2.0)
    Merry result: 1.4142136

</td> </tr>

</table>

### sscanf

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>sscanf</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">int</font> <font
class="fun">sscanf(</font><font class="args">string str,
string fmt, ...</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> int

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Parse the string
str, using the format string fmt. The following character sequences have
a special meaning in the format string:<br/><br/>%s match a
substring<br/>%d match a number<br/>%f match a
floating-point number<br/>%c match a character<br/>%% match
single %<br/><br/>Other characters must be matched exactly.
%*s, %*d, %*f and %*c can be used to match without assignment.
Matched substrings and numbers are assigned to the successive lvalue
arguments following the format string. The number of matched substrings
and numbers is returned.<br/> </td>

</tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a
href="#parse_string">parse_string</a>, <a
href="#explode">explode</a> and <a
href="#implode">implode</a> </td> </tr>

</table>

### status

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>status</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">varargs mixed
*</font> <font class="fun">status(</font><font
class="args">object obj</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> varargs mixed *

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Called without an
argument, this kfun returns information about resources used by the
system. With an object as argument, resource usage by that object is
given. The returned value is an array, the fields of which are described
in the include file .<br/> </td> </tr> <tr>
<td valign="top"> **Example(s):** </td>

<td valign="top">

    Merry code: status()
    Merry result: ({ "DGD 1.2.55p2s", 997809254, 1046300140, 51470076, 1048576, 112323, 1024, 0, 0, 25037884, 24893744, 124032000, 118680792, 262144, 11447, 10000, 15, 41, 400, 40, 1048576, 8192, 243, 499975398, ({  }), "198.232.133.147" })

</td> </tr>

</table>

### Stop

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:**

</td> <td>Stop</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">void</font> <font
class="fun">Stop(</font><font class="args">string
identifier</font><font class="fun">)</font>
</td>

</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> void </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Stop() is used to terminate a running loop,
instantiated using the Every() function.<br/>It takes the
identifier string returned by the Every() function as single argument.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    [Also see C. Allen's example torch at: Examples:complete:light:torch]

    See the Every() function reference for an example.

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#Every">Every</a> </td> </tr> </table>

### Str

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>Str</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">Str(</font><font class="args">mixed
value</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> string </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
Convert an appropriate value to a string.<br/>Note that this does
not work with all properties.<br/>- All strings, floats, integers
and objects are applicable.<br/>- No arrays or mappings are
applicable.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

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

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a href="#Int">Int</a>,
<a href="#Flt">Flt</a>, <a
href="#dump_value">dump_value</a>, <a
href="#mixed_to_ascii">mixed_to_ascii</a> and <a
href="#ascii_to_mixed">ascii_to_mixed</a> </td>
</tr> </table>

### string_to_hex

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>string_to_hex</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">string</font> <font
class="fun">string_to_hex(</font><font
class="args">string bytes</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> string </td>

</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top"> Return the hexadecimal
representation of bytes. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    'FOO' -> 464f4f

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#hex_digit">hex_digit</a> </td> </tr>
</table>

### strip

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>strip</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td>

<font class="ret">string</font> <font
class="fun">strip(</font><font class="args">string
str</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> string </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Strip whitespace from both sides of str. </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    "  abc " -> "abc"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#strip_left">strip_left</a>, <a
href="#strip_right">strip_right</a>,

<a href="#pad_left">pad_left</a> and <a
href="#pad_right">pad_right</a>

</td> </tr> </table>

### strip_left

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>strip_left</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">strip_left(</font><font class="args">string
str</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Strip whitespace from the left of str. </td>
</tr> <tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    "    abc    " --> "abc  "

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#strip_right">strip_right</a>, <a
href="#strip">strip</a>,

<a href="#pad_left">pad_left</a> and <a
href="#pad_right">pad_right</a>

</td> </tr> </table>

### strip_right

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>strip_right</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">strip_right(</font><font class="args">string
str</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Strip whitespace from the right of str. </td>
</tr> <tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    "   abc " --> " abc"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#strip_left">strip_left</a>, <a
href="#strip">strip</a>,

<a href="#pad_left">pad_left</a> and <a
href="#pad_right">pad_right</a>

</td> </tr> </table>

### strlen

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>strlen</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">strlen(</font><font class="args">string
s</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**

</td> <td valign="top"> int </td> </tr>
<tr> <td valign="top"> **Description:** </td> <td
valign="top"> Return the length of string s. </td> </tr>
<tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    Merry code: strlen( "test" )
    Merry result: 4

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#map_sizeof">map_sizeof</a> and <a
href="#sizeof">sizeof</a>

</td> </tr> </table>

### structure_propmap

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>structure_propmap</td> </tr>

</table>

### switch

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>switch</td> </tr>

<tr> <td valign="top"> **Syntax:** </td> <td>
<font class="ret"></font> <font
class="fun">switch(</font><font class="args">mixed
value</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Description:**

</td> <td valign="top"> The switch() statement is in a way
an extension of if(). For example,<br/>if( $a == 1 ) EmitTo(
$actor, "One" );<br/>if( $a == 2 ) EmitTo( $actor, "Two"
);<br/>if( $a == 3 ) EmitTo( $actor, "Three" );<br/>- can
also be written as,<br/>switch( $a ){<br/>case 1: EmitTo(
$actor, "One" ); break;<br/>case 2: EmitTo( $actor, "Two" );
break;<br/>case 3: EmitTo( $actor, "Three" );
break;<br/>}<br/><br/>Within the switch() block, the
case and default keywords are used to check conditions, both concluded
using the break keyword. Several case statements can be made in which
case the code after the first TRUE case statement is executed regardless
until the next break. Example:<br/><br/>switch( $a
){<br/>case 1: EmitTo( $actor, "One." ); /* no break;
*/<br/>case 2: EmitTo( $actor, "Two." ); break;<br/>case 3:
EmitTo( $actor, "Three." ); break;<br/>}<br/>If $a is 1, the
output will be "One." followed by "Two." but if $a is 2 the output will
be "Two." only.<br/>If $a is 3, the output will be "Three." only.

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

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

</td> </tr> <tr>

<td valign="top"> **See also:** </td> <td
valign="top"> <a href="#if">if</a> and <a
href="#break">break</a> </td> </tr> </table>

## T

### tabulate

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>tabulate</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">tabulate(</font><font class="args">mixed
*arrlist...</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

For a fixed-sized font, render the arrays in arrlist in a table.
</td> </tr>

</table>

### TAG

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>TAG</td>

</tr> <tr> <td valign="top"> **Syntax:** </td>
<td> <font class="ret">string</font> <font
class="fun">TAG(</font><font class="args">string str,
string tag</font><font class="fun">)</font>
</td> </tr> <tr> <td valign="top">

**Return value(s):** </td> <td valign="top"> string
</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Use TAG() to
colorize text using the client user's preset theme colors. </td>
</tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#PRE">PRE</a> </td>
</tr> </table>

### tan

<table border="0" cellpadding="5" cellspacing="0"> <tr>

<td valign="top"> **Function:** </td>
<td>tan</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">tan(</font><font class="args">float
x</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> float </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return the tangent of the
argument.<br/><br/>Note:<br/>For values close to a
multiple of PI/2, the result may be inaccurate.<br/> </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: tan(0.0)
    Merry result: 0.0

    Merry code: tan(0.5)
    Merry result: 0.54630249

    Merry code: tan(1.5)
    Merry result: 14.10142

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#cos">cos</a> and <a
href="#sin">sin</a> </td> </tr> </table>

### tanh

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>tanh</td> </tr> <tr> <td valign="top">
**Syntax:** </td> <td> <font
class="ret">float</font> <font
class="fun">tanh(</font><font class="args">float
x</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> float </td>
</tr> <tr> <td valign="top"> **Description:**
</td> <td valign="top">

Return the hyperbolic tangent of the argument.<br/> </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

    Merry code: tanh(0.0)
    Merry result: 0.0

    Merry code: tanh(0.5)
    Merry result: 0.46211716

    Merry code: tanh(1.5)
    Merry result: 0.90514825

</td> </tr> <tr> <td valign="top">

**See also:** </td> <td valign="top"> <a
href="#cosh">cosh</a> and <a
href="#sinh">sinh</a> </td> </tr> </table>

### this_object

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>this_object</td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> object </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> The this_object() function returns the internal object
name for 'this'. </td> </tr> <tr> <td
valign="top"> **Example(s):** </td> <td valign="top">

    Merry code: this_object()
    Merry result: </usr/SkotOS/merry/4a6e774b0814ac8f2c8c693ec75c0e5b>

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#previous_object">previous_object</a> </td>
</tr> </table>

### time

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>time</td> </tr> <tr> <td valign="top">
**Return value(s):** </td> <td valign="top"> int

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Return the current
time as an integer. The time can be converted into a string with the
kfun ctime().<br/> </td> </tr> <tr> <td
valign="top"> **Example(s):** </td>

<td valign="top">

    Merry code: time()
    Merry result: 1049521697

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#ctime">ctime</a> </td> </tr> </table>

### to_hex

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>to_hex</td> </tr> <tr> <td
valign="top"> **Syntax:**

</td> <td> <font class="ret">string</font>
<font class="fun">to_hex(</font><font
class="args">string bytes</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):** </td> <td
valign="top"> string

</td> </tr> <tr> <td valign="top">
**Description:** </td> <td valign="top"> Transform a
sequence of characters (a string) into a sequence of hexadecimal values.
</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    Merry code: to_hex( "Kalle" )
    Merry result: "4b616c6c65"

</td> </tr>

</table>

### typeof

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>

<td>typeof</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">int</font> <font
class="fun">typeof(</font><font class="args">mixed
value</font><font class="fun">)</font> </td>
</tr>

<tr> <td valign="top"> **Return value(s):** </td>
<td valign="top"> int </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
Return the type of a value. The return values are declared in the
include file. <br/>

</td> </tr> <tr> <td valign="top">
**Example(s):** </td> <td valign="top">

    typeof( nil ) == 0 /* T_NIL */
    typeof( 123 ) == 1 /* T_INT */
    typeof( 3.14 ) == 2 /* T_FLOAT */
    typeof( "abc" ) == 3 /* T_STRING */
    typeof( $actor ) == 4 /* T_OBJECT */
    typeof( ({ "a", "b", "c" }) ) == 5 /* T_ARRAY */
    typeof( ([ "foo" : "bar" ]) ) == 6 /* T_MAPPING */

</td> </tr>

</table>

## U

### UnSAM

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>UnSAM</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td>

<font class="ret">string</font> <font
class="fun">UnSAM(</font><font class="args">mixed
SAM</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> string </td> </tr>

<tr> <td valign="top"> **Description:** </td> <td
valign="top"> UnSAM() is used to convert a SAM-string into a regular
string.<br/>Like the Bilbo $sam(), ParseXML() used with UnSAM()
constitute Merry's portal to the XML/SAM engine. It's not going to be
used as much as Bilbo's is, because SAM has few abilities that Merry
does not have natively. To emulate $sam(foo), use
UnSAM(ParseXML("foo")).<br/><br/>The real use of UnSAM() is
to handle binary SAM data stored in e.g. descriptions. If you have a
room with a description containing oneof's, for example, and you want to
create a text representation of this, you'd want to do something
like,<br/>str = UnSAM(Get(this,
"details:default:description:examine")); </td> </tr>
<tr> <td valign="top"> **Example(s):** </td>

<td valign="top">

    Merry code: UnSAM( ParseXML( "{sam-style|one|of}" ))
    Merry result: "sam-style"
    or:          "one"
    or:          "of"

    Merry code: UnSAM( ParseXML( "<describe what=\"$actor\"/>" ))
    Merry result: "StoryCoder Kalle"

    Merry code:   UnSAM( ParseXML( "You are <describe what=\"$actor\"/>, the {heroic|fantastic|extraordinary|hulkhoganish|awesome|illiterate|analphabetic|dyslectic} {thief|villain|joe|wizard|viking|lord|knight|master} {of|from} {Sweden|Norway|York|Denmark|London|Scandinavia}!" )
    Example result: "You are StoryCoder Kalle, the fanatic lord from Scandinavia!"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#ParseXML">ParseXML</a> </td>

</tr> </table>

### upper_case

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>upper_case</td> </tr> <tr> <td
valign="top">

**Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">upper_case(</font><font class="args">string
str</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td>

<td valign="top"> string </td> </tr> <tr> <td
valign="top"> **Description:** </td> <td valign="top">
Capitalize (uppercase) every letter in str. </td> </tr>
<tr> <td valign="top"> **Example(s):**

</td> <td valign="top">

    "SkotOS" -> "SKOTOS"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#lower_case">lower_case</a>, <a
href="#capitalize">capitalize</a>,

<a href="#decapitalize">decapitalize</a> and <a
href="#proper">proper</a>

</td> </tr> </table>

### url_absolute

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>url_absolute</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">url_absolute(</font><font
class="args">string url</font><font
class="fun">)</font> </td> </tr> <tr> <td
valign="top"> **Return value(s):**

</td> <td valign="top"> string </td> </tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: url_absolute( "/page?somearg=somevalue" )
    Merry result: "http://marrach.skotos.net:8080/page?somearg=somevalue"

</td> </tr>

<tr> <td valign="top"> **See also:** </td> <td
valign="top"> <a href="#url_decode">url_decode</a>,
<a href="#url_encode">url_encode</a> and <a
href="#make_url">make_url</a> </td> </tr>
</table>

### url_decode

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>url_decode</td> </tr> <tr> <td
valign="top"> **Syntax:** </td>

<td> <font class="ret">string</font> <font
class="fun">url_decode(</font><font class="args">string
str</font><font class="fun">)</font> </td>
</tr> <tr> <td valign="top"> **Return value(s):**
</td> <td valign="top"> string </td>

</tr>

<tr> <td valign="top"> **Example(s):** </td> <td
valign="top">

    Merry code: url_decode( "Hi,+I'm+Kalle+%26+this+is+an+evil+smiley%3A+%3E%3A-)" )
    Merry result: "Hi, I'm Kalle & this is an evil smiley: >:-)"

</td> </tr> <tr> <td valign="top"> **See also:**

</td> <td valign="top"> <a
href="#url_encode">url_encode</a>, <a
href="#make_url">make_url</a> and <a
href="#url_absolute">url_absolute</a> </td>
</tr> </table>

### url_encode

<table border="0" cellpadding="5" cellspacing="0">

<tr> <td valign="top"> **Function:** </td>
<td>url_encode</td> </tr> <tr> <td
valign="top"> **Syntax:** </td> <td> <font
class="ret">string</font> <font
class="fun">url_encode(</font><font class="args">string
str</font><font class="fun">)</font>

</td> </tr> <tr> <td valign="top"> **Return
value(s):** </td> <td valign="top"> string </td>
</tr>

<tr> <td valign="top"> **Example(s):** </td>

<td valign="top">

    Merry code: url_encode( "Hi, I'm Kalle & this is an evil smiley: >:-)" )
    Merry result: "Hi,+I'm+Kalle+%26+this+is+an+evil+smiley%3A+%3E%3A-)"

</td> </tr> <tr> <td valign="top"> **See also:**
</td> <td valign="top"> <a
href="#url_decode">url_decode</a>, <a
href="#make_url">make_url</a> and <a
href="#url_absolute">url_absolute</a>

</td> </tr> </table>

## W

### while

<table border="0" cellpadding="5" cellspacing="0"> <tr>
<td valign="top"> **Function:** </td>
<td>while</td> </tr> <tr>

<td valign="top"> **Syntax:** </td> <td> <font
class="ret"></font> <font
class="fun">while(</font><font
class="args"><condition></font><font
class="fun">)</font> </td> </tr>

<tr> <td valign="top"> **Description:** </td>

<td valign="top"> While-loops are used when a block of code needs
to be repeated until certain condition requirements are met. </td>
</tr> <tr> <td valign="top"> **Example(s):**
</td> <td valign="top">

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

</td> </tr> <tr>

<td valign="top"> **See also:** </td> <td
valign="top"> <a href="#for">for</a> and <a
href="#do">do</a> </td> </tr> </table>

-- Main.KalleAlm - 1 Feb 2005
