%META:TOPICINFO{author="nino" date="1067015700" format="1.0"
version="1.1"}% The components involved:

\* Merry's Popup() function. \* SAM's &lt;zsession&gt; tag

It is possible to store data on the server that you restore at the
moment you create a dynamic HTML page using SAM and Merry, by providing
the appropriate zid parameter.

For backward compatibility, the Popup() function still converts its
parameters into
name`value entries in the URL.  However if you provide =$zid: -1` as one
of the parameters, it'll generate a new zid value and *only* pass the
parameters along via the server.

The &lt;zession&gt; tag only looks at its own attributes, ignores any
global values there might be. If no `zid` attribute was given or an
invalid one is found, it creates a new `zid` variable to tag server-side
data onto. Any additional attributes found in the &lt;zession&gt; tag
will be added/changed in the server-side data.

Example:

      &lt;zession zid="$(zid)" body="$(body)" list="$(somearray)">
         &lt;zform zid="$(zid)">
         ...
         &lt;/zform>
      &lt;/zsession>

Here an existing zsession is reused if present, otherwise a new one is
created. We store the $body and $list variables in it. Then we start an
HTML form, for which we ask the server to remember the $zid variable so
that the session can be restored when the form is submitted, along with
any other form input data. This may seem pointless now, but remember
that the session may already contain other data than $body and $list and
this way we don't need to tell zform each time all those variables.

-- Main.ErwinHarte - 24 Oct 2003
