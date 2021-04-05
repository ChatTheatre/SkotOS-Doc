# Setting up Objects for +Traits & @Traits Commands

The `+traits` staff command is used to edit the traits properties of an object to any value using a web interface. Which is particular useful for StoryBuilders when testing new Shared objects, or StoryPlotters to make unique spawn for a user request or as a plot item in a game.

The `@traits` OOC user command, if enabled on a particular ChatTheatre, will allow regular users to also edit the traits of an item, but they are restricted to more limited lists of specific values for each trait.

## Overview of +Traits

Though properties named `traits:*` are used for many purposes, the most common use is for custom adjectives used in descriptions of details.

* `export:traits:adj-map` - watched adjective traits and what detail they appy to. REQUIRED FOR +TRAITS.
 * `export:traits:sname-map`- watched noun traits and what detail they apply to
* `export:traits:adj-map-restricted` - subset the traits for OOC user editing with @traits
* `export:traits:sname-map-restricted`- subset of noun traits for OOC user editing with @traits.
* `export:traits:adj-map:options` - list of allowed values for adjective traits for OOC user editing with @traits. REQUIRED FOR @TRAITS


## Key Scripts & Objects for +Traits

???

* `objectname` - purpose

## Converting an Object for +Traits

If you are not cloning an existing [[SharedSystem]] object, you'll need to convert it (otherwise, just skip to next section).

The first step to converting is to use the `+sharify <woename>` command. If you get an error, run it twice.

Next you may need to use the Tree of Woe to change the parent of the object to point to a more appropriate [[SharedSystem]] UR:objects that leads to one of the grandparent UR:objects that have the [[SharedSystem]] Merry Scripts in them.

Good candidates are:
  * `Shared:Local:clothing:UrClothing`

## Modifying an Object for +Traits

You'll need to decide which object in your UR parent heirarchy you want your to have your traits properties in. For instance, for most kinds of pants it is in `Shared:clothing:ageless:leggings:pants-nopockets` as that is the "least unique" pair of pants.

Then you'll need to set 



## Special Properties

### `export:traits:adj-map` - List of +staff editible adjective traits

This is the core:property with a mapping list of adjective traits that are editible by staff using the `+traits <local spawned object>` command.

These traits are watched, and if are changed (leveraging the `setprop-post` signal), the adjectives are added or removed from the object.

This property is REQUIRED for the Traits System to function, in particular the `+traits` staff command.

By convention, all [[SharedSystem]] [[ClothingSystem]] objects should have at minimum `trait:color` and `trait:material` properties for the prime "default" detail:

`([ "color":({ "default" }), "material":({ "default" }) ])`

An example from a more complex clothing object:`Shared:clothing:ageless:leggings:pants-nopockets`:

`([ "color":({ "default" }), "condition":({ "default" }), "detail:fly:type":({ "fly" }), "fit":({ "default" }), "material":({ "default" }), "pattern":({ "default" }), "style":({ "default" }) ])`

Note in the above example that with `trait:detail:fly:type` when property value changes, the adjective for the the detail "fly", is changed, not the advjective in the default detail.

### `export:traits:sname-map` - List of +staff editable name variant traits

This is a core:property with the mapping list of nount (sname/pname???) traits that are editible by staff using the `+traits <local spawned object>` command.

These traits are watched, and if are changed (leveraging the `setprop-post` signal), rather than adjectives being changed, the appropriate nouns (snames/pnames???) are added or removed from the object.

This is particularly useful in situations where there are disjoint synonyms: all jeans are pants, but not all pants are jeans.

The original noun (sname/pname???) defined in the object will always function, so a `trait:variant` value of `jeans` will still always have the parent's noun of `pants` if it was defined there. (??? What if there is no sname in the prime detail?) 

If you want variants to be editable in `+traits` you need:

`([ "variant":({ "default" }) ])`

We use the property name `trait:variant` by convention in [[SharedSystem]] [[ClothingSystem]] objects, but these nount (sname/pname???) traits can have a different property name, there can be multiple of them, and they can refer to other details than the default detail.

### `export:traits:adj-map:restricted` - List values available to OOC user editible adjective traits

If this property doesn't exist, all the adjective traits listed in `export:traits:adj-map` are available to the `@traits` OOC user command.

However, in many case it can be useful to give Users a smaller list of adjective traits to edit with `@traits` OOC user command, than what is available to the `+traits` staff command.

An example from a relatively simple object: `Shared:clothing:ageless:accessories:belt-simple` does not allow editing of the `trait:craft` and `trait:design` properties.

`([ "color":({ "default" }), "condition":({ "default" }), "material":({ "default" }), "style":({ "default" }) ])`

### `export:traits:sname-map:restricted` - List values available to User OOC editible noun traits

If this property doesn't exist, all the noun traits listed in `export:traits:noun-map` are available to the User OOC `@traits` command.

However, you may wish to not allow users to edit all the noun traits. 

You can completely turn them off with

`([ "" ])`

Of if there are multiple noun traits, delete one or more of them.


### `export:traits:adj-map:options` - List of User OOC editable adjective options 

With the `@traits` OOC user command, a limited list of adjective choices for each trait is available rather than the open choices given to`+traits` staff command.

This property is REQUIRED for the `@traits` OOC user command to function, but is not required for the `+traits` staff command.

Most Shared objects have a master list for `export:traits:adj-map:options`, for instance, for clothing it is in `Shared:Local:clothing:UrClothing`. However, it can be overridden in any child for more limited options.

Note that all the adjective choices except for `trait:color` & `trait:cloth` have "" aka 'nil' entries in them. This allows for that adjective choice to be optional.

