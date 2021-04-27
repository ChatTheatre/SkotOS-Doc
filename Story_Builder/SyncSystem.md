# The Sync System

**(Note: how much of this still works? A lot of this is old and clearly long-neglected.)**

SkotOS lets your game set up a two-way sync with an "upstream" game. Similarly, your game can be an upstream game for another, downstream of yourself. So if you had a lot of different SkotOS games, as Skotos Tech did, you can have a sort of tree of them. This was useful for Skotos Tech because they always had Castle Marrach as the grandfather game, containing a wide variety of social systems, elaborate clothing and general rich interaction. Using Sync, they could take good systems from other games, and start newer games with rich systems while keeping them up to date with Marrach.

And of course, sometimes the newer games wanted their own versions of things. That's important too.

So how did it work?

## Object by Object, IgDiPro

Every SkotOS WOE object can be marked for sync as one of Ignore, Discard or Propose ("IgDiPro"). If it's set to "ignore", that means you like the local version and you don't want to use anything upstream.

If Castle Marrach had a lovely UrBelt but you've modified your Batman-themed game to have extensive utility belt properties and commands, you'd set your local UrBelt to **ignore** changes from Marrach. You have local changes, you want to keep them, and you don't want any changes from your upstream game please-and-thank-you.

I'm ignoring the fact that you ***could*** have made an UrUtilityBelt inheriting from UrBelt and sorted this out properly. But for purposes of this example, you didn't.

If there are local changes but you don't care about them, you can set the object to **discard** - your local one goes away and is replaced by the most up-to-date from upstream.

And if you've made local changes that you think are worth sharing, you can mark the object as **propose**, and the Castle Marrach folks will be given the option to replace the upstream version with yours, and soon everybody will have them.

## Commands

+synctool

## DGD and MERRY

The DGD object "/usr/SkotOS/sys/sync" exposes itself in WOE as SkotOS:Sync. This object seems to do a lot of the heavy lifting for the sync - serialising and deserialising objects, calling MERRY callbacks and so on.

Logfiles get written under /usr/SkotOS/data/requests/. It also looks like Sync specifically works according to an old, hardcoded list of groups, currently: "Generic", "SkotOS", "Socials", "TextIF", "Pending", "Reverse", "Meta".

Within those groups, there's a recursive scan... But mostly, it looks like the /usr/GROUPNAME/data/vault.lst file has a bunch of directories listed with a + (include) or a - (exclude) in front to include them or not.

Each of those groups represents a Vault node &mdash; the actual DGD object is /usr/GROUPNAME/initd, which looks like it was once a vault node in each of those cases. The vault node can compile a vault.lst file containing objects to include or exclude in the sync operation.

## One-Off Fixes In MERRY

The Neoct:Data:sync object is used to indicate a sync should be done, based on modifying the Neoct:Data:sync's perform_sync script. It looks like that was used as a central place to put sync fixes -- things that should be modified with the incoming WOE objects when the sync was performed.

It also looks like the sync_fix script on the same object was run just *after* the sync, for similar reasons. So you'd add a snippet of MERRY code to one or the other, make sure the sync was run (to run your code) and then remove the snippet.

## Notes for the Future

This Sync system should be our blueprint for dealing with the file system. The Vaulttool is really useful for developers, but it doesn't hook in at the Story Builder level, and long-term that's who needs to handle these things.

It's not clear how much of the code can be directly reused.

## Notes from the Past

Old Sync system docs: http://skotos-wiki.marrach.com/twiki/bin/view/Builders/SyncSystemTwo
