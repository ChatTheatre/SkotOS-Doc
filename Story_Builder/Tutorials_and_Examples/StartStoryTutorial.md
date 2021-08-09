---
sort: 1
---

# Tutorial: The Start Story

Every story needs a beginning and for your players, the Start Story is it. This is where new characters are born and introduced to the world you are building.

Before touching the Start Story code, it is important to take the time to map out each step of your Start Story and determine what these steps will accomplish.

```
Example:
State "no-body" - Select name (input box) and gender (radio buttons). Chatter body is created.
State "01" - Select physical attributes (drop down boxes for each option)
State "02" - Select starting skills (drop down boxes)
State "03" - Attribute priotization (drop down boxes)
State "end" - Finalize selection (overview of character)
```

The **"no-body"** and **"end"** states are static though you can modify what content you want to be visible here. The "no-body" state is where the chatter body is created. Name and gender have to be collected here in order for the chatter to be made. The "end" state is where all selections are finalized.

**State "01"**, **State "02"**, etc. are the states you have most control over. You can have as many or as few as you want. The chatter body is created at this point so it's very easy to have different options for chatter customization. What does the chatter look like? Does the chatter have any special skills or attributes?


## The Start Story Code

The basic Start Story is comprised of three files located in Theatre:Web:StartStory:*

### Theatre:Web:StartStory:CreateCharacter

This is where the html code is stored. In other words, this is where you define what the players see when creating their characters.

The udat object can be referenced and we use it to define two key variables.

```
<z dat="$(UDat.Dat)" name="$(UDat.Name)">

$dat - the udat's woe name
$name - the account name
```



* **export:html:index** - This is what loads when launching the start story. It has all the core html tags and links to the css and javascript locations you want to use. It will determine what state the player is currently on in and load the appropriate content for that state. If no chatter body is defined, it will load the "no-body" state. If a chatter body is defined, it will look for a `chargen:state` property in the chatter. This property will continue to update as the player navigates through the Start Story.
* **export:xtra:state:no-body** - The "no-body" state. This content is loaded when no chatter body is defined. Once the submit button is clicked, a new chatter will be created and the `chargen:state` property will read "01". Subsequently, this next state will be loaded onto the screen. The chatter body is referenced with the `$characterref` variable.
* **export:xtra:state:01** - The first state after the chatter is created. This property can be copied and renamed to add more steps to the Start Story process. The code within the `<action></action>` tag fires when the submit button is clicked, and this is where you update the `chargen:state` property as the player clicks through the Start Story.
* **export:xtra:state:end** - The last step of the Start Story.
* **export:xtra:stylesheet** - The Start Story stylesheet


### Theatre:Web:StartStory:StartStoryFrame

This file contains all the backend scripts and settings for the Start Story. 

#### Settings

* **export:setting:characterslots:free** - The number of character slots a free account has.
* **export:setting:characterslots:standard** - The number of character slots a standard account has.
* **export:setting:characterslots:premium** - The number of character slots a premium account has.
* **export:setting:title** - The title that appears in the browser's title bar.
* **export:setting:virtualhome** - This is the virtual home location where all characters start.

#### Scripts

* **merry:lib:initialize** - This script runs when the start story page loads. It ensures that critical variables are present (udat reference objects) and that we aren't trying to do something illegal like access another account's body.
* **merry:lib:figurestate** - This script determines which phase of the start story a character is on.
* **merry:lib:check_name** - This script checks a name to determine if it is legal (is not taken and does not contain special characters or numbers)
* **merry:lib:check_roster** - This script makes sure the account is allowed to make more characters.
* **merry:lib:grab-choices** - This script is used compile all the different options for a selection (ie. eyecolor). More about this below.
* **merry:lib:list-choices** - This script takes the data gathered by the above script and compiles it into a drop down list. More about this below.
* **merry:lib:runscripts** - This is the final script that runs once the Start Story is complete. It sets up starting clothes and chatter's virtual home.

### Theatre:Web:StartStory:AppearanceChoices 

This is a propcontainer that holds all the different Start Story options. Most of the options are for appearance but more can be added depending on how much you want to customize the Start Story experience.

The html code for the appearance looks like this:

You are a [height] [build] $(body.base:genderstring) of [skin] complexion with a [haircoverage] head of [hairlength] [hairtype] [haircolor] hair, [hairstyle]. [eyeshape] [eyecolor] eyes return your gaze from beneath [eyebrowshape] eyebrows. You also note your [noseshape] nose, [jawshape] jaw, and [mouthshape] mouth with [lipshape] lips.

The grab-choices script will take everything enclosed in [] and find a matching property in Theatre:Web:StartStory:AppearanceChoices. The height property looks something like this:

```
Core:Property   [   property='export:choices:features:height'   ] V E X D
([ "free":({ "above-average", "average", "below-average", "diminutive", "medium", "short", "small", "tall", "huge", "large", "little", "miniscule", "towering", "enormous", "gargantuan", "giant", "puny", "tiny" }) ])
```

Choices can be limited based on account type and gender. Premium accounts will have access to premium, standard, and free options; standard accounts will have access to standard and free options; free accounts will only have access to free options.

Use the same syntax to limit based on gender.

```
Core:Property   [   property='export:choices:features:build'   ] V E X D
([ "male":({ "masculine" }), "female":({ "feminine"}) ])
```

### Debugging

While experimenting with your Start Story, you will no doubt run into issues. You can manually set which state to debug using the +setp command

```
+setp character "chargen:state 1"
```

My recommendation is to thoroughly test each state as you go and ensure it is working 100% before moving to the next.
