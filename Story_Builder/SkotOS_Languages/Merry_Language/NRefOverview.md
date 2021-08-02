# NRef Overview

Simply put, NRefs are references to a specific object’s detail. They are their own data type so when defining a NRef variable in Merry, you would use the **NRef** keyword. The **NewNRef()** Merry function can then be used to create a reference to your desired object/detail.

### Define a new NRef

**Syntax: NRef = NewNRef( object ob, "detail” );**

```
NRef nose;

nose = NewNRef(${Chatters:Gables:bo:bob}, “nose”);

EmitTo($actor, "Don't poke " + Describe( nose ) + “.”);
```

Most of the time, the NRef is passed to your code via external source, such as if you are writing a merry:react script or merry:global:command script for a verb. In this case, you will most likely need to extract object or detail information.

It important to note that the Set() and Get() Merry functions require an object to be passed. The compiler will not complain if you pass a NRef to these functions, however, it will not work. You must first extract the object reference from the NRef and pass that to the functions. If you are wondering why an object property is not being set or why you getting a return value of nil, double check the parameters.

### Extract the object from an NRef

**Syntax: object = NRefOb( NRef );**

The NRefOb() function is highly useful when manipulating the objects of NRef's.

```
Example react script react:poke-dob in any object.

$object = NRefOb( $target );
$possessive = $object."trait:possessive";
EmitTo( $actor, Describe( $object ) + " pokes you with " + $possessive + " might!" ); /* emits a message to $actor, e.g. "John pokes you with his might!", "Eve pokes you with her might!" or "A cat pokes you with it's might!", etc. */ 
```

### Extract the string name of an NRef's detail

**Syntax: string = NRefDetail( NRef );**

```
Example react script react:poke-dob in any object.

$detail = NRefDetail( $target ); /* figure out what detail in $target that was poked */
if( $detail == "nose" ) EmitTo( $actor, "Don't poke my nose!" );
if( $detail == "ear" ) EmitTo( $actor, "Why are you poking my ear?" );
if( $detail == "belly" ) EmitTo( $actor, "*giggle*" );
```

See the Merry MHelp page (or in-game +mhelp command) for more information about how to use Describe to alter the output of the object/NRef you are using.

