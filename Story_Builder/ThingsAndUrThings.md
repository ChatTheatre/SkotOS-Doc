# Things and Ur-Things

There is a standard SkotOS "in-game object" type called /base/obj/thing. It does a lot. And one of its most interesting properties is data inheritance, or the "Ur-Thing" system.

## What is "Ur"?

WOE Objects have the possibility of inheriting from an "Ur" object. Wikipedia says of the word "UR": *Ur-, a German prefix meaning "primeval" (seldom also "primitive") or even simply "original"; in a relative majority of cases it takes on the sense of "most ancient" (referring to sth. as a 'source' - the initial root, the starting point - of a development); Compare with Old English: or-deal, or-lay, or-iginal; in modern English often replaced by 'proto-'; Sometimes in combinations of two or more of these meanings.*

An "Ur" object is like a parent object. It is especially similar to a JavaScript parent object since JS uses [prototypal inheritance](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain), very similar to what SkotOS uses.

Basically, you can have a beer, which can be an instance of the "Ur-beer," the parent object. The Ur-beer isn't usually sitting around in the world. That's good, because if you drank it then it would empty all the other beers in the world! They inherit their "full" state from the Ur-beer. An object you see in the world can often be an *instance* of a parent object, and any object can inherit its properties (data) from an Ur-object.

## Rooms and One-Off Objects

Nearly all SkotOS objects have an Ur-object. You can see what an object's Ur-Object is in the Tree of WOE, if that object has a [WOE name](./woe_workflow.md). An Ur-object basically always has a WOE name (Ed note: I don't see any reason you ***can't*** have a WOE-name-less Ur-object, but that's not how it's generally done.)

Many SkotOS objects only exist in one place. A room is usually the only instance of that room &mdash; you have the Vestibule as the start room of The Gables, and there aren't a lot of Vestibules. There's normally only one in all of The Gables.

Many objects are similar. There's one. It's a WOE object. It has an Ur-object. It has no spawns.

## Spawns

A "spawn" is an instance of an object in the world that basically ***only*** has an Ur-object. The spawn doesn't override the data of the parent. It doesn't register a WOE name for itself. The vaulttool won't dump it. You can't see it in the Tree of WOE and if you move it around and drop it somewhere else, those changes won't persist after a cold-boot.

A spawn only has an Ur-object, so it's basically exactly the same as its Ur-object except for its location (and maybe a few other properties you wouldn't want to inherit.)
