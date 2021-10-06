---
sort: 2
---

# Staff + Commands

#### +accfinger 
   * Usage: +accfinger [accountname]
   * Pulls up information about a players account
   * For more information, type: +man accfinger

#### +action
   * Usage: Locate an action and return its handler(s).
   * Seemingly not fully implemented.

#### +adddesc
   * Usage: +adddesc [type] [detailID] "[text]" 
   * Adds an additional description line to a room.
   * For more information, type: +man adddesc

#### +addnote 
   * Usage: +addnote [accountname] "[message]"
   * Adds a note to a user account
   * For more information, type: +man addnote

#### +advapp
   * Usage: Type '+advapp h' for help on the command-line syntax.
   * Allows the creation of "Choose Your Own Adventure" action sets.
   * Opens the CYOA Popup on Skotos-supported clients.
   * See Troll/Builders TWiki for more information.

#### +adverb
   * Usage: +adverb "[adverb]" 
   * Modify the adverbs in the game.
   * For more information, type: +man adverb

#### +assist
   * Usage: +assist [various]
   * Displays the "New" TAS queue.
   * Equivalent to typing +tas alone.

#### +badname
   * Usage: +badname [name] 
   * Add a name to the badnames database. Any names declared as 'badnamed' are rendered invalid to any user attempting to create a new character with that name. 
   * For more information, type: +man badname

#### +badnames
   * Usage: +badnames 
   * Display all names declared as bad. Long list.
   * For more information, type: +man badnames

#### +bodies
   * Usage: +bodies [account] 
   * Lists the name, Woe name, and Brief name of all bodies on an indicated account.

#### +bring
   * Usage: +bring charname
   * Brings the character, logged in or not, to your location
   * +unbring returns them to that location.

#### +broadcast
   * Usage: +broadcast "Message"
   * Sends a message to the entire game world/server. Does NOT show your name so if you want it to be known, it should be added into the message
   * See also +emitto, +emitin , +emitub, +emitib, and +emitob

#### +bugs
   * Usage: +bugs
   * Shortcut used to bring up the bugs queue of the TAS system

#### +busy
   * Usage:+busy [on|off]
   * Blocks (on) or unblocks (off) incoming pages

#### +cc
   * Usage: +cc (brings up helpfile)
   * This is the coders chatline, which is cross game meaning it is heard by those on other servers. Look at helpfile for the various chatline commands

#### +chatlib
   * Admin interface for chatlines.

#### +chatlines
   * Usage: +chatlines
   * Shows you a list of all chatlines you have access to and which ones you have turned on or off
   * Same as +listchats

#### +chatwipe
   * Usage: Remove a person by account from all chatlines in the system.
   * For more information, type: +man chatwipe

#### +clearprop
   * Usage: clears the indicated property in a character.
   * equivalent of using +setp/+setp2 to set a property to nil

#### +cobj
   * Usage: most often +cobj object "Woename" though +cobj shows you a list of other uses
   * Creates a brand new object in WOE for you

#### +cron
   * Usage: admin tool for the cron daemon script scheduler. 

#### +customers
   * Usage: +customers
   * Will show everyone logged into the game who is not NDA staff

#### +cyoa
   * Usage: activate a CYOA script set.
   * Use +advapp to create a CYOA (Create Your Own Adventure) script set.

#### +dark
   * Usage: Hides/unhides your name from the who list

#### +delays [target]
   * Shows the #delays() running in the target.

#### +detail
   * Usage: +detail [target->object] "[detail-ID]:[sname]:[pname]:[adjective]:[brief]|[look]|[examine]"
   * Adds or modifies the detail with detail-ID on the target object. Good for setting a detail in-game, if you aren't wanting to get into anything more than the arguments available. Merryized.

#### +diff
   * Usage: Display diffs between two properties.
   * Experimental - see Kalle.

#### +disconnect
   * Usage: +disconnect name
   * Terminate the target character body's connection to the server.
   * Requires you to be in same room as target.

#### +emit
   * Usage: +emit message (no quotes)
   * Sends an emit to your environment

#### +emitall
   * Usage: +emitall message (no quotes)
   * Sends an emit to everyone in the game

