# Interaction::question

## Summary

Interaction::question is a very useful script that will allow you to ask questions to the players without worrying about juggling too much code. All you need to do is set one command to ask the question, and any scripts you want that should run depending on the answer.

## Examples

### Simple example

Write a merry script, that will be triggered by some action. For example, we could create the merry:act:smile script in our body - that will trigger when we smile. In the script write: 

```
X[M] 

   /* All merry scripts start with X[M] */ 

   interaction::question($question: "Do you like icecream?", 
                         $expires: 10, 
                         $env: "FALSE", 
                         $yes:"Yum",
                         $no:"Why, do you think you're fat?", 
                         $expire:"It's alright. You can tell me later."); 
   return TRUE; 
   
   /* We've finished the script */
```

Now smile, and you should see the question. And get the answer depending on how you respond.

Let's pull that command apart. 
   * It starts with interaction::question() - that is the script that will ask the question, and set up any code needed for an answer \* \$question - this is the question that will be asked 
   * $expires - how long does the player have to answer this question before it "expires" 
   * $env - Do they have to stay in the same room where the question was asked? If $env is set to TRUE, they can\'t leave the room and still answer the question. If it's set to FALSE, they can leave the room and still give an answer. 
   * $yes - The text that is sent to the player if they answer yes 
   * $no - The text that is sent to the player if they answer no 
   * $expire - The text that is sent to the player if they don\'t give an answer in the allowed time

### An example with scripts

The above example shows how to ask a question, and give an answer. Chances are, it's not very useful to you. What if you want to **do** something with that answer? Run some new code, save a property in the players body, make a change to the game world? Fortunately, as well as giving text responses, we're also able to run a script. We can then put any merry code that we'd like into those scripts.

Let's make a script that lets us force other characters to dance when we smile at them.

Like before, we put the code in merry:act:smile

```
X[M] 
   /* make someone dance when you smile at them */ 
   /* check we have a target */ 
   
   if(\$iob) return FALSE; /* We just smiled, we didn\'t smile AT anyone */ 
   if(sizeof(\$iob) \> 1) return FALSE; /* We smiled at 2 or more people. We only want this to work when we smile at one person at a time */

   interaction::question($question: "Do you want to force"+Describe(\$iob)+" to dance?", 
                         $expires: 10, 
                         $env: "TRUE",
                         $no: "You decide not to magically compel "+Describe(\$iob)+".",
                         $expire:"You decide not to magically compel "+Describe($iob)+".",
                         $yes_ob: this, 
                         $yes_fun: "force_to_dance", 
                         $par: (["victim":NRefOb($iob[0])]) );

return TRUE; 

\* finished with this script. Returning TRUE lets everyone see me smile at the target */

```

   * Instead of $yes we now use $yes_ob and $yes_fun 
   * $yes_ob tells us what object to find the script in 
   * $yes_fun tells us what function (which script) to run 
   * $par (short for "parameters") is a mapping of all the other properties we want to pass to the script. In this case, we're passing the target object as the "victim" property. 
   * We have set $env to be TRUE, so they can't leave the room and still force people to dance

So, in this example, we can tell that we are running the "force_to_dance" script in the "this" object. "this" means "the same object that is running the current script" - i.e. in your body. So we'll have to create the "force_to_dance" script next. It is a merry library script (i.e. a script we can call from other scripts, rather than an act or react script) - so in your body object we now create:

```
merry:lib:force_to_dance

X[M] 
   /* forcing someone to dance */ 
   Social($par["victim"], "dance"); /* force the target to dance */ 
   return TRUE;
```

This is just a totally normal script. It gets called by the interaction::question code when you answer $yes, and the $par property is passed to it. Since the $par property is a mapping that included "victim", we could check that property by using $par\["victim"\] - similarly, we could check any other property that was passed using $par to the script.

### An example where we specify the $actor

In all cases, the question needs to be asked to a specific player. How does it know which player to ask? It uses the $actor property. When an act or react script is run, $actor is set to be the person doing the action. In some cases, you'll want to ask a question to someone **other** than the person doing the action. For example, if someone fired a gun at a character, we might give them a choice between ducking for cover, or standing in front of the Queen. In this case, the person pointing the gun is the $actor and the person getting pointed at is the one we want to ask the question of.

In the gun we might have the script: merry:react-post:point-dob And that means the person they are pointing it at is $iob-2 (If you don't know how we figure this out, you should read about merry signals and roles on the SignalSystem page. The in-game +verb command is also extremely useful.)

```
X[M] 
   /* pointing a gun at $iob-2 */ 
   if($(iob-2)) return TRUE; /* they didn't point the gun AT anyone */ 
   if(sizeof($(iob-2)) > 1) return TRUE; /* they pointed at more than one person. To keep things easy, we'll only run the script if they point at one person at a time. */

   /* Since the script asks $actor the questions, we tell the script to use $(iob-2) as the $actor */

   interaction::question($actor:$(iob-2), 
                         $question: "You are about to get shot! Instead of running for cover, do you want to leap in front of the Queen. Like a heroic bodyguard?", 
                         $expires: 10, 
                         $env: "TRUE",
                         $yes: "You leap in front of the Queen, getting shot in the chest, but saving Her Majesty.", 
                         $no: "You scurry for cover, while the gunman blasts the Queen's head off.", 
                         $expire: "You stand there, unable to decide what to do. The gunman shoots you, then the Queen.");

   return FALSE;
```

   * $actor is set to be $(iob-2) - Whatever object you put there will be asked the questions.

## Specifications

   * $actor - the object that is being asked the question (object) 
   * $question - The question that is being asked (string) 
   * $expires - How long the question takes to expire (int) 
   * $env - Whether the $actor can leave the room and still answer the question. FALSE allows them to leave and still answer (bool) 
   * $par - Any parameters/variables that should be passed to the scripts (mapping) 
   * $yes - What text to give the $actor if they answer yes (string) 
   * $yes_ob - What object to run a script in, if they answer yes. Running a script requires $yes_ob and $yes_fun. (object) 
   * $yes_fun - What function to call, if they answer yes. Running a script requires $yes_ob and $yes_fun. (string that matches a merry:lib:STRINGNAME function) 
   * $no - What text to give the $actor if they answer no (string) 
   * $no_ob - What object to run a script in, if they answer no. Running a script requires $no_ob and $no_fun. (object)
   * $no_fun - What function to call, if they answer no. Running a script requires $no_ob and $no_fun. (string that matches a merry:lib:STRINGNAME function) 
   * $expire - What text to give the $actor if they don't answer (string) 
   * $expire_ob - What object to run a script in, if they don't answer. Running a script requires $expire_ob and $expire_fun. (object) 
   * $expire_fun - What function to call, if they don't answer. Running a script requires $expire_ob and $expire_fun. (string that matches a merry:lib:STRINGNAME function)

TonyDemetriou - 09 Jul 2010
