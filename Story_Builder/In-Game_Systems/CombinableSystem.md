---
sort: 7
---

# Combinable System - A Technical Summary

Combinables are special objects whose behaviour differ from normal
objects in a few different ways. \* When two spawns of the same
combinable ur-parent enter the same environment, they are automatically
collapsed into a single object by the system. Thus any given environment
only ever contains one instance of each type of object. \* Combinable
objects have an \'amount\' attribute that normal objects do not, which
determines \'how much\' of the object\'s ur-parent the object in
question actually represents.

For example, say we have a \'water\' ur-object. We have two jars, each
containing one quart of water. If a user now pours a quart of water from
the first jar into the second jar, the system will automatically combine
the two separate water objects (both with the amount \'1 quart\') into a
single object with the amount \'2 quarts\'.

Combinable objects have two boolean settings which can be found under
Base:Misc in the Tree of Woe: \* \"discrete\" \* Discrete combinables
are things like coins, logs of firewood, or pebbels: there can be lots
of them (thousands of coins, say) but they never break down into smaller
pieces than one single coin. \* Non-discrete combinables are things like
water or sand \-- which you can always sub-divide into smaller pieces.
\* \"by weight\" \-- mostly useful for non-discrete items, this setting
determines wether the system describes the object in terms of its weight
or its volume: \* Six pounds of flour \* Three gallons of water

So the main three classes of combinables are discrete, non-discrete by
weight, and non-discrete by volume. Only the latter two are currently
implemented in our system. The first one is awaiting plural briefs,
since it requires constructs like \"Two thousand small copper coins.\"
whereas the latter require only constructs like \"Six pounds of
butter.\" where butter is in the singular.

Creating a combinable is as trivial a matter as clicking the
\'combinable\' flag in Base:Misc in the Tree of Woe and possibly the
by_weight flag. For your perusal, there are simple examples in
Ur:combinables on Marrach and the Skotos Seven development server.

In the case of non-discrete combinables, the system presumes these to be
\'loose\' in the manner of water or sand; they must be in tight
containers or they will spill. The +spawn command has been modified to
automatically spawn a Generic:clothing:pouch when it is used on a
\'runny\' combinable, and the newly created combinable is modified to
fit into the pouch.

The tightness of a container is also in Base:Misc. The flag is called
\'tight\'. Most containers should be tight: player bodies are examples
of containers that are not tight \-- they cannot \'contain\' water or
sand. Rooms are also not really tight: if you dropped water into a room
it would spill.

Since combinables can only exist in tight containers, commands like
\'take\' and \'drop\' don\'t work very well unless you happen to be
possessing a tight container. Instead there are two commands to
manipulate combinables:

\* pour \[amount\] of \[what\] from \[where\] into \[where\] \* e.g.
pour one pound of flour from my sack into the barrel \* pour \[what\]
from \[where\] into \[where\] \* e.g. pour from my sack into my barrel
\* fill \[what\] with \[amount\] of \[what\] from \[where\] \* e.g. fill
my sack with a pound of flour from the barrel \* fill \[what\] with
\[what\] from \[where\] \* e.g. fill my sack with water from the barrel
\* fill \[what\] from \[where\] \* e.g. fill my sack from the barrel

These should be operational on Marrach, though syntax is currently a
touch twitchy: be sure to use \'into\' rather than just \'to\', for
example. I\'ll fix this up later.

\-- Main.ParWinzell - 02 Dec 2001 \<br\>

For flour at least, I see that \'ounce\' is a recignized amount, but you
can only see amounts in larger quantities. Might some form of detailed
examine be usefull to give you the exact weight? Or a \'scale\' object
to view this? Just starting my morning playing.

\-- Main.MatthewSeidl - 03 Dec 2001 \<br\>

You can see amounts in smaller units. You were probably just witnessing
the coarse rounding effect in action. For example:

> \> look at my second sack\<br\> A plain fabric sack. Your plain sack
> is open. It contains eight ounces of flour.\<br\> \> pour four ounces
> of flour from my second sack into my first sack\<br\> \> look at my
> second sack\<br\> A plain fabric sack. Your plain sack is open. It
> contains almost a pound of flour.\<br\>

\-- Main.ParWinzell - 03 Dec 2001 \<br\>
%META:TOPICMOVED{by=\"ChristopherAllen\" date=\"1048714854\"
from=\"Builders.CombinableObjects\" to=\"Builders.CombinableSystem\"}%