#### +emitallnewly
   * Usage: +emitallnewly message (no quotes)
   * Sends an emit to all logged in characters that are less than a month old.

#### +emitapp
   * Usage: +EmitApp is a tool to create advanced emit schedules. It has a minor array of tools available through a dialog system using the popup-technology of SkotOS. 
   * For more information, type: +man emitapp

#### +emitin
   * Usage: +emitin "([delay]) [room->woename] [text]" 
   * Emit a message into a specific environment. Optionally, wait a specific amount of time before emitting by specifying the amount of seconds before the woename of the environment.

#### +emitallnewly
   * Usage: +emitallnewly message (no quotes)
   * Sends an emit to all new characters in the game
   
#### +emitter
   * Usage: Opens a pop-up tool that allows the creation of scheduled emitter scripts in designated environments.

#### +emitto
   * Usage: +emitto [person 1], [person 2], [person 3], [...]: "[text]"
   * Emit a message to one or several characters.
   * For more information, type: +man emitto

#### +emote
   * Usage: +emote message (no quotes)
   * Sends an emote to the room prefaced by your name. +emote smiles will come up <nop>StoryCoder Geli smiles.

#### +feature
   * Usage: +feature \<feature\> in \<object\>
   * Used to set various host-related properties in a character body, such as teleport messages, etc.

#### +finger
   * Usage: +finger character
   * Gives you same information as +accfinger, except you use a character name instead of account name
   * For more information, type: +man finger

#### +force
   * Usage: +force object "action"
   * Forces an object/character to perfom an action. Actions should be written as you would write them into the parser. i.e. +force table "stand in middle" or +force jerboa "go west"
   * For more information, type: +man force

#### +gc
   * Usage: +gc (brings up helpfile)
   * General Chat line, server specific, for all staff including plotter trainees and guides. (Non NDA)

#### +go
   * Usage: +go
   * This command has combined 3 previous commands. It works as follows:
      * Teleport/move into a specific object, specified by its name in the system.
      * Teleport to another character or object.
      * +go is used to store/return to areas. By prefixing the area name with a +, 
   you are adding it to the list of go-able places. Omitting the + means you wish 
   to go to the place previously defined as <name>.
   * WARNING: All entries are global for the server.
   * IMPORTANT for more information, type: +man go

#### +goodname
   * Usage: +goodname "name" 
   * Remove a name from the badnames database.
   * For more information, type: +man goodname

#### +goto
   * Usage: +goto woename
   * Teleport/move into a specific object, specified by its name in the system. 
   * For more information, type: +man goto

#### +guides
   * Usage: +guides
   * Shows which guides are logged in

#### +helppopup
   * Usage: +helppopup
   * EXPERIMENTAL tool created by Kalle to inteface with the Help system.
   * Status unknown.

#### +home
   * Usage: +home
   * Teleports you to where the server designates as "home". In Marrach, this is the unused Green room.
      * This should be reset to main staff office. (Will follow-up with Nino.)

#### +hop
   * Usage: hop [+|++|-] name
   * +hop is used to store/return to areas. By prefixing the area name with a +, you are adding it to the list of hoppable places. Omitting the + means you wish to hop to the place previously defined as <name>.
   * For more information, type: +man hop

#### +hosts
   * Usage: +hosts
   * Lists all NDA staff that is logged on. Lists account name, character name, idle time, and woename of location. 
   * For more information, type: +man hosts

#### +hotspots
   * Usage: +hotspots
   * Lists rooms that contain 2 or more unidle bodies, showing you the more populated areas of the game. Good for directing new players to areas where they can interact
   * For more information, type: +man hotspots

#### +ideas
   * Usage: +ideas
   * Shortcut to pull up the ideas queue in TAS. Same as +tas ideas
   * For more information, type: +man ideas

#### +idleness
   * Usage: +idleness [watch] name ["message"] (or just +idle)
   * Find out when a person submitted a command last. The command additionally allows you to keep a tab on the person that will stay there until they either disconnect or return from idleness.
   * For more information, type: +man idleness

#### +immobile
   * Usage: +immobile \<object\>
   * Fixes an object in place so it cannot be taken. Use again to unfix the object.

#### +info
   * Usage: +info account name
   * Display information about all bodies logged in by a particular account.
   * For more information, type: +man info

