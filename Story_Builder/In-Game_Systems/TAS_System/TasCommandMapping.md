# TAS Command Mapping

## Introduction

A classic example of command mapping is the \@storypoint command. A
player types \@storypoint \"I want to buy blue eyes\" and that is mapped
to TAS, filing a new assist in the Storypoints queue automagically. Some
games will have similar features in place, and that is where this
document comes in. Namely, **how do I map a command to a TAS-queue?**

Throughout this, we will create the \@rumor command. The \@rumor
command, when used, will create a new task in the Rumors queue. We thus
need to create the actual verb, create the actual queue, and then create
the little Merry-snippet that puts 2 and 2 together.

## Creating the verb

We start by creating an empty \@rumor verb object. We call it
`Game:neoct:ooc:verb:@rumor` (but you can call it whatever you want). We
can do this via Woe or via commandline. Commandline would
be:\<pre\>+cobj verb Game:neoct:ooc:verb:\@rumor\</pre\> (cobj is short
for \"create object).

Once we\'ve created the verb, we open it up and set the **imp**
(imperative) value to `@rumor`.

## Creating the TAS queue

Next, we want to set up the Queue in TAS:\<pre\>+tas add rumors\</pre\>

## Mapping \@rumor with the Rumors queue.

Finally, we map the two together. We do this in the verb itself, by
creating a new Merry snippet `merry:global:command` in our verb
(`Game:neoct:ooc:verb:@rumor`). Set it to:

    X[M]
    /*
     * D=Filing a task into the Rumors queue. 
     */
    if (!$evoke) {
         EmitTo($actor, "Use @rumor to submit rumors!");
         return FALSE;
    }
    assist::dofileassist($data: Obj("Data:DB:assist:AssistGeneralDB"), $char: Str($actor), $queue: <b>"rumors"</b>, $assisttext: $(raw-evoke), $log: "[TAS]");

And that\'s it. Now try first \@rumor on its own, and then \@rumor
\"Test 123\". If all went well, it should generate a new assist in the
appropriate queue.

\-- Main.KalleAlm - 21 Sep 2005