For another example of use of "" nil values, note inside of `Shared:Local:clothing:UrClothing` you'll see that a nil fly type is possible: 
`"detail:fly:type":({ "", "button", "zipper" }),`
This is used by the SAM tags in the prime examine and detail:fly of pants so that the look and examine descriptions to say "There is no fly."

Another example of fewer adjective choices for use in the `@traits` OOC user command is in a relatively simple belt object `Shared:clothing:ageless:accessories:belt-simple`. This list is different and overrides `Shared:Local:clothing:UrClothing` as belt's are not made of cloth:

`([ "color":({ "black", "blue", "brown", "gray", "grey", "green", "khaki", "maroon", "navy", "purple", "red", "tan", "white", "yellow" }), "condition":({ "", "battered", "clean", "dirty", "filthy", "frayed", "grubby", "new", "old", "pristine", "ragged", "ripped", "soiled", "starched", "tattered", "torn", "worn" }), "fit":({ "", "loose", "snug", "tight" }), "material":({ "cotton", "leather", "silk", "terry-cloth" }), "style":({ "", "dress", "plain", "thick", "thin" }) ])`

Note that there isn't a `export:traits:adj-map:options:restricted` property, however, if there are property values in this mapping that are not listed in `export:traits:adj-map` or `export:traits:adj-map:restricted`, they will not be seen by user in the `@traits` OOC user command.

### `export:traits:sname-map:options` - List of User OOC editable adjective options 

Similarly to adjective options, you may a limited list of noun choices for each trait is available rather than the open choices given to`+traits` staff command.

An example from a more complex clothing object: `Shared:clothing:ageless:leggings:pants-nopockets` we allow four variants, but do not allow long-johns, knickers, etc. that could be added with the `+traits` staff command:

`([ "variant":({ "jeans", "pants", "slacks", "trousers" }) ])`

By convention, we always add the prime detail noun in the variant list, however, note that can also offer an option "" aka 'nil' entry for detail noun, which allows for that noun choice to be optional. 


## Master UrClothing 

For reference, these are the default details available to the `@traits` OOC user command found in `export:traits:adj-map:options` inside `Shared:Local:clothing:UrClothing`

Currently supported are: 

* `$(trait:cloth)`
* `$(trait:condition)`
* `$(trait:crafted)`
* `$(trait:design)`
* `$(trait:detail:collar:type)`
* `$(trait:detail:long-sleeves:type)`
* `$(trait:detail:short-sleeves:type)`
* `$(trait:fit)`
* `$(trait:style)`

Note in particular that `$(trait:design)` and `$(trait:design` are available in the `+trait` staff commands but largely restricted from the `@traits` OOC user command.

```
([

"cloth":({ "broadcloth", "chevoir", "corduroy", "cotton", "denim", "duck", "flannel", "leather", "moleskin", "nylon", "rayon", "rubber", "serge", "silk", "tweed", "twill", "whipcord", "wool", "worsted" }),

"color":({ "black", "blue", "brown", "dove", "gray", "grey", "green", "hyacynth", "khaki", "maroon", "navy", "purple", "red", "tan", "white", "yellow" }),

"condition":({ "", "battered", "clean", "dirty", "filthy", "frayed", "grubby", "neatly-pressed", "moth-eaten", "new", "old", "pristine", "ragged", "ripped", "soiled", "starched", "tattered", "threadbare", "torn", "worn", "unkempt", "unpressed" }),

"crafted":({ "", "carved", "embossed", "embroidered", "printed" }), "design":({ "", "rose", "roses" }),

"detail:collar:type":({ "", "band", "bib", "bishop", "butterfly", "button-band", "button-down", "chelsea", "classic", "clerical", "club", "cossack", "cutaway", "dutch", "formal", "frilled", "longpoint", "pinned", "ring", "ruffle", "sailor", "shirt", "stand", "spread", "tab", "turtleneck", "tuxedo", "van-dyke", "wing", "wing-tip" }),

"detail:long-sleeves:type":({ "", "bag", "baggy", "balloon", "barrel", "batwing", "bell", "bishop", "cuffed", "cold-shoulder", "classic", "dolman", "elbow-patched", "epaulet", "flutter", "gauntlet", "gibson-girl", "hanging", "juliet", "kimono", "lantern", "loose", "magyar", "mahoitres", "marmaluke", "mutton-leg", "off-shoulder", "over", "padded-shoulder", "peasant", "poet", "puffed", "regular", "slashed", "slit", "tight", "tailored", "well-tailored", "virago" }),

"detail:short-sleeves:type":({ "", "angel", "baggy", "banded", "bracelet", "butterfly", "cap", "cape", "classic", "cold-shouldered", "draped", "drawstring", "epaulet", "extended-cap", "frill", "flute", "flared", "loose", "melon", "off-shoulder", "pagada", "puff", "puffed", "raglan", "regular", "slashed", "slit", "square-armhole", "strapped", "tailored", "tight", "t-shirt", "well-tailored", "wing-ruffle" }),

"fit":({ "", "baggy", "form-fitting", "loose", "regular", "snug", "tight" }), "pattern":({ "", "checked", "herringbone", "patterned", "plaid", "pinstriped", "polkadot", "striped", "windowpane-check" }),

"style":({ "", "crude", "chic", "dapper", "diaphanous", "dowdy", "drab", "dress", "elegant", "fashionable", "flimsy", "formal", "gauzy", "heavy", "old-fashioned", "outdated", "plain", "patched", "rakish", "shabby", "sheer", "slashed", "sleek", "smart", "shoddy", "solid", "stylish", "thick", "thin", "unstylish" }) ])

```

## Credits

The intial +traits command was created by @Zwoc (Kalle Alm) as part of the [[SharedSystem]] in 2006, and this version of +traits and the new @traits was been updated by @Roo (Sarah Tacket) in 2020 and examples and documentation by @ChristopherA (Christopher Allen)
