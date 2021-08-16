---
sort: 3
---

# Out of Character (OOC) Commands

#### @traits
   * Usage: `@traits (me|object)`
   * Description: Modify yourself or an object using the @traits popup window.

#### @assist
   * Usage: `@assist "Message"`
   * Description: Request general help from staff.
   
#### @bug
   * Usage: `@bug "Message"`
   * Description: Notify staff of a bug you have encountered.

#### @typo
   * Usage: `@typo "Message"`
   * Description: Notify staff of a typo you have encountered.
   
#### @idea
   * Usage: `@idea "Message"`
   * Description: Submit an idea to staff.
   
#### @social
   * Usage: `@social verb "(verb, one word only)"`
   * Description: Submit an idea for a new verb.
   * Usage: `@social adverb "(adverb, one word only)"`
   * Description: Submit an idea for a new adverb.
   * Usage: `@social change "Message"`
   * Description: Submit a verb/adverb change request, new prepositions, uages, etc.
   * Usage: `@social other "Message"`
   * Description: Other changes that do not fall into the above categories.
   
#### @a, @b, @c, @d, @e
   * Usage: `@a` `@b` `@c` `@d` `@e`
   * Description: Respond to a prompt that gives up to 5 choices. Each choice is assigned a letter a-e.
   * See also: Tutorial: Interactive prompts (NEEDS WRITTEN)

#### @yes, @no
   * Usage: `@yes` `@no`
   * Description: Respond to a yes/no prompt.
   * See also: Tutorial: Interactive prompts (NEEDS WRITTEN)
   
#### @oocprefix
   * Usage: `@oocprefix "symbol"` where symbol can be any character that isn't alphanumeric (a-z, 0-9) and is not one of the following characters: !, +, ', "
   * Description: Change the prefix of OOC commands. For example, @oocprefix '-' will make '-' character the prefix and the `@ooc` command becomes `-ooc`. 
   
#### @adverb
   * Usage: `adverb` or `adverb <letter or string>`
   * Description: Returns a list of adverbs that begin with the letter or string.
   
#### @verb
   * Usage: `verb` or `verb <letter or string>`
   * Description: Returns a list of verbs that begin with the letter or string.
   
#### @ooc
   * Usage: `@ooc "message"` or `@ooc <name> "message"`
   * Description: Send an Out of Character message to the room or to a specific person. All @ooc messages will be visible to everyone in the room regardless of who the message is targeting.
   
#### @brb, @afk
   * Usage: `@brb` `@brb "message"` `@afk` `@afk "message"`
   * Description: Announce to the room that user will Be Right Back or Away From Keyboard. An optional message can be added and will be visible to everyone in the room.
   
#### @wb
   * Usage: `@wb <target>` or `@wb <user> "message"`
   * Description: Send someone an OOC Welcome Back message. This message is only visible to the target. >OOC -- You welcome back Roo.> An optional message can be added. >OOC -- You welcome back StoryCoder Roo, "Yay!">
   
#### @away
   * Usage: `@away`
   * Description: Mark yourself as Away From Keyboard. No message will be sent to witnesses but your away status will be visible on the who list.
   
#### @back
   * Usage: `@back`
   * Description: Mark yourself as no longer Away From Keyboard. No message will be sent to witnesses.
   
#### @page
   * Usage: `@page <name> "message"`
   * Description: Send a message to someone. They will be given the option to accept or deny the page.
   * Usage: `@page accept <name>` `@page deny <name>`
   * Description: Accept or deny a pending page.
   * Usage: `@page allow <name>` `@page unallow <name>`
   * Description: Allow to auto accept pages from specified person. Unallow to manually accept pages from specifiec person.
   * Usage: `@page block` `@page unblock`
   * Description: Block pages from specified person so all pages from them will be auto denied. Unblock to no longer auto deny pages from them.
   * Usage: `@page recall`
   * Description: View most recent @page conversations.
   * Usage: `@page busy`
   * Description: Mark yourself as busy so you will not receive any pages. Sender will be notified that you are not accepting pages.
   * Usage: `@page status`
   * Description: Show a summary of all people on your allow/deny/block/unblock lists.
   
#### @busy
   * Usage: `@busy`
   * Description: Toggle busy status on and off.
   
#### @allow, @deny
   * Usage: `@allow <name>` `@deny <name>`
   * Description: Respond to a consent prompt.
   
#### @always, @never
   * Usage: `@always (allow|deny) <name>` `@never (allow|deny) <name>`
   * Description: Modify consent list to auto allow or auto deny consent requests.

#### @consent
   * Usage: `@consent list`
   * Description: Show everyone on the allow and deny consent lists.
   * Usage: `@consent (allow|deny|remove) <name>`
   * Description: Modify the consent list.
   * Usage: `@consent (allow|deny|remove) all`
   * Description: Modify the consent list. `@consent allow all` will auto accept all consent requests regardless of deny list. `@consent deny all` will auto deny all consent requests regardless of allow list. `@consent remove all` will no longer allow/deny **all** and individual allow/deny lists will be used.
   
#### @remember
   * Usage: `@remember "Text"`
   * Description: Save a piece of information to memory. This action is not visible to witnesses.
   
#### @recall
   * Usage: `@recall`
   * Description: Output all stored memories.
   * Usage: `@recall <string>`
   * Description: Output all stored memories that contain a specific string.
   
#### @forget
   * Usage: `@forget "Text"`
   * Description: Forget any memories that contain the supplied text.
   
#### @compose
   * Usage: `@compose <object>`
   * Description: Opens a popup window with a text editor that allows you to write something on the object (if writable).
   
#### @readall
   * Usage: `@readall`
   * Description: Open a popup window that will show a clickable list of readable contents you are holding in the left pane. The right pane will display the written contents of the selected object.
   
#### @toggle
   * Usage: `@toggle (keepalive|linebreaks)`
   * Description: Toggle server/client settings on/off. Keepalive sends an empty string to the client every so often to prevent idle disconnects. Linebreaks will send an empty line to the client every so often to prevent idle disconnects.
   
#### whoami
   * Usage: `@whoami`
   * Descripton: Outputs your In-Character identity and shows where you are standing in the room.
   
#### @time
   * Usage: `@time`
   * Description: Shows the server's date and time.
   
#### @cont
   * Usage: `@cont` `@cont all`
   * Description: When reading a large blurb of text, some of it may be truncated to prevent spam. The `@cont` command is used to output another line of the text and `@cont all` will display the remaining text in its entirety.
   
#### @undress
   * Usage: `@undress`
   * Description: Remove everything you are wearing all at once. All removed items will be stored in a temporary list.
   
#### @dress
   * Usage: `@dress`
   * Description: Wear all items that were removed with the previous use of the @undress command. If the item is not in the room or in hand, it will be ignored. Items stored in containers are ignored.
   
#### @fadetoblack
   * Usage: `@fadetoblack`
   * Description: Use in private rooms to end a scene. Everyone present will see >The scene fades to black.>
   

