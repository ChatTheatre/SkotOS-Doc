# WOE for Developers

So if there are WOE objects and the Tree of WOE, what's WOE?

## A WOE Object is an Object with a WOE Name

DGD comes with its own built-in object naming system. SkotOS builds a second one on top of it. The second, SkotOS-specific naming scheme is WOE.

DGD names look roughly like "/base/obj/thing#3714" or "/usr/System/sys/devuserd". WOE names look like this: "Shared:drinks:CafeAmericano".

Every DGD object in a DGD server has a unique DGD name. Most objects, but not all, also have a WOE name. The WOE name can be assigned immediately or not. It can change or not.

The IDD (ID Daemon) keeps track of all the names and what objects have them registered.

(There's a little bit of oddity in what counts as a "DGD object" with a DGD name. For instance, lightweight objects, arrays and mappings do *not* get their own DGD names. Objects like that can't have WOE names either. To have a WOE name, an object has to be a full-fledged DGD object with a DGD name.)

## Things and Things

The most common kind of WOE object is an instance of /base/obj/thing. That's essentially all in-game objects, including rooms, bodies, clothing, food and drinks and so on.

Importantly, a detail is ***not*** one of these. A detail is part of a different, larger object. You can wrap a detail in a full object using an NRef.

A less-common kind of WOE object is a DGD object that needs to make itself usable by MERRY, SAM, etc. For instance, the DGD object /usr/System/sys/devuserd uses the WOE name System:Developers. Those are both the same object.

Sometimes DGD objects export a WOE name so that MERRY or SAM objects can use them. Sometimes they export a WOE name so that they can load and save themselves using XML.

## XML Files

Every WOE object can be saved as XML. Most of them can also be modified or loaded using the same interface. The most common kind are, again, /base/obj/thing instances, which give the XML files for in-game objects like rooms.

Not only can whole objects be serialised as XML, in many cases ***parts*** of objects can be. In the Tree of WOE if you hit "X" for a row of an object below the very top, you'll see ***just that part*** of the object serialised, and you can edit it.

DGD objects that export themselves as WOE often have callbacks for loading data from XML. For instance, here's XML for SID:LookAndFeel:Property, a clone of /usr/SID/obj/sidnode:

~~~
<object clone="/usr/SID/obj/sidnode" owner="SID">
  <SID:Element type="xml_pcdata" ns="LookAndFeel" tag="Property" recpoint="false" transient="false" query="query_lf_property(prop)">
    <SID:Children/>
    <SID:Attributes>
      <SID:Attribute id="prop" atype="lpc_str" areadonly="false"/>
    </SID:Attributes>
    <SID:Iterator var="prop" call="query_lf_properties"/>
    <SID:Callbacks>
      <SID:Callback call="set_lf_property(prop, CONTENT)"/>
    </SID:Callbacks>
  </SID:Element>
</object>
~~~

Notice the query on SID:Element, telling it that query_lf_property() is how to get this property list. There's also a SID:Iterator for query_lf_properties(), and a callback to set a property. These are DGD functions, exported via XML.

## Is This All Just WOE?

One problem with large software systems: they have a lot of components, and those components work together. There are several that interact here.

WOE is not the name of a software library. It is, very roughly, the name of the naming scheme. IDD is the specific component that does the mapping.

SID actually maps properties to objects. So when you use XML (yet another component), SID is how XML translates XML fields into on-object properties.
