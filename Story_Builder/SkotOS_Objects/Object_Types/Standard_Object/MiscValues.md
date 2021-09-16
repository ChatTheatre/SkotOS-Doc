---
sort: 5
---

## [Misc Values](MiscValues)

### Base:Misc

#### gender

**What sex, if any?** Default options are male, female, and neuter. New genders can be added to the list of accepted genders by updating **TextIF:Gender**. To have these reflect on the drop down menu, you will also need to update **DTD:DTD**.

#### volition 

**Does this object require consent to interact with?** This option is usually selected for living things like Chatters and NPCs. 

See also: [Consent System](../In-Game_Systems/ConsentSystem.md).

#### weapon

**Does this object perform as a weapon on this server?** Selecting this option makes the object wieldable/unwieldable (wield knife/unwield knife) so players will see "Sally is wielding a butter knife" as opposed to "Sally is holding a butter knife" when looking at her. Further combat mechanics are handled by the combat system you select. It is worth noting that only one object can be wielded at a time.

#### default_stance

**When dropped, what stance should it use?** Options are none, crouching, floating, hanging, kneeling, lying, sitting, standing. When *none* is selected, stance defaults to *lying*. This list of stances currently cannot be modified.

#### combinable

**Is this object combinable with like items?** This option must be selected for the *by_weight* option to work properly.

#### discrete

**If it is combinable, is it discrete like coins?** Obsolete. Multiple like objects are automatically grouped by the parser whether or not *combinable* or *discrete* is selected.

#### by_weight

**If it is combinable, is it by weight like water or flour?** When this option is selected, the output displays the weight of the objects rather than just the quantity (i.e. an ounce of flour vs. a handfuls of flour). The weight is calculated based on bulk settings so it is important to be as accurate as possible. Also, these types of objects cannot simply be taken or placed just anywhere but must be placed in a container with the *tight* flag (see below). This functionality has been known to be buggy and not always show sensible outputs so use with caution. 

See also: [Mass Values](./MassValues.md) and [Density Values](./DensityValues.md).

#### tight

**Is the container tight enough to hold water?** Objects with the *by_weight* flag set can only be placed or picked up by objects with the *tight* flag.

#### scriptrunner

**Does this object have any uato scripts in it?** Scriptrunner objects add more load to the server by constantly "watching" for activity. It only makes sense to select this option for objects that will have *witness* scripts.

See also: [Merry Witness Script Tutorial](../Tutorials_and_Examples/Merry/WitnessScriptTutorial.md).

#### integration

**What property, if any, determines what room this object is an integral part of?**

See also: [Integration Tutorial](../Tutorials_and_Examples/Building_Objects/IntegrationTutorial.md).

### Base:Edible

**Is this object edible?** Use this flag to turn an object into food. The amount of bites an object has depends on the bulk settings. A single bite ('eat' command) will consume about 150 grams while the 'gobble' command will consume the entire amount. The below tutorial shows how scents and tastes can be added for extra flavor.

See also: [Building Food](../Tutorials_and_Examples/Building_Objects/BuildFoodTutorial.md)

### Base:Potable

**Is this object drinkable?** Use this flag to turn an object into a drink. The amount of drinks an object has depends on the bulk settings. A single drink ('drink' command) will consume the entire amount (known bug). The below tutorial shows how scents and tastes can be added for extra flavor.

See also: [Building Drinks](../Tutorials_and_Examples/Building_Objects/BuildDrinksTutorial.md)

### Base:DrinkMessageFirst

Obsolete.

### Base:DrinkMessageThird

Obsolete.

### Base:Transparency

**For clothing and other worn items, does it reveal items under it on the same location? I.E. rings, belts, etc.** All clothing has a list of body parts that they cover. If you wear two garments that cover the exact same body parts, the first garment will not be visible unless the second garment has the *transparency* flag set. 

See also: [Clothing](./Clothing.md).

### Base:Unsafe

**Is this a place that characters may not return to when they log in? If yes, they get sent to the character's home room.** 

See also: [Building a Room](../Tutorials_and_Examples/Building_Objects/BuildAContainerTutorial.md)

### Base:Safe

**Is this a place that you must return to when logging in? Used for home rooms and jail cells.** 

See also: [Building a Room](../Tutorials_and_Examples/Building_Objects/BuildAContainerTutorial.md)

### Base:ClothesExpected

**Is this object to be described as nude if it is not wearing any clothing?** 

See also: [Clothing](./Clothing.md).

### Base:DieMessageFirst

This can be used to add an emit that will show to the actor when an object is slain, either with the +slay command or some other means. For example, this can be used to add a taste to taste to food and drinks when consumed.

### Base:DieMessageThird

This can be used to add an emit that will show to the entire room, actor included. For example, when a monster is slain, this can be used to display a creative death emote.

