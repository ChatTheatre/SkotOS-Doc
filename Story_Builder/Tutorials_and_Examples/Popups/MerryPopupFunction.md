# Merry Function: Popup

### Old Notes

There is a new Merry function called Popup(). If the user is running an official Skotos client (Java, Zealous or Alice) this will cause a browser window to pop up for the player, filled with whatever content you specify. For example,

```
  Popup($actor, $actor."base:environment", "painting");
```

will popup a window to $actor, displaying the contents of the property html:painting in the actor's current room.

Unsurprisingly, popup window content is written in HTML, and we're lucky in that SAM -- which we normally use to write text description -- is closely related to HTML.

There is no limit upon the number of arguments for Popup().-- Main.DocBrown - 02 Jan 2007

The following, inserted into the HTML document, will cause the popup to move (x1, y1) and resize to (x2, y2) in size. You must add 'script language="Javascript"' between '<' and '>' at the beginning of it and 'script' (also between '<' and '>') at the end of it in order for it to work.) 

```
   moveTo(x1,y1)
   resizeTo(x2,y2)
</script>
```
* -- Main.DocBrown - 25 Jan 2007 

As an example, we might have...

```
  room.html:painting = X[S]
   &lt;BODY bgcolor="black"&gt;
    &lt;IMG src="http://www.mydomain.com/images/painting.jpg"/&gt;
   &lt;/BODY&gt;
```

which wouldn't look good -- it'd be up to you to do cook up some nice looking stylesheet, or something -- but you get the idea.

---

Of course, SAM can do more than just represent static HTML. SAM for popups can use the same active tags that it does for text... we can pull values from the room and apply logic to the values. For example, display different paintings depending on the light level of the room...

```
  room.html:painting = X[S]
   &lt;BODY bgcolor="$(this.painting:bgcolor)"&gt;
    {? | $this.base:dark |
      &lt;IMG src="http://www.mydomain.com/images/painting-in-dark.jpg"/&gt; |
      &lt;IMG src="http://www.mydomain.com/images/painting-in-light.jpg"/&gt;
    }
   &lt;/BODY&gt;
```

Again, you get the basic idea.

---

These popups are built on top of a general way for browsers to fetch the value of a property from an in-game object. This system a special form of the basic URL syntax you are used to from browsing the web. A URL that fetches the property 'html:painting' from 'Zell:Rooms:PaintingRoom' and displays it would look like, ==/SAM/Prop/Zell:Rooms:PaintingRoom/painting== and that is in fact precisely the URL constructed by the Popup() call in Merry, above.

The special format of this URL allows us to use relative linking in a very handy way. Let's add a hyperlink to our example:

```
  room.html:painting = X[S]
   &lt;BODY bgcolor="$(this.painting:bgcolor)"&gt;
     &lt;A href="painting-closeup"&gt;
        {? | $this.base:dark |
          &lt;IMG src="http://www.mydomain.com/images/painting-in-dark.jpg"/&gt; |
          &lt;IMG src="http://www.mydomain.com/images/painting-in-light.jpg"/&gt;
        }
     &lt;/A&gt;
   &lt;/BODY&gt;
```

You will note that the 'href' attribute of the link is a relative URL. The browser will automatically expand this to ==/SAM/Prop/Zell:Rooms:PaintingRoom/painting-closeup== and so if you click on the link, you will be taken to the contents of the property 'html:painting-closeup' in the same object as 'html:painting' is already defined. This makes it easy to create links that navigate between web properties in a single object.

---

For further complexity, Merry can now be embedded anywhere in SAM -- either to be included in the stream of text, or as attribute value to another SAM tag. For example, let's say we want to automate the example above with different paintings even further. We could dynamically create the URL from the derived property base:light-category:

```
  room.html:painting = X[S]
   &lt;BODY bgcolor="black"&gt;
    &lt;IMG src='$[
       /* MERRY: add the light category into the middle of the URL */
       "http://www.mydomain.com/images/painting-" +
       $this."base:light-category" +
       ".jpg"
    ]'/&gt;
   &lt;/BODY&gt;
```

Things get -really- exciting when you begin to use the zform and zact SAM tags, which allow a Merry script to be executed on the server when the user hits a submit button or a link. This means popups can contain controls, such as start story configuration panels.

More on that later.

* -- Main.ParWinzell - 05 Mar 2003

Just a heads up that things like:

  &lt;redirect propob="Neoct:Staff:Actions:+mhelp"/> 

- will croak over the plus-sign (+). Not sure if this is fixable?
Regardless, if you bump into issues when you try to refer to woenames
with odd chars in them, you might want to rename the objects to
something like "Neoct:Staff:Actions:mhelp" (without plus-sign).

* -- Main.KalleAlm - 24 Aug 2003

A few more options related to Popup() but not exactly the same:

   * <b>anyurl</b> - upon examine or look of this detail, the URL will be displayed in a popup window - referenced at QuickSummaryDescriptionSystem
   * <b>arturl</b> - upon examine or look of this detail, the graphic-only URL in the desc will be displayed in a popup window, and the window will be resized - referenced at QuickSummaryDescriptionSystem
   * <b>SKOOT_ANYURL</b> - upon execution the external (Non-Skotos) URL will be displayed in a popup window - used in a merry script commonly via a verb - an example of the format is: Act($actor, "client_control", $id: SKOOT_ANYURL, $val: "http://www.random_url.html");

* -- Main.AngeloMangione - 28 Oct 2010

