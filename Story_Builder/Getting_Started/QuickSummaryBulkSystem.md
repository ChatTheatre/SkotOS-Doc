---
sort: 4
---

## [Quick Summary of the Bulk System](QuickSummaryBulkSystem)

Every physical object in game has 4 basic attributes that must be set by the Admins.StoryBuilder. These bulk attributes are available to the Admins.StoryBuilder through the Tree of Woe, as well as by viewing and setting of derived properties.

* **Mass** -- the mass, in kilograms, of the object. A brick is 2kg, an average human 55kg, 
* **Density** -- the average specific gravity of the object. Pine wood is 0.5, water is 1.0, an average human is also 1.0, and a brick is 1.9. 
* **Capacity** -- the volume, in cubic meters (m^3) that the object may carry. A brick has a capacity of 0, a two-liter bottle of soda is 0.002, a steamer trunk 0.2, a small closet 1.0, a 10'x10'x10' room 28.3. Capacity is also used by the LightSystem for illumination of large rooms. 
* **MaxWeight** -- the maximum mass that an object may carry. A brick has a max weight of 0, a two-liter bottle of soda is 8 kg, a steamer trunk is 200 kg, a small closet 1000 kg, and a 10'x10x10' room 28,300 kg.

These attributes are used to calculate the values for a number of derived attributes, such as **Actual Volume** and **Minimum Volume**. The values of various of these attributes are tested against for moving objects from place to place.

In addition to these attributes, there are a number of special purpose attributes that define specific functionality, in particular for containers. These are: 

* **Immobile** -- Is the object fixed in place in spite of weight? 
* **Flexible** -- Is the container flexible? Flexible means that the container crunches up, like a bag, rather then is rigid like a box. 
* **Transparent-Container** -- Set this if you want to be able to see the contents of this container even when it is closed. 
* **Public-Container** -- Set this if you want other people than the holder to be able to see the contents of this container. 
* **Tight** -- Is the container tight enough to hold water? 
* **Verb2 & Verb3** -- How is the object holding its contents? Does it 'contain' it, 'carry' it, etc.

Bulk attributes have some special characteristics when used between ur-parents and ur-children that require special consideration.
