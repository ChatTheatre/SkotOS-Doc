# Verbs Part 1: Basic Setup

Verbs are the commands that make our chatters do something. Most verb objects are stored in the Socials:Verbs:* directory in the Tree of Woe. The +verb command will allow you to see if a verb already exists and how it is set up. 

```
> +verb kick

Socials:Verbs:K:kick [V]
VERB: kick (kick/kicks)
    * evoke: allowed
* role: dob
    * prepositions: NIL
    * proximity: close
    * allowed
* role: iob
    * prepositions: at, from, toward, to, for
    * proximity: close
    * allowed
* role: using
    * prepositions: using, with
    * proximity: close
    * allowed
```

A quick look at this shows that the kick command does exist and where in WOE it exists. Clicking the V next to the woename will open a popup with the verb object that you can view or edit.

The VERB line shows the name of the verb (kick) and the second person/third person versions of the command (kick/kicks). We also see that evokes (spoken words) are allowed with this command.

Then we see a breakdown of **roles**. Roles define how we can use this verb to interact with other objects. You can define as many roles for a verb as you want including none (verb cannot interact with any object), but the only limitation is you can only have one direct object role. This doesn’t mean you can’t theoretically kick more than one thing at a time, just that you only need one direct object role to allow for it (this will make more sense when setting up your own verb). 

You can also name the roles what you want but it’s good practice to stick to a consistent naming convention. Direct object roles are typically named **dob** and indirect object roles (objects used with prepositions) are named **iob**. If there is more than one indirect object role, then you’ll see other names such as **iob2**, **using**, and **with**. Again, these roles can be named whatever you want but the names should be consistent and intuitive.

In the case of the kick verb above, we have two indirect roles because we want to allow chatters to be able to kick something AT/FROM/TOWARD/TO/FOR something USING/WITH something (kick rock at wall with my foot). Combinations of the kick verb use include but are not limited to the following commands:

kick
kick rock **(dob)**
kick rock **(dob)** using my foot **(using)**
kick at rock **(iob)** using my foot **(using)**
kick rock **(dob)** at wall **(iob)** using my foot **(using)**, “Doh!” **(evoke)**

Before creating your own verb, you will want to spend some time mapping out different variations of how the verb should be used. What do you want the output to look like in the verb’s most simple and complicated uses?

## Creating Verbs

The +cobj tool can be used to make several types of objects, including verbs.

```
> +cobj

+cobj syntax:

+cobj action         Tavern:coders:sarah:myAction
+cobj helpnode       Tavern:coders:sarah:myHelpnode
+cobj object         Tavern:coders:sarah:myObject
+cobj propcontainer  Tavern:coders:sarah:myPropcontainer
+cobj verb           Tavern:coders:sarah:myVerb
```

The tool gives an example woename location to save your object, but you do not need to follow this suggestion. I recommend putting all verbs in the Socials:Verbs:* directory but you can do what you want. Just be consistent.

```
> +cobj verb Socials:Verbs:P:punt
Done! [V] [E] [X] [MStamp]
```

Clicking the E will open a popup window so you can begin editing your verb. This form is where you input all the basic information for the verb.

* imp - Name of the command.
* second - What you see when you use the command (second person pov)
* third - What everyone else sees when you use the command (third person pov)
* evoke - Do we want people to be able to speak while using this command? Options include forbidden, optional, and required.
* audible, private, secret, obscured - Different options for how the verb is seen by others. Not used very often as developers tend to make these features conditional (skill checks, for example) and use special code for handling.
* target-abstract - Some details can be defined as abstract (non-physical things such as weather, thoughts, feelings) when building objects, and by default, cannot be directly targeted. This flag allows the command to target those details anyway.
* disabled - New verbs are disabled by default.
* ooc - Out of Character verb? This doesn’t really do anything as far as the command is parsed.
* raw_verb - Advanced option. Raw verbs do not follow the typical parser syntax so any roles you define will be ignored. You should only use this option when hardcoding a verb.
* Ur:UrObject - You can define a parent object for this verb and it will inherit all the roles included in the parent.
* Socials:SocialObjects - Add new roles to the verb.
* Socials:VerbActions - Advanced. Verb actions are specialized code that gets triggered when the verb is used.

Once all the basic information is added, you can begin adding roles by clicking the N next to Socials:SocialObject. Then click the E next to the NEW role to edit that role.

* role - The name you are giving the role (dob, iob, using, with).
* direct - Will this role be used to interact directly with objects? (ie. Kick rock, touch door)
* single - Will this role only allow interaction with one object a time? 
* raw - Advanced. Only use when doing complex code with the verb.
* requirements - Options include forbidden (not sure when or why this would ever need to be selected), optional (can use the verb without using this role), required (must use this role when interacting with an object). Does it make sense for the verb to be used without having to interact with an object (Example: smile, run)? If yes, this role is optional.
* distance = How close to an object do you have to be to interact with it using this verb? Armslength and close force the chatter to move within proximity of the object. Far will let you target the object without moving into its proximity. Owned requires you to be holding the object to interact with it using this verb.
* Socials:SocObPreps - This is where you add the prepositions that support the interaction with the object (at, over, under, behind, to, etc). Remember that direct objects do not accept prepositions.

Once that roles are added, the verb is complete. Just make sure to thoroughly test it to ensure it behaves as intended.

One final note that this process is not just limited to Socials. Follow these same steps to create @commands and +commands.

