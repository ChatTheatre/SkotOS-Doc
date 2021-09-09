---
sort: 5
---

# TAS System

## TAS For The Uninitiated!

\* This document has a few siblings which contain further information
about TAS: \* [Tas - Mapping commands to a queue.](TasCommandMapping)

TAS, the Task and Assist System, is a powerful tool that every staff
member should utilize. Because of the endless ways you can utilize this
system, to the new staffer it may seem overwhelming and intimidating.
I\'ll break some of the more basic uses down step by step so you can
become more familiar with this system.

### Turn TAS On

TAS has a chatline capability and works like all other chatlines do.
Every occurance through TAS (filing assists, adding notes to assists,
closing assists and more) gets recorded on the chatline and so you need
to have this line turned on to be able to see assists filed.

\<font color=blue\>+tas on\</font\> - Turns the chatline on.\<br\>
\<font color=blue\>+tas secure\</font\> - You should do this while
possessing your staff body as it ensures that no matter what chatter
body you inhabit, your staff name comes up on the line (and keeps us
from having to keep track of character names).

### I have it turned on. Now what??

Once you have the line turned on, you will be able to see assists filed.
They will look like this:\<br\> \<font color=blue\>13:47 \[TAS\]
\"\<\#874/New\> filed by StoryCoder Geli\[ocannie\]: Testing for my tas
document\"\</font\>

The 13:47 is the time the assist was filed. \[TAS\] is obviously the
chatline. \<\#874/New\> is the assist number (all assists are given
numbers sequentially) and the queue it was filed in. It then lists
character name and account name of the chatter who filed it. Last is the
actual assist they filed.

Now I just mentioned queues above. TAS is divided into an unlimited
amount of queues. \@assist is filed into the \"New\" queue, \@bug is
filed directly into a \"Bugs\" queue, \@typo into a \"Typos\" queue and
so on. We\'ll get into queues in more depth a little later, but to see
the main queues, type \<font color=blue\>+tas queues\</font\>.

To view an individual queue, type \<font color=blue\>+tas
queuename\</font\>, i.e. +tas new. You\'ll see a list of all assists
filed under that queue.

Next you\'ll want to know how to view individual assists/tasks. \<font
color=blue\>+tas info \#\</font\> will pull up the information on that
assist.

\<font color=blue\>+tas info 874\<br\>

    Task #874           Server: Lovecraft  Theatre: LC               Priority: 10
    ----------------------------------------------------------------------
         Account: ocannie                               Flags: 
      Character: StoryCoder Geli                     Queue: New
     Date Filed: Wed Sep  1 13:47:04 2004    Revision: 1
        Last Rev: Wed Sep  1 13:47:04 2004
    Environment: &lt;Nino:Workroom>

    Assisted By: **OPEN**                    Date Claimed: **OPEN**
    Assigned To:                                  Date Closed: **OPEN**
    ------------------------------[X] MESSAGE [X]-------------------------

    Testing for my tas document 

    -------------------------------[X] NOTES [X]--------------------------

\</font\>

### Okay, I\'ve looked at the info on an assist and want to work on it.

When you want to work on an assist, the next step is to claim it.
Sometimes staffers get ahead of themselves and begin working on an
assist without claiming it and what happens is mutiple staffers end up
working on the same one. This leads to confusion and extra work, so
please claim a task if you intend to work on it.

\<font color=blue\>+tas 874\<br\> 14:22 \[TAS\] \"You have claimed task
\#874 from the New queue.

\<Ocannie/StoryCoder Geli\>: Testing for my tas document

See \'+tas info 874\' for specific information regarding this
task.\</font\>

You have now claimed the task and can begin work on it. Several things
you may do while working on an assist: \* Add notes to it. You can add
multiple notes to any task by typing \<font color=blue\>+tas note \"Make
sure the doc is precise and accurate\"\</font\> if you have that task
claimed, or \<font color=blue\>+tas note 874 \"Make sure the doc is
precise and accurate\"\</font\> if you do not have it claimed. \*
Transfer it to another queue. There may be times when an assist needs to
be forwarded to someone else to look at. \<font color=blue\>+tas
transfer \# newqueue\</font\> will do that for you. i.e. +tas transfer
874 bugs. \* Return it to the queues. If you\'ve done all you can do on
an assist and cannot resolve it, you will want to return it to the
queue. \<font color=blue\>+tas return\</font\> will do that. \* Close
the assist. Once you are able to resolve the assist, you\'ll want to
close it. The command is \<font color=blue\>+tas done \"Note about what
was done to resolve the assist.\"\</font\>

### More On Queues

