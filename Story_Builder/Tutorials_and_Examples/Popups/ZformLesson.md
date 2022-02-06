# Zform Lessons

### What is it?

Basically, web interaction can be divided in two distinct events:
   1. displaying and...
   2. doing.
   
Displaying is simply a matter of opening up a page. Doing is a matter of the user requesting that something happens, and the server doing it.

Lots of ways of handling this have been written in history. PHP handles it by not handling it, which works surprisingly well. You just put some PHP code at the top that looks for "action" variables and if they're set, do the thing. ASPX handles it by separating it into two separate systems. The actual HTML part and the server-side code part. This works fairly well, but I prefer the PHP method. Skotos handles it via something called ZFORMS.

Zforms are regular forms, but they have an additional functionality called action tags.

When you submit a zform, the page is actually loaded twice. First the action page, and then the redisplay page. The new page that is the result of the action.

### Action Tags

The action tag, thus, has an indicator saying which page to redirect the user to.

A simple example:

```
    <zform>
        <action>
            $["";
            $obname = common::lookup($name: $person);]
            <redirect propob="$(this)" prop="index" obname="$(obname)"/>
        </action>
        <b>Type in someone's name to get their woename:</b>
        <input name="person"/><br/>
        <input type="submit"/>
    </zform>
```

Traditionally, the \<action\> tag has some Merry at the top, and then ends with a \<redirect\> tag.

What the example does basically is, it asks for a person\'s name. When you submit, it grabs the object for that person and redirects to a new page, "index".

And includes the obname="\$(obname)" argument.

The index page in turn now has \$(obname) set to what the action figured out.\<br/\> Let\'s complete that example so it makes more sense.

```
    -- html:index in Some:object --
    {? | $(obname) |
        That person's woename is: $(obname)
    |
    <zform>
        <action>
            $["";
            $obname = common::lookup($name: $person);]
            <redirect propob="$(this)" prop="index" obname="$(obname)"/>
        </action>
        <b>Type in someone's name to get their woename:</b>
        <input name="person"/><br/>
        <input type="submit"/>
    </zform>
    }
```

If obname is defined, name it otherwise create the submittal button then reload the page with the carried over variable: obname. Which in turn will display the name now.

Since the redirect actually runs the same script for this page but makes the change of having a defined obname? Exactly. The redirect might just as well go "elsewhere". E.g. in the item builder, you click Submit Modifications after setting density etc. and the page is reloaded. The action in that case sets the values in the object, and then just reloads the page.

### HTTP GET

Do you know how HTTP GET works? It's very simple. People like making dynamic pages that can reflect stuff. But web pages are different from regular applications because there is nothing "stored in memory" for a particular user.

That is, when you go to google.com, it won't know a thing about you, except by looking at cookies and such.

When you type in "restaurants that I like" in the search field and hit enter, google knows that because of HTTP GET. It is the concept of storing variables in the URL of the page.

\<http://google.com/\> has no variables.

\<http://google.com/search?forwhat=restaurants that I like\> has one variable.

It has 'forwhat' set to 'restaurants that I like'. forwhat just being a placeholder such as \$object, etc. forwhat could be "actor=Mortalis:hosts:a:angelo" as well. When you add multiple variables to a HTTP GET statement, you separate them using &.

To recap, variables start with a question mark (page?vars), contain equals sign (varname=varvalue) and are separated using & (var1=val1&var2=val2&var3=val3)

This stuff is good to know because you sometimes have to write it manually. When you want to link a user to some other page, you might want to include information for that page to display properly. For example, if we're at page 2 in a schedule in the events system, you might have something like this: \<a href="display_schedule?page=3"\>next page\</a\>.

Or you might store it using month and day instead. So you might be in january (month 1) and you have \<a href="display_schedule?month=2"\>next month\</a\>. But that's outside of zforms. Just figured it's related. :)

### Two Important Notes

One important thing.. Two actually

The ""; thing in the Merry segment in that example. When you do \$\[something\] in SAM, it expects a return value that is outputted.

If you do \$\[code\] then it might grab the value of the first thing being evaluated. Or it might grab the value of the last thing evaluated. Or it might even cause an error.

Hence why you normally put ""; at the beginning, to say "Grab this (nothing) as the results." Otherwise you will see pages with e.g. '1' somewhere randomly placed.

Second thing. This is not good:

```
    <zform>
        <action>
            $["";
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code 
            lots of code lots of code lots of code ]
            <redirect propob="$(this)" prop="index" obname="$(obname)"/>
        </action>
        ....
    </zform>
```

For two reasons. 
   1. Big properties are bad.
   2. More than a few lines of code should be moved into a separate merry:lib script.
   
```
    <zform>
        <action>
            $[::calc_universe()]
            <redirect propob="$(this)" prop="index" obname="$(obname)"/>
        </action>
        ....
    </zform>
```

