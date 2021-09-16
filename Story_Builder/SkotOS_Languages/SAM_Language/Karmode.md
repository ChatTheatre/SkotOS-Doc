%META:TOPICINFO{author=\"felis\" date=\"1051214897\" format=\"1.0\"
version=\"1.3\"}% %META:TOPICPARENT{name=\"WebHome\"}%

### KarMode

What is KarMode? It is the simplest way to input room and item
descriptions into the files used for Skotos games. The outline is fairly
basic and once you get the hang of it, it is very easy to write up your
descriptions in this format.

This is extremely helpful in Devil\'s Cay for the volunteers who are
writting descriptions but are not active coders. This allows them to
format their writing into a style that is easy for them to understand.
All a coder has to do it cut and paste it into woe and the object is
there. More technical things, like proximity, weight, etc, will need to
be handled by the coder but the bulk of the work is done.

There are things you cannot do in KarMode, such as set proximity for a
detail, set up an object as a container, set the prepositions, etc. But
since the largest time consuming task is typically the description,
being able to submit your item, room, or item request in KarMode format
will save the coders a huge chunk of time.

Here\'s a basic example of KarMode:

\<font color=blue\> \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-- DETAIL
\[default\]\<br\> Brief: a sanctuary\<br\> Glance: A middle sized room,
there is plenty of space for a gathering among the tables and chairs and
sofas and the bed. A worktable stands against the south wall. Several
windows high up near the top of the arched ceiling let in plenty of
daylight.\<br\> Look: A middle sized room, there is plenty of space for
a gathering among the tables and chairs and sofas and the bed. A
worktable stands against the south wall.\<br\> Examine: A middle sized
room, there is plenty of space for a gathering among the tables and
chairs and sofas and the bed. A worktable stands against the south wall.
Several windows high up near the top of the arched ceiling let in plenty
of daylight. It is well carpeted with a lush pile of rugs in various
colors.\<br\> Name: room/rooms\<br\> Name: chamber/chambers\<br\> Name:
hall/halls\<br\> Name: sanctum/sanctums\<br\> Name: sanctuary\<br\>
\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
DETAIL \[floor\]\<br\> Brief: the floor\<br\> Look: The floor of this
room is covered in a lush mixture of carpets.\<br\> Examine: The floor
of this room is covered in a lush mixture of carpets, multiple colors
and all soft to walk upon. You cannot see the floor underneath.\<br\>
Name: floor/floors\<br\> Name: ground/grounds\<br\> Name:
carpet/carpets\<br\> Adjective: carpeted\<br\> Adjective: colorful\<br\>
Adjective: lush\<br\> Adjective: soft\<br\>
\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--
\</font\>

Now let us run through this bit by bit. This is very simple room and no
room in a game should ever have this little description. It\'s an
example for us just for this. It has the main room description and one
detail. You can always tell the main description because it should be
named \[default\]. Any other details are just aspects of the object that
you can describe.

As a rule, if you mention any noun in the object, make sure to add a
detail of it. If you have a sword and you mention the hilt, blade, grip,
pommel, edge, etc, you will want a detail for each of these. And vice
versa if you have a room and add details about the grass and trees and
sun, you might wish to mention those things in the \[default\] examine
for the room.

Exceptions might be for more hidden aspects of rooms or objects. There
might be leaves, but the player won\'t see the word leaves mentioned
until they examine the trees. Additionally, some details might be
assumed, such as the corners of the room, the sky, the sun, etc. These
should still be added as details but need not be mentioned in the
\[default\] examine.

Quick facts:

\* You can put in just a Look if you want. If you have no Examine
defined and you examine the object, the Look with be returned as the
default.

\* Glance is ONLY used for rooms in the \[default\]. This is what is
seen when you arrive in a room. It should give a good sense of the room
without spamming the player to death. Otherwise, it\'s not needed, so
don\'t put time in describing it for anything else.

\* List \"Names\" in priority of importance. Is it a \'sword\' first, or
\'weapon\' or \'object\'?

\* Use Adjectives and alternative Names as much as you can. If a door is
blue, wood, polished, sturdy, south, southern, strong, and tall then all
of those should be defined as adjectives for the door detail. As well, a
plant can be a \'plant\', \'greenery\', \'flower\' etc.

\* Whenever possible, please define the plural for any object. Even if
there is only one floor in the room, make sure you call it, Name:
floor/floors.

\* Be careful of extra \[ and \]s. If you use them in your description,
you\'ll confuse poor KarMode. It\'s a good system, but not particuarly
strong. As well, after you commit your changes, you\'ll see that your
text will automatically be formatted. Any long lines will have a \[ and
\] around them. You do not need to write these in, but make sure you
don\'t delete one \[ and not the matching \].

\* Since KarMode is a bit weak, you will soon find out you cannot DELETE
details or certain lines. Annoying, but true. You will need to jump into
E-mode or XML (X-mode) to delete the things you need. KarMode is a
delight for editing and adding, but not for deleting.

\-\-\-\--

\-- Main.StoryCoderFelis - 15 Jan 2003 %META:TOPICMOVED{by=\"felis\"
date=\"1051214897\" from=\"Builders.KarMode101\"
to=\"Builders.KarMode\"}%
