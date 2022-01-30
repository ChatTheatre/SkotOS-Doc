# State Interface Definition (SID)

### What is a SID?

A SID is an object that supplies some structural and datatype information for a specific class. It also determines what functions may be called in an object to acquire its state. Most object classes utilize multiple SIDs. The SIDs also determine how an object is displayed in Tree of Woe.

### Dissecting a SID 

Let's take a look at a few examples. The following SIDs define the structure of a UDat object.

```
**SID:UserAPI:UDat**

SID:Element   [   ns='UserAPI'   tag='UDat'   ] V E X
    SID:Children V E X
        SID:Child   [   node='SID:Core:Properties'   ] V E X
        SID:Child   [   node='SID:UserAPI:Bodies'   ] V E X
    SID:Attributes V E X
    SID:Iterator   [   ] V E X
    SID:Callbacks V E X
```

This is the root of the UDat structure and contains the following data: 
   * ns = The element's namespace. The data within this node will have the prefix *UserAPI*.
   * tag = The name of the element.

It inherits two child nodes: *SID:Core:Properties* and *SID:UserAPI:Bodies*.

```
*SID:Core:Properties*

SID:Element   [   ns='Core'   tag='Properties'   recpoint='true'   newitem='set_property(#New Property Name, #New Property Value, #1)'   ] V E X
    SID:Children V E X
        SID:Child   [   node='SID:Core:Property'   ] V E X
    SID:Attributes V E X
    SID:Iterator   [   ] V E X
    SID:Callbacks V E X
        SID:Callback   [   call='clear_all_properties'   ] V E X
```

```
*SID:Core:Property*

SID:Element   [   type='lpc_mixed'   ns='Core'   tag='Property'   query='query_property(property)'   delitem='clear_property(property)'   ] V E X
    SID:Children V E X
    SID:Attributes V E X
        SID:Attribute   [   id='property'   atype='lpc_str'   ] V E X
    SID:Iterator   [   var='property'   call='query_property_indices(#0)'   ] V E X
    SID:Callbacks V E X
        SID:Callback   [   call='set_property(property, CONTENT)'   ] V E X
```

SID:Core:Properties will allow UDat objects to have **Core:Properties** (defined by *ns* and *tag*) in the data structure. It's child object is *SID:Core:Property* which defines how each individual Core:Property is handled.

SID:Core:Properties 
    * Element data:
        * ns = "Core" namespace
        * tag = "Properties" element name
        * recpoint = This will either be true or false. In a case such as this, where a child element can have multiple iterations of itself, this needs to be set to true.
        * newitem = The function that is called when an iteration of this element is created or modified.
    * Callbacks
        * call = Callbacks are class functions that can be accessed at the Merry level using the *Call* Merry function.
        
SID:Core:Property
    * Element data:
        * type = The element's type. "lpc_mixed" is similar to a mixed variable in Merry which means they can accept any data type.
        * ns = "Core" namespace.
        * tag = "Property" element name.
        * query = The function that is used to return the information within the element. It take "property" as an argument which is defined in SID:Attribute.
        * delitem = The function that is called when this element is deleted in an object. It take "property" as an argument which is defined in SID:Attribute.
    * Attributes data:
        * There can be more than one attribute. Each attribute has the following data:
            * id = This data's label.
            * atype = The data type of the label. In this case, it must be a "lpc_str" which is just a String data type.
    * Iterator data:
        * As mentioned before, the Core:Property element can have more than one iteration. SID:Iterator assists with the parsing of the data in Tree of Woe by iterating through every Core:Property.
            * var = The temp variable name. The current iteration is stored there.
            * call = The function that is called with each iteration. The temp variable is available to this function.
    * Callbacks
        * call = Gives access to the set_property class function.

```
**SID:UserAPI:Bodies**

SID:Element   [   ns='UserAPI'   tag='Bodies'   recpoint='true'   ] V E X
    SID:Children V E X
        SID:Child   [   node='SID:UserAPI:Body'   ] V E X
    SID:Attributes V E X
    SID:Iterator   [   ] V E X
    SID:Callbacks V E X
```

```
**SID:UserAPI:Body**

SID:Element   [   ns='UserAPI'   tag='Body'   ] V E X
    SID:Children V E X
    SID:Attributes V E X
        SID:Attribute   [   id='char'   atype='lpc_str'   ] V E X
        SID:Attribute   [   id='body'   atype='lpc_obj'   aquery='query_body(char)'   ] V E X
    SID:Iterator   [   var='char'   call='query_chars'   ] V E X
    SID:Callbacks V E X
        SID:Callback   [   call='add_body(body, char)'   ] V E X
```

Similar to Core:Properties and Core:Property SIDs, **SID:UserAPI:Bodies** and **SID:UserAPI:Body** help list all the bodies on an account when viewing the UDat in Tree of Woe.

Now let's look at a UDat object:

```
**UserAPI:UDats:a:admin**

UserAPI:UDat V E X
    Core:Properties [ #26 ] V E X N
    UserAPI:Bodies [ #1 ] V E X
```

From here, we can verify that UserAPI:UDat is the root element and Core:Properties and UserAPI:Bodies are its children. Clicking V next to each child will then show the data for that child, including the child's child.

```
Core:Properties V E X N
Core:Property   [   property='array:assists'   ] V E X D
({ 319, 325, 326, 327, 328, 329, 330, 331, 385, 386, 387, 388, 389, 391, 392, 393, 394 })
Core:Property   [   property='conn:check'   ] V E X D
0
Core:Property   [   property='more'   ] V E X D
18
Core:Property   [   property='see:listeners'   ] V E X D
([ ])
```

```
UserAPI:Bodies V E X
UserAPI:Body   [   char='admin:gables'   body='Chatters:Gables:ad:admin'   ] V E X
```

### SID Structure Overview

**SID:Element**
    * type = The data type of the object. Examples: XML_PCDATA, LPC_STR, LPC_OBJ
    * ns = The element's namespace.
    * tag = The element's name.
    * recpont = true or false. Can this element have multipe iterations of itself?
    * transient = true or false. Transient data is not saved when saving an object's state.
    * query = The function that is used to return the information within the element.
    * newitem = The function that is called when an iteration of this element is created or modified.
    * delitem = The function that is called when an iteration of this element is deleted.
    * comment = A short description of the element that is visible in the Tree of Woe.

**SID:Children**
    * SID:Child
        * node = The woename of the SID child node.
    * *There can be more than one child node.*
    
**SID:Attributes**
    * SID:Attribute
        * id = The attribute's label.
        * atype = The attribute label's data type.
        * acomment = A short description of the attribute that is visible in the Tree of Woe.
        * areadonly = true or false. Can this attribute be modified?
        * aquery = The function that is used to return the information within this attribute.
    * *There can be more than one attribute.*

**SID:Iterator**
    * var = The temp variable name. The current iteration is stored there.
    * call = The function that is called with each iteration. The temp variable is available to this function.
    
* Callbacks
    * call = A function that can be called in this object.
    * *There can be more than one callback.*
