---
sort: 4
---

# Standard Objects (Things)

A standard object, or **thing**, can be thought of as a physical object that exists in the world. They are children of the DGD "Thing" object. Examples include books, clothing, rooms, etc. These objects are complex in that they have physical descriptions, details, and other settings (such as weight and volume) that define how they exist in the world.

## Things and UrThings

There is a standard SkotOS "in-game object" type called /base/obj/thing. It does a lot. And one of its most interesting properties is data inheritance, or the "Ur-Thing" system.

### What is "Ur"?

WOE Objects have the possibility of inheriting from an "Ur" object. Wikipedia says of the word "UR": *Ur-, a German prefix meaning "primeval" (seldom also "primitive") or even simply "original"; in a relative majority of cases it takes on the sense of "most ancient" (referring to sth. as a 'source' - the initial root, the starting point - of a development); Compare with Old English: or-deal, or-lay, or-iginal; in modern English often replaced by 'proto-'; Sometimes in combinations of two or more of these meanings.*

An "Ur" object is like a parent object. It is especially similar to a JavaScript parent object since JS uses [prototypal inheritance](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain), very similar to what SkotOS uses.

Basically, you can have a beer, which can be an instance of the "Ur-beer," the parent object. The Ur-beer isn't usually sitting around in the world. That's good, because if you drank it then it would empty all the other beers in the world! They inherit their "full" state from the Ur-beer. An object you see in the world can often be an *instance* of a parent object, and any object can inherit its properties (data) from an Ur-object.

### Rooms and One-Off Objects

Nearly all SkotOS objects have an Ur-object. You can see what an object's Ur-Object is in the Tree of WOE, if that object has a [WOE name](../Tree_of_Woe/woe_workflow.md). An Ur-object basically always has a WOE name (Ed note: I don't see any reason you ***can't*** have a WOE-name-less Ur-object, but that's not how it's generally done.)

Many SkotOS objects only exist in one place. A room is usually the only instance of that room &mdash; you have the Vestibule as the start room of The Gables, and there aren't a lot of Vestibules. There's normally only one in all of The Gables.

Many objects are similar. There's one. It's a WOE object. It has an Ur-object. It has no spawns.

### Spawns

A "spawn" is an instance of an object in the world that basically ***only*** has an Ur-object. The spawn doesn't override the data of the parent. It doesn't register a WOE name for itself. The vaulttool won't dump it. You can't see it in the Tree of WOE and if you move it around and drop it somewhere else, those changes won't persist after a cold-boot.

A spawn only has an Ur-object, so it's basically exactly the same as its Ur-object except for its location (and maybe a few other properties you wouldn't want to inherit.)

## Derived Properties

A **Thing** is comprised of the following **derived properties**. For a more detailed look, check out [Derived Properties](./DerivedProperties.md).

#### Base:Transient
This includes an object's environment (base:environment) and inventory (base:inventory). These properties do not get set directly in WOE but can be modified with code and by naturally interacting with the environment (chatter moves rooms or items are placed into container object). This information is useful to view in WOE to see where an object resides in the game world or to see the contents of a container object.

#### Ur:UrObject
The Ur or ***parent*** object.

#### Base:Bulk 
These settings determine an object's mass, density, and volume. 

See also: [Mass Values](./MassValues.md) and [Density Values](./DensityValues.md).

#### Base:Container
These settings detrmine whether or not an object is also a container and if it is, how much it can hold. 

See also: [Container Values](./ContainerValues.md)

#### Base:Misc
Miscellaneous properties such as gender and food-related properties. 

See also [Misc Values](./MiscValues.md).

#### Base:Details
Details of an object (ie. pages, cover, spine of a book) including their descriptions. It is possible to use this section of WOE to add/modify details but it can be painstaking. KarMode is the recommended method for adding/modifying descriptions.

See also: [The Description System](../In-Game_Systems/DescriptionSystem.md), [The Detail System](../In-Game_Systems/DetailSystem.md), and [KarMode](../SkotOS_Languages/SAM_Language/KarMode.md).

#### Base:Combat
Obsolete. Do not use.

#### Base:Clothing
These values determine if an object is clothing and what body parts the clothing will cover when worn. 

See also: [Clothing](./Clothing.md).

#### Base:Crafting
Obsolete. Do not use.

#### Base:InitialContents
When an object is spawned, the objects listed under initial contents will be spawned into the inventory of the object. 

See also: [Initial Contents](./InitialContents.md).

#### Base:InitialProperties
Initial properties are properties that get set when an object is spawned. 

See also: [Initial Properties](./InitialProperties.md).

#### Core:Properties
Miscellaneous data can be stored via core property. 

See also: [Properties and Values](./PropertiesAndValues.md).

#### Notes:Notes
Each object has a notes section that allows staff to share notes about the object.


## Examples and Tutorials

* [Building a Simple Object](../Tutorials_and_Examples/Building_Objects/BuildASimpleObjectTutorial.md)
* [Building a Container](../Tutorials_and_Examples/Building_Objects/BuildAContainerTutorial.md)
* [Building a Room](../Tutorials_and_Examples/Building_Objects/BuildAContainerTutorial.md)
* [Building with Ur Objects](../Tutorials_and_Examples/Building_Objects/BuildingWithUrsTutorial.md)
* [Building Food](../Tutorials_and_Examples/Building_Objects/BuildFoodTutorial.md)
* [Building Drinks](../Tutorials_and_Examples/Building_Objects/BuildDrinksTutorial.md)