#### +infoline
   * Usage: +infoline on/off or +infoline recall
   * When line is turned on, it notifies you every time someone logs on, logs out or disconnects. Using the recall will show you the most recent of these notices
   * For more information, type: +man infoline

#### +integrate
   * Usage: +integrate (brings up helpfile)
   * Integrates an object into another object, hiding it from view but still making it interactable. Used mainly with furniture to keep the looks of rooms uncluttered. If you use the syntax that calls for a woename, it will automatically spawn that object and then integrate it
   * For more information, type: +man integrate

#### +interact
   * Usage: +interact \<object\>
   * Outputs snames/pnames of an object, including those in the Ur chain.

#### +inventory
   * Usage: +inv (optional $character/$here)
   * +inv alone will produce the inventory of the body you are in. +inv $here will produce the inventory of the room you are in. +inv $character will give you the inventory of that character whether they are logged in or not. +inv $character.container (i.e. +inv $geli.bag) will give you the inventory of that container. 
   * For more information, type: +man inventory
   * __Please do not abuse this command!!!__

#### +ipnames
   * Usage: +ipnames
   * Displays all the ip names for everyone online
   * For more information, type: +man ipnames

#### +ipsearch
   * Usage: +ipsearch (brings up helpfile)
   * Allows you to search similar ip names to help track down trial account abusers
   * For more information, type: +man ipsearch
   
#### +join
   * Usage +join character
   * Usage +join woename
   * Teleports you to that character. They need not be logged in, but their body must be in an environment other than NIL.
   * For more information, type: +man join

#### +keycode
   * Usage: +keycode door target
   * +keycode is used to determine which locks (exits) a particular key works on, or which keys a particular lock handles. It can also be used to detect invalid settings in locks (for instance the exit pair between two rooms not having the same keycodes).
   * For more information, type: +man keycode

#### +killnote
   * Usage: +killnote account
   * Kill the last entry in the specified account's notes. 
   * For more information, type: +man killnote

#### +kpe
   * Usage: +kpe
   * Experimental fork of the Property Editor on Marrach.
   * Not properly implemented (yet).

#### +lastseen
   * Usage: +lastseen character
   * Shows if that character is online or offline, their idle time if they are online, and when that character last connected and disconnected. It also shows the average time spent online per connect. 
   * For more information, type: +man lastseen

#### +lfc
   * Usage: +lfc (brings up help text)
   * The LFC (log feed channel) exists to provide the developers with an extended tool for debugging runtime systems. The LFC uses the chatlib code with a series of debugging- and filtering-specific extensions.
   * For more information, type: +man lfc

#### +lg 
   * Usage: +lg (brings up helpfile)
   * Local Game chat, server specific, NDA staff only

#### +listchats
   * Usage: +listchats
   * Display a list of all chatlines, your current body's status (on/off), the purpose of each line and whether it is cross-game (multi-server). 
   * Same as +chatlines.
   * For more information, type: +man listchats

#### +listobjects
   * Usage: +listobjects
   * Displays characters and rooms that have 10 or more objects in their inventory. The character listing is displayed first with character name and total number of objects. The room listing is displayed second and lists the room brief, the room woename and total number of objects. 
   * Purpose unclear
   * For more information, type: +man listobjects

#### +lock
   * Usage: +lock door
   * Locks a door from both sides
   * For more information, type: +man lock
   * See also +unlock

#### +man
   * Usage: +man (displays help data)
   * +man is the system's manual pager. It is used to look up information on specific commands. Manual pages are either local or global. Global manual pages, available on every server, can only be written from the master server (at point of writing, Castle Marrach server); local pages, only available on the server where they were written, can be added/modified anywhere. Local manual pages take precedence over global.
   * For more information, type: +man man

#### +miki
   * Usage: +miki
   * A game-internal TWiki-like system to reduce dependancy on external TWiki.
   * Note that Marrach/TWiki is not administered by Skotos.
   * Basically unused.

#### +mref
   * Usage: +mref (dislays the helpfile)
   * Display a Merry function reference for an object or a specific function in an object.

