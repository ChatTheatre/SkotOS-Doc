# Verbs Part 2: Adding Code to Commands

In [Verbs Part 1](https://github.com/ChatTheatre/SkotOS-Doc/blob/master/Story_Builder/Verbs%20Part%201:%20Basic%20Setup.md) we covered the basics on how to set up a new verb, be it a new social or @command/+command. As a developer, you’ll likely want to code specialized commands that do more than emit actions on the screen. There are a few different ways to make your verb trigger special code. 

## Object Interactions

These scripts are added to the objects themselves rather than hardcoded in the command. The [Signal System](https://github.com/ChatTheatre/SkotOS-Doc/blob/master/Story_Builder/SignalSystem.md) overview goes into great detail about how to add these types of scripts to objects so I am not going to talk about that here. I would recommend reading the overview regardless as it also touches on verb phases.

## Command Usage

These scripts fire every time the command is used. Scripts are either hardcoded in the verb or the verb has an action object, which holds one or more scripts. The question of which to use depends on when and where in the verb phase you want your code to be triggered.

**Verb Phases**
1.	Pre phase – all verb requirements are checked (direct object required, evoke required/forbidden, etc) 
2.	Standard phase – verb is executed, consent check if proximity is required
3.	Desc phase – this phase handles how the action emitted (described) on the screen
4.	Post phase – handles any scripts that fire once action is complete

## Hardcoded Verbs

Coding verbs in this manner is perfect for simplistic scenarios where not much code is involved. If you do plan on, or end up having, quite a bit of code, you may want to consider storing your code in a propcontainer library or use an action object.

To hardcode a verb, you simply need to add a merry:global:command or a merry:global-post:command script to your verb object. Or add both if you feel it’s necessary. The difference between the two is subtle but significant: merry:global:command fires when the command is inputted but BEFORE the emit is seen on the screen (standard phase), and merry:global-post:command fires AFTER the emit is seen on the screen (post phase).

What that means is merry:global:command can be used to control whether an emit is seen at all. 

return FALSE = no emit is seen
return TRUE = emit is seen

Bear in mind though that if your merry:global:command script returns FALSE, the merry:global-post:command script (if you have one) will never fire.

## Action Objects

An action object can be thought of as a library of scripts that fire when a command/verb is used. It is particularly convenient because multiple commands can be linked to a single action object. Adding code to verbs in this way is more powerful that the aforementioned hardcoded method as it allows us to write scripts for every verb phase as opposed to just the “before the emit” and “after the emit” phases.

* merry:global-pre:action
* merry:global:action
* merry:global-desc:action
* merry:global-post:action

If the return value is FALSE during any of these phases, the process will be killed and all subsequent phases will fail to fire.

To setup your action object, use the +cobj command

+cobj action Location:of:your:action:object

Then give your action an action id and make sure it is intuitive and/or given the same name of the verb/command it is associated with. Similar to the +verb command, the +action command can be used to see if an action already exists.

## Examples

**I want special code to fire every time I interact with a specific object, such as throwing a rock.**

Add your scripts to the rock. See [Signal System](https://github.com/ChatTheatre/SkotOS-Doc/blob/master/Story_Builder/SignalSystem.md).

**I want a command that does a skill check before allowing the action, such as backflip.**

Create a merry:global:command in the backflip verb. If the chatter is skilled enough, return TRUE. If not, emit something to the chatter to let them know they are not skilled enough, and then return FALSE;

**I want a @command or +command that just outputs some information.**

Create a merry:global:command in the verb object.

**I want the throw, toss, hurl verbs to all perform a skill roll that will describe how well I throw objects.**

Use an action object and put the skill roll/success emit in the merry:global-post:action script. Then link that action to the throw, toss, and hurl verbs. The verbs will behave as normal but with the additional emit that describes how well the throw was performed.

```
> throw rock
You throw a rock.
The rock flies far to the right of your intended target.
```

As long as your code works as intended, there really is no right or wrong way. When in doubt, look at existing verbs and actions for inspiration. 