And I didn't include ""; because by calling a merry lib, something is ALWAYS returned, even if that is nil. SAM treats nil and "" as the same in terms of
displaying. You'll see if you look at old Kalle-code that I didn't follow that advice. But I do in new code.

### Angelo is handed a Task

Alright. So, when you have time, write up 
   1. a +calendar command that allows one single thing: it allows me to type +calendar 07 22 "Tell Angelo about zforms.", and stores that in my body, as a 2d map (I can explain what that is).
   2. a simple page (just put it in e.g. Mortalis:staff:angelo:events or wherever) that displays, if any, my stuff for today.\<br/\> This doesn\'t even include zform stuff yet. Actually, make that 3d map. Example: I do +calendar 07 22 "Eat dinner." Your code does this, in turn:

```
    MAP is the name of the map variable. YEAR is the result of get_year().
    1. Does MAP exist? If not, create it as ([ YEAR : ([ 7 : ([ 22 : ({ "Eat dinner." }) ]) ]) ])
    2. It does exist? Is MAP[YEAR] nil? If yes, set MAP[YEAR] to ([ 7 : ([ 22 : ({ "Eat dinner." }) ]) ])
    3. It does exist? Is MAP[YEAR][7] nil? If yes, set MAP[YEAR][7] to ([ 22 : ({ "Eat dinner." }) ])
    4. It does exist? Is MAP[YEAR][22] nil? If yes, set MAP[YEAR][7][22] to ({ "Eat dinner." })
    5. It does exist? Add "Eat dinner." to the array.
```

The property name for that map might be sys:events:map btw. If you want to follow the conventions.

Basically we just want it to be possible to grab "all entries for this day" ultra-fast-like, by doing Arr(Map(Map(Map(\$actor.\"sys:events:map\")\[YEAR\])\[MONTH\])\[DAY\]) 

Doing it that way, we will always get an array, even for entries where the year, the month, and/or the day are nil. And in the case of the monthly, we just grab the Map() for \[YEAR\]\[MONTH\] and step through its entries. So the system will be as fast as it possibly can be, evenif people are hammering on the various "next week, previous week, next month, next year" etc buttons. Alright. After that I'm thinking we'll make some way to submit an event (to your private calendar).

### CSS Stuff

But we havent touched the display aspect and I thought most had a css thing. Look at this:

```
    {? | $(UDat.Host) |
    <html>
        <head>
            <title>My page</title>
            <style>
            $(this.sam:css)
            </style>
        </head>
    < body > (should be no spaces, but TWiki sucks)
    < /body >
    </html>
    |}
```

That is a typical "being constructed" page. The {? thing goes from the very top to the very bottom and basically stops regular peeps from seeing stuff until it's done. 99.999% of all my pages start out exactly like that. The \$(this.sam:css) deal loads the property "sam:css" from the object you're in. \<head\> has information about the page. nothing in \<head\> is displayed to the user. I mean, \<title\> puts the title of the window, but that\'s different.

\<body\> is where everything that is on the body of the page is located. CSS is a topic all of its own. I'll give you a sort of beginner's crash course, a short one, but CSS is a very consistent thing, so once you know how to set one thing, all it is a matter of is going to google and searching for e.g. "css h1" or "css div" etc.

Open up some random object, create html:index in that object, and then put in this:

```
    X[S]
    <html>
        <head>
            <style>
            $(this.sam:css)
            </style>
        </head>
    < body > (should be no spaces, but TWiki sucks)
        <h1>Hello world!</h1>
        This is my place.
    </body>
    </html>
```

Once you've saved that, lemme know which object you put it in.

Mortalis:staff:angelo:testcss.

Now go to this URL: \<http://mv.skotos.net/SAM/Prop/Mortalis:staff:angelo:testcss/Index\>

Now open up sam:css in the same object.

Write X\[S\] at the top, and then add this:

```
    --- Quoted text from Kalle: ---
    body \{
        font-family: Helvetica, Arial;
        font-size: 10pt;
    \}
    --- Quoted text ends ---
```

When you've saved that, reload that page. The testcss one I mean.

Add:


```
    h1 \{
        font-size: 18pt;
        border-bottom: solid red 1px;
    \}
```

Why are there two fonts in the family?

You can make a list of preferred fonts. If the user doesn't have Helvetica, use Arial. Not pretty, but you get the point. Let's change the bg and fg colors.

```

    body \{
        font-family: Helvetica, Arial;
        font-size: 10pt;
        background: #003;
        color: #fff;
    \}
    h1 \{
        font-size: 18pt;
        border-bottom: solid red 1px;
    \}
    
```

\#fff is essentially f (red) f (green) f (blue). Regular RGB hexadecimals.

This page might actually be a lot more helpful than I am for CSS,. now that you got the basics of it: \<http://www.w3schools.com/css/default.asp\>
