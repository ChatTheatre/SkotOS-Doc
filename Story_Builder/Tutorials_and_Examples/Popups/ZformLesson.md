%META:TOPICINFO{author=\"kallea\" date=\"1153599180\" format=\"1.0\"
version=\"1.2\"}% %META:TOPICPARENT{name=\"WebHome\"}%

# Zform Lessons

### What is it?

\<font color=blue\>Kalle\</font\>\<br/\> \<font
color=green\>Angelo\</font\>\<br/\>

\[Logging begins: Sat, 22 Jul 2006 17:26:56 GMT\]\<br\>

\<font color=blue\>Basically, web interaction can be divided in two
distinct events\... 1) displaying, and 2) doing.\<br/\> Displaying is
simply a matter of opening up a page. Doing is a matter of the user
requesting that something happens, and the server doing it.\<br/\> Lots
of ways of handling this have been written in history. PHP handles it by
not handling it, which works surprisingly well. You just put some PHP
code at the top that looks for \"action\" variables and if they\'re set,
do the thing. ASPX handles it by separating it into two separate
systems. The actual HTML part and the server-side code part. This works
fairly well, but I prefer the PHP method. Skotos handles it via
something called ZFORMS.\<br/\> Zforms are regular forms, but they have
an additional functionality called action tags.\<br/\> When you submit a
zform, the page is actually loaded twice. First the action page, and
then the redisplay page. The new page that is the result of the
action.\<br/\>\</font\>

### Action Tags\<br\>\<br\>

\<font color=blue\>The action tag, thus, has an indicator saying which
page to redirect the user to.\<br/\> A simple
example:\<br/\>\<br/\>\</font\>

    --- Quoted text from Kalle: ---
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
    --- Quoted text ends ---

\<font color=blue\>Traditionally, the \<action\> tag has some Merry at
the top, and then ends with a \<redirect\> tag.\<br/\> What the example
does basically is, it asks for a person\'s name. When you submit, it
grabs the object for that person and redirects to a new page,
\"index\".\<br/\> And includes the obname=\"\$(obname)\"
argument.\<br/\> The index page in turn now has \$(obname) set to what
the action figured out.\<br/\> Let\'s complete that example so it makes
more sense.\<br/\>\<br/\>\</font\>

    --- Quoted text from Kalle: ---
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
    --- Quoted text ends ---

\<font color=green\>If obname is defined, name it otherwise create the
submittal button then reload the page with the carried over variable:
obname. Which in turn will display the name now.\<br/\>\</font\> \<font
color=blue\>Kalle nods twice.\<br/\>\</font\> \<font color=green\>Since
the redirect actually runs the same script for this page but makes the
change of having a defined obname?\<br/\>\</font\> \<font
color=blue\>Exactly. The redirect might just as well go
\"elsewhere\".\<br/\> E.g. in the item builder, you click Submit
Modifications after setting density etc. and the page is
reloaded.\<br/\> The action in that case sets the values in the object,
and then just reloads the page.\<br/\>\</font\>

### HTTP GET\<br\>\<br\>

\<font color=blue\>Do you know how HTTP GET works?\<br/\>\</font\>
\<font color=green\>Not a clue.\<br/\>\</font\> \<font color=blue\>It\'s
very simple. People like making dynamic pages that can reflect
stuff.\<br/\> But web pages are different from regular applications
because there is nothing \"stored in memory\" for a particular
user.\<br/\> That is, when you go to google.com, it won\'t know a thing
about you, except by looking at cookies and such.\<br/\> When you type
in \"restaurants that i like\" in the search field and hit enter, google
knows that because of HTTP GET.\<br/\> It is the concept of storing
variables in the URL of the page.\<br/\> <http://google.com/> has no
variables.\<br/\> <http://google.com/search?forwhat=restaurants> that i
like\' has one variable.\<br/\> It has \'forwhat\' set to \'restaurants
that i like\'.\<br/\>\</font\> \<font color=green\>forwhat just being a
placeholder such as \$object, etc?\<br/\>\</font\> \<font
color=blue\>Exactly. forwhat could be \"actor=Mortalis:hosts:a:angelo\"
as well.\<br/\> When you add multiple variables to a HTTP GET statement,
you separate them using &.\<br/\> To recap, variables start with a
question mark (page?vars), contain equals sign (varname=varvalue) and
are separated using & (var1=val1&var2=val2&var3=val3)\<br/\> This stuff
is good to know because you sometimes have to write it manually.\<br/\>
When you want to link a user to some other page, you might want to
include information for that page to display properly. For example, if
we\'re at page 2 in a schedule in the events system, you might have
something like this: \<a href=\"display_schedule?page=3\"\>next
page\</a\>.\<br/\> Or you might store it using month and day
instead.\<br/\> So you might be in january (month 1) and you have \<a
href=\"display_schedule?month=2\"\>next month\</a\>.\<br/\> But that\'s
outside of zforms.\<br/\> Just figured it\'s related. :)
\<br/\>\</font\>