#### +msearch
   * Usage: +msearch (dislays the helpfile)
   * Search the Merry library database for entries matching one or several keywords. Note that this is not the same database +MHelp is using, as +MHelp is for internal Merry commands and +MSearch is for Merry libraries written IN Merry. 
   * For more information, type: +man msearch

#### +mstamp 
   * Usage: +mstamp "woename"
   * Apply a stamp to an object containing Merry scripts, scanning each script individually in an attempt to find a description for it. 
   * For more information, type: +man mstamp

#### +munstamp 
   * Usage: +munstamp "woename"
   * Presumably removes the effects of +mstamp.
   
#### +notes
   * Usage: +notes accountname
   * Display all notes on a given account.
   * also: +addnote accountname "Note"
   * also: +killnote accountname

#### +obname
   * Usage: +obname here/object/character
   * Displays the woename for that room, object, or character

#### +obstat
   * Usage: +obstat \<object name\> \<stat type\>
   * Types: name, details, environment, bulk, living, motion, stance, thing, clothing, property, brain, all
   * Displays information about specified object.
   * Wildcards are accepted. For example: +obstat Chatters:Gables:ro:roo property:*udat*
   * also: +stat

#### +opage
   * Usage: +opage character "message"
   * Leaves a pending page for that character to retrieve when they next log on
   * also: +opage reset <name> 
   * also: +opage see

#### +owners
   *Usage: +owners[last modified Fri Jul  8 06:20:59 2005] 
Synopsis:
   +owners "woename" 
Description:
   Returns a list of children/spawns of that woename and where it is in game. 
   The listing is done by the woename of each child/spawn and woename of the 
   locations. 
   This command is used to find the owner of all the instances of an object. 
Examples:
   +obname "Generic:clothing:robe-dressing" 
See also:
   +whereis 

#### +page
   * Usage: +page character/accountname "MESSAGE"
   * Paging that allows you to override someone who has page busy on (DO NOT ABUSE) or allows you to page someone who is possessing an inanimate object.

#### +pe
   * Usage: +pe %objectname propertyname
   * Opens the property editor popup window.
   * also: +kpe

#### +people
   * Usage: +people
   * Lists characters logged in by location (grouping those together in the same location)

#### +pf, +propfind
   * Usage: +pf 'object-parent property-name \[property-value\]
   * Search object for specified property name. Object woe name must be specified and property name must exist in that object in order to return a value.

#### +possess
   * Usage: +possess object/character
   * Puts you in the body of object or character

#### +propose
   * Usage: +propose

#### +quote
   * Usage: +quote "message"
   * Used to display code scripts so that full-stops aren't added to the end like they do when you use the parser to say "message".

#### +readall
   * +readall

#### +recursive-move
   * Usage: +recursive [move] "[old]=[new]"
   * Usage: +recursive [copy] "[source]=[dest]"
   * Usage: +recursive [irreversibly disintegrate] "[folder]"
   * Dangerous command.
   * Moves or copies contents of a folder to a new location.

#### +relocate
   * Usage: +relocate my apple 'waldo': send the apple to Waldo
   * Usage: +relocate my apple 'Marrach:objects:stuff:bigbox': sends the apple to the big box
   * Allows you to move an object in your possession or environment to someplace else. You can send it either to a character's inventory (by character name) or to a room or object's inventory (by object WOE name). It will do so silently.
   * If the relocation fails for any reason you are notified and the object remains where it was.

#### +reregister
   * Usage: +reregister \<body name\>
   * Implements the +reregister command, which moves a previously unregistered body back onto the original account. 
   
#### +return
   * Usage: +return (character optional)
   * Using +return by itself will send you back to your virtual home if it is set. +return character sends that char to their virtual home if it is set

#### +revisions
   * Usage: +revisions \<object\>
   * Outputs the "revisions" property of an object in a formatted, easy to read list.

#### +roombuild
   * Usage: +roombuild
   * A popup tool that assists in creating a new room.

#### +roster
   * Usage: +roster
   * This Text
   * +roster \<account\>
   * Check an account's roster-capacity
   * +roster \<account\> \<extra\>
   * Set an accounts additional roster-capacity

#### +rpossess
   * Usage: +rpossess \<charname\>
   * Usage: +rpossess "woename"
   * Remotely possesses a character or object. Not recommended. Use +possess instead.
   * also: +possess

