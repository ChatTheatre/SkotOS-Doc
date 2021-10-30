---
sort: 2
---

# Guide ! Commands

#### !accfinger
   * Usage: !accfinger [accountname]
   * Pulls up information about a players account
   * For more information, type: +man accfinger
   
#### !addnote
   * Usage: !addnote [accountname] "[message]"
   * Adds a note to a user account
   * For more information, type: +man addnote
   
#### !assist
   * Usage: !assist [various]
   * Displays the "New" TAS queue.
   * Equivalent to typing !tas alone.
   
#### !badname
   * Usage: !badname [name] 
   * Add a name to the badnames database. Any names declared as 'badnamed' are rendered invalid to any user attempting to create a new character with that name. 
   * For more information, type: +man badname
   
#### !badnames
   * Usage: !badnames 
   * Display all names declared as bad. Long list.
   * For more information, type: +man badnames
   
#### !broadcast
   * Usage: !broadcast "Message"
   * Sends a message to the entire game world/server. Does NOT show your name so if you want it to be known, it should be added into the message
   * See also +emitto, +emitin , +emitub, +emitib, and +emitob
   
#### !bugs
   * Usage: !bugs
   * Shortcut used to bring up the bugs queue of the TAS system
   
#### !busy
   * Usage: !busy [on|off]
   * Blocks (on) or unblocks (off) incoming pages

#### !chatlines
   * Usage: !chatlines
   * Shows you a list of all chatlines you have access to and which ones you have turned on or off
   * Same as !listchats
   
#### !customers
   * Usage: !customers
   * Will show everyone logged into the game who is not NDA staff

#### !dark
   * Usage: !dark
   * Hides/unhides your name from the who list
   
#### !disconnect
   * Usage: !disconnect name
   * Terminate the target character body's connection to the server.
   * Requires you to be in same room as target.
   
#### !dismiss
   * Usage: !dimiss [character] "[reason]"
   * EXAMPLE: !dimiss troublemaker "Kept swearing at the other players."
   * Sends a character to the Out-Of-Character Jail. Should be used with care, only if other things such as discussion or muting have failed.
   * See also: !disconnect, !mute, !suspend
   
#### !finger
   * Usage: !finger character
   * Gives you same information as !accfinger, except you use a character name instead of account name
   * For more information, type: +man finger
   
#### !gc
   * Usage: !gc (brings up helpfile)
   * General Chat line, server specific, for all staff including plotter trainees and guides. (Non NDA)
   
#### !goodname
   * Usage: !goodname "name" 
   * Remove a name from the badnames database.
   * For more information, type: +man goodname
   
#### !grab
   * Usage: !grab playername
   * Bring a player to your environment
   
#### !guides
   * Usage: !guides
   * Shows which guides are logged in

#### !hosts
   * Usage: !hosts
   * Lists all NDA staff that is logged on. Lists account name, character name, idle time, and woename of location. 
   * For more information, type: +man hosts
   
#### !hotspots
   * Usage: !hotspots
   * Lists rooms that contain 2 or more unidle bodies, showing you the more populated areas of the game. Good for directing new players to areas where they can interact
   * For more information, type: +man hotspots
   
#### !ideas
   * Usage: !ideas
   * Shortcut to pull up the ideas queue in TAS. Same as !tas ideas
   * For more information, type: +man ideas
   
#### !idleness
   * Usage: !idleness [watch] name ["message"] (or just !idle)
   * Find out when a person submitted a command last. The command additionally allows you to keep a tab on the person that will stay there until they either disconnect or return from idleness.
   * For more information, type: +man idleness
   
#### !infoline
   * Usage: !infoline on/off or !infoline recall
   * When line is turned on, it notifies you every time someone logs on, logs out or disconnects. Using the recall will show you the most recent of these notices
   * For more information, type: +man infoline
   
#### !join
   * Usage !join character
   * Usage !join woename
   * Teleports you to that character. They need not be logged in, but their body must be in an environment other than NIL.
   * For more information, type: +man join
   
#### !killnote
   * Usage: !killnote account
   * Kill the last entry in the specified account's notes. 
   * For more information, type: +man killnote
   
#### !lastseen
   * Usage: !lastseen character
   * Shows if that character is online or offline, their idle time if they are online, and when that character last connected and disconnected. It also shows the average time spent online per connect. 
   * For more information, type: +man lastseen
   
#### !listchats
   * Usage: !listchats
   * Display a list of all chatlines, your current body's status (on/off), the purpose of each line and whether it is cross-game (multi-server). 
   * Same as !chatlines.
   * For more information, type: +man listchats
   
#### !mute
   * Usage: !mute [character] "[reason]"<br/> 
   * EXAMPLE: !mute Troublemaker "Won't shut up while I'm talking!"
   * Makes a character unable to talk. Intended primarily as a means to calm someone down and to give you, the StoryGuide, an opportunity to speak without being abused. Should be used with care and should not be used long-term. A better option that one of the harsher punishments like !dismiss.
   * SEE ALSO: !disconnect, !dismiss, !suspend, !unmute
   
#### +notes
   * Usage: !notes accountname
   * Display all notes on a given account.
   * also: !addnote accountname "Note"
   * also: !killnote accountname

#### !office
   * Usage: !office
   * EXAMPLE: !office
   * Teleports you Backstage. This is the place you generally will hang out when acting as a StoryGuide, and almost always the place you want to be if you're !grabbing players to talk to them.
   * SEE ALSO: !grab, !join, !ungrab

#### !opage
   * Usage: !opage character "message"
   * Leaves a pending page for that character to retrieve when they next log on
   * also: !opage reset \<name\> 
   * also: !opage see
    
#### !page
   * Usage: !page character/accountname "MESSAGE"
   * Paging that allows you to override someone who has page busy on (DO NOT ABUSE) or allows you to page someone who is possessing an inanimate object.

#### !people
   * Usage: !people
   * Lists characters logged in by location (grouping those together in the same location)
   
#### !readall
   * Usage: !readall
   
#### !return
   * Usage: !return (character optional)
   * Using '!return' by itself will send you back to your virtual home if it is set. 
   * Using '!return character' sends that char to their virtual home if it is set

#### !see
   * Usage: +see (brings up helpfile)
   * Used to notify you whenever a specific character logs into/out of the game.
   
#### !sk
   * Usage: !sk (brings up helpfile)
   * Skotos Chatline, cross game, NDA staff only. Game leads MAY have access to this on servers they are not staffing so that their staff from their own game has the ability to reach them

#### !staff
   * Usage: !staff
   * Displays NDA staff logged on

#### !suspend
   * Usage: !suspend (brings up helpfile)
   * Used to suspend an account from the game. Only Guides and the game lead should use this command
   
#### !tas
   * Usage: !tas (brings up helpfile)
   * Task and Assist System. Very extensive system for the filing of assists, bugs, typos, ideas, and socials. Also allows staff to file tasks into personal queues.

#### !typos
   * Usage: !typos
   * Shortcut to view typos queue in TAS

#### !ungrab
   * Usage: !ungrab character
   * Sends the character back to the room where they were !grab-bed from
   
#### !unmute
   * Usage: !unmute [character]
   * EXAMPLE: !unmute Launfal
   * Lets someone talk again after they'd been muted. Remember to do this fairly quickly after you've muted someone! Muting is intended to just be temporary while you try and work out problems.
   * SEE ALSO: !mute

#### !whereis
   * Usage: !whereis charname
   * Lists the woename of the environment for that character and allows you to see the brief of the room they are in.