### Two Important Notes\<br\>\<br\>

\<font color=blue\>One important thing..\<br/\> Two actually.\<br/\> The
\"\"; thing in the Merry segment in that example.\<br/\> When you do
\$\[something\] in SAM, it expects a return value that is
outputted.\<br/\> If you do \$\[code\] then it might grab the value of
the first thing being evaluated. Or it might grab the value of the last
thing evaluated. Or it might even cause an error.\<br/\> Hence why you
normally put \"\"; at the beginning, to say \"Grab this (nothing) as the
results.\<br/\> Otherwise you will see pages with e.g. \'1\' somewhere
randomly placed.\<br/\> Second thing. This is not good :
\<br/\>\</font\>

    --- Quoted text from Kalle: ---
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
    --- Quoted text ends ---

\<font color=blue\>For two reasons. 1) Big properties are bad. 2) More
than a few lines of code should be moved into a separate merry:lib
script.\<br/\>\</font\>

    --- Quoted text from Kalle: ---
    <zform>
        <action>
            $[::calc_universe()]
            <redirect propob="$(this)" prop="index" obname="$(obname)"/>
        </action>
        ....
    </zform>
    --- Quoted text ends ---

\<font color=blue\>Better.\<br/\> And I didn\'t include \"\"; because by
calling a merry lib, something is ALWAYS returned, even if that is
nil.\<br/\> SAM treats nil and \"\" as the same in terms of
displaying.\<br/\> You\'ll see if you look at old Kalle-code that I
didn\'t follow that advice. But I do in new code.\<br/\>\</font\>

### Angelo is handed a Task\<br\>\<br\>

\<font color=blue\>Alright. So, when you have time, write up 1) a
+calendar command that allows one single thing: it allows me to type
+calendar 07 22 \"Tell Angelo about zforms.\", and stores that in my
body, as a 2d map (I can explain what that is).\<br/\> 2) a simple page
(just put it in e.g. Mortalis:staff:angelo:events or wherever) that
displays, if any, my stuff for today.\<br/\> This doesn\'t even include
zform stuff yet.\<br/\> Actually, make that 3d map.\<br/\> Example: I do
+calendar 07 22 \"Eat dinner.\<br/\> Your code does this, in
turn:\<br/\> This might scare you. I don\'t think so but it might. :)
\<br/\>\</font\>

    --- Quoted text from Kalle: ---
    MAP is the name of the map variable. YEAR is the result of get_year().
    1. Does MAP exist? If not, create it as ([ YEAR : ([ 7 : ([ 22 : ({ "Eat dinner." }) ]) ]) ])
    2. It does exist? Is MAP[YEAR] nil? If yes, set MAP[YEAR] to ([ 7 : ([ 22 : ({ "Eat dinner." }) ]) ])
    3. It does exist? Is MAP[YEAR][7] nil? If yes, set MAP[YEAR][7] to ([ 22 : ({ "Eat dinner." }) ])
    4. It does exist? Is MAP[YEAR][22] nil? If yes, set MAP[YEAR][7][22] to ({ "Eat dinner." })
    5. It does exist? Add "Eat dinner." to the array.
    --- Quoted text ends ---