#### +see
   * Usage: +see (brings up helpfile)
   * Used to notify you whenever a specific character logs into/out of the game.
   
#### +setprop, +setp
   * Usage: +setp object "script"
   * Allows you to set a property on that object. +setp by itself will give you the helpfile
   * +setp is the short version of +setprop

#### +sh
   * Usage: +sh (brings up helpfile)
   * Story Host chatline, cross game, NDA staff only

#### +sk
   * Usage: +sk (brings up helpfile)
   * Skotos Chatline, cross game, NDA staff only. Game leads MAY have access to this on servers they are not staffing so that their staff from their own game has the ability to reach them

#### +skills
   * Usage: +skills
   * Display a list of all skill properties and values within your chatter body.
   * Usage: +skills \<character\>
   * Display a list of all skill properties and values of specified character.

#### +slay
   * Usage: +slay object
   * Will destroy that object completely. Will not (or should not) allow you to slay an item that has children/spawns. Please be careful as once you slay something, you can NOT get it back

#### +socials
   * Usage: +socials
   * Shortcut displaying the socials queue in TAS

#### +sp
   * Usage: +sp (brings up helpfile)
   * <nop>StoryPlotter chatline. While all NDA staff has access to it, only plotters should have this line turned on or do recalls on it. If you are not a plotter, please do not abuse the fact that you have access to it

#### +spawn
   * Usage: +spawn (brings up lengthy helpfile)
   * Spawns an object into the game. Most commonly used is +spawn "woename"

#### +sspace, +ss
   * Description: Add a code library to your script space to make it more easily accessible. For example, if you have a combat library that is defined as "combat" in your script space, you can call scripts within that library using the syntax `combat::script();`. Arguments can be passed the same way you would with any other function call `combat::script($arg: arg);`
   * Usage: +sspace
   * This help
   * Usage: +sspace list   
   * Lists In Use Script Name Spaces
   * Usage: +sspace list (name)
   * Shows Functions Available in Name Space
   * Usage: +sspace register (name) (woename)
   * Registers space (name) with handler of (woename)
   * Usage: +sspace unregister (name)
   * Unregisters space (name)
   * Usage: +sspace display (name) (property)
   * Displays the code for that lib
   
#### +staff
   * Usage: +staff
   * Displays NDA staff logged on
   
#### +stat
   * Usage: +stat \<object name\> "\<stat type\>"
   * Types: name, details, environment, bulk, living, motion, stance, thing, clothing, property, brain, all
   * Displays information about specified object.
   * Wildcards are accepted. For example: +stat me property:*udat*
   * also: +obstat

#### +status
   * Usage: +status heartbeat|swapping

#### +storyapi
   * Usage: +storyapi
   * Open the storyapi popup window. This tool allows developers to create automated an storypoint purchase system.

#### +storypoints
   * Usage: +storypoints [help]
   * This text.
   * Usage: +storypoints info <account>
   * Verify somene's SPS total.
   * Usage: +storypoints take <account> "<reason>
   * Take 50 SPS from someone for the reason given.
   * Usage: +storypoints take <account> <amount> "<reason>
   * Take SPS from someone for the reason given, not necessarily 50.
   * Usage: +storypoints give <account> "<reason>
   * Give 50 SPS to someone for the reason given.
   * Usage: +storypoints give <account> <amount> "<reason>
   * Give SPS to someone for the reason given, not necessarily 50.
   * Usage: +storypoints log [<days>]
   * Review the +storypoint activity in the last X days (default 7 days).
   * Usage: +storypoints log <account> [<days>]
   * Review the +storypoint activity by the given account (default 7 days).

#### +summon
   * Usage: +summon woename
   * Used to bring an object to your environment. Great to use for spawned items. Please do not summon original object to you unless it is a character (and then we prefer you use +bring or +grab) or a CNPC you are building.

#### +suspend
   * Usage: +suspend (brings up helpfile)
   * Used to suspend an account from the game. Only Guides and the game lead should use this command

#### +sysinfo
   * Usage: +sysinfo
   * Displays all system information including DGD version and memory usage.

