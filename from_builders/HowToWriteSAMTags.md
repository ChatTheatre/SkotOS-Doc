# How to Write SAM Tags

### DEFINING A SAM TAG IN SAM

First, let's imagine that I'm building one of those 90's cyberpunk cities where -- if you have the right implants -- your vision is augmented with computer-fed overlays and such. In each room, then, I want to be able to include a bit of text that is only shown if the looker has been properly augmented. Normally I would add something like this at the end:

<pre>
  {? | $looker.augmentation |
       Your NeuroSparc III DangerSensor [tm] is highlighting the dark alley in warning shades of orange.
</pre>

This is a little cryptic, but not bad. However, as your game grows, chances are the SAM would start getting increasingly complex, and after a while you might get tired of all the curly braces and want to do simply:

<pre>
  <zell:augmentation>
       Your NeuroSparc III DangerSensor [tm] is highlighting the dark alley in warning shades of orange.
  </zell:augmentation>
</pre>

This can now be accomplished by creating a very simple tag with the tag name 'zell:augmentation' and a single property:

<pre>
  Property 'sam:global:tag' in object 'Zell:Tags:augmentation' =
    X[S] {? | $looker.augmentation | $(tag-content) }
</pre>

Whenever the SAM engine encounters <zell:augmentation> in mid-SAM, it will insert this definition in its place, with $(tag-content) holding whatever the original tag contained.

You get the idea.

### DEFINING A SAM TAG IN MERRY

If you are comfortable with Merry, chances are you would rather work with that. Luckily, this is done almost exactly the same way as with SAM. Your property name starts with merry: rather than sam: and the value is Merry (X[M]) rather than SAM (X[S]) but that's about it.

The augmentation tag above, for example, would instead read:

<pre>
  Property 'merry:global:tag' in object 'Zell:Tags:merry-augmentation' =
    X[M]
      if ($looker."augmentation") {
         return $(tag-content);
      }
      return nil;
</pre>

In general, if there is a Merry script 'merry:global:tag', its return value is used as the tag content. Your script can return a string or SAM. If there is no script, the contents of the defined tag are passed through untouched.

### DEFINING A POST-PROCESSING TAG IN MERRY

Once you've defined a few of these tags you run into a very obvious problem, which is that $(tag-content) contains SAM rather than text. Since tags often want to do some kind of text processing -- capitalize the contents, say -- this is rather a flaw. SAM is a binary format; how do you capitalize it? No string operations work on SAM.

In Merry you are used to doing UnSAM() on SAM before you work with it, but in these tag definitions the preferred method is to implement the -post phase of the tag expansion, *where the SAM has already been converted to text*.

As an example, consider the system tag 'atag', which is used to tag a string for profile (i.e. Alice/Zealous colour scheme) purposes. You might see it used like this in a game:

<pre>
  To the <atag tag="direction">north</atag> you see an endless marsh.
</pre>

This tag has always been hard-coded in LPC, but there's no reason why that should be true now. In fact, it can be done in Merry with extreme ease:

<pre>
  Property 'merry:global-post:tag' in object 'Zell:Tags:atag' =
    X[M]
     if ($(local:tag) == nil) {
       error("expecting 'tag' attribute to SAM tag 'atag'");
     }
     return TAG($(tag-content), $(local:tag));
</pre>

and that's it.

Go to it!

-- ParWinzell - 21 Jul 2003

----

### WHEN/CASE CONSTRUCTS 

From: Par Winzell <zell@alyx.com><br>
Date: Mon Dec 30, 2002  11:04:13 AM US/Pacific<br>
To: skotos-seven@skotos.net<br>
Subject: [skotos-seven] Case in SAM<br>
Reply-To: skotos-seven@skotos.net<br>

Hey folks,

There is now a when/case construct:

<pre>
  {?when | something | case1 | result1 | case2 | result2}
</pre>

with * having the special effect and the string nil matching a nil value. Thus e.g.

<pre>
  {?when | $actor.skill:juggling |
      1 | You fail miserably! |
      2 | You do OK. |
      3 | You juggle beautifully. |
      * | Your juggling property is set to a bad value.}
</pre>

would describe how an actor succeeds in juggling...

Zell

---

{? equal | $(this.cup:number) | 1 |cup|cups}

Means: If the property this.cup:number is equal to 1, write cup, else  write cups

-- Main.CheskY - 27 Nov 2004
---


### SAM SYNTAX

From: Par Winzell <zell@skotos.net><br>
Date: Thu Oct 17, 2002  8:18:09 PM US/Pacific<br>
To: skotos-seven@skotos.net<br>
Subject: [skotos-seven] SAM syntax<br>
Reply-To: skotos-seven@skotos.net<br>

Hey folks,

One of our long-term projects was to make SAM easier to work with. In a small step in this direction we've finally enabled some of the syntax simplifications we've long dreamed of. This simplification targets the often-used 'if' tag specifically. In its simplest form, it automatically rewrites e.g.

<pre>
  <if val="$(this.skyisclear)"><true>You see stars in the sky.</true><false>The night sky is clouded over.</false></if>
</pre>

to

<pre>
  {?|$(this.skyisclear)
    |You see stars in the sky.
    |The night sky is clouded over.}
</pre>

(the whitespace is my own and is not generated automatically).

There is additional testing done for the cases when the predicate is the reference 'equal', 'greaterthan', 'lessthan' or 'range'. For example the rather hideous

<pre>
  <if val="$(range val="$(system.hour)" from="5" to="18"><true>
    The sun is shining.
  </true><false>
    It's dark outside.
  </false></if>
</pre>

becomes

<pre>
  {? range | 5 | 18
    | The sun is shining.
    | It's dark outside.
  }
</pre>

Again, the whitespace is my own -- right now whitespace is discarded by the XML parser, which is probably the next target for SAM prettifying, whenever we do it. Right now it automatically collapses to

<pre>
  {? range | 5 | 18 | The sun is shining. | It's dark outside. }
</pre>

which isn't bad either.

----

### MERRY INTO SAM

From: Par Winzell <zell@skotos.net><br>
Date: Tue Mar 4, 2003  9:01:15 PM US/Pacific<br>
To: skotos-seven@skotos.net<br>
Subject: [skotos-seven] putting Merry into SAM<br>
Reply-To: skotos-seven@skotos.net<br>

Hello folks,

After much hither and fro I think we've got a way to put Merry nicely into SAM... I finally opted for the most practical and least confusing syntax I could manage. To embed some Merry in SAM, encapsulate it in $[] brackets. As a simple example,

<font face="Courier" size="-1">
  You are on a road. There are $[this.stars_in_sky + this.moons_in_sky] celestial bodies above you.
</font>

Where this example adds two properties together, you could place Merry of any complexity. I'm too tired tonight to come up with an interesting example, but this is pretty much -the- way to make complex and dynamic descriptions.

If the piece of Merry does not end in a semi-colon or a right-brace, it is assumed to be a 'statement' rather than an 'expression'. This means the code needs to explicitly return a value. For example,

<pre>
  You are on a road. There are
    $[
        if (this.stars_in_sky > 5) {
            return "lots of";
        }
        if (this.stars_in_sky > 0) {
            return "a few";
        }
        return "no";
     ]
  stars in the sky.
</pre>

More later.. urgh.. think I am re-acquiring the virus from last week. Good night.

Zell

Sneakily added by -- Main.PeterCorless - 04 Dec 2003