\<font color=green\>it checks if those exist already in case we had 7 22
Tell Kalle to look at this and then wanted to add 7 23 Did he
look.\<br/\>\</font\> \<font color=blue\>The property name for that map
might be sys:events:map btw. If you want to follow the
conventions.\<br/\> Basically we just want it to be possible to grab
\"all entries for this day\" ultra-fast-like, by doing\<br/\>
Arr(Map(Map(Map(\$actor.\"sys:events:map\")\[YEAR\])\[MONTH\])\[DAY\])
\<br/\> Doing it that way, we will always get an array, even for entries
where the year, the month, and/or the day are nil.\<br/\> And in the
case of the monthly, we just grab the Map() for \[YEAR\]\[MONTH\] and
step through its entries. So the system will be as fast as it possibly
can be, evenif people are hammering on the various \"next week, previous
week, next month, next year\" etc buttons.\<br/\> Alright. After that
I\'m thinking we\'ll make some way to submit an event (to your private
calendar).\<br/\>\</font\>

### CSS Stuff\<br\>\<br\>

\<font color=green\>But we havent touched the display aspect and I
thought most had a css thing.\<br/\>\</font\> \<font color=blue\>Good
point.\<br/\> Look at this: \<br/\>\</font\>

    --- Quoted text from Kalle: ---
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
    --- Quoted text ends ---

\<font color=blue\>That is a typical \"being constructed\" page. The {?
thing goes from the very top to the very bottom and basically stops
regular peeps from seeing stuff until it\'s done.\<br/\> 99.999% of all
my pages start out exactly like that.\<br/\> The \$(this.sam:css) deal
loads the property \"sam:css\" from the object you\'re in.\<br/\>
\<head\> has information about the page. nothing in \<head\> is
displayed to the user. I mean, \<title\> puts the title of the window,
but that\'s different.\<br/\> \<body\> is where everything that is on
the body of the page is located.\<br/\> CSS is a topic all of its
own.\<br/\> I\'ll give you a sort of beginner\'s crash course, a short
one, but CSS is a very consistent thing, so once you know how to set one
thing, all it is a matter of is going to google and searching for e.g.
\"css h1\" or \"css div\" etc.\<br/\> Open up some random object, create
html:index in that object, and then put in this:\<br/\>\</font\>

    --- Quoted text from Kalle: ---
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
    --- Quoted text ends ---

\<font color=blue\>Once you\'ve saved that, lemme know which object you
put it in.\<br/\>\</font\> \<font
color=green\>Mortalis:staff:angelo:testcss.\<br/\>\</font\> \<font
color=blue\>Now go to this URL:
<http://mv.skotos.net/SAM/Prop/Mortalis:staff:angelo:testcss/Index>.\<br/\>
Now open up sam:css in the same object.\<br/\> Write X\[S\] at the top,
and then add this:\<br/\>\</font\>

    --- Quoted text from Kalle: ---
    body \{
        font-family: Helvetica, Arial;
        font-size: 10pt;
    \}
    --- Quoted text ends ---

\<font color=blue\>When you\'ve saved that, reload that page.\<br/\> The
testcss one i mean.\<br/\>\</font\> \<font color=green\>Why are there
two fonts in the family?\<br/\>\</font\> \<font color=blue\>Add:
\<br/\>\</font\>

    --- Quoted text from Kalle: ---
    h1 \{
        font-size: 18pt;
        border-bottom: solid red 1px;
    \}
    --- Quoted text ends ---

\<font color=blue\>You can make a list of preferred fonts. If the user
doesn\'t have Helvetica, use Arial.\<br/\> Not pretty, but you get the
point. Let\'s change the bg and fg colors.\<br/\>\</font\>

    --- Quoted text from Kalle: ---
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
    --- Quoted text ends ---

\<font color=blue\> \#fff is essentially f (red) f (green) f (blue).
Regular RGB hexadecimals.\<br/\> This page might actually be a lot more
helpful than I am for CSS,. now that you got the basics of it:
<http://www.w3schools.com/css/default.asp>.\<br/\> But what you need
most is a reference page of some sort. I know these by heart nowadays so
I have no idea where a good one might be.\<br/\>\</font\> \[Logging
ends: Sat, 22 Jul 2006 18:44:10 GMT\]