#### +tas
   * Usage: +tas (brings up helpfile)
   * Task and Assist System. Very extensive system for the filing of assists, bugs, typos, ideas, and socials. Also allows staff to file tasks into personal queues. __As a staff member, you must become familiar with the system as it will be used often. It is not a complicated system, but there are a lot of commands to review. Any questions on its usage, please ask Geli.__

#### +title
   * Usage: +title character "title"
   * Sets the <nop>StoryPlotter, <nop>StoryCoder, or <nop>StoryGuide title for staff

#### +tool
   * Usage: +tool help (brings up helpfile)
   * +tool is used to open up various popups for editing objects in WOE or adding merry code as well as various other things 

#### +trace

#### +traits
   * Usage: +traits \<object\>
   * Open the traits editor for an item. E.g. +traits my hat.

#### +transfer
   * Usage: +transfer character from accountname to accountname
   * Transfers a character from one account to another. Useful to move VPs into a player's account or back to the generic npcs account

#### +trash
   * Usage: +trash restore [woename]|[object#]
   * Usage: +trash info [land]|[woename]
   * Usage: +trash search [woename]
   * Usage: +trash env [woename]
   * Usage: +trash check 
   * The Skotos Trash System is a sophisticated tool for handling trash in a Skotos game. The +trash command is used for administrative tasks such as recovering items or producing statistics about the game. 
   * Examples:
```
       +trash restore [Generic:clothing:pouch]#12345
       +trash restore 12345
            Restore the pouch and all its content, and move into your environment.
       +trash info master
       +trash info Data:Trash:Default:Masterland
            Produce and display information about the Masterland object.
       +trash search Generic:clothing:pouch
            Search through all trash and display information about all matches.
       +trash env Marrach:rooms:outer:ground:OuterCourtyard
            Search through all trash and display information about any object that was 
       trashed in the room Marrach:rooms:outer:ground:OuterCourtyard. (Hint: if a 
       player gives trash to an NPC, the +trash env command should be used _ON THAT 
       PLAYER_ as the environment from which the trash was taken)
       +trash check
            Check (and set up) the current server for trash usage. 
```

#### +typos
   * Usage: +typos
   * Shortcut to view typos queue in TAS

#### +unbring
   * Usage: +unbring character
   * Acts like unsummon, sending character to the nil. You need only type the character's name, not his/her woename

#### +ungrab
   * Usage: +ungrab character
   * Sends the character back to the room where they were +grab-bed from

#### +unintegrate
   * Usage: +unintegrate <object>
   * Unintegrates an object from the room.

#### +unlock
   * Usage: +unlock door
   * Unlocks a door on both sides

#### +unsummon
   * Usage: +unsummon woename
   * Sends the object back to the nil

#### +usage
   * Usage: +usage
   * Merry Tick Usage Report. Lists all Merry scripts that are being executed. This report helps track down objects or scripts that could be causing lag (high tick usage).

#### +users
   * Usage: +users
   * Lists: free accounts, paying customers, accounts online, characters online

#### +verb
   * Usage: +verb "verb"
   * Lists the roles and signals for the verb

#### +whereis
   * Usage: +whereis charname/woename
   * Lists the woename of the environment for that character or object. You may be able to also use !whereis which can only be done on a character and not a woename of an object and allows you to see the brief of the room they are in instead of the environment's woename.

#### +who
   * Usage: +who
   * Description: Lists accounts, ip names, and characters of those logged in
   * See also: See also +customers, +hotspots, +staff, +people 

#### +whois
   * Usage: +whois character (must be in the room with you)
   * Lists information about that character object such as charname, snames, pnames, theatre id, and possessee name

#### +woe
   +woe[last modified Sat Sep 18 06:45:16 2004] 
   * Usage: +woe <string>|abort 
   * Description: Search through the Woe and display every object whose name contains the supplied string. (Note that searching for "food meat" will not search for the words "food" and "meat" separately, but will instead search for any objects with "food meat" in the name.) The command will continue the scan until either 1) it has gone through Woe, 2) you begin a new search, or 3) you type +woe abort. 
   * Examples:
   
```   
   +woe horse
        Search for any woename whose name contains the word "horse"
   +woe abort
        Abort the current +woe search. 
```