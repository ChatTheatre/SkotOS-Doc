---
sort: 2
---

# Context variables available in SAM and Merry

Anybody who\'s worked with SAM or Merry will have some
experience with expressions such as \$actor or \$target \-- values set
by the system to let script code and SAM descriptions know what\'s going
on, who\'s doing what, and to whom. This document is the reference guide
to which of these *context variables* are available, and when.

### A careful and complete description

The most fundamental context is the one created when an action occurs.
An action can be the result of a player command (\"take sword\") or it
can originate from another script (e.g. a NPC picking up a sword from
the floor). Because our system is straddling a fundamental rewrite, the
only variables that are *always* set in the initial action context are:

```
  \$actor    The object executing the action, e.g. whoever is taking the sword
  \$action   The name of the action currently executing
```

This limitation is true for the following actions, which as of March
2003 have not yet been rewritten to make use of the new shiny
architecture: **quit, disconnect, linkdie, login, take, inv, look,
glance, examine, emote, tip, recall, remember, forget, drag, undrag,
dragwiggle, wear, wield, unwear, unwield, remove, allow, deny, consent,
enter, teleport, approach, leave, stance, study_request, teach_offer,
study_start, study_request_accept, teach_offer_accept, study_message,
study_stop, assess, assess_complete**

For the new actions, **which includes socials**, one more vital variable
is always set:

```
  \$roles   An array of names of target roles, e.g. `({ "dob", "using" })`
```

In corollary, for each element in \$roles, e.g. \"dob\", there is
another context variable set, named i.e. \$dob, containing the objects
associated with that role for the particular action. Thus in practice
you might find

        $actor = &lt;Chatters:ZellTheatre:ze:zell&gt;
        $roles = ({ "dob", "using" })
        $dob = ({ &lt;Zell:Objects:mirror&gt; })
        $using = ({ &lt;Zell:Objects:cloth&gt; })

Furthermore, for the majority of the new actions, **including socials**,
you will also find set:

```
  \$vob    A verb object representing a grammatical representation of the action being executed
  \$verb   The imperative form of \$vob
```

Even if the action is executed by an NPC, i.e. there is no actual player
input involved and thus no real command line, the action has associated
with it a verb object that be used for descriptive purposes. If the NPC
script forces the NPC to drop a toy, and the toy has a react script in
it, that script may rely on \$vob and \$verb to be set to reasonable
values.

In practice, then, we can extend the above example to

```        
        $actor = &lt;Chatters:ZellTheatre:ze:zell&gt;
        $roles = ({ "dob", "using" })
        $dob = ({ &lt;Zell:Objects:mirror&gt; })
        $using = ({ &lt;Zell:Objects:cloth&gt; })
        $vob = &lt;Socials:Verbs:polish&gt;
        $verb = "polish"
```

### A pragmatic guide to figuring out what you can really use, and when

\-- Main.ParWinzell - 20 Mar 2003
