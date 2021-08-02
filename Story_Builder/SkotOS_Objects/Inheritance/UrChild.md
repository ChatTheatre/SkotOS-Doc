---
sort: 3
---

%META:TOPICINFO{author=\"ChristopherAllen\" date=\"1050395220\"
format=\"1.0\" version=\"1.2\"}% %META:TOPICPARENT{name=\"UrParent\"}%

# Ur Child

An UrChild is an object that was +spawn\'ed from a parent object. These
children will have all the attributes of the UrParent, but do not
inherit any of its properties (except for DerivedProperties and
ExportProperties)

The UrChild when +spawn\'ed will have no contents and properties,
however, any properties set in the UrParent\'s InitialProperties and
items defined in the UrParent\'s InitialContents will be set in the
UrChild.

If the UrParent itself has an UrParent, the highest UrParent\'s
InitialProperties will be put into the UrChild first, and then each
lower UrParent \-- if there are duplicate InitialProperties, they are
overwritten.

(See also UrRooms)

\-- Main.ChristopherAllen - 15 Apr 2003
