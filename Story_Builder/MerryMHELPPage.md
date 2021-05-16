# Merry +MHELP reference page

*This page was automatically created using the +mhelp tool. If anything
in this document is in error, do not edit the document directly --
instead, use +mhelp to modify the topic in question, from within the
client.*

------------------------------------------------------------------------

##  $
### $delay

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>$delay</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>$delay(mixed wait, mixed return[, string id])</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">$delay() is used to prematurely exit a script, and return to it a set amount of seconds later (wait, 1st argument), specified as a floating value (up to 60.0) or an integer value (no limit).<br />
<br />
Not only does the script exit, though, but if the script was called from another script, that script is returned the return value (return, 2nd argument).<br />
If the script is an act/react/witness script, the first time a non-FALSE value is returned, the action will go through, as pointed out in the example(s) section below.<br />
<br />
Only the first argument is required, second is optional, third is automatic.<br />
The second value defaults to FALSE, the third value becomes a four-digit unique character identifier for the switch. Make careful note that no two $delay() statements in a single script may contain two identical identifiers. The script will fail to compile with a "duplicate case labels in switch" error. Remove the third argument from the copied $delay() statements and another identifier will be generated.<br />
<br />
Note: only $variables and constants are maintained after a $delay() returns control to a script. The following script would fail,<br />
<br />
string s;<br />
s = "Hello world!"; /* s == "Hello world!" */<br />
$delay( 1, FALSE ); /* s is reset */<br />
EmitTo( $actor, s ); /* s is nil */<br />
<br />
- because the variable s is nil after the $delay() call.<br />
Solve by storing the necessary variables in some appropriate object, or use $variables.</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">
    Example act:smile in the actor: <br />
    EmitTo( $actor, "You won't smile ever, cause we return FALSE below." );  <br />
    $delay( 1, FALSE ); <br /> <br />
    Example act:smile in the actor: <br />
    EmitTo( $actor, "You will smile after seeing this message, because we return TRUE below." ); <br />
    $delay( 1, TRUE );
</td>
</tr>
</tbody>
</table>

##  A
### acos

