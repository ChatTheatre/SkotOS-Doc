---
sort: 2
---

%META:TOPICINFO{author=\"ChristopherAllen\" date=\"1050395280\"
format=\"1.0\" version=\"1.2\"}% %META:TOPICPARENT{name=\"UrInside\"}%

# UrParent

An UrParent is an object that has children objects +spawn\'ed from it.
These children will have all the details and attributes of the parent,
but do not inherit any of its properties (other then DerivedProperties
and ExportProperties.)

The UrParent can contain InitialProperties and InitialContents
attributes \-- when a child is +spawn\'ed, those properties and contents
will be added to the new UrChild object.

If the UrParent itself has an UrParent, the highest UrParent\'s
InitialProperties will be put into the UrChild first, and then each
lower UrParent \-- if there are duplicate InitialProperties, they are
overwritten.

(see also UrRooms)

\-- Main.ChristopherAllen - 15 Apr 2003
