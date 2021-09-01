# PropertyContainer

A PropertyContainer is an object containing a number of properties with values. Due to its stripped-down nature, this is the ideal object to use for storing information in non-physical objects. This includes merry scripts.

## Setup

A new PropertyContainer can be created using the +cobj command.

`+cobj propcontainer "Roo:MyPropContainer"`

## Inheritance

Propcontainers can inherit other propcontainers. This is particularly useful if you have a large system with many scripts that you want to keep organized. For example:

CombatLib is a propcontainer with the script merry:lib:fight.
NPCLib is a propcontainer with scripts specific to NPC behavior. NPCLib has the UrParent CombatLib.
The merry:lib:fight script can be triggered with either `Call(${NPCLib}, "fight");` or `Call(${CombatLib}, "fight");`.

## Limitations

Since a PropertyContainer is a non-physical object, it cannot be spawned.

Also, if you want to programmatically change the woe name of the PropertyContainer, you must use the syntax `$propcontainer."core:objectname" = "NewWoeName"` as opposed to `$propcontainer."base:objectname"`.