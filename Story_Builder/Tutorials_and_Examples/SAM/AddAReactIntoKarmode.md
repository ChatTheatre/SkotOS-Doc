## Adding Reacts into Karmode

We are all familiar with the law \"Every action has an equal and
opposite reaction.\" Well, in coding, you can write out specific
reactions to various actions. We call these react scripts. While a lot
of this is done in Merry, you can enter in some react scripts right into
details in Karmode.

### Sense react scripts

There are 3 \"sense\" react scripts that can be entered into Karmode,
taste, touch and smell. These, when entered, will respond to most verbs
that allude to that sense. The first is taste which will react to taste,
lick, nibble, and others. Touch will react to touch and other contact
verbs. Smell will react to smell and sniff.

Open up in WOE the object that you wish to enter the react into, then
open up Karmode. Find the detail where you want to enter the script (can
be the default detail or any other detail).

Under the brief, look, and examine and before the names you want to
write:\<br\> \<font color=blue\>React-post:sense/taste-dob: You taste a
mixture of strawberries and bananas.\</font\>

Now when you taste, lick, or nibble that detail, the react you entered
in will be displayed.\<br\> ***lick lollipop*** \<br\> You lick a
lollipop.\<br\> You taste a mixture of strawberries and bananas.

Same thing can be done for smell.\<br\> \<font
color=blue\>React-post:sense/smell-dob: Your nose is infected with the
rank smell of decay.\</font\>

***smell corpse*** \<br\> You smell a corpse.\<br\> Your nose is
infected with the rank smell of decay.

Touch is a bit different as it is a React-pre instead of React-post,
which means the actor receives no confirmation that the action has been
performed.

\<font color=blue\>React-pre:sense/touch-dob: The fire is hot! You pull
back your fingers before you are hurt! \</font\>

***touch fire*** \<br\> The fire is hot! You pull back your fingers
before you are hurt!

### Other simple react scripts

When you enter in react scripts into Karmode, it is important to
remember that the output is only emitted to the actor (the person
performing the action). To enter in other react scripts into Karmode, do
the same as before, but you won\'t be adding in the \"sense\".

\<font color=blue\>React-post:poke-dob: Your finger sinks momentarily
into the goo.\<br\> React-post:shake-dob: You shake the doll vigorously,
yet get no effect whatsoever.\</font\>

And so on\...

### Enter into scripts

One more react script that you may see being used in LC are enter-into
scripts. These are not post scripts (post means that the action goes
through before the emits). They are entered into exit details on rooms
and keep players from exiting in that direction while also emitting a
response. One example is in the East Dorm stairwell where we have no
doors to close it off, but don\'t want people to try to go upstairs as
it\'s not been coded yet.

In the exit detail for up, we write\<br\> \<font
color=blue\>React:enter-into: The stairwell has been roped off due to
excessive water damage upstairs.\</font\>

When someone tries to leave to go up, they\'ll approach that exit but
not leave and receive the output message about it being roped off.

