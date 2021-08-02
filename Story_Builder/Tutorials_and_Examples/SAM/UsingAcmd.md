# SAM Tag: acmd

## Old Notes

---+ Purpose of document

This page exists to document the changes and plans of the Skotos Acmd project, which aims to improve the user-friendliness of the SkotOS platform.

The document is divided into three sections: What has been done, What will be done, and What can't be done.

---

---+ What has been done

   * Some of the more basic (and useful) commands have been updated to include link references to related commands. See commands list further down.
   * Related help nodes have been updated to make browsing the help documentation easier (linkable 'seealsos'). See help nodes list further down.
   * A SAM tag named &lt;helplink/&gt; has been added, to make help-topic-linking easier and cleaner.
   * The Marrach folder has been Acmd'ified and updated so that scroll items can be retrieved again.
   * The ascii::strlen() function was added, which enabled the ability to include atag and acmd's in ascii::table() content.

---

---++ Tips and tricks

Some tips and tricks in successfully putting in Acmd's are listed here.

   * Problem: When a command includes quotation (e.g. &lt;acmd cmd='smile "hello"'&gt;click to smile&lt;/acmd&gt;), there is an issue where " turns into &amp;quote; and ' simply breaks the skotosLink() functionality in Zealous (unsure/unverified on Alice).
   * Solution: Use %22 (percentsign22) instead of ".
      * The above solution is Zealous-only, and needs a better fix. Either a quote() and percent() command in Merry that is client-sensitive, or a bug-fix in Zealous to allow '.

---

---++ Determined conventions

Determined conventions is a list of "rules" to maintain as consistent a system as possible.

   * Linking:
      * Room descriptions should have <code>+goto room</code> links.
      * Woenames should have <code>+tool woe view</code> links.

---

---++ Completed commands list

The following commands have been updated with Acmd referencing:
   
   * Movement: follow, elude
   * Trading: accept, offer, refuse, revoke
   * Staff: TAS, +cobj, +obname, +chatlines, +opage

---

---++ Completed help nodes list

The following help nodes have been updated with Acmd referencing:

   * follow, elude, offer, give, go, enter, exits

---

---+ What will be done

   * All of the basic commands will be updated to include link references to related commands or actions. 
   * All of the help nodes will be updated with helplink references.
   * Staff-related commands (TAS in particular) will be updated.

---

---+ What can't be done

This is more or less a wishlist on things we wish to do, but cannot at this point. 

   * Update 'offer' output to include Acmd referencing.
   * Fix % and " hacks to be cross-browser-compatible.
   * Update "accept" output (no arguments) to do acmd'ing.

---

---++ Completed can't-be-done's (by Nino or someone)

   * Update @page to include Acmd referencing for accepting/rejecting pages and similar.

---

-- Main.KalleAlm - 06 Jul 2005
