## Adding in a Simple Merry React

Props are important for tools for characters to use to RP with. We all
know how much fun it is just to get your hands on a prop. It\'s even
more fun when the prop responds to commands. When you perform an action
with a prop and it responds, it means it has a react script in it.

The simplest of reacts is to emit to the room and actor (actor being the
one who performed the action on the object) after performing the action,
and that is what we are going to do here.

### Step 1: Spawning an object

First you need an object. Any test object you\'ve made will do fine. Go ahead and +spawn that object.

In this doc, I\'ll be using a bunny object.\<br\> \<font
color=blue\>+spawn \"ABN:Staff:Geli:OOC:bunny\"\</font\>\<br\> Spawn 1
of 1 successful and moved into Chatters:LC:ge:geli.

Before we can begin entering in our react scripts, we need to decide two
things. \* What command/verb are we going to have our objects react to
\* What \"role\" that verb is

### Step 2: Determining roles

For our lesson here, we\'ll use the poke verb. (Wasn\'t that an easy
decision?) Now that we have our verb selected, we need to decide what
role it is. For our reacts, there are two roles to choose from. \*
Direct object (dob) - You perform the action directly to an object.
Examples are: You pat your head. You touch your hair. You poke your
belly. Direct roles are obvious by their lack of preposition. \*
Indirect object (iob) - You perform an action indirectly to an object.
Examples are: You smile AT your head. You glance UNDER your hair. You
extend TO the chair. Indirect roles are obvious by their presence of
prepositions.

To find out what roles a verb has, you can use the +verb command.\<br\>
\<font color=blue\>+verb \"poke\"\<br\>

    ({ Socials:Verbs:P:poke })
    VERB: poke (poke/pokes)
    * evoke: allowed
    * role: dob
    * prepositions: NIL
    * proximity: close
    * required
    * role: iob
    * prepositions: at, toward, towards, into
    * proximity: far
    * allowed
    * role: using
    * prepositions: with, using
    * proximity: owned
    * allowed

\</font\>

As you can see above, poke has both a dob and an iob role. We\'re going
to use the dob (you poke object) role.

### Step 3: Writing the script

Now we\'re ready to write our Merry scripts. We\'re going to write these
in the Merry editor using +tool.\<br\> \<font color=blue\>+tool merry edit
%ABN:Staff:Geli:OOC:bunny react:poke-dob\</font\>

A popup window should have appeared. On the left should be Merry, in the
middle should be the woename for your object, and on the right should be
react:poke-dob.

You are now going to write in three lines into the big blank editing
box.

\<font color=blue\>\$delay(3, TRUE);\<br\> EmitTo(\$actor, \"Ouch! You
poked me\" );\<br\> EmitIn(\$actor.\"base:environment\", \"The bunny
yelps from being poked.\", \$actor);\</font\>

Now click commit changes and I\'ll go over everything we just wrote in.

**\$delay(3, TRUE);**

\$delay means that there will be a delay after you perform the comman
and before the script runs. The number is how many seconds to delay, so
in our case, we\'ll poke our object and then 3 seconds later, the emits
will run.

TRUE means that the action (Geli pokes her bunny.) will be seen. If you
do not want the action to be seen by others in the room, replace with
this FALSE.

You may notice after committing your changes, a number and letter
combination was automatically added to this line. The editor gives an
identifier for all delays; this is NOT something you write in yourself
and if you every copy this code into another object, you want to make
sure you take that identifier out.

Lastly, every line of script ends with a semi-colon (;). That means that
this script is done and to go on to the next.

**EmitTo(\$actor, \"Ouch! You poked me\" );**

EmitTo sends an emit to one specific person. You cannot use EmitTo to
send an emit to a room.

\$actor, is who we\'re sending this emit to. \$actor is the person who
is performing the action on the object. So whomever pokes the object,
they become the \$actor and will see that emit.

\"Ouch! You poked me\" is the message that will be shown to the \$actor.

**EmitIn(\$actor.\"base:environment\", \"The bunny yelps from being poked.\", \$actor);**

EmitIn sends the emit to a room.

\$actor.\"base:environment\", is basically \"the actor\'s environment\",
or the room the actor is in.

In quotes is the text you want to emit to the room.

Lastly you see \$actor. In EmitTo, you already sent an emit to the actor
so there\'s no need for him to see a second emit as well. By adding
\$actor here at the end of this line, you\'re telling the code to emit
this to everyone in the room EXCEPT the actor.

### Step 4: Testing

Now, I want you to poke your object. You should see:\<br\> \<font
color=blue\> ***poke bunny*** \<br\> You poke your bunny.

(3 second pause)\<br\> Ouch! You poked me\</font\>

Everyone else in the room saw:\<br\> \<font color=blue\>Geli pokes her
bunny.

(3 second pause)\<br\> The bunny yelps from being poked.\</font\>

**Some things you can do in these emit strings**

1\) You can have the code look up the brief of the object and output it
in your emit string by using Describe(this). An example of this would be
EmitIn(\$actor.\"base:environment\", Describe(this)+ \" yelps from being
poked.\", \$actor); . Use a + sign after the Describe)this) and then
make sure you put in a space after the \" sign so there will be a space
between the brief of the object and the rest of the text.

2\) You can have the code look up the brief for the actor and output it
in the emit string by using Describe(\$actor). An example would be
EmitIn(\$actor.\"base:environment\", Describe(\$actor)+ \" gets scowled
at by \" +Describe(this)+ \".\", \$actor); . That line would emit to the
room \"Geli gets scowled at by the bunny.\"

3\) You can have the code determine possessive traits and decide to use
\"him\" or \"her\". EmitIn(\$actor.\"base:environment\", Describe(this)+
\" shakes in \" +\$actor.\"trait:possessive\" + \" hand.\", \$actor); .
The line would emit to the room \"The bunny shakes in her hand.\"