|                      |                                                                                                                                         |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | acos                                                                                                                                    |
| **Syntax:**          | float acos(float x)                                                                                                                     |
| **Return value(s):** | float                                                                                                                                   |
| **Example(s):**      | Merry code: acos(0.0) <br />Merry result: 1.5707963 <br />Merry code: acos( 0.5 ) <br />Merry result: 1.0471976 <br />Merry code: acos( 1.0 ) <br />Merry result: 0.0 |
| **See also:**        | [asin](#asin) and [atan](#atan)                                                                                                         |

### Act

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Act</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>void Act(object ob, string action, special arguments)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">void</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Another extremely powerful function, this is how Merry commands some object to perform an action, optionally specified by an array of arguments. The argument $silent can be sent as TRUE in order to suppress all output for (presumably) all signals.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Act( $actor, "drop", $what: sword_objects, $into: container_object ); (see TWiki page on signals for more verbose information on what exactly you can do with what)</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Social">Social</a></td>
</tr>
</tbody>
</table>

### allocate

|                      |                                                                                                                  |
|----------------------|------------------------------------------------------------------------------------------------------------------|
| **Function:**        | allocate                                                                                                         |
| **Syntax:**          | mixed \* allocate(int size)                                                                                      |
| **Return value(s):** | mixed \*                                                                                                         |
| **Description:**     | Allocate an array with size number of elements. All elements are initialized to zero. The new array is returned. |
| **Example(s):**      | Merry code: allocate(5) <br />Merry result: ({ nil, nil, nil, nil, nil })                                              |
| **See also:**        | [sizeof](#sizeof)                                                                                                |

### allocate\_float

|                      |                                                                                                       |
|----------------------|-------------------------------------------------------------------------------------------------------|
| **Function:**        | allocate\_float                                                                                       |
| **Syntax:**          | float \* allocate\_float(int size)                                                                    |
| **Return value(s):** | float \*                                                                                              |
| **Description:**     | Allocate an array with size elements. All elements are initialized to 0.0. The new array is returned. |
| **Example(s):**      | Merry code: allocate\_float(5) <br />Merry result: ({ 0.0, 0.0, 0.0, 0.0, 0.0 })                            |
| **See also:**        | [allocate](#allocate), [allocate\_int](#allocate_int) and [sizeof](#sizeof)                           |

### allocate\_int

|                      |                                                                                                     |
|----------------------|-----------------------------------------------------------------------------------------------------|
| **Function:**        | allocate\_int                                                                                       |
| **Syntax:**          | int \* allocate\_int(int size)                                                                      |
| **Return value(s):** | int \*                                                                                              |
| **Description:**     | Allocate an array with size elements. All elements are initialized to 0. The new array is returned. |
| **Example(s):**      | Merry code: allocate\_int(5) <br />Merry result: ({ 0, 0, 0, 0, 0 })                                      |
| **See also:**        | [allocate](#allocate), [allocate\_float](#allocate_float) and [sizeof](#sizeof)                     |

### Arr

|                      |                                                                                                                                                                     |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | Arr                                                                                                                                                                 |
| **Syntax:**          | mixed \* Arr(mixed v)                                                                                                                                               |
| **Return value(s):** | mixed \*                                                                                                                                                            |
| **Description:**     | Return &lt;v&gt; in the form of an array. If &lt;v&gt; is an array already, &lt;v&gt; will be returned in its present state, otherwise ({ &lt;v&gt; }) is returned. |
| **Example(s):**      | Merry code: Arr( "Hello" ) <br />Merry result: ({ "Hello" }) <br />Merry code: Arr( ({ "Hello" }) ) <br />Merry result: ({ "Hello" })                                                 |
| **See also:**        | [Str](#Str), [Int](#Int), [Flt](#Flt), [Num](#Num) and [Map](#Map)                                                                                                  |

### arr\_to\_set

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>arr_to_set</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>mapping arr_to_set(array a)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mapping</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Use arr_to_set to convert an array value to a mapping where each unique property in the array is an indice (key) in the resulting mapping.<br />
As mappings are automatically represented in alphabetical order, arr_to_set may for instance be used to sort an array of strings.<br />
As you see in the second example, applying map_indices to the result of an arr_to_set-call will result in an identical, but sorted, array.<br />
Take note, however, that if any two values in an array are identical (which is valid for an array), these two values will be merged into a single value by arr_to_set, as indices must be unique.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: arr_to_set( ({ "Kalle", "Anders", "Erik", "Maria" }) ) <br />Merry result: ([ "Anders":1, "Erik":1, "Kalle":1, "Maria":1 ]) <br />Merry code: map_indices( arr_to_set( ({ "Kalle", "Anders", "Erik", "Maria" }) )) <br />Merry result: ({ "Anders", "Erik", "Kalle", "Maria" })</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#map_values">map_values</a>, <a href="#map_indices">map_indices</a> and <a href="#reverse_mapping">reverse_mapping</a></td>
</tr>
</tbody>
</table>

### ascii\_to\_mixed

|                      |                                                                                                                                                                                                                            |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | ascii\_to\_mixed                                                                                                                                                                                                           |
| **Syntax:**          | mixed ascii\_to\_mixed(string str)                                                                                                                                                                                         |
| **Return value(s):** | mixed                                                                                                                                                                                                                      |
| **Description:**     | Convert an ascii value into the appropriate property type.                                                                                                                                                                 |
| **Example(s):**      | Merry code: ascii\_to\_mixed( "15" ) <br />Merry result: 15 <br />Merry code: ascii\_to\_mixed( "({ \\"a\\", \\"cute\\", \\"array!\\" })" ) <br />Merry result: ({ "a", "cute", "array!" }) <br />Merry code: ascii\_to\_mixed( "" ) <br />Merry result: |
| **See also:**        | [mixed\_to\_ascii](#mixed_to_ascii) and [dump\_value](#dump_value)                                                                                                                                                         |

### ascii\_typeof

|                      |                                                                                                                                                                                                                                                                         |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | ascii\_typeof                                                                                                                                                                                                                                                           |
| **Syntax:**          | string ascii\_typeof(mixed value)                                                                                                                                                                                                                                       |
| **Return value(s):** | string                                                                                                                                                                                                                                                                  |
| **Description:**     | Return a string representation of the property type of value.                                                                                                                                                                                                           |
| **Example(s):**      | ascii\_typeof( nil ) == "nil" ascii\_typeof( 123 ) == "int" ascii\_typeof( 3.14 ) == "float" ascii\_typeof( "abc" ) == "string" ascii\_typeof( $actor ) == "object" ascii\_typeof( ({ "a", "b", "c" }) ) == "array" ascii\_typeof( (\[ "foo" : "bar" \]) ) == "mapping" |
| **See also:**        | [typeof](#typeof)                                                                                                                                                                                                                                                       |

### asin

|                      |                                                                                                                                      |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | asin                                                                                                                                 |
| **Syntax:**          | float asin(float x)                                                                                                                  |
| **Return value(s):** | float                                                                                                                                |
| **Example(s):**      | Merry code: asin(0.0) <br />Merry result: 0.0 <br />Merry code: asin(0.5) <br />Merry result: 0.52359878 <br />Merry code: asin(1.0) <br />Merry result: 1.5707963 |
| **See also:**        | [acos](#acos) and [atan](#atan)                                                                                                      |

### atan

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>atan</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float atan(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the arc tangent of the argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: atan(0.0) <br />Merry result: 0.0 <br />Merry code: atan(0.5) <br />Merry result: 0.46364761 <br />Merry code: atan(1.0) <br />Merry result: 0.78539816</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#acos">acos</a>, <a href="#asin">asin</a> and <a href="#atan2">atan2</a></td>
</tr>
</tbody>
</table>

### atan2

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>atan2</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float atan2(float y, float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the arc tangent of y/x, using the signs of the arguments to determine the quadrant of the result.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: atan2(0.0, 0.0) <br />Merry result: 0.0 <br />Merry code: atan2(1.0, 0.0) <br />Merry result: 1.5707963 <br />Merry code: atan2(0.0,1.0) <br />Merry result: 0.0 <br />Merry code: atan2(1.0,1.0) <br />Merry result: 0.78539816</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#atan">atan</a></td>
</tr>
</tbody>
</table>

##  B 
### base64\_decode

|               |                |
|---------------|----------------|
| **Function:** | base64\_decode |

### Bilbo

|                      |                                                                                                                                                                            |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | Bilbo                                                                                                                                                                      |
| **Syntax:**          | void Bilbo(object ob, string signaltype, string signalname, special arguments)                                                                                             |
| **Return value(s):** | void                                                                                                                                                                       |
| **Description:**     | Merry can call Bilbo directly -- but as Merry at this point has exceeded bilbo in all/any aspect, it is recommended that you use this function scarcely; preferably never. |
| **Example(s):**      | Bilbo( $actor, "react", "smile" ); /\* will execute bilbo:react:smile found in $actor \*/                                                                                  |

### break\_paragraph

|                      |                                                                                                                                                                                                                                                                 |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | break\_paragraph                                                                                                                                                                                                                                                |
| **Syntax:**          | string break\_paragraph(string head, string str, int len)                                                                                                                                                                                                       |
| **Return value(s):** | string                                                                                                                                                                                                                                                          |
| **Description:**     | For a fixed-size font, break str into lines each no longer than len characters, and start all of it with the string head.                                                                                                                                       |
| **Example(s):**      | Merry code: break\_paragraph( "You say: ", "sputnik was a satellite", 20 ) <br />Merry result: "You say: sputnik was\\n a satellite\\n" - which renders to You say: sputnik was a satellite (note that "a satellite" is directly below "sputnik was" if pre-formated) |

##  C 
### calculate\_stamp

|                      |                                                                                                                                                                                                                                                |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | calculate\_stamp                                                                                                                                                                                                                               |
| **Syntax:**          | int calculate\_stamp(int year, int month, int day)                                                                                                                                                                                             |
| **Return value(s):** | int                                                                                                                                                                                                                                            |
| **Description:**     | Create a UNIX timestamp pointing to midnight, year &lt;year&gt;, day &lt;day&gt; of month &lt;month&gt;.                                                                                                                                       |
| **Example(s):**      | Merry code: calculate\_stamp( 1980, 9, 24 ) <br />Merry result: 338616000 <br />Merry code: ctime( 338616000 ) + ", Kalle was born." <br />Merry result: "Wed Sep 24 00:00:00 1980, Kalle was born."                                                             |
| **See also:**        | [time](#time), [ctime](#ctime), [short\_time](#short_time), [smalltime](#smalltime), [get\_day](#get_day), [get\_month](#get_month), [get\_year](#get_year), [get\_hour](#get_hour), [get\_minute](#get_minute) and [get\_second](#get_second) |

### Call

|                      |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | Call                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| **Syntax:**          | mixed Call(object ob, string script, special arguments)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **Return value(s):** | mixed                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **Example(s):**      | Merry's means of calling other Merry functions. If the script argument is e.g. 'checktimer', the property search will be for merry:lib:checktimer; there is no way to avoid the 'lib' portion. All functions that are callable in Merry must exist in the 'lib' namespace. This makes sense, as you will see in time. The third argument is on precisely the same format as in Act. For example, if you do Call(this, "inflict", $damage: 100); then the merry:lib:inflict script will be called, and inside this script $damage will contain the integer value 100. The local value is not changed, so after $damage = 50; Call(this, "inflict", $damage: 100); $damage will still be 50. |
| **See also:**        | [call\_other](#call_other), [call\_out](#call_out) and [call\_trace](#call_trace)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

### call\_other

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>call_other</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>varargs mixed call_other(mixed obj, string function, mixed args...)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">varargs mixed</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Call a function in an object. The first argument must be either an object or a string. If it is a string, call_object() will be called in the driver object to get the corresponding object.<br />
Only non-private functions can be called with call_other(). If the function is static, the object in which the function is called must be the same as the object from which the function is called, or the call will fail.<br />
Any additional arguments to call_other() will be passed on to the called function.<br />
In LPC, obj-&gt;func(arg1, arg2, argn) can be used as a shorthand for call_other(obj, "func", arg1, arg2, argn).<br />
</td>
</tr>
</tbody>
</table>

### call\_out

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>call_out</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>varargs int call_out(string function, int delay, mixed args...)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">varargs int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Call a function in the current object with a delay. The function to be called must not be private. The delay is specified in seconds.<br />
The minimum delay is 1 second; if the given delay is less, it is changed into 1 second.<br />
The returned value is the callout handle, an integer &gt; 0 which must be used if the callout is to be removed.<br />
</td>
</tr>
</tbody>
</table>

### call\_trace

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>call_trace</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mixed **</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the function call trace as an array. The elements are of the following format:<br />
<br />
({ objname, progname, function, line, extern, arg1, ..., argn })<br />
<br />
The line number is 0 if the function is in a compiled object.<br />
Extern is 1 if the function was called with call_other(), and 0 otherwise.<br />
The last element of the returned array is the trace of the current function.<br />
</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: call_trace() <br />Merry result: ({ ({ "/kernel/obj/binary#10769", "/kernel/obj/binary", "receive_message", 85, 1 }), ({ "/kernel/obj/binary#10769", "/kernel/lib/connection", "receive_message", 233, 0 }), ({ "/usr/TextIF/obj/user#10798", "/usr/TextIF/obj/user", "receive_message", 371, 1 }), ({ "/usr/TextIF/obj/user#10798", "/usr/TextIF/obj/user", "receive_line", 720, 0 }), ({ "/usr/TextIF/obj/user#10798", "/kernel/lib/auto", "call_limited", 719, 0 }), ({ "/usr/TextIF/obj/user#10798", "/kernel/lib/auto", "_F_call_limited", 698, 0 }), ({ "/usr/TextIF/obj/user#10798", "/usr/TextIF/obj/user", "parse_command", 812, 1 }), ({ "/usr/TextIF/main", "/usr/TextIF/main", "command", 230, 1 }), ({ "/usr/Tool/sys/tool", "/usr/Tool/sys/tool", "cmd_DEV_tool", 117, 1 }), ({ "/usr/Tool/sys/merry", "/usr/Tool/lib/merry", "cmd_merry_eval", 133, 1 }), ({ "/usr/Tool/sys/merry", "/usr/Tool/lib/merry", "run_merry_code", 45, 0 }), ({ "/usr/SkotOS/data/merry#-1", "/usr/SkotOS/data/merry", "evaluate", 223, 1, ({ , nil, nil, ([ "actor":, "body":, "here":, "looker": ]), nil }) }), ({ "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "/usr/SkotOS/lib/merrynode", "evaluate", 56, 1, , nil, nil, @14, nil, nil }), ({ "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "merry", 6, 1, nil, nil, "virgin" }), ({ "/usr/SkotOS/merry/c8a82e895d135325ccf56f4106de1b80", "/kernel/lib/auto", "call_trace", 524, 0 }) })</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#previous_object">previous_object</a></td>
</tr>
</tbody>
</table>

### capitalize

|                      |                                                                                                             |
|----------------------|-------------------------------------------------------------------------------------------------------------|
| **Function:**        | capitalize                                                                                                  |
| **Syntax:**          | string capitalize(string str)                                                                               |
| **Return value(s):** | string                                                                                                      |
| **Description:**     | Make sure the first letter of str is capitalized.                                                           |
| **Example(s):**      | "zell" -&gt; "Zell"                                                                                         |
| **See also:**        | [lower\_case](#lower_case), [upper\_case](#upper_case), [decapitalize](#decapitalize) and [proper](#proper) |

### cardinal

|                      |                                                                                                                                                                                                        |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | cardinal                                                                                                                                                                                               |
| **Syntax:**          | int cardinal(string str)                                                                                                                                                                               |
| **Return value(s):** | int                                                                                                                                                                                                    |
| **Description:**     | Convert a string expression of a cardinal number into an integer value.                                                                                                                                |
| **Example(s):**      | Merry code: cardinal( "one" ) <br />Merry result: 1 <br />Merry code: cardinal( "five" ) <br />Merry result: 5 <br />Merry code: cardinal( "fiftytwo" ) <br />Merry result: 52 <br />Merry code: cardinal( "ninetynine" ) <br />Merry result: 99 |
| **See also:**        | [ordinal](#ordinal), [desc\_ordinal](#desc_ordinal) and [desc\_cardinal](#desc_cardinal)                                                                                                               |

### catch

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>catch</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string catch(expression)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Execute the code for until an error results, or until execution is complete. If an error resulted, catch() will return the error message as a string; otherwise, it will return 0.<br />
Note: catch() is not a real kfun. catch(a, b) will evaluate the expression (a, b), rather than "call catch() with arguments a and b".<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#error">error</a></td>
</tr>
</tbody>
</table>

### ceil

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>ceil</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float ceil(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Round the argument towards positive infinity.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: ceil(14.1) <br />Merry result: 15.0</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#floor">floor</a> and <a href="#fmod">fmod</a></td>
</tr>
</tbody>
</table>

### char\_to\_string

|                  |                                                                                                            |
|------------------|------------------------------------------------------------------------------------------------------------|
| **Function:**    | char\_to\_string                                                                                           |
| **Syntax:**      | char\_to\_string(int ch)                                                                                   |
| **Description:** | Convert a numeric character code value into a string.                                                      |
| **Example(s):**  | Merry code: char\_to\_string( 'A' ) <br />Merry result: "A" <br />Merry code: char\_to\_string( 65 ) <br />Merry result: "A" |

### clear\_by\_int

|                      |                                                                                                                                                                                                                                             |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | clear\_by\_int                                                                                                                                                                                                                              |
| **Syntax:**          | void clear\_by\_int(mapping bigmap, int ix)                                                                                                                                                                                                 |
| **Return value(s):** | void                                                                                                                                                                                                                                        |
| **Description:**     | Clear the value in &lt;bigmap&gt; for the indice specified using integer identifier &lt;ix&gt;, effectively removing the map entry altogether.                                                                                              |
| **See also:**        | [get\_by\_int](#get_by_int), [set\_by\_int](#set_by_int), [get\_by\_ob](#get_by_ob), [set\_by\_ob](#set_by_ob), [clear\_by\_ob](#clear_by_ob), [get\_by\_str](#get_by_str), [set\_by\_str](#set_by_str) and [clear\_by\_str](#clear_by_str) |

### clear\_by\_ob

|                      |                                                                                                                                                                                                                                                                              |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | clear\_by\_ob                                                                                                                                                                                                                                                                |
| **Syntax:**          | void clear\_by\_ob(mapping bigmap, object ob)                                                                                                                                                                                                                                |
| **Return value(s):** | void                                                                                                                                                                                                                                                                         |
| **Description:**     | Clear the value in &lt;bigmap&gt; for the indice specified using object identifier &lt;ob&gt;, effectively removing the map entry altogether.                                                                                                                                |
| **See also:**        | [get\_by\_int](#get_by_int), [set\_by\_int](#set_by_int), [clear\_by\_int](#clear_by_int), [get\_by\_ob](#get_by_ob), [set\_by\_ob](#set_by_ob), [clear\_by\_ob](#clear_by_ob), [get\_by\_str](#get_by_str), [set\_by\_str](#set_by_str) and [clear\_by\_str](#clear_by_str) |

### clear\_by\_str

|                      |                                                                                                                                                                                                                                             |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | clear\_by\_str                                                                                                                                                                                                                              |
| **Syntax:**          | void clear\_by\_str(mapping bigmap, string str)                                                                                                                                                                                             |
| **Return value(s):** | void                                                                                                                                                                                                                                        |
| **Description:**     | Clear the value in &lt;bigmap&gt; for the indice specified using string identifier &lt;str&gt;, effectively removing the map entry altogether.                                                                                              |
| **See also:**        | [get\_by\_int](#get_by_int), [set\_by\_int](#set_by_int), [clear\_by\_int](#clear_by_int), [get\_by\_ob](#get_by_ob), [set\_by\_ob](#set_by_ob), [clear\_by\_ob](#clear_by_ob), [get\_by\_str](#get_by_str) and [set\_by\_str](#set_by_str) |

### comma

|                      |                                                                 |
|----------------------|-----------------------------------------------------------------|
| **Function:**        | comma                                                           |
| **Syntax:**          | string comma(int num)                                           |
| **Return value(s):** | string                                                          |
| **Description:**     | Make num readable by inserting a comma after every third digit. |
| **Example(s):**      | Merry code: comma( 1344266 ) <br />Merry result: "1,344,266"          |

### contains

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>contains</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int contains(string str, string sub)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">If sub is a sub-string of str, return TRUE, else FALSE.<br />
That is, if str contains sub.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: contains( "foobar", "ob" ) <br />Merry result: TRUE</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#sscanf">sscanf</a></td>
</tr>
</tbody>
</table>

### copy

|                      |                                                                                                                                                                                                                                                                                      |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | copy                                                                                                                                                                                                                                                                                 |
| **Syntax:**          | mixed copy(mixed var)                                                                                                                                                                                                                                                                |
| **Return value(s):** | mixed                                                                                                                                                                                                                                                                                |
| **Description:**     | The copy() function is useful when modifying for instance arrays and/or mappings, to avoid harming the original source. VAR = ARRAY does not instantly create a copy of ARRAY, which means there is a slight chance that modifying VAR will also modify ARRAY (the original source). |
| **Example(s):**      | Merry code: copy( "abc" ) <br />Merry result: "abc <br />Merry code: copy( ({ "a", "b", "c" }) ) <br />Merry result: ({ "a", "b", "c" }) <br />Merry code: copy( $actor ) <br />Merry result:                                                                                                                      |

### cos

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>cos</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float cos(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the cosine of the argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: cos(0.0) <br />Merry result: 1.0 <br />Merry code: cos(0.5) <br />Merry result: 0.87758256 <br />Merry code: cos(1.0) <br />Merry result: 0.54030231</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#sin">sin</a> and <a href="#kfun">kfun</a></td>
</tr>
</tbody>
</table>

### cosh

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>cosh</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float cosh(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the hyperbolic cosine of the argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: cosh(0.0) <br />Merry result: 1.0 <br />Merry code: cosh(0.5) <br />Merry result: 1.127626 <br />Merry code: cosh(1.0) <br />Merry result: 1.5430806</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#sinh">sinh</a> and <a href="#tanh">tanh</a></td>
</tr>
</tbody>
</table>

### crypt

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>crypt</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>varargs string crypt(string passwd, string salt)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">varargs string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Encrypt a password, of which only the first 8 characters are significant. If the optional second argument is given, its first two characters are used to perturb the encryption algorithm additionally; without one, the encryption is perturbed randomly. The returned string is 13 characters long, the first two of which are equal to the used salt.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: crypt("test") <br />Merry result: "MKfcAguU0/rhs" <br />Merry code: crypt("test", "te") <br />Merry result: "teH0wLIpW0gyQ"</td>
</tr>
</tbody>
</table>

### ctime

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>ctime</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string ctime(int clock)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Convert the specified time, which is an integer such as is returned by the kfun time(), into a string of the form "Tue Aug 3 14:40:18 1993".<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: ctime(0) <br />Merry result: "Wed Dec 31 19:00:00 1969" <br />Merry code: ctime(time()) <br />Merry result: "Fri Apr 4 19:38:09 2003"</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#time">time</a>, <a href="#short_time">short_time</a> and <a href="#rfc_1123_date">rfc_1123_date</a></td>
</tr>
</tbody>
</table>

##  D 
### days

|                      |                                                                                                                                                               |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | days                                                                                                                                                          |
| **Syntax:**          | string days(int n)                                                                                                                                            |
| **Return value(s):** | string                                                                                                                                                        |
| **Description:**     | Generate a string value representation of the amount of days and hours since Jan 1st, 1970.                                                                   |
| **Example(s):**      | Merry code: days( time() ) <br />Merry result: "12203 d, 12 h"                                                                                                      |
| **See also:**        | [ctime](#ctime), [time](#time), [short\_time](#short_time), [humanized\_date](#humanized_date), [rfc\_1123\_date](#rfc_1123_date) and [smalltime](#smalltime) |

### decapitalize

|                      |                                                                                                         |
|----------------------|---------------------------------------------------------------------------------------------------------|
| **Function:**        | decapitalize                                                                                            |
| **Syntax:**          | string decapitalize(string str)                                                                         |
| **Return value(s):** | string                                                                                                  |
| **Description:**     | Make sure the first letter of str is lower case.                                                        |
| **Example(s):**      | "Chocolate" -&gt; "chocolate"                                                                           |
| **See also:**        | [lower\_case](#lower_case), [upper\_case](#upper_case), [capitalize](#capitalize) and [proper](#proper) |

### desc\_cardinal

|                      |                                      |
|----------------------|--------------------------------------|
| **Function:**        | desc\_cardinal                       |
| **Syntax:**          | string desc\_cardinal(int n)         |
| **Return value(s):** | string                               |
| **Description:**     | Describe the cardinal n in English.  |
| **Example(s):**      | 123 -&gt; "one hundred twenty-three" |
| **See also:**        | [desc\_ordinal](#desc_ordinal)       |

### desc\_ordinal

|                      |                                      |
|----------------------|--------------------------------------|
| **Function:**        | desc\_ordinal                        |
| **Syntax:**          | string desc\_ordinal(int n)          |
| **Return value(s):** | string                               |
| **Description:**     | Describe the ordinal n in English.   |
| **Example(s):**      | 123 -&gt; "one hundred twenty-third" |
| **See also:**        | [desc\_cardinal](#desc_cardinal)     |

### Describe

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Describe</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string Describe(object o)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Describe() is used to get string descriptions of objects, like $actor, $target, etc. in a merry script.<br />
It can take multiple objects simultaneously as ({ object one, object two, ... }).<br />
It can take an optional second parameter which will describe o in objective form.<br />
If the second param is nil and the third parameter is o, Describe() will describe in first person (you).<br />
If both the second and third parameters are o, Describe() will describe in possessive first person (yourself).<br />
The fourth parameter is a flag that can optionally be set to:<br />
STYLE_NONPOSS /* don't do the 'his frog' thing */<br />
STYLE_DEFINITE /* the frog */<br />
STYLE_REL_LOC /* the frog in his bag */<br />
STYLE_FIRST_PERSON /* the frog in your bag */<br />
STYLE_REDUCE_CHUNK /* avoid look frogs -&gt; four frogs */<br />
STYLE_PRONOUN /* allow i.e. 'yourself' vs 'you' */<br />
STYLE_NOCLUSTER /* (undocumented) */<br />
STYLE_NO_SHOW_INVIS /* don't show unseen objects */<br />
STYLE_WEAK_LOOKER /* don't replace Zell with You */<br />
STYLE_IGNORE_VISIBILITY /* ignores luminosity from the actors p.o.v. */</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Examples using the first and second parameters: Describe( $actor ) -&gt; "StoryCoder Kalle" Describe( $actor, $actor ) -&gt; "him" Describe( $actor, nil, $actor ) -&gt; "you" Describe( $actor, $actor, $actor ) -&gt; "yourself"</td>
</tr>
</tbody>
</table>

### dgd\_version

|                      |                                                |
|----------------------|------------------------------------------------|
| **Function:**        | dgd\_version                                   |
| **Return value(s):** | int                                            |
| **Example(s):**      | Merry code: dgd\_version() <br />Merry result: 12071 |

### do

|                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**    | do                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| **Description:** | Do..while loops work exactly like while-loops except that the condition is checked AFTER the block is executed, rather than before. This means the block will be executed at least once regardless.                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| **Example(s):**  | Example \#1: ----------- int i; i = 0; do { i ++; EmitTo( $actor, "i is now "+Str(i) ); } while( i &lt; 10 ); EmitTo( $actor, Str(i)+" is NOT less than 10, so the do..while-loop has ended." ); ---------- Result: ------- i is now 1 i is now 2 i is now 3 i is now 4 i is now 5 i is now 6 i is now 7 i is now 8 i is now 9 i is now 10 10 is NOT less than 10, so the do..while-loop has ended. ------- Example \#2: ----------- int i = 0; do { i++; EmitTo( $actor, "i is "+Str(i) ); } while( FALSE ); EmitTo( $actor, "Loop has ended with i at "+Str(i)+"." ); ---------- Result: ------- i is 1 Loop has ended with i at 1. |
| **See also:**    | [for](#for) and [while](#while)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

### dump\_value

|                      |                                                                                                                                                                               |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | dump\_value                                                                                                                                                                   |
| **Syntax:**          | string dump\_value(mixed value)                                                                                                                                               |
| **Return value(s):** | string                                                                                                                                                                        |
| **Description:**     | Convert any property into a string value.                                                                                                                                     |
| **Example(s):**      | Merry code: dump\_value( $actor ) <br />Merry result: "" <br />Merry code: dump\_value( args ) <br />Merry result: "(\[ \\"actor\\":, \\"body\\":, \\"here\\":, \\"looker\\":, \\"this\\": \])" |
| **See also:**        | [ascii\_to\_mixed](#ascii_to_mixed) and [mixed\_to\_ascii](#mixed_to_ascii)                                                                                                   |

### Duplicate

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Duplicate</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>object Duplicate(object ob)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">object</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">This function makes a copy of an existing object, just like the "Duplicate" button in WOE works.<br />
For a merryized version of +spawn, check out Spawn().</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">$copy_of_Generic_drink_mug_coffee = Duplicate( ${Generic:drink:mug-coffee} ); $copy_of_Generic_drink_mug_coffee."base:objectname" = "Marrach:Coders:kalle:my_own_coffee_object";</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Spawn">Spawn</a> and <a href="#Slay">Slay</a></td>
</tr>
</tbody>
</table>

##  E 
### EmitIn

|                      |                                                                                                                                                                                                                                                                                                        |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | EmitIn                                                                                                                                                                                                                                                                                                 |
| **Syntax:**          | void EmitIn(object o, string s, object exclude\_one, object exclode\_another, ...)                                                                                                                                                                                                                     |
| **Return value(s):** | void                                                                                                                                                                                                                                                                                                   |
| **Example(s):**      | Merry command to emit a string of text into an environment, such as a room. Example: EmitIn( $actor."base:environment", "This goes to everyone in the same room as $actor." ); EmitIn( $actor."base:environment", "This also goes to everyone in $actor's presence, except $actor himself.", $actor ); |
| **See also:**        | [EmitTo](#EmitTo)                                                                                                                                                                                                                                                                                      |

### EmitTo

|                      |                                                            |
|----------------------|------------------------------------------------------------|
| **Function:**        | EmitTo                                                     |
| **Syntax:**          | void EmitTo(object o, string s)                            |
| **Return value(s):** | void                                                       |
| **Description:**     | Merry command to emit a string of text to a single object. |
| **Example(s):**      | EmitTo( $actor, "Tag! You're it!" );                       |
| **See also:**        | [EmitIn](#EmitIn)                                          |

### error

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>error</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>void error(string errormessage)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">void</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Cause an error, which will stop execution. If the error is caught, execution will continue after the catch.<br />
<br />
Note that error() and Error() -- with only error() documented here -- do the exact same thing.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#catch">catch</a></td>
</tr>
</tbody>
</table>

### Every

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Every</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string Every(string script, int frequency)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Every() is used to create an infinitely looping process.<br />
It returns an identifier string for the process it creates, and it takes two arguments,<br />
- the timer:-script to execute<br />
- the frequency in seconds<br />
<br />
There is no need to do any loops on your own, like while( TRUE ){ ... }, when using Every(), but take note that the script is actually halted, and all variables it uses are reset each time it's called.<br />
It is also very important to keep track of the identifier string it returns, as without it you cannot ever turn off the loop.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">[Also see C. Allen's example torch at: Examples:complete:light:torch] Example script timer:my_loop ---------------------------- /* my_loop is executed once every Nth second, specified in the Every() call below. */ EmitTo( ${Marrach:players:K:kalle}, "Alive and kicking!" ); /* $actor isn't defined here, so we emit directly instead */ ---------------------------- Example script lib:start_my_loop -------------------------------- /* To make sure we don't "screw up" and lose an identifier, we check if a loop is running already, and stop it automagically on our own if it is */ if( $actor."my_loop:identifier" ) Call( this, "stop_my_loop" ); EmitTo( $actor, "Initiating loop. Call stop_my_loop to stop it!" ); $actor."my_loop:identifier" = Every( "my_loop", 60 ); /* we must remember that identifier...! */ -------------------------------- Example script lib:stop_my_loop ------------------------------- EmitTo( $actor, "Stopping loop!" ); if( !$actor."my_loop:identifier" ){ EmitTo( $actor, "Whoops! No loop found!" ); return FALSE; } Stop( $actor."my_loop:identifier" ); $actor."my_loop:identifier" = nil; EmitTo( $actor, "Done!" ); -------------------------------</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Stop">Stop</a></td>
</tr>
</tbody>
</table>

### exp

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>exp</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float exp(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the exponential value of the given argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: exp(0.0) <br />Merry result: 1.0 <br />Merry code: exp(0.5) <br />Merry result: 1.6487213 <br />Merry code: exp(1.0) <br />Merry result: 2.7182818</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#log">log</a>, <a href="#log10">log10</a> and <a href="#pow">pow</a></td>
</tr>
</tbody>
</table>

### explode

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>explode</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string * explode(string str, string separator)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string *</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return an array of substrings of str, divided by the given separator.<br />
The separators that str starts and ends with, if any, are not taken into account.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: explode("This is a test"," ") <br />Merry result: ({ "This", "is", "a", "test" })</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#implode">implode</a>, <a href="#sscanf">sscanf</a> and <a href="#parse_string">parse_string</a></td>
</tr>
</tbody>
</table>

##  F 
### fabs

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>fabs</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float fabs(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the absolute value of the argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: fabs(-14.9) <br />Merry result: 14.9</td>
</tr>
</tbody>
</table>

### find\_object

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>find_object</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>object find_object(string obj)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">object</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">The string argument is resolved as a file path, and the object with the resulting name is searched for. Either the object, if found, or zero is returned.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: find_object("/base/obj/thing#4803") <br />Merry result:</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#object_name">object_name</a></td>
</tr>
</tbody>
</table>

### FindMerry

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>FindMerry</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>object FindMerry(object src, string type, string name)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">object</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">FindMerry is used in cases where it is imperative to figure out 1) whether a particular Merry script is present in an object, and/or 2) where that Merry script is located.<br />
<br />
As objects may have references for Merry scripts (aka "inherits"), the actual location of the script itself is at times not equal to the object nor either of its UrParents.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: FindMerry( $actor, "react-post", "hit-dob" ) <br />Merry result:</td>
</tr>
</tbody>
</table>

### first\_elements

|                      |                                                                                                                                                                         |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | first\_elements                                                                                                                                                         |
| **Syntax:**          | mixed \* first\_elements(mixed arr, int num)                                                                                                                            |
| **Return value(s):** | mixed \*                                                                                                                                                                |
| **Description:**     | Retrieve &lt;num&gt; number of elements from &lt;arr&gt;, starting at the beginning and moving toward the end resulting in the first &lt;num&gt; values of &lt;arr&gt;. |
| **Example(s):**      | Merry code: first\_elements( ({ "1", "2", "3", "4" }), 2 ) <br />Merry result: ({ "1", "2" })                                                                                 |
| **See also:**        | [last\_elements](#last_elements)                                                                                                                                        |

### flatten

|                      |                                                                                                                                    |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | flatten                                                                                                                            |
| **Syntax:**          | array flatten(mixed \*\*value)                                                                                                     |
| **Return value(s):** | array                                                                                                                              |
| **Description:**     | Convert a two-dimensional array -- e.g. ({ ({ 1 }) }) -- to a regular array through the use of the flatten() function.             |
| **Example(s):**      | Merry code: flatten( ({ ({ "A1", "B1", "C1" }), ({ "A2", "B2", "C2" }) }) ) <br />Merry result: ({ "A1", "B1", "C1", "A2", "B2", "C2" }) |

### flatten\_structmap

|               |                    |
|---------------|--------------------|
| **Function:** | flatten\_structmap |

### floor

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>floor</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float floor(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Round the argument towards negative infinity.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: floor(14.9) <br />Merry result: 14.0</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#ceil">ceil</a> and <a href="#fmod">fmod</a></td>
</tr>
</tbody>
</table>

### Flt

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Flt</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float Flt(mixed value)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Convert an appropriate value to a float.<br />
Note that this does not work with all properties.<br />
- Strings must begin with a numeric character, and are truncated at the first non-numeric character (except points ('.')), including e.g. '+', '-', e.t.c.<br />
- All floats and integers are applicable.<br />
- No objects, arrays or mappings are applicable.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Flt( 3 ) -&gt; 3.0 Flt( 3+3 ) -&gt; 6.0 Flt( 3.14 ) -&gt; 3.14 Flt( "5.9" ) -&gt; 5.9 Flt( "15" ) -&gt; 15.0 Flt( "123 muffins" ) -&gt; 123.0 Flt( "5+5" ) -&gt; 5.0 Flt( nil ) -&gt; 0.0 Flt( "Muffin" ) -&gt; ERROR: cannot convert value to float Flt( $actor."base:intrinsiccapacity" ) -&gt; 10.0 Flt( $actor."base:actualcapacity" ) -&gt; 9.8574127</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Int">Int</a>, <a href="#Str">Str</a>, <a href="#dump_value">dump_value</a>, <a href="#mixed_to_ascii">mixed_to_ascii</a> and <a href="#ascii_to_mixed">ascii_to_mixed</a></td>
</tr>
</tbody>
</table>

### fmod

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>fmod</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float fmod(float x, float y)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the value f, for which there exists an integer k such that<br />
k * y + f == x, f has the same sign of x, and the absolute value of<br />
f is less than the absolute value of y.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: fmod(25.0,5.0) <br />Merry result: 0.0 <br />Merry code: fmod(25.0,6.0) <br />Merry result: 1.0</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#ceil">ceil</a> and <a href="#floor">floor</a></td>
</tr>
</tbody>
</table>

### foo

|               |     |
|---------------|-----|
| **Function:** | foo |

### for

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>for</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>for(; ; )</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">for-loops are essentially a compression of the following:<br />
---<br />
/* for( &lt;x&gt;; &lt;y&gt;; &lt;z&gt; ){ &lt;code&gt; } */<br />
&lt;x&gt;;<br />
while( &lt;y&gt; ){<br />
&lt;code&gt;<br />
&lt;z&gt;;<br />
}<br />
---<br />
<br />
They are traditional and frequently occuring in almost all programming languages. If the concept of for-loops still elude you, you may wish to look around on the internet for other, more verbose explanations.</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Example #1: ----------- int step; for( step = 0; step &lt; 10; step ++ ){ EmitTo( $actor, "Taking step "+Str( step )); } EmitTo( $actor, "Done stepping. 'step' is now: "+Str( step )); ---------- Result: ------- Taking step 0 Taking step 1 Taking step 2 Taking step 3 Taking step 4 Taking step 5 Taking step 6 Taking step 7 Taking step 8 Taking step 9 Done stepping. 'step' is now: 10 ------- Example #2: ----------- int i; $colors = ({ "red", "green", "blue", "turquoise", "pink", "yellow" }) EmitTo( $actor, "These colors are available:" ); for( i = 0; i &lt; sizeof( $colors ); i++ ){ EmitTo( $actor, $colors[i] ); } ----------- Result: ------- These colors are available: red green blue turquoise pink yellow -------</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#while">while</a> and <a href="#do">do</a></td>
</tr>
</tbody>
</table>

### format\_float

|                      |                                                            |
|----------------------|------------------------------------------------------------|
| **Function:**        | format\_float                                              |
| **Syntax:**          | string format\_float(float f, int dec)                     |
| **Return value(s):** | string                                                     |
| **Description:**     | Return f such that the result has dec decimal points.      |
| **Example(s):**      | Merry code: format\_float( 0.3, 4 ) <br />Merry result: "0.3000" |

### frexp

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>frexp</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>mixed * frexp(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mixed *</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">The argument is split into a fraction f and an integer exponent n, such that either f == 0.0, or 0.5 &lt;= | f | &lt; 1.0, and f * 2 ** n == x.<br />
({ f, n }) is returned. If x == 0.0, both f and n will be zero.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: frexp(1.0) <br />Merry result: ({ 0.5, 1 }) <br />Merry code: frexp(1.1) <br />Merry result: ({ 0.55, 1 }) <br />Merry code: frexp(1.5) <br />Merry result: ({ 0.75, 1 }) <br />Merry code: frexp(2.0) <br />Merry result: ({ 0.5, 2 }) <br />Merry code: frexp(5.0) <br />Merry result: ({ 0.625, 3 }) <br />Merry code: frexp(10.0) <br />Merry result: ({ 0.625, 4 }) <br />Merry code: frexp(100.0) <br />Merry result: ({ 0.78125, 7 })</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#ldexp">ldexp</a> and <a href="#modf">modf</a></td>
</tr>
</tbody>
</table>

### full\_explode

|                      |                                                                                                                                                               |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | full\_explode                                                                                                                                                 |
| **Syntax:**          | string \* full\_explode(string str, string del)                                                                                                               |
| **Return value(s):** | string \*                                                                                                                                                     |
| **Example(s):**      | Merry code: full\_explode( "\|foo\|", "\|" ) <br />Merry result: ({ "", "foo", "" }) (compared to) <br />Merry code: explode( "\|foo\|", "\|" ) <br />Merry result: ({ "foo" }) |
| **See also:**        | [explode](#explode) and [implode](#implode)                                                                                                                   |

##  G 
### Get

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Get</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>mixed Get(object ob, string property)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mixed</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Get() is used to retrieve a property from an object. It has a built-in shorter syntax as well,<br />
<br />
Get( x, "y" ) -&gt; x."y"<br />
<br />
The shorter version only works if y is an absolute string value ("abc" is absolute, $property is not), otherwise the Get() function must be used.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">$foo = Get( ob, "prop" ); /* Get the property "prop" from the object ob */ $foo = Get( $actor, "prop" ); /* Get the property "prop" from the actor */ $propertyName = "appearance:eyecolor"; $eye = Get( $actor, $propertyName ); /* Get the property "appearance:eyecolor" (as defined in $propertyName) from $actor */ $otherProperty = "skin"; $skin = Get( $actor, "appearance:" + $otherProperty ); /* Get "appearance:skin" (whereas 'skin' is defined in $otherProperty) from $actor. $foo = ob."prop"; /* Get property "prop" from object ob (yes, exactly like above) */ $foo = $actor."prop"; /* Get "prop" from actor */ Currently, x = Get( y, "z" ); can be shortened to x = y."z"; But this only works if the property name argument (z) is absolute. That is, we cannot: x = y.$foo;</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Set">Set</a></td>
</tr>
</tbody>
</table>

### get\_by\_int

|                      |                                                                                                                                                                                                                                                 |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | get\_by\_int                                                                                                                                                                                                                                    |
| **Syntax:**          | mixed get\_by\_int(mapping bigmap, int ix)                                                                                                                                                                                                      |
| **Return value(s):** | mixed                                                                                                                                                                                                                                           |
| **Description:**     | Get a value from a bigmap mapping from a bigmap indice specified using an integer identifier.                                                                                                                                                   |
| **See also:**        | [set\_by\_int](#set_by_int), [clear\_by\_int](#clear_by_int), [get\_by\_ob](#get_by_ob), [set\_by\_ob](#set_by_ob), [clear\_by\_ob](#clear_by_ob), [get\_by\_str](#get_by_str), [set\_by\_str](#set_by_str) and [clear\_by\_str](#clear_by_str) |

### get\_by\_ob

|                      |                                                                                                                                                                                                                                                   |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | get\_by\_ob                                                                                                                                                                                                                                       |
| **Syntax:**          | mixed get\_by\_ob(mapping bigmap, object ob)                                                                                                                                                                                                      |
| **Return value(s):** | mixed                                                                                                                                                                                                                                             |
| **Description:**     | Get a value from a bigmap mapping from a bigmap indice specified using an object identifier.                                                                                                                                                      |
| **See also:**        | [get\_by\_int](#get_by_int), [set\_by\_int](#set_by_int), [clear\_by\_int](#clear_by_int), [set\_by\_ob](#set_by_ob), [clear\_by\_ob](#clear_by_ob), [get\_by\_str](#get_by_str), [set\_by\_str](#set_by_str) and [clear\_by\_str](#clear_by_str) |

### get\_by\_str

|                      |                                                                                                                                                                                                                                                 |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | get\_by\_str                                                                                                                                                                                                                                    |
| **Syntax:**          | mixed get\_by\_str(mapping bigmap, string str)                                                                                                                                                                                                  |
| **Return value(s):** | mixed                                                                                                                                                                                                                                           |
| **Description:**     | Get a value from a bigmap mapping from a bigmap indice specified using a string identifier.                                                                                                                                                     |
| **See also:**        | [get\_by\_int](#get_by_int), [set\_by\_int](#set_by_int), [clear\_by\_int](#clear_by_int), [get\_by\_ob](#get_by_ob), [set\_by\_ob](#set_by_ob), [clear\_by\_ob](#clear_by_ob), [set\_by\_str](#set_by_str) and [clear\_by\_str](#clear_by_str) |

### get\_day

|                      |                                                                                                                                                                                                                                                                |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | get\_day                                                                                                                                                                                                                                                       |
| **Syntax:**          | int get\_day(int n)                                                                                                                                                                                                                                            |
| **Return value(s):** | int                                                                                                                                                                                                                                                            |
| **Description:**     | Derive the month day from the UNIX timestamp &lt;n&gt; and return this as an integer value.                                                                                                                                                                    |
| **Example(s):**      | Merry code: "Day of the month: " + get\_day( time() ) <br />Merry result: "Day of the month: 12"                                                                                                                                                                     |
| **See also:**        | [time](#time), [ctime](#ctime), [short\_time](#short_time), [smalltime](#smalltime), [get\_month](#get_month), [get\_year](#get_year), [get\_hour](#get_hour), [get\_minute](#get_minute), [get\_second](#get_second) and [calculate\_stamp](#calculate_stamp) |

### get\_hour

|                      |                                                                                                                                                                                                                                                              |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | get\_hour                                                                                                                                                                                                                                                    |
| **Syntax:**          | int get\_hour(int n)                                                                                                                                                                                                                                         |
| **Return value(s):** | int                                                                                                                                                                                                                                                          |
| **Description:**     | Return the hour as specified in the UNIX timestamp &lt;n&gt; as an integer value.                                                                                                                                                                            |
| **Example(s):**      | Merry code: "Current hour: " + get\_hour( time() ) <br />Merry result: "Current hour: 7"                                                                                                                                                                           |
| **See also:**        | [time](#time), [ctime](#ctime), [short\_time](#short_time), [smalltime](#smalltime), [get\_day](#get_day), [get\_month](#get_month), [get\_year](#get_year), [get\_minute](#get_minute), [get\_second](#get_second) and [calculate\_stamp](#calculate_stamp) |

### get\_minute

|                      |                                                                                                                                                                                                                                                          |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | get\_minute                                                                                                                                                                                                                                              |
| **Syntax:**          | int get\_minute(int n)                                                                                                                                                                                                                                   |
| **Return value(s):** | int                                                                                                                                                                                                                                                      |
| **Description:**     | Return the minutes passed since last new hour as specified in the UNIX timestamp &lt;n&gt; as an integer value.                                                                                                                                          |
| **Example(s):**      | Merry code: "Minutes since last new hour: " + get\_minute( time() ) <br />Merry result: "Minutes since last new hour: 40"                                                                                                                                      |
| **See also:**        | [time](#time), [ctime](#ctime), [short\_time](#short_time), [smalltime](#smalltime), [get\_day](#get_day), [get\_month](#get_month), [get\_year](#get_year), [get\_hour](#get_hour), [get\_second](#get_second) and [calculate\_stamp](#calculate_stamp) |

### get\_month

|                      |                                                                                                                                                                                                                                                            |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | get\_month                                                                                                                                                                                                                                                 |
| **Syntax:**          | int get\_month(int n)                                                                                                                                                                                                                                      |
| **Return value(s):** | int                                                                                                                                                                                                                                                        |
| **Description:**     | Derive the month of the year from the UNIX timestamp &lt;n&gt; and return this as an integer value.                                                                                                                                                        |
| **Example(s):**      | Merry code: "Month of the year: " + get\_month( time() ) <br />Merry result: "Month of the year: 5"                                                                                                                                                              |
| **See also:**        | [time](#time), [ctime](#ctime), [short\_time](#short_time), [smalltime](#smalltime), [get\_day](#get_day), [get\_year](#get_year), [get\_hour](#get_hour), [get\_minute](#get_minute), [get\_second](#get_second) and [calculate\_stamp](#calculate_stamp) |

### get\_second

|                      |                                                                                                                                                                                                                                                          |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | get\_second                                                                                                                                                                                                                                              |
| **Syntax:**          | int get\_second(int n)                                                                                                                                                                                                                                   |
| **Return value(s):** | int                                                                                                                                                                                                                                                      |
| **Description:**     | Return the seconds since last new minute as specified in the UNIX timestamp &lt;n&gt; as an integer value.                                                                                                                                               |
| **Example(s):**      | Merry code: "Seconds since last new minute: " + get\_second( time() ) <br />Merry result: "Seconds since last new minute: 33"                                                                                                                                  |
| **See also:**        | [time](#time), [ctime](#ctime), [short\_time](#short_time), [smalltime](#smalltime), [get\_day](#get_day), [get\_month](#get_month), [get\_year](#get_year), [get\_hour](#get_hour), [get\_minute](#get_minute) and [calculate\_stamp](#calculate_stamp) |

### get\_year

|                      |                                                                                                                                                                                                                                                              |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | get\_year                                                                                                                                                                                                                                                    |
| **Syntax:**          | int get\_year(int n)                                                                                                                                                                                                                                         |
| **Return value(s):** | int                                                                                                                                                                                                                                                          |
| **Description:**     | Return the year as specified in the UNIX timestamp &lt;n&gt; as an integer value.                                                                                                                                                                            |
| **Example(s):**      | Merry code: get\_year( time() ) <br />Merry result: 2004                                                                                                                                                                                                           |
| **See also:**        | [time](#time), [ctime](#ctime), [short\_time](#short_time), [smalltime](#smalltime), [get\_day](#get_day), [get\_month](#get_month), [get\_hour](#get_hour), [get\_minute](#get_minute), [get\_second](#get_second) and [calculate\_stamp](#calculate_stamp) |

### GetVar

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>GetVar</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>mixed GetVar(string n)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mixed</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">GetVar() is used to retrieve the value of a variable with a name reference, usually used when the variable's name itself is unresolved at compile time.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">$name = "address"; $address = "Skogsb. 27"; EmitTo( $actor, GetVar( $name )); /* * emits "Skogsb. 27", found in $address, to $actor */</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#SetVar">SetVar</a>, <a href="#Set">Set</a> and <a href="#Get">Get</a></td>
</tr>
</tbody>
</table>

##  H 
### hash\_crc16

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>hash_crc16</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int hash_crc16(string str, string extra...)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Compute the 16 bit Cyclic Redundancy Code of the concatenation of all string arguments, with polynomial:<br />
<br />
X^16 + X^12 + X^5 + 1<br />
<br />
CRC-16 is considered suitable for strings of up to a total of 4096 characters.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: hash_crc16("text") <br />Merry result: 49980</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#hash_md5">hash_md5</a></td>
</tr>
</tbody>
</table>

### hash\_md5

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>hash_md5</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string hash_md5(string str, string extra...)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Compute the 128 bit MD5 message digest of the concatenation of all string arguments. The result is a string of 16 characters.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">(test cases as per http://www.ietf.org/rfc/rfc1321.txt ) <br />Merry code: to_hex(hash_md5("")) <br />Merry result: "d41d8cd98f00b204e9800998ecf8427e" <br />Merry code: to_hex(hash_md5("a")) <br />Merry result: "0cc175b9c0f1b6a831c399e269772661" <br />Merry code: to_hex(hash_md5("abc")) <br />Merry result: "900150983cd24fb0d6963f7d28e17f72" <br />Merry code: to_hex(hash_md5("message digest")) <br />Merry result: "f96b697d7cb7938d525a2f31aaf161d0" <br />Merry code: to_hex(hash_md5("abcdefghijklmnopqrstuvwxyz")) <br />Merry result: "c3fcd3d76192e4007dfb496cca67e13b" <br />Merry code: to_hex(hash_md5("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789")) <br />Merry result: "d174ab98d277d9f5a5611c2c9f419d9f" <br />Merry code: to_hex(hash_md5("12345678901234567890123456789012345678901234567890123456789012345678901234567890")) <br />Merry result: "57edf4a22be3c955ac49da2e2107b67a"</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#hash_crc16">hash_crc16</a></td>
</tr>
</tbody>
</table>

### hex\_digit

|                      |                                                              |
|----------------------|--------------------------------------------------------------|
| **Function:**        | hex\_digit                                                   |
| **Syntax:**          | int hex\_digit(int nibble)                                   |
| **Return value(s):** | int                                                          |
| **Description:**     | Return the hexadecimal character of nibble, smaller than 16. |
| **Example(s):**      | 11 -&gt; 'b'                                                 |
| **See also:**        | [string\_to\_hex](#string_to_hex)                            |

### humanized\_date

|                      |                                                                                                                                          |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | humanized\_date                                                                                                                          |
| **Syntax:**          | string humanized\_date(int n)                                                                                                            |
| **Return value(s):** | string                                                                                                                                   |
| **Description:**     | Extract a humanized date from a unix timestamp integer value, such as the one retrieved from time().                                     |
| **Example(s):**      | Merry code: humanized\_date( time() ) <br />Merry result: "8:19 AM, May 31st, 2003"                                                            |
| **See also:**        | [ctime](#ctime), [time](#time), [short\_time](#short_time), [rfc\_1123\_date](#rfc_1123_date), [days](#days) and [smalltime](#smalltime) |

##  I 
### if

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>if</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>if()</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Mastering if-statements is an absolute necessity for any programmer of almost any language.<br />
If-statements occur regularly and are used to control and specify how a piece of code should react and handle various 'situations' (conditions) by scanning conditions and variables and acting based on the results.<br />
Below are a good amount of examples describing a good amount (but not all) of the various ways if-cases can be used in merry.<br />
Take note, however, that things such as AND, OR, etc. are not exclusively used in if-statements (hence, it's not at all a bad idea to learn them all as soon as you can).</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Example #1: (simple if) ----------- if( 1 + 1 == 2 ) EmitTo( $actor, "Believe it or not! 1+1 is 2!" ); /* note that we use two equal-signs ('=='), since one ('=') is reserved for setting properties (like $a = 2) */ ----------- Result: ------- Believe it or not! 1+1 is 2! ------- Example #2: (not equals) ----------- if( "abc" != "def" ) EmitTo( $actor, "'abc' is not 'def'" ); /* TRUE */ if( 123 != 456 ) EmitTo( $actor, "123 is not 456." ); /* TRUE */ if( 1+2+3+4 != 10 ) EmitTo( $actor, "1+2+3+4 is not 10." ); /* FALSE */ /* == means equals. != means NOT equals, thus in the above if statements, we're asking if the left value is NOT equal to the right value */ ----------- Result: ------- 'abc' is not 'def' 123 is not 456. ------- Example #3: (less than, greater than, less/greater than or equal to) ----------- if( 5 + 5 &gt; 10 ) EmitTo( $actor, "5+5 is greater than 10" ); /* FALSE */ if( 10*3 &gt; 20 ) EmitTo( $actor, "10 times 3 is greater than 20" ); /* TRUE */ if( 50 / 5 &lt; 20 ) EmitTo( $actor, "50 divided by 5 is less than 20" ); /* TRUE */ if( 10 &gt;= 5 + 5 ) EmitTo( $actor, "10 is more than or equal to 5+5" ); /* TRUE */ if( 50 &lt;= 25 * 2 ) EmitTo( $actor, "50 is less than or equal to 25*2" ); /* TRUE */ ----------- Result: ------- 10 times 3 is greater than 20 50 divided by 5 is less than 20 10 is more than or equal to 5+5 50 is less than or equal to 25*2 ------- Example #4: (if ... else ...) ----------- if( 10 &gt; 20 ) { EmitTo( $actor, "10 is more than 20." ); /* wrong */ } else { EmitTo( $actor, "10 isn't more than 20." ); /* right */ } if( "George" == "James" ) { EmitTo( $actor, "George is James." ); /* wrong */ } else { EmitTo( $actor, "George is not James." ); /* right */ } ----------- Result: ------- 10 isn't more than 20. George is not James. ------- Example #5: (multiple condition prerequisites; AND) ----------- if( 1 + 2 == 3 &amp;&amp; 5 &gt; 4 ) EmitTo( $actor, "1+2 is 3, and 5 is more than 4." ); /* TRUE */ if( 5 == 2 + 3 &amp;&amp; "kalle" == "you" ) EmitTo( $actor, "5 is 2+3 and 'kalle' is 'you'." ); /* FALSE */ if( 1+1 == 2 &amp;&amp; 1+2 == 3 &amp;&amp; 10*10 == 100 ) EmitTo( $actor, "1+1 is 2, 1+2 is 3 and 10*10 is 100." ); /* TRUE */ /* &amp;&amp; represents AND */ ----------- Result: ------- 1+2 is 3, and 5 is more than 4. 1+1 is 2, 1+2 is 3 and 10*10 is 100. ------- Example #6: (multiple condition prerequisites; OR) ----------- if( "kalle" == "you" || "you" == "you" ) EmitTo( $actor, "Either 'kalle' is 'you', or 'you' is 'you'." ); /* TRUE */ if( 50 - 1 == 40 || 9 &gt; 9 || 1+2+3 == 6 ) EmitTo( $actor, "50-1 is 40, or 9 is more than 9, or 1+2+3 is 6. Either one works (though only one is of course true)." ); /* TRUE */ /* || represents OR */ ----------- Result: ------- Either 'kalle' is 'you', or 'you' is 'you'. 50-1 is 40, or 9 is more than 9, or 1+2+3 is 6. Either one works (though only one is of course true). ------- Example #7: (multiple condition prerequisites; parenthesis in if statements) ----------- if( 15 == 7+8 || (1 == 2 &amp;&amp; 2 == 3) ) EmitTo( $actor, "15 is 7+8, or 1 is 2 and 2 is 3." ); /* TRUE */ ----------- Result: ------- 15 is 7+8, or 1 is 2 and 2 is 3. ------- Example #8: (variables in conditions) ----------- $name = "Kalle"; if( $name == "Kalle" ) EmitTo( $actor, "Hi Kalle!" ); else EmitTo( $actor, "You're not Kalle." ); $number = 123; if( $number == 100 + 20 + 3 ) EmitTo( $actor, Str( $number )+" is 100 + 20 + 3." ); $snack = ({ "muffin" }); if( $snack[0] == "muffin" ) EmitTo( $actor, "Element 0 in the array $snack is 'muffin'! Mmm!" ); if( sizeof( $snack ) &gt; 0 ) EmitTo( $actor, "Array $snack is not empty. It has at LEAST one element." ); ----------- Result: ------- Hi Kalle! 123 is 100 + 20 + 3. Element 0 in the array $snack is 'muffin'! Mmm! Array $snack is not empty. It has at LEAST one element. -------</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#switch">switch</a></td>
</tr>
</tbody>
</table>

### implode

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>implode</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string implode(string *arr, string separator)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return a string, consisting of all string elements of the array arr concatenated, separated by the string separator.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: implode(({ "This", "is", "a", "test" }), " ") <br />Merry result: "This is a test"</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#explode">explode</a>, <a href="#sscanf">sscanf</a> and <a href="#parse_string">parse_string</a></td>
</tr>
</tbody>
</table>

### In

|               |     |
|---------------|-----|
| **Function:** | In  |

### index

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>index</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>The index value in
for the first occurence of the value . index(mixed val, array a)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">The index value in
for the first occurence of the value .</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">The index() function is used to retrieve the index position in an array of the first occurence of a value.<br />
index() will return the integer index position, or -1 if the value is not found anywhere in the array.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: $array = ({ "Kalle", "Jess", "Jim", "Bob" }); EmitTo($actor, dump_value(index("Bob", $array))); Return value: 3 <br />Merry code: $array = ({ "Kalle", "Jess", "Jim", "Bob" }); EmitTo($actor, dump_value(index("George", $array))); Return value: -1</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#member">member</a></td>
</tr>
</tbody>
</table>

### Int

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int Int(mixed value)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Convert an appropriate value to an integer.<br />
Note that this does not work with all properties.<br />
- Strings must begin with a numeric character, and are truncated at the first non-numeric character, including e.g. '+', '-', e.t.c. AND points ('.'), which are taken into account in Flt().<br />
- All floats and integers are applicable.<br />
- No objects, arrays or mappings are applicable.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Int( 3.4 ) -&gt; 3 Int( 3.5 ) -&gt; 4 Int( 123 ) -&gt; 123 Int( "5.9" ) -&gt; 5 Int( "15" ) -&gt; 15 Int( "15+1" ) -&gt; 15 /* note math operation unresolved */ Int( "abc" ) -&gt; ERROR: cannot convert value to integer Int( $actor."base:intrinsiccapacity" ) -&gt; 10 Int( "1" + "0" ) -&gt; 10 Int( "22 years old" ) -&gt; 22 Int( nil ) -&gt; 0</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Flt">Flt</a>, <a href="#Str">Str</a>, <a href="#dump_value">dump_value</a>, <a href="#mixed_to_ascii">mixed_to_ascii</a> and <a href="#ascii_to_mixed">ascii_to_mixed</a></td>
</tr>
</tbody>
</table>

##  L 
### last\_elements

|                      |                                                                                                                                                                        |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | last\_elements                                                                                                                                                         |
| **Syntax:**          | mixed \* last\_elements(mixed arr, int num)                                                                                                                            |
| **Return value(s):** | mixed \*                                                                                                                                                               |
| **Description:**     | Retrieve &lt;num&gt; number of elements from &lt;arr&gt;, starting at the end and moving toward the beginning resulting in the last &lt;num&gt; values of &lt;arr&gt;. |
| **Example(s):**      | Merry code: last\_elements( ({ "1", "2", "3", "4" }), 2 ) <br />Merry result: ({ "3", "4" })                                                                                 |
| **See also:**        | [first\_elements](#first_elements)                                                                                                                                     |

### ldexp

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>ldexp</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float ldexp(float x, int n)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the value x * 2 ** n.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: ldexp(4.0, 0) <br />Merry result: 4.0 <br />Merry code: ldexp(4.0, 1) <br />Merry result: 8.0 <br />Merry code: ldexp(4.0, 2) <br />Merry result: 16.0 <br />Merry code: ldexp(4.0, 3) <br />Merry result: 32.0</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#frexp">frexp</a> and <a href="#modf">modf</a></td>
</tr>
</tbody>
</table>

### log

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>log</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float log(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the natural logarithm of the argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: log(0.5) <br />Merry result: -0.69314718 <br />Merry code: log(1.0) <br />Merry result: 0.0 <br />Merry code: log(2.0) <br />Merry result: 0.69314718</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#exp">exp</a>, <a href="#log10">log10</a> and <a href="#pow">pow</a></td>
</tr>
</tbody>
</table>

### log10

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>log10</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float log10(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the logarithm of the argument to base 10.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: log10(0.5) <br />Merry result: -0.30103 <br />Merry code: log10(1.0) <br />Merry result: 0.0 <br />Merry code: log10(2.0) <br />Merry result: 0.30103</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#exp">exp</a>, <a href="#log">log</a> and <a href="#pow">pow</a></td>
</tr>
</tbody>
</table>

### lower\_case

|                      |                                                                                                            |
|----------------------|------------------------------------------------------------------------------------------------------------|
| **Function:**        | lower\_case                                                                                                |
| **Syntax:**          | string lower\_case(string str)                                                                             |
| **Return value(s):** | string                                                                                                     |
| **Description:**     | Downcase each letter in str.                                                                               |
| **Example(s):**      | "SkotOS" -&gt; "skotos"                                                                                    |
| **See also:**        | [upper\_case](#upper_case), [capitalize](#capitalize), [decapitalize](#decapitalize) and [proper](#proper) |

##  M 
### make\_url

|                      |                                                                                                                                                                                                                                                                               |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | make\_url                                                                                                                                                                                                                                                                     |
| **Syntax:**          | string make\_url(string base, mapping args, varargs int secure)                                                                                                                                                                                                               |
| **Return value(s):** | string                                                                                                                                                                                                                                                                        |
| **Description:**     | The make\_url() function creates a string URL which includes page (&lt;base&gt;) and any amount of arguments (&lt;args&gt;).                                                                                                                                                  |
| **Example(s):**      | Merry code: make\_url( "some\_page", (\[ "some property" : "some value", "other property" : "other value", "actor" : $actor, "year" : 2004 \]) ) <br />Merry result: "some\_page?actor=Marrach%3Aplayers%3AK%3Akalle&other property=other+value&some property=some+value&year=2004" |
| **See also:**        | [url\_decode](#url_decode), [url\_encode](#url_encode) and [url\_absolute](#url_absolute)                                                                                                                                                                                     |

### map\_indices

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>map_indices</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>mixed * map_indices(mapping map)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mixed *</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return an array containing the indices of mapping map.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: map_indices(([ "Monday" : "Meatloaf", "Tuesday" : "Chicken", "Wednesday" : "Tater tots", "Thursday" : "Fish", "Friday" : "Leftovers", ])) <br />Merry result: ({ "Friday", "Monday", "Thursday", "Tuesday", "Wednesday" })</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#map_values">map_values</a></td>
</tr>
</tbody>
</table>

### map\_sizeof

|                      |                                                                                        |
|----------------------|----------------------------------------------------------------------------------------|
| **Function:**        | map\_sizeof                                                                            |
| **Syntax:**          | int map\_sizeof(mapping map)                                                           |
| **Return value(s):** | int                                                                                    |
| **Description:**     | map\_sizeof() is used to determine the size of a mapping.                              |
| **Example(s):**      | Merry code: map\_sizeof( (\[ "foo" : "bar", "george" : "hamster" \]) ) <br />Merry result: 2 |
| **See also:**        | [sizeof](#sizeof) and [strlen](#strlen)                                                |

### map\_values

|                      |                                                                                                                                                                                                                                      |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | map\_values                                                                                                                                                                                                                          |
| **Syntax:**          | mixed \* map\_values(mapping map)                                                                                                                                                                                                    |
| **Return value(s):** | mixed \*                                                                                                                                                                                                                             |
| **Example(s):**      | Merry code: map\_values((\[ "Monday" : "Meatloaf", "Tuesday" : "Chicken", "Wednesday" : "Tater tots", "Thursday" : "Fish", "Friday" : "Leftovers", \])) <br />Merry result: ({ "Leftovers", "Meatloaf", "Fish", "Chicken", "Tater tots" }) |
| **See also:**        | [map\_indices](#map_indices)                                                                                                                                                                                                         |

### Match

|                      |                                                                                                                                                    |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | Match                                                                                                                                              |
| **Syntax:**          | NRef \* Match(object ob, string name, varargs object looker, string adj...)                                                                        |
| **Return value(s):** | NRef \*                                                                                                                                            |
| **Description:**     | Match a name (name) and any amount of adjectives (adj...) with a source's inventory (ob).                                                          |
| **Example(s):**      | $black\_cats = Match($actor, "cat", $actor, "black"); EmitTo($actor, "The following black cats are in your inventory: " + Describe($black\_cats)); |
| **See also:**        | [MatchPlural](#MatchPlural)                                                                                                                        |

### MatchPlural

|                      |                                                                                                                                                             |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | MatchPlural                                                                                                                                                 |
| **Syntax:**          | NRef \* MatchPlural(object ob, string pname, varargs object looker, string adj...)                                                                          |
| **Return value(s):** | NRef \*                                                                                                                                                     |
| **Description:**     | Match a pname (plural name) and any amount of adjectives (adj...) with a source's inventory (ob).                                                           |
| **Example(s):**      | $black\_cats = MatchPlural( $actor, "cats", $actor, "black" ); EmitTo($actor, "The following black cats are in your inventory: " + Describe($black\_cats)); |
| **See also:**        | [Match](#Match)                                                                                                                                             |

### member

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>member</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int member(mixed m, array a)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">To figure out whether an array contains a certain value, you use member(). The following:<br />
for( i = 0; i &lt; sizeof( a ); i++ )<br />
if( a[i] == val ) {<br />
/* found it! */<br />
}<br />
Could instead be written as:<br />
if( member( val, a )) {<br />
/* found it! */<br />
}</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry result: 1 <br />Merry code: member( "a", ({ "a", "b", "c" }) )</td>
</tr>
</tbody>
</table>

### millitime

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>millitime</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mixed *</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the current time as an array ({ time, fraction }), where time is an integer denoting the current time in seconds, and fraction is a float in range [0.0 .. 1.0&gt;, denoting the fraction of the current second that has passed, with a resolution of 0.001.<br />
</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: millitime() <br />Merry result: ({ 1049514170, 0.983 })</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#time">time</a> and <a href="#ctime">ctime</a></td>
</tr>
</tbody>
</table>

### mixed\_to\_ascii

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>mixed_to_ascii</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string mixed_to_ascii(mixed value)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Convert any property to a string value.<br />
Note that this function is a clone of dump_value().<br />
For examples and further information, read the 'dump_value' reference.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#ascii_to_mixed">ascii_to_mixed</a> and <a href="#dump_value">dump_value</a></td>
</tr>
</tbody>
</table>

### modf

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>modf</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float * modf(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float *</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Split the argument into a fraction f and an integer part n, such that | f | &lt; 1.0, and f + n == x. ({ f, n }) is returned. Note that n is returned as a float, and may not be representable in type int.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: modf(0.0) <br />Merry result: ({ 0.0, 0.0 }) <br />Merry code: modf(0.5) <br />Merry result: ({ 0.5, 0.0 }) <br />Merry code: modf(1.0) <br />Merry result: ({ 0.0, 1.0 }) <br />Merry code: modf(2.0) <br />Merry result: ({ 0.0, 2.0 })</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#frexp">frexp</a> and <a href="#ldexp">ldexp</a></td>
</tr>
</tbody>
</table>

##  N 
### NewNRef

|                      |                                                                                          |
|----------------------|------------------------------------------------------------------------------------------|
| **Function:**        | NewNRef                                                                                  |
| **Syntax:**          | NRef NewNRef(object obj, string detail)                                                  |
| **Return value(s):** | NRef                                                                                     |
| **Description:**     | Create a new NRef for an object.                                                         |
| **Example(s):**      | Merry code: NewNRef( $actor, "nose" ) <br />Merry result: (43)O(/base/data/nref\#-1, , "nose") |
| **See also:**        | [NRefOb](#NRefOb) and [NRefDetail](#NRefDetail)                                          |

### NRefDetail

|                      |                                                                                                                                                                                   |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | NRefDetail                                                                                                                                                                        |
| **Syntax:**          | string NRefDetail(NRef n)                                                                                                                                                         |
| **Return value(s):** | string                                                                                                                                                                            |
| **Description:**     | Find out the detail ID an NRef is referring to.                                                                                                                                   |
| **Example(s):**      | Merry condition: Actor is smiling at someone's arm ($target). To figure out which part of 'someone' the actor is smiling at: <br />Merry code: NRefDetail( $target ) <br />Merry result: "arm |
| **See also:**        | [NRefOb](#NRefOb) and [NewNRef](#NewNRef)                                                                                                                                         |

### NRefOb

|                      |                                                                                                                                                                            |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | NRefOb                                                                                                                                                                     |
| **Syntax:**          | object NRefOb(NRef n)                                                                                                                                                      |
| **Return value(s):** | object                                                                                                                                                                     |
| **Description:**     | Figure out which object an NRef is referring to.                                                                                                                           |
| **Example(s):**      | Merry condition: Actor is smiling at someone's arm ($target). To figure out who 'someone' is: <br />Merry code: NRefOb( $target ) <br />Merry result: (object reference for 'someone') |
| **See also:**        | [NRefDetail](#NRefDetail) and [NewNRef](#NewNRef)                                                                                                                          |

### NRefsEqual

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>NRefsEqual</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int NRefsEqual(NRef left, NRef right)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">NRefsEqual is used to check whether two NRefs are equal.<br />
Note that 'if( NRef1 == NRef2 )' will always return FALSE, regardless.<br />
Hence, you must do 'if( NRefsEqual( NRef1, NRef2 ))' instead.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: NRefsEqual( NewNRef( $actor, "nose" ), NewNRef( $actor, "nose" )) <br />Merry result: 1 <br />Merry code: NRefsEqual( NewNRef( $actor, "default" ), $actor )) <br />Merry result: 1 <br />Merry code: NRefsEqual( $actor, $actor ) <br />Merry result: 1 <br />Merry code: NRefsEqual( $actor, NewNRef( $actor, "ear" )) <br />Merry result: 0</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#NRefOb">NRefOb</a>, <a href="#NRefDetail">NRefDetail</a> and <a href="#NewNRef">NewNRef</a></td>
</tr>
</tbody>
</table>

### Num

|                      |                                                                                                                                |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | Num                                                                                                                            |
| **Syntax:**          | mixed Num(mixed v)                                                                                                             |
| **Return value(s):** | mixed                                                                                                                          |
| **Description:**     | Turn a string value &lt;v&gt; into a float or integer value. The function will cause an error if &lt;v&gt; is not convertable. |
| **Example(s):**      | Merry code: Num( "4" ) <br />Merry result: 4 <br />Merry code: Num( "4.5" ) <br />Merry result: 4.5                                              |
| **See also:**        | [Str](#Str), [Int](#Int), [Flt](#Flt), [Arr](#Arr) and [Map](#Map)                                                             |

### number\_digit

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>number_digit</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int number_digit(int hexvalue)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Convert any numeric value into a one-digit number, based on the character code position (ASCII, in this case), into the numeric value it represents.<br />
'5', the char, equals 53, the numeric value.<br />
number_digit( 53 ) equals 5, the numeric value.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: number_digit( 1 ) <br />Merry result: 0 <br />Merry code: number_digit( 50 ) <br />Merry result: 2 <br />Merry code: number_digit( 51 ) <br />Merry result: 3 <br />Merry code: number_digit( 52 ) <br />Merry result: 4 <br />Merry code: number_digit( 57 ) <br />Merry result: 9 <br />Merry code: number_digit( 58 ) <br />Merry result: 0 <br />Merry code: number_digit( '5' ) <br />Merry result: 5 <br />Merry code: number_digit( '9' ) <br />Merry result: 9</td>
</tr>
</tbody>
</table>

##  O 
### Obj

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Obj</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>object Obj(string s)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">object</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Obj() is used to retrieve an object's reference through the object's string-name.<br />
For instance, if you have a string objectname, which contains the name of an object you need to access, you could do ob = Obj( objectname );<br />
If the objectname is user-specified, you mustn't count on its validity; if the object &lt;objectname&gt; does not exist, Obj() will return nil. if( !ob ) /* object not exist error handling */<br />
If the object is static, i.e. the name of the object is predetermined and won't ever change, you are encouraged to use the syntax ${objectname} instead. This is the exact same thing as Obj() except that a reference in ${}'s will be updated automatically if the object is ever renamed.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: Obj( "Generic:UrMale" ) <br />Merry result: <br />Merry code: Obj( "Something:nonexistent" ) <br />Merry result: nil</td>
</tr>
</tbody>
</table>

### object\_name

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>object_name</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string object_name(object obj)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the name of object obj.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: object_name($actor) Runtime error: object_name() is replaced by name() and ur_name() <br />Merry code: name($actor) <br />Merry result: "Chatters:LC:ch:allen-christopher" <br />Merry code: ur_name($actor) <br />Merry result: "/base/obj/thing#4803"</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#find_object">find_object</a></td>
</tr>
</tbody>
</table>

### obstat

|               |        |
|---------------|--------|
| **Function:** | obstat |

### oneof

|                      |                                                                                                                                                                                                                                                             |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | oneof                                                                                                                                                                                                                                                       |
| **Syntax:**          | string oneof(string alt1, string alt2, ...)                                                                                                                                                                                                                 |
| **Return value(s):** | string                                                                                                                                                                                                                                                      |
| **Description:**     | Similar to the SAM oneof, {One\|two\|three}, oneof() can be used to produce a random string based on a number of alternatives.                                                                                                                              |
| **Example(s):**      | oneof( "George", "James", "John" ) -&gt; either "George", "James" or "John". "Mr. " + oneof( "George", "James", "John" ) + " " + oneof( "Georgeson", "Jameson", "Johnson" ) -&gt; Mr. George/James/John Georgeson/Jameson/Johnson, e.g. Mr. George Johnson. |

### ordinal

|                      |                                                                                                                                                                                                     |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | ordinal                                                                                                                                                                                             |
| **Syntax:**          | int ordinal(string str)                                                                                                                                                                             |
| **Return value(s):** | int                                                                                                                                                                                                 |
| **Description:**     | Convert a string expression of an ordinal number into an integer value.                                                                                                                             |
| **Example(s):**      | Merry code: ordinal( "first" ) <br />Merry result: 1 <br />Merry code: ordinal( "fifth" ) <br />Merry result: 5 <br />Merry code: ordinal( "tenth" ) <br />Merry result: 10 <br />Merry code: ordinal( "ninetyninth" ) <br />Merry result: 99 |
| **See also:**        | [cardinal](#cardinal), [desc\_ordinal](#desc_ordinal) and [desc\_cardinal](#desc_cardinal)                                                                                                          |

##  P 
### pad\_left

|                      |                                                                                                                                                      |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | pad\_left                                                                                                                                            |
| **Syntax:**          | string pad\_left(string var, int size)                                                                                                               |
| **Return value(s):** | string                                                                                                                                               |
| **Description:**     | Pad var with spaces to the left, so that the result is size long.                                                                                    |
| **Example(s):**      | Merry code: pad\_left( "foo", 8 ) <br />Merry result: " foo" (note that the result above contains five spaces, but only one is displayed in non-pre style) |
| **See also:**        | [strip\_left](#strip_left), [strip\_right](#strip_right), [strip](#strip) and [pad\_right](#pad_right)                                               |

### pad\_right

|                      |                                                                                                                                                       |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | pad\_right                                                                                                                                            |
| **Syntax:**          | string pad\_right(string var, int size)                                                                                                               |
| **Return value(s):** | string                                                                                                                                                |
| **Description:**     | Pad var with spaces to the right, so that the result is size long.                                                                                    |
| **Example(s):**      | Merry code: pad\_right( "foo", 8 ) <br />Merry result: "foo " (note that the result above contains five spaces, but only one is displayed in non-pre style) |
| **See also:**        | [strip\_left](#strip_left), [strip\_right](#strip_right), [strip](#strip) and [pad\_left](#pad_left)                                                  |

### parse\_string

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>parse_string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>mixed parse_string(string format, string str)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mixed</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Parse a string as described by the grammar. The format of the grammar is described in the document called 'Parsing'. If parsing is successful, the parse tree is returned as an array. The optional third argument specifies the number of alternative parse trees to integrate in the result, if the grammar is ambiguous. parse_string() uses internal object storage to cache grammars and generated automatons, which is not removed until the object is destructed.<br />
This function cannot be used from a user or editor object.<br />
<br />
Note:<br />
The parse_string kfun is a very powerful parser to which you supply a grammar of your choice. It's reminiscent of lex and yacc if you've used them before. DGD's parse_string, unlike most parsers, keeps track of all your ambiguous matches. That fact is both a great power and a great responsibility.<br />
<br />
What that means is that if your grammar allows something to be parsed a couple of different ways then DGD will keep track of them all while parsing. If there are two ways to parse a double-if statement with else (the else can go with either if) in your grammar, and you feed parse_string a chunk with fifteen of those, you'll find that DGD is keeping track of 2^15 (that's around 32,000) different interpretations of your file. Then it will cheerfully return only the first. That's slow, just in case you hadn't guessed.<br />
<br />
However, sometimes you want ambiguous parsing. For instance, you may have a natural language parser for player commands, and you'd like the player to be able to type "get down" and have it mean either of "get down from the platform" or "take the down pillow" according to two different grammar rules. DGD's parse_string will return both parses, and you can decide which makes more sense where the player is standing at the time. Most parsers won't do this for you. Lucky you found DGD, hey?<br />
<br />
A fellow named Steve Foley has graciously put together a tutorial on parse_string, with the aid of our own Nino (Erwin Harte). You can find it at http://www.mindspring.com/~zeppo1/parse_string.html<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#sscanf">sscanf</a>, <a href="#explode">explode</a> and <a href="#implode">implode</a></td>
</tr>
</tbody>
</table>

### ParseXML

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>ParseXML</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>mixed ParseXML(string XML)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mixed</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">ParseXML() is used to convert an XML string to the appropriate value (a SAM-string, for instance).<br />
Like the Bilbo $sam(), ParseXML() used with UnSAM() constitute Merry's portal to the XML/SAM engine. It's not going to be used as much as Bilbo's is, because SAM has few abilities that Merry does not have natively. To emulate $sam(foo), use UnSAM(ParseXML("foo")).<br />
<br />
The real use of UnSAM() is to handle binary SAM data stored in e.g. descriptions. If you have a room with a description containing oneof's, for example, and you want to create a text representation of this, you'd want to do something like,<br />
str = UnSAM(Get(this, "details:default:description:examine"));</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: ParseXML( "{sam-style|one|of}" ) <br />Merry result: X[S] {sam-style|one|of} <br />Merry code: ParseXML( "" ) <br />Merry result: X[S] <br />Merry code: UnSAM( ParseXML( "" ) <br />Merry result: "StoryCoder Kalle" <br />Merry code: ParseXML( "You are , the {heroic|fantastic|extraordinary|hulkhoganish|awesome|illiterate|analphabetic|dyslectic} {thief|villain|joe|wizard|viking|lord|knight|master} {of|from} {Sweden|Norway|York|Denmark|London|Scandinavia}!" ) <br />Merry result: X[S] You are , the {heroic|fantastic|extraordinary|hulkhoganish|awesome|illiterate|analphabetic|dyslectic} {thief|villain|joe|wizard|viking|lord|knight|master} {of|from} {Sweden|Norway|York|Denmark|London|Scandinavia}!</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#UnSAM">UnSAM</a></td>
</tr>
</tbody>
</table>

### Popup

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Popup</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>void Popup(object recipient, object source, string what)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">void</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">There is a new Merry function called Popup(). If the user is running an official Skotos client (Java, Zealous or Alice) this will cause a browser window to pop up for the player, filled with whatever content you specify. For example,<br />
<br />
Popup($actor, $actor."base:environment", "painting");<br />
will popup a window to $actor, displaying the contents of the property html:painting in the actor's current room.<br />
<br />
Unsurprisingly, popup window content is written in HTML, and we're lucky in that SAM -- which we normally use to write text description -- is closely related to HTML.<br />
<br />
As an example, we might have...<br />
<br />
room.html:painting = X[S]<br />
&lt;BODY bgcolor="black"&gt;<br />
&lt;IMG src="http://www.mydomain.com/images/painting.jpg"/&gt;<br />
&lt;/BODY&gt;<br />
<br />
which wouldn't look good -- it'd be up to you to do cook up some nice looking stylesheet, or something -- but you get the idea.<br />
<br />
Of course, SAM can do more than just represent static HTML. SAM for popups can use the same active tags that it does for text... we can pull values from the room and apply logic to the values. For example, display different paintings depending on the light level of the room...<br />
<br />
room.html:painting = X[S]<br />
&lt;BODY bgcolor="$(this.painting:bgcolor)"&gt;<br />
{? | $this.base:dark |<br />
&lt;IMG src="http://www.mydomain.com/images/painting-in-dark.jpg"/&gt; |<br />
&lt;IMG src="http://www.mydomain.com/images/painting-in-light.jpg"/&gt;<br />
}<br />
&lt;/BODY&gt;<br />
<br />
Again, you get the basic idea.<br />
<br />
These popups are built on top of a general way for browsers to fetch the value of a property from an in-game object. This system a special form of the basic URL syntax you are used to from browsing the web. A URL that fetches the property 'html:painting' from 'Zell:Rooms:PaintingRoom' and displays it would look like, /SAM/Prop/Zell:Rooms:PaintingRoom/painting and that is in fact precisely the URL constructed by the Popup() call in Merry, above.<br />
<br />
The special format of this URL allows us to use relative linking in a very handy way. Let's add a hyperlink to our example:<br />
<br />
room.html:painting = X[S]<br />
&lt;BODY bgcolor="$(this.painting:bgcolor)"&gt;<br />
&lt;A href="painting-closeup"&gt;<br />
{? | $this.base:dark |<br />
&lt;IMG src="http://www.mydomain.com/images/painting-in-dark.jpg"/&gt; |<br />
&lt;IMG src="http://www.mydomain.com/images/painting-in-light.jpg"/&gt;<br />
}<br />
&lt;/A&gt;<br />
&lt;/BODY&gt;<br />
<br />
You will note that the 'href' attribute of the link is a relative URL. The browser will automatically expand this to /SAM/Prop/Zell:Rooms:PaintingRoom/painting-closeup and so if you click on the link, you will be taken to the contents of the property 'html:painting-closeup' in the same object as 'html:painting' is already defined. This makes it easy to create links that navigate between web properties in a single object.<br />
<br />
For further complexity, Merry can now be embedded anywhere in SAM -- either to be included in the stream of text, or as attribute value to another SAM tag. For example, let's say we want to automate the example above with different paintings even further. We could dynamically create the URL from the derived property base:light-category:<br />
<br />
room.html:painting = X[S]<br />
&lt;BODY bgcolor="black"&gt;<br />
&lt;IMG src='$[<br />
/* MERRY: add the light category into the middle of the URL */<br />
"http://www.mydomain.com/images/painting-" +<br />
$this."base:light-category" +<br />
".jpg"<br />
]'/&gt;<br />
&lt;/BODY&gt;<br />
<br />
Things get -really- exciting when you begin to use the zform and zact SAM tags, which allow a Merry script to be executed on the server when the user hits a submit button or a link. This means popups can contain controls, such as start story configuration panels.</td>
</tr>
</tbody>
</table>

### pow

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>pow</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float pow(float x, float y)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return x to the power y.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: pow(10.0, 3.0) <br />Merry result: 1000.0</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#exp">exp</a>, <a href="#log">log</a> and <a href="#log10">log10</a></td>
</tr>
</tbody>
</table>

### PRE

|                      |                                                              |
|----------------------|--------------------------------------------------------------|
| **Function:**        | PRE                                                          |
| **Syntax:**          | string PRE(string str)                                       |
| **Return value(s):** | string                                                       |
| **Description:**     | Use PRE() to get the equivalent of the HTML &lt;PRE&gt; tag. |
| **See also:**        | [TAG](#TAG)                                                  |

### prefixed\_map

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>prefixed_map</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>mapping prefixed_map(mapping map, string prefix)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mapping</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Extract all elements from map where the indice (key) begins with prefix.<br />
There are known issues with mappings that contain non-alphanumeric characters, that may result in invalid results for this specific function.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: prefixed_map( ([ "Monday" : "Meatloaf", "Tuesday" : "Chicken", "Wednesday" : "Tater tots", "Thursday" : "Fish", "Friday" : "Leftovers" ]), "Monday" ) <br />Merry result: ([ "Monday":"Meatloaf" ]) <br />Merry code: prefixed_map( ([ "ape" : "monkey", "adam" : "pig", "bertram" : "prince" ]), "a" ) <br />Merry result: ([ "adam":"pig", "ape":"monkey" ])</td>
</tr>
</tbody>
</table>

### previous\_object

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>previous_object</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>varargs object previous_object(int n)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">varargs object</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the object n+1 (default: 1) steps back in the call_other chain.<br />
If the object is destructed, or the number of steps is larger than the number of call_others involved, zero is returned.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: previous_object() <br />Merry result:</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#call_other">call_other</a>, <a href="#this_object">this_object</a> and <a href="#call_trace">call_trace</a></td>
</tr>
</tbody>
</table>

### previous\_program

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>previous_program</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string previous_program(varargs int n)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the name of the object with the function n+1 (default: 1) steps back in the function call chain. If the number of steps is larger than the number of function calls involved, nil is returned.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: previous_program() <br />Merry result: "/usr/SkotOS/lib/merrynode"</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#previous_object">previous_object</a> and <a href="#call_trace">call_trace</a></td>
</tr>
</tbody>
</table>

### proper

|                      |                                                                                                                     |
|----------------------|---------------------------------------------------------------------------------------------------------------------|
| **Function:**        | proper                                                                                                              |
| **Syntax:**          | string proper(string str)                                                                                           |
| **Return value(s):** | string                                                                                                              |
| **Description:**     | Make sure the first letter of each space-delimited word in str is capitalized.                                      |
| **Example(s):**      | "the kingdom of sweden" -&gt; "The Kingdom Of Sweden"                                                               |
| **See also:**        | [lower\_case](#lower_case), [upper\_case](#upper_case), [capitalize](#capitalize) and [decapitalize](#decapitalize) |

##  Q 
### query\_editor

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>query_editor</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string query_editor(object obj)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the editor status of an object. This is either "command", if the editor instance is in command mode, "insert", if the editor instance is in input mode, or 0, if there is no editor instance for the given object.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: query_editor($actor) <br />Merry result: nil</td>
</tr>
</tbody>
</table>

### query\_ip\_name

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>query_ip_name</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string query_ip_name(object user)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the IP name of a user, as a string, or nil if the given object is not a user object. If the IP name could not be resolved, the IP number is returned, instead.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#query_ip_number">query_ip_number</a>, <a href="#send_datagram">send_datagram</a>, <a href="#send_message">send_message</a>, <a href="#this_user">this_user</a> and <a href="#users">users</a></td>
</tr>
</tbody>
</table>

### query\_ip\_number

|                      |                                                                                             |
|----------------------|---------------------------------------------------------------------------------------------|
| **Function:**        | query\_ip\_number                                                                           |
| **Syntax:**          | string query\_ip\_number(object user)                                                       |
| **Return value(s):** | string                                                                                      |
| **Description:**     | Return the ip number of a user, as a string, or 0 if the given object is not a user object. |

##  R 
### random

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>random</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int random(int mod)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return a positive random number between 0 and integer specified within () minus 1.<br />
The example would return a random number between 1 and 5 due to the modifier of +1.<br />
If modifier is less than 1, 0 is returned.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">random(5)+1</td>
</tr>
</tbody>
</table>

### replace\_html

|                      |                                     |
|----------------------|-------------------------------------|
| **Function:**        | replace\_html                       |
| **Syntax:**          | string replace\_html(string str)    |
| **Return value(s):** | string                              |
| **Description:**     | Use replace\_html() to escape HTML. |
| **Example(s):**      | "foo & bar" -&gt; "foo & bar"       |

### replace\_strings

|                      |                                                                                                                                                 |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | replace\_strings                                                                                                                                |
| **Syntax:**          | string replace\_strings(string str, string swaps...)                                                                                            |
| **Return value(s):** | string                                                                                                                                          |
| **Description:**     | Replace substrings in str given in swaps.                                                                                                       |
| **Example(s):**      | Merry code: replace\_strings( "You, someone, must something!", "someone", "Kalle", "something", "jump" ) <br />Merry result: "You, Kalle, must jump!" |

### replace\_xml

|                      |                                                                                                                                                                                                                                                                                                                                                                                                |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | replace\_xml                                                                                                                                                                                                                                                                                                                                                                                   |
| **Syntax:**          | string replace\_xml(string str)                                                                                                                                                                                                                                                                                                                                                                |
| **Return value(s):** | string                                                                                                                                                                                                                                                                                                                                                                                         |
| **Description:**     | Escape a string, adding a backslash character before any character significant to SAM.                                                                                                                                                                                                                                                                                                         |
| **Example(s):**      | Merry code: ParseXML( "1&lt;2 & 3&gt;2" ) Runtime error: XML: file N/A line 1: unexpected token <br />Merry code: replace\_xml( "1&lt;2 & 3&gt;2" ) <br />Merry result: "1\\\\&lt;2 \\\\& 3\\\\&gt;2" <br />Merry code: ParseXML( replace\_xml( "1&lt;2 & 3&gt;2" )) <br />Merry result: X\[S\] 1\\&lt;2 \\& 3\\&gt;2 <br />Merry code: UnSAM( ParseXML( replace\_xml( "1&lt;2 & 3&gt;2" ))) <br />Merry result: "1&lt;2 & 3&gt;2" |
| **See also:**        | [ParseXML](#ParseXML) and [UnSAM](#UnSAM)                                                                                                                                                                                                                                                                                                                                                      |

### restore\_object

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>restore_object</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int restore_object(string file)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Restore all global variables in an object that are not private or static from a file. All variables which qualify, but were not restored and do not contain object values, will be set to 0. 1 is returned if the variables could be restored, 0 otherwise.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#save_object">save_object</a></td>
</tr>
</tbody>
</table>

### reverse

|                      |                                                                                                        |
|----------------------|--------------------------------------------------------------------------------------------------------|
| **Function:**        | reverse                                                                                                |
| **Syntax:**          | mixed \* reverse(mixed \*orig)                                                                         |
| **Return value(s):** | mixed \*                                                                                               |
| **Description:**     | Reverse the array &lt;orig&gt;, result being an array listing the values of &lt;orig&gt; backwards.    |
| **Example(s):**      | Merry code: reverse( ({ "ape", "monkey", "giraffe" }) ) <br />Merry result: ({ "giraffe", "monkey", "ape" }) |
| **See also:**        | [reverse\_mapping](#reverse_mapping)                                                                   |

### reverse\_lookup

|                      |                                                                                                                                                                                                                                                                                                  |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | reverse\_lookup                                                                                                                                                                                                                                                                                  |
| **Syntax:**          | mixed reverse\_lookup(mapping map, mixed val)                                                                                                                                                                                                                                                    |
| **Return value(s):** | mixed                                                                                                                                                                                                                                                                                            |
| **Description:**     | Mappings are sequences of pairs, each pair containing an indice (key) and a value. The ordinary way to read from a map is to read the values by providing the indice - map\[&lt;indice&gt;\] == &lt;value&gt;. The reverse\_lookup function is used to read the indices by providing the values. |
| **Example(s):**      | Merry code: reverse\_lookup( (\[ "a":1, "b":2, "c":3 \]), 2 ) <br />Merry result: "b"                                                                                                                                                                                                                  |
| **See also:**        | [map\_indices](#map_indices) and [map\_values](#map_values)                                                                                                                                                                                                                                      |

### reverse\_mapping

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>reverse_mapping</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>mapping reverse_mapping(mapping map)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">mapping</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Reverse a mapping by setting indice-&gt;value, and value-&gt;indice.<br />
Note that if a mapping contains several identical values, such as ([ "foo" : "bar", "foo2" : "bar" ]), a call to reverse_mapping will result in a "mapping is not injective" runtime error.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: reverse_mapping( ([ "foo" : "bar", "name" : "kalle" ]) ) <br />Merry result: ([ "bar":"foo", "kalle":"name" ])</td>
</tr>
</tbody>
</table>

### rfc\_1123\_date

|                      |                                                                                                                                           |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | rfc\_1123\_date                                                                                                                           |
| **Syntax:**          | string rfc\_1123\_date(int n)                                                                                                             |
| **Return value(s):** | string                                                                                                                                    |
| **Description:**     | Extract a UNIX time stamp date as a string, formatted RFC-1123 compliant.                                                                 |
| **Example(s):**      | Merry code: rfc\_1123\_date( time() ) <br />Merry result: "Sat, 31 May 2003 14:21:43 GMT"                                                       |
| **See also:**        | [ctime](#ctime), [time](#time), [short\_time](#short_time), [humanized\_date](#humanized_date), [days](#days) and [smalltime](#smalltime) |

##  S 
### save\_object

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>save_object</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>void save_object(string file)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">void</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Save all global variables in an object that are not private or static to a file. Only non-zero and non-object values are actually saved.<br />
</td>
</tr>
</tbody>
</table>

### Set

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Set</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>void Set(object ob, string property, mixed value)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">void</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Set() is used to set a property in an object to a value. It has a built-in shorter syntax as well,<br />
<br />
Set( x, "y", z ) -&gt; x."y" = z;<br />
<br />
The shorter version only works if y is an absolute string value ("abc" is absolute, $property is not), otherwise the Set() function must be used.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">$foo = "I'ma value."; Set( ob, "prop", $foo ); /* Set "prop" in ob to "I'ma value." (as defined in $foo) */ Set( $actor, "prop", $foo ); /* Set "prop" in actor to "I'ma value." (as defined in $foo) */ $changeWhat = "appearance:eyecolor"; $value = "rainbow"; Set( $actor, $changeWhat, $value ); /* Set "appearance:eyecolor" (as defined in $changeWhat) in $actor to "rainbow" (as defined in $value) */ $changeSomethingElse = "skin"; $value = "pink with blue dots"; Set( $actor, "appearance:" + $changeSomethingElse, $value ); /* Set "appearance:skin" in $actor to "pink with blue dots" */ ob."prop" = $foo; /* Set "prop" in ob to "I'ma value." */ $actor."prop" = $foo; Currently, Set( x, "y", z ); can be shortened to x."y" = z; But this only works if the property name argument (y) is absolute. That is, we cannot: x.$foo = z;</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Get">Get</a></td>
</tr>
</tbody>
</table>

### set\_by\_int

|                      |                                                                                                                                                                                                                                                 |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | set\_by\_int                                                                                                                                                                                                                                    |
| **Syntax:**          | void set\_by\_int(mapping bigmap, int ix, mixed val)                                                                                                                                                                                            |
| **Return value(s):** | void                                                                                                                                                                                                                                            |
| **Description:**     | Set the value in &lt;bigmap&gt; for the indice specified using integer identifier &lt;ix&gt; to &lt;val&gt;.                                                                                                                                    |
| **See also:**        | [get\_by\_int](#get_by_int), [clear\_by\_int](#clear_by_int), [get\_by\_ob](#get_by_ob), [set\_by\_ob](#set_by_ob), [clear\_by\_ob](#clear_by_ob), [get\_by\_str](#get_by_str), [set\_by\_str](#set_by_str) and [clear\_by\_str](#clear_by_str) |

### set\_by\_ob

|                      |                                                                                                                                                                                                                                                   |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | set\_by\_ob                                                                                                                                                                                                                                       |
| **Syntax:**          | void set\_by\_ob(mapping bigmap, string str, mixed val)                                                                                                                                                                                           |
| **Return value(s):** | void                                                                                                                                                                                                                                              |
| **Description:**     | Set the value in &lt;bigmap&gt; for the indice specified using object identifier &lt;ob&gt; to &lt;val&gt;.                                                                                                                                       |
| **See also:**        | [get\_by\_int](#get_by_int), [set\_by\_int](#set_by_int), [clear\_by\_int](#clear_by_int), [get\_by\_ob](#get_by_ob), [clear\_by\_ob](#clear_by_ob), [get\_by\_str](#get_by_str), [set\_by\_str](#set_by_str) and [clear\_by\_str](#clear_by_str) |

### set\_by\_str

|                      |                                                                                                                                                                                                                                                                              |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | set\_by\_str                                                                                                                                                                                                                                                                 |
| **Syntax:**          | void set\_by\_str(mapping bigmap, string str, mixed val)                                                                                                                                                                                                                     |
| **Return value(s):** | void                                                                                                                                                                                                                                                                         |
| **Description:**     | Set the value in &lt;bigmap&gt; for the indice specified using string identifier &lt;str&gt; to &lt;val&gt;.                                                                                                                                                                 |
| **See also:**        | [get\_by\_int](#get_by_int), [set\_by\_int](#set_by_int), [clear\_by\_int](#clear_by_int), [get\_by\_ob](#get_by_ob), [set\_by\_ob](#set_by_ob), [clear\_by\_ob](#clear_by_ob), [get\_by\_str](#get_by_str), [set\_by\_str](#set_by_str) and [clear\_by\_str](#clear_by_str) |

### SetVar

|                  |                                                                                                                                                                     |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**    | SetVar                                                                                                                                                              |
| **Syntax:**      | SetVar(string n, mixed v)                                                                                                                                           |
| **Description:** | SetVar() is used to set the value of a variable with a possibly constructed name, usually used when the variable's name is unresolved at compile time.              |
| **Example(s):**  | $property = "address"; $value = "Skogsb. 27"; SetVar( $property, $value ); EmitTo( $actor, $address ); /\* \* Emits "Skogsb. 27", found in $address, to $actor. \*/ |
| **See also:**    | [GetVar](#GetVar), [Set](#Set) and [Get](#Get)                                                                                                                      |

### short\_time

|                      |                                                                                                                                                  |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | short\_time                                                                                                                                      |
| **Syntax:**          | string short\_time(int stamp)                                                                                                                    |
| **Return value(s):** | string                                                                                                                                           |
| **Description:**     | Extract a brief string version of a UNIX timestamp date (stamp).                                                                                 |
| **Example(s):**      | Merry code: short\_time( time() ) <br />Merry result: "May 31 08:28"                                                                                   |
| **See also:**        | [ctime](#ctime), [time](#time), [humanized\_date](#humanized_date), [rfc\_1123\_date](#rfc_1123_date), [days](#days) and [smalltime](#smalltime) |

### sin

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>sin</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float sin(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the sine of the argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: sin(0.0) <br />Merry result: 0.0 <br />Merry code: sin(0.5) <br />Merry result: 0.47942554 <br />Merry code: sin(1.0) <br />Merry result: 0.84147098</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#cos">cos</a> and <a href="#tan">tan</a></td>
</tr>
</tbody>
</table>

### sinh

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>sinh</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float sinh(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the hyperbolic sine of the argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: sinh(0.0) <br />Merry result: 0.0 <br />Merry code: sinh(0.5) <br />Merry result: 0.52109531 <br />Merry code: sinh(1.0) <br />Merry result: 1.1752012</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#cosh">cosh</a> and <a href="#tanh">tanh</a></td>
</tr>
</tbody>
</table>

### sizeof

|                      |                                                                               |
|----------------------|-------------------------------------------------------------------------------|
| **Function:**        | sizeof                                                                        |
| **Syntax:**          | int sizeof(mixed \*arr)                                                       |
| **Return value(s):** | int                                                                           |
| **Description:**     | sizeof() is used to determine the size of an array.                           |
| **Example(s):**      | Merry code: sizeof( ({ "foo", "bar", "george", "hamster" }) ) <br />Merry result: 4 |
| **See also:**        | [map\_sizeof](#map_sizeof) and [strlen](#strlen)                              |

### Slay

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Slay</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>void Slay(object ob)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">void</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Slay() undoes what Spawn() does.<br />
A word of warning though: there is no such thing as a 'trashcan'.<br />
Know what you're doing.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Slay( $steaming_hot_cup_of_java );</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Spawn">Spawn</a> and <a href="#Duplicate">Duplicate</a></td>
</tr>
</tbody>
</table>

### smalltime

|                      |                                                                                                                                                     |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | smalltime                                                                                                                                           |
| **Syntax:**          | string smalltime(int stamp)                                                                                                                         |
| **Return value(s):** | string                                                                                                                                              |
| **Description:**     | Return the hour and minute of the UNIX timestamp date (stamp).                                                                                      |
| **Example(s):**      | Merry code: smalltime( time () ) <br />Merry result: "08:29"                                                                                              |
| **See also:**        | [ctime](#ctime), [time](#time), [humanized\_date](#humanized_date), [rfc\_1123\_date](#rfc_1123_date), [days](#days) and [short\_time](#short_time) |

### Social

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Social</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>void Social(object ob, string verb, string adverb, string evoke, string prep1, NRef *obs1, string prep2, NRef *obs2, ...)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">void</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Social() is a shortcut for what could actually be accomplished through the use of Act(), by calling the "social" action. However, the social action is complex enough and socials are so common that this convenience function is quite warranted. Note that this executes real socials, not just emits. This means all the signals and scripts associated with the social are run as well.<br />
Social() can take a good amount of argument and can generate any results with the parser that any regular player can.<br />
Only the first two arguments are required: the object to command, and the verb to execute. The adverbs and evokes should be straight-forward. The last string of arguments specify the different targets and at least for now, more than one pair of preposition and object should be quite rare.<br />
In some cases, though, when a Social() doesn't seem to do what you ask, you may have to look into Act().<br />
<br />
(Hack) Set the property $(adverb:position) to one of the following, right before the call to Social() to determine the position of the adverb:<br />
PRE_VERB = "pv" e.g. 'happily wave the sword'<br />
PRE_ROLE = "pr" e.g. 'wave happily to the creature'<br />
PRE_PREP = "pp" e.g. 'wave the sword angrily at the mutant'<br />
PRE_EVOKE = "pe" e.g. 'wave the sword at the mutant angrily'<br />
<br />
E.g.:<br />
$(adverb:position) = PRE_VERB;<br />
Social( $actor, "smile", "happily", "Hi Charles!" ); -&gt; You happily smile, "Hi Charles!"<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Social( $actor, "smile" ); -&gt; You smile. Social( $actor, "smile", "happily" ); -&gt; You smile happily. Social( $actor, "smile", "happily", "G'day everyone!" ); -&gt; You smile happily, "G'day everyone!" Social( $actor, "smile", "happily", nil, "at", $actor ); -&gt; You smile happily at yourself. Social( $actor, "smile", "happily", nil, "at", ({ $actor, NewNRef( $actor, "toe" ) }) ); -&gt; You smile happily at yourself and your toe. Social( $actor, "turn", "seriously", nil, nil, NewNRef( $actor, "head" ), "to", NewNRef( $actor, "feet" ) ); -&gt; You turn seriously your head to your feet.</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Act">Act</a>, <a href="#EmitTo">EmitTo</a> and <a href="#EmitIn">EmitIn</a></td>
</tr>
</tbody>
</table>

### spaces

|                      |                                                                                                                                         |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | spaces                                                                                                                                  |
| **Syntax:**          | string spaces(int num)                                                                                                                  |
| **Return value(s):** | string                                                                                                                                  |
| **Description:**     | Return a string of num spaces.                                                                                                          |
| **Example(s):**      | Merry code: spaces( 5 ) <br />Merry result: " " (note that the result above contains five spaces, but only one is displayed in non-pre style) |
| **See also:**        | [pad\_left](#pad_left) and [pad\_right](#pad_right)                                                                                     |

### Spawn

|                      |                                                                                                                                                                                                                                                |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | Spawn                                                                                                                                                                                                                                          |
| **Syntax:**          | object Spawn(object ob)                                                                                                                                                                                                                        |
| **Return value(s):** | object                                                                                                                                                                                                                                         |
| **Description:**     | Extremely straight-forward, this is how we generate new objects. Merry can only create spawns of existing ur-objects, though this limitation may go out the door in time. The spawn behaves exactly as spawns do throughout the Skotos system. |
| **Example(s):**      | $steaming\_hot\_cup\_of\_java = Spawn( ${Generic:drink:mug-coffee} );                                                                                                                                                                          |
| **See also:**        | [Duplicate](#Duplicate) and [Slay](#Slay)                                                                                                                                                                                                      |

### sqrt

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>sqrt</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float sqrt(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the square root of the argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: sqrt(2.0) <br />Merry result: 1.4142136</td>
</tr>
</tbody>
</table>

### sscanf

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>sscanf</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int sscanf(string str, string fmt, ...)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Parse the string str, using the format string fmt. The following character sequences have a special meaning in the format string:<br />
<br />
%s match a substring<br />
%d match a number<br />
%f match a floating-point number<br />
%c match a character<br />
%% match single %<br />
<br />
Other characters must be matched exactly. %*s, %*d, %*f and %*c can be used to match without assignment. Matched substrings and numbers are assigned to the successive lvalue arguments following the format string. The number of matched substrings and numbers is returned.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#parse_string">parse_string</a>, <a href="#explode">explode</a> and <a href="#implode">implode</a></td>
</tr>
</tbody>
</table>

### status

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>status</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>varargs mixed * status(object obj)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">varargs mixed *</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Called without an argument, this kfun returns information about resources used by the system. With an object as argument, resource usage by that object is given. The returned value is an array, the fields of which are described in the include file .<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: status() <br />Merry result: ({ "DGD 1.2.55p2s", 997809254, 1046300140, 51470076, 1048576, 112323, 1024, 0, 0, 25037884, 24893744, 124032000, 118680792, 262144, 11447, 10000, 15, 41, 400, 40, 1048576, 8192, 243, 499975398, ({ }), "198.232.133.147" })</td>
</tr>
</tbody>
</table>

### Stop

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Stop</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>void Stop(string identifier)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">void</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Stop() is used to terminate a running loop, instantiated using the Every() function.<br />
It takes the identifier string returned by the Every() function as single argument.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">[Also see C. Allen's example torch at: Examples:complete:light:torch] See the Every() function reference for an example.</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Every">Every</a></td>
</tr>
</tbody>
</table>

### Str

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>Str</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string Str(mixed value)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Convert an appropriate value to a string.<br />
Note that this does not work with all properties.<br />
- All strings, floats, integers and objects are applicable.<br />
- No arrays or mappings are applicable.</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Str( 3 ) -&gt; "3" Str( 3+3 ) -&gt; "6" Str( 3.14 ) -&gt; "3.14" Str( "5.9" ) -&gt; "5.9" Str( "15" ) -&gt; "15" Str( "123 muffins" ) -&gt; "123 muffins" Str( "5+5" ) -&gt; "5+5" Str( nil ) -&gt; "" Str( "Muffin" ) -&gt; "Muffin" Str( $actor."base:intrinsiccapacity" ) -&gt; "10.0" Str( $actor."base:actualcapacity" ) -&gt; "9.8574127" Str( $actor ) -&gt; "Marrach:players:K:kalle" Str( ({ "a", "b", "c" }) ) -&gt; ERROR: cannot convert value to string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#Int">Int</a>, <a href="#Flt">Flt</a>, <a href="#dump_value">dump_value</a>, <a href="#mixed_to_ascii">mixed_to_ascii</a> and <a href="#ascii_to_mixed">ascii_to_mixed</a></td>
</tr>
</tbody>
</table>

### string\_to\_hex

|                      |                                                 |
|----------------------|-------------------------------------------------|
| **Function:**        | string\_to\_hex                                 |
| **Syntax:**          | string string\_to\_hex(string bytes)            |
| **Return value(s):** | string                                          |
| **Description:**     | Return the hexadecimal representation of bytes. |
| **Example(s):**      | 'FOO' -&gt; 464f4f                              |
| **See also:**        | [hex\_digit](#hex_digit)                        |

### strip

|                      |                                                                                                               |
|----------------------|---------------------------------------------------------------------------------------------------------------|
| **Function:**        | strip                                                                                                         |
| **Syntax:**          | string strip(string str)                                                                                      |
| **Return value(s):** | string                                                                                                        |
| **Description:**     | Strip whitespace from both sides of str.                                                                      |
| **Example(s):**      | " abc " -&gt; "abc"                                                                                           |
| **See also:**        | [strip\_left](#strip_left), [strip\_right](#strip_right), [pad\_left](#pad_left) and [pad\_right](#pad_right) |

### strip\_left

|                      |                                                                                                    |
|----------------------|----------------------------------------------------------------------------------------------------|
| **Function:**        | strip\_left                                                                                        |
| **Syntax:**          | string strip\_left(string str)                                                                     |
| **Return value(s):** | string                                                                                             |
| **Description:**     | Strip whitespace from the left of str.                                                             |
| **Example(s):**      | " abc " --&gt; "abc "                                                                              |
| **See also:**        | [strip\_right](#strip_right), [strip](#strip), [pad\_left](#pad_left) and [pad\_right](#pad_right) |

### strip\_right

|                      |                                                                                                  |
|----------------------|--------------------------------------------------------------------------------------------------|
| **Function:**        | strip\_right                                                                                     |
| **Syntax:**          | string strip\_right(string str)                                                                  |
| **Return value(s):** | string                                                                                           |
| **Description:**     | Strip whitespace from the right of str.                                                          |
| **Example(s):**      | " abc " --&gt; " abc"                                                                            |
| **See also:**        | [strip\_left](#strip_left), [strip](#strip), [pad\_left](#pad_left) and [pad\_right](#pad_right) |

### strlen

|                      |                                                  |
|----------------------|--------------------------------------------------|
| **Function:**        | strlen                                           |
| **Syntax:**          | int strlen(string s)                             |
| **Return value(s):** | int                                              |
| **Description:**     | Return the length of string s.                   |
| **Example(s):**      | Merry code: strlen( "test" ) <br />Merry result: 4     |
| **See also:**        | [map\_sizeof](#map_sizeof) and [sizeof](#sizeof) |

### structure\_propmap

|               |                    |
|---------------|--------------------|
| **Function:** | structure\_propmap |

### switch

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>switch</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>switch(mixed value)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">The switch() statement is in a way an extension of if(). For example,<br />
if( $a == 1 ) EmitTo( $actor, "One" );<br />
if( $a == 2 ) EmitTo( $actor, "Two" );<br />
if( $a == 3 ) EmitTo( $actor, "Three" );<br />
- can also be written as,<br />
switch( $a ){<br />
case 1: EmitTo( $actor, "One" ); break;<br />
case 2: EmitTo( $actor, "Two" ); break;<br />
case 3: EmitTo( $actor, "Three" ); break;<br />
}<br />
<br />
Within the switch() block, the case and default keywords are used to check conditions, both concluded using the break keyword. Several case statements can be made in which case the code after the first TRUE case statement is executed regardless until the next break. Example:<br />
<br />
switch( $a ){<br />
case 1: EmitTo( $actor, "One." ); /* no break; */<br />
case 2: EmitTo( $actor, "Two." ); break;<br />
case 3: EmitTo( $actor, "Three." ); break;<br />
}<br />
If $a is 1, the output will be "One." followed by "Two." but if $a is 2 the output will be "Two." only.<br />
If $a is 3, the output will be "Three." only.</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">Example #1: ----------- $i = 2; switch( $i ){ case 0: EmitTo( $actor, "Zero value." ); break; case 1: EmitTo( $actor, "Value is one." ); break; case 2: EmitTo( $actor, "Value is two." ); break; default: EmitTo( $actor, "It's not 0, not 1, not 2." ); break; } ----------- Result: ------- Value is two. ------- Example #2: (advanced) ----------- /* Compare two values, $left and $right, regardless of value type. We call this script lib:compare in this (since we will be calling ourselves further down) */ if( typeof( $left ) != typeof( $right )) /* They're not even the same type, so we check their dump values and just compare those. */ return dump_value( $left ) == dump_value( $right ); switch( typeof( $left )){ case T_ARRAY: /* this is an array, so we do some special checks, cause in this compare function, ({ "a", "b" }) is the same as ({ "b", "a" }) */ /* firstly, check if the size of both is the same (if not, they're not similar) */ if( sizeof( $left ) != sizeof( $right )) return FALSE; /* We sort'em. */ $left = map_indices( arr_to_set( $left )); $right = map_indices( arr_to_set( $right )); /* and step through'em each to see if we find any differences */ for( $i = 0; $i &lt; sizeof( $left ); $i++ ) /* Here we call ourselves recursively on each element in the array, and if we get a "not similar" anywhere, we have reached the conclusion that the two properties aren't similar */ if( !Call( this, "compare", $left: $left[$i], $right: $right[$i] )) return FALSE; break; case T_MAPPING: /* this is a mapping, so we need to do some other special checks */ /* size check, like we did with the arrays above, but we use 'map_sizeof' since we're dealing with mappings */ if( map_sizeof( $left ) != map_sizeof( $right )) return FALSE; /* Okay, sizes are right. Let's extract indices and values, and do a check on both */ $left_indices = map_indices( $left ); /* ([ "foo" : "bar" ]) becomes ({ "foo" }) */ $right_indices = map_indices( $right ); for( $i = 0; $i &lt; sizeof( $left_indices ); $i++ ) if( !Call( this, "compare", $left: $left_indices[$i], $right: $right_indices[$i] )) return FALSE; /* indices seem to be the same; checking values now ... */ $left_values = map_values( $left ); /* ([ "foo" : "bar" ]) becomes ({ "bar" }) */ $right_values = map_values( $right ); for( $i = 0; $i &lt; sizeof( $left_values ); $i++ ) if( !Call( this, "compare", $left: $left_values[$i], $right: $right_values[$i] )) return FALSE; break; default: /* anything that wasn't caught above (arrays and mappings) is caught here */ return $left == $right; /* simple enough, neh? */ break; } return TRUE; ----------- Comment: -------- The above function, while a little long, is a perfect example for what switch() may be used for. Try putting the function in for instance your body and call it like: +tool merry eval Call( $actor, "compare", $left: ([ ({ "a", "b", "c" }) : ([ "foo" : "bar" ]) ]), $right : ([ ({ "c", "b", "a" }) : ([ "foo" : "bar" ]) ]) ) (which will result in a '1' which means TRUE (they are the same)) --------</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#if">if</a> and <a href="#break">break</a></td>
</tr>
</tbody>
</table>

##  T 
### tabulate

|                      |                                                                  |
|----------------------|------------------------------------------------------------------|
| **Function:**        | tabulate                                                         |
| **Syntax:**          | string tabulate(mixed \*arrlist...)                              |
| **Return value(s):** | string                                                           |
| **Description:**     | For a fixed-sized font, render the arrays in arrlist in a table. |

### TAG

|                      |                                                                         |
|----------------------|-------------------------------------------------------------------------|
| **Function:**        | TAG                                                                     |
| **Syntax:**          | string TAG(string str, string tag)                                      |
| **Return value(s):** | string                                                                  |
| **Description:**     | Use TAG() to colorize text using the client user's preset theme colors. |
| **See also:**        | [PRE](#PRE)                                                             |

### tan

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>tan</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float tan(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the tangent of the argument.<br />
<br />
Note:<br />
For values close to a multiple of PI/2, the result may be inaccurate.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: tan(0.0) <br />Merry result: 0.0 <br />Merry code: tan(0.5) <br />Merry result: 0.54630249 <br />Merry code: tan(1.5) <br />Merry result: 14.10142</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#cos">cos</a> and <a href="#sin">sin</a></td>
</tr>
</tbody>
</table>

### tanh

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>tanh</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>float tanh(float x)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">float</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the hyperbolic tangent of the argument.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: tanh(0.0) <br />Merry result: 0.0 <br />Merry code: tanh(0.5) <br />Merry result: 0.46211716 <br />Merry code: tanh(1.5) <br />Merry result: 0.90514825</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#cosh">cosh</a> and <a href="#sinh">sinh</a></td>
</tr>
</tbody>
</table>

### this\_object

|                      |                                                                          |
|----------------------|--------------------------------------------------------------------------|
| **Function:**        | this\_object                                                             |
| **Return value(s):** | object                                                                   |
| **Description:**     | The this\_object() function returns the internal object name for 'this'. |
| **Example(s):**      | Merry code: this\_object() <br />Merry result:                                 |
| **See also:**        | [previous\_object](#previous_object)                                     |

### time

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>time</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the current time as an integer. The time can be converted into a string with the kfun ctime().<br />
</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: time() <br />Merry result: 1049521697</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#ctime">ctime</a></td>
</tr>
</tbody>
</table>

### to\_hex

|                      |                                                                                      |
|----------------------|--------------------------------------------------------------------------------------|
| **Function:**        | to\_hex                                                                              |
| **Syntax:**          | string to\_hex(string bytes)                                                         |
| **Return value(s):** | string                                                                               |
| **Description:**     | Transform a sequence of characters (a string) into a sequence of hexadecimal values. |
| **Example(s):**      | Merry code: to\_hex( "Kalle" ) <br />Merry result: "4b616c6c65"                            |

### typeof

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>typeof</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>int typeof(mixed value)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">int</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">Return the type of a value. The return values are declared in the include file.<br />
</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top">typeof( nil ) == 0 /* T_NIL */ typeof( 123 ) == 1 /* T_INT */ typeof( 3.14 ) == 2 /* T_FLOAT */ typeof( "abc" ) == 3 /* T_STRING */ typeof( $actor ) == 4 /* T_OBJECT */ typeof( ({ "a", "b", "c" }) ) == 5 /* T_ARRAY */ typeof( ([ "foo" : "bar" ]) ) == 6 /* T_MAPPING */</td>
</tr>
</tbody>
</table>

##  U 
### UnSAM

<table data-border="0" data-cellpadding="5" data-cellspacing="0">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td data-valign="top"><strong>Function:</strong></td>
<td>UnSAM</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Syntax:</strong></td>
<td>string UnSAM(mixed SAM)</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Return value(s):</strong></td>
<td data-valign="top">string</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>Description:</strong></td>
<td data-valign="top">UnSAM() is used to convert a SAM-string into a regular string.<br />
Like the Bilbo $sam(), ParseXML() used with UnSAM() constitute Merry's portal to the XML/SAM engine. It's not going to be used as much as Bilbo's is, because SAM has few abilities that Merry does not have natively. To emulate $sam(foo), use UnSAM(ParseXML("foo")).<br />
<br />
The real use of UnSAM() is to handle binary SAM data stored in e.g. descriptions. If you have a room with a description containing oneof's, for example, and you want to create a text representation of this, you'd want to do something like,<br />
str = UnSAM(Get(this, "details:default:description:examine"));</td>
</tr>
<tr class="odd">
<td data-valign="top"><strong>Example(s):</strong></td>
<td data-valign="top"><br />Merry code: UnSAM( ParseXML( "{sam-style|one|of}" )) <br />Merry result: "sam-style" or: "one" or: "of" <br />Merry code: UnSAM( ParseXML( "" )) <br />Merry result: "StoryCoder Kalle" <br />Merry code: UnSAM( ParseXML( "You are , the {heroic|fantastic|extraordinary|hulkhoganish|awesome|illiterate|analphabetic|dyslectic} {thief|villain|joe|wizard|viking|lord|knight|master} {of|from} {Sweden|Norway|York|Denmark|London|Scandinavia}!" ) Example result: "You are StoryCoder Kalle, the fanatic lord from Scandinavia!"</td>
</tr>
<tr class="even">
<td data-valign="top"><strong>See also:</strong></td>
<td data-valign="top"><a href="#ParseXML">ParseXML</a></td>
</tr>
</tbody>
</table>

### upper\_case

|                      |                                                                                                            |
|----------------------|------------------------------------------------------------------------------------------------------------|
| **Function:**        | upper\_case                                                                                                |
| **Syntax:**          | string upper\_case(string str)                                                                             |
| **Return value(s):** | string                                                                                                     |
| **Description:**     | Capitalize (uppercase) every letter in str.                                                                |
| **Example(s):**      | "SkotOS" -&gt; "SKOTOS"                                                                                    |
| **See also:**        | [lower\_case](#lower_case), [capitalize](#capitalize), [decapitalize](#decapitalize) and [proper](#proper) |

### url\_absolute

|                      |                                                                                                                              |
|----------------------|------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | url\_absolute                                                                                                                |
| **Syntax:**          | string url\_absolute(string url)                                                                                             |
| **Return value(s):** | string                                                                                                                       |
| **Example(s):**      | Merry code: url\_absolute( "/page?somearg=somevalue" ) <br />Merry result: "http://marrach.skotos.net:8080/page?somearg=somevalue" |
| **See also:**        | [url\_decode](#url_decode), [url\_encode](#url_encode) and [make\_url](#make_url)                                            |

### url\_decode

|                      |                                                                                                                                                   |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | url\_decode                                                                                                                                       |
| **Syntax:**          | string url\_decode(string str)                                                                                                                    |
| **Return value(s):** | string                                                                                                                                            |
| **Example(s):**      | Merry code: url\_decode( "Hi,+I'm+Kalle+%26+this+is+an+evil+smiley%3A+%3E%3A-)" ) <br />Merry result: "Hi, I'm Kalle & this is an evil smiley: &gt;:-)" |
| **See also:**        | [url\_encode](#url_encode), [make\_url](#make_url) and [url\_absolute](#url_absolute)                                                             |

### url\_encode

|                      |                                                                                                                                                   |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**        | url\_encode                                                                                                                                       |
| **Syntax:**          | string url\_encode(string str)                                                                                                                    |
| **Return value(s):** | string                                                                                                                                            |
| **Example(s):**      | Merry code: url\_encode( "Hi, I'm Kalle & this is an evil smiley: &gt;:-)" ) <br />Merry result: "Hi,+I'm+Kalle+%26+this+is+an+evil+smiley%3A+%3E%3A-)" |
| **See also:**        | [url\_decode](#url_decode), [make\_url](#make_url) and [url\_absolute](#url_absolute)                                                             |

##  W 
### while

|                  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Function:**    | while                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| **Syntax:**      | while()                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| **Description:** | While-loops are used when a block of code needs to be repeated until certain condition requirements are met.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| **Example(s):**  | Example \#1: ----------- int i; i = 0; while( i &lt; 10 ){ i ++; EmitTo( $actor, Str(i)+" is less than 10." ); } EmitTo( $actor, Str(i)+" is NOT less than 10, so the while-loop has ended." ); ---------- Result: ------- 0 is less than 10. 1 is less than 10. 2 is less than 10. 3 is less than 10. 4 is less than 10. 5 is less than 10. 6 is less than 10. 7 is less than 10. 8 is less than 10. 9 is less than 10. 10 is NOT less than 10, so the while-loop has ended. ------- Example \#2: ----------- int i = 0; while( TRUE ){ i++; } /\* Warning: this script will loop eternally, or rather -- until an "Out of ticks" error occurs. It is not recommended to test it. \*/ ---------- |
| **See also:**    | [for](#for) and [do](#do)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |

-- Main.KalleAlm - 1 Feb 2005