While one of the functions of TAS is for players to file assists, bug
reports, etc so that we as staff can attend to them, another function is
basically project management. What this means is we can file tasks for
ourselves and others that\'s basically a \"to-do\" list. There are many
queues for many different areas so that staff can file tasks for
specific purposes. There are even subqueues of main queues, an example
being the Staff queue which has queues for each individual staff member
under it.

To view all queues including subqueues, type \<font color=blue\>+tas
tree

    > +tas tree

    General
      `-> Aztasks - [S][2/0]
      `-> Bugs - [SG][64/0]
              `-> Mgeneric - [P][11/0]
              `-> Startstory - [P][2/0]
      `-> Ce - [SE][0/0]
      `-> Changelog - [S][0/0]
      `-> Client - [SE][0/0]
      `-> Codingrequests - [G][0/0]
              `-> Cnpcs - [P][16/0]
              `-> Props - [P][13/2]
              `-> Rooms - [P][5/0]
      `-> Eng-pending - [SE][0/0]
      `-> Eng-wishlist - [S][0/0]
      `-> Fog - [][0/0]
      `-> Ideas - [S][121/0]
      `-> Kalle - [][0/0]
      `-> Lsc - [][6/0]
      `-> Lsh - [][0/0]
      `-> Lsp - [][1/0]
      `-> New - [S][10/3]
      `-> Room-bugs - [G][40/0]
              `-> Maps - [P][15/0]
      `-> Socials - [S][39/0]
      `-> Staff - [G][0/0]
              `-> Geli - [P][1/0]
              `-> Wells - [P][0/0]
              `-> Willow - [P][5/0]
      `-> Suspended - [S][0/0]
      `-> Tas - [SE][0/0]
      `-> Task - [S][2/0]
      `-> Typos - [S][9/0]
      `-> Xcode - [S][0/0]

    [S: System, E: Email Alerted, P: Private, G: Contains <nop>SubQueues, L: Locked Queue][Open/Claimed]</font>

The numbers beside each queue denotes how many tasks are in that queue
currently.

To file a task in a particular queue:\<br\> \<font color=blue\>task geli
\"Can you look into writing a document for TAS?\"\</font\>\<br\> and
that task will be filed directly into Geli\'s personal queue.

### Adding New Queues

To make your own personal queue, follow these steps\...\<font
color=blue\> \* +tas add queuename (i.e. +tas add geli) \* +tas private
queuename (denotes the queue as a private queue) \* +tas desc queuename
\"Description\" (Sets a description for your queue) \* +tas associate
queuename (Associates you with specified queue so that you need only
type task \"Whatever it is you want to file\" and it files it directly
into your queue) \* +tas slide queuename staff (sets your queue as a
subqueue of Staff) \</font\>

To make a new queue for a project (as opposed to a personal queue),
follow the same steps, but do not make the queue private, and do not
associate yourself to the queue.

Skotos Seven does not have a general Staff queue, so you need to create
a queue for your game, such as \"Pendragon-staff\", slide that under
your game\'s general queue (so it would be Pendragon/Pendragon-staff),
and then create a personal queue and slide that under your game staff
sub-queue (Pendragon/Pendragon-staff/Wolfram).

Now you should have the basics of TAS down. There are many other things
you can do like search tasks by keywords, view stats, and more. To view
the entire list of commands, type +tas help all.

If anything in this document seems unclear or you have any suggestions,
please e-mail me at <geli@lovecraftcountry.com>

\-\-\-\--

## TAS Commands

\* [+tas help](TASHelp) (and +tas help all) \* [+tas open](TASOpen) (to
see what TAS items are open)

\-\-\--

## Creating a New TAS Verb

So let\'s say you\'ve created a spiffy new queue, and want people to be
able to enter things directly into it from an OOC command, like an \"@\"
command. Here\'s what you do.

\* Look at the original \<font color=\"blue\"\>\@bug\</font\> verb. \*
+tool woe view %Neoct:OOC:Verbs:\@bug \* Make your own social from it by
duplicating and renaming it in WOE. \* For instance, I made
Pendragon:Socials:OOC:\@poprops, for Pendragon Online Props \* Note that
the command cannot have a hyphen in it, so it cannot be, for instance,
\@po-props. \* Edit the Socials:Verb, and change \"imp\" to your new
verb name, and the second and third also. \* For instance, I changed
these to \@poprops \* Edit the Core:Properties, and change the
merry:global:command script to make it your own queue instead of the
standard \"bugs\" queue. \* For instance, I changed it from \$queue:
\"bugs\" to \$queue: \"pendragon-props\".

\-- Main.PeterCorless - 20 Nov 2004
