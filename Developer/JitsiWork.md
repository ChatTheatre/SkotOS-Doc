# Working on Jitsi

Jitsi is a recent addition to SkotOS, and quite heavy on the operational requirements. Here, you can find some notes on working with it.

## Jitsi's Security Model

Jitsi is based on XMPP (a.k.a. Jabber), an old AOL-era instant message protocol. XMPP is used to exchange information to set up WebRTC (that's the audio and/or video chat) with one XMPP connection corresponding to one WebRTC connection, mostly. Jitsi has built a chatroom service (JiCoFo), a service for three-plus-person chat (Jitsi Videobridge) and a number of other components, some of which are meant for old-style video phones and we don't use them (e.g. JiGaSi.)

In Jitsi, a room only exists if somebody is in it. No participants? No room. That was standard for chat protocols of its era. Jitsi has two primary security models: everybody gets full rights, or some people get full rights and there are optional guests.

If everybody gets full rights, that means anybody can kick anybody else out of a room. That's no good for us. So we have to use that second model.

It's *possible* to give everybody an account dynamically (e.g. with JWT) but you still don't get any real granularity about what they can do: they get full moderator rights or basically no rights. So that's not much of an improvement.

Which leaves us with the last model: some people can have full rights, but anybody who *cannot* kick out or mute other participants needs to be a guest (or similar no-moderator-rights entity.)

Since in Jitsi rooms only exist if people are in them, and only moderators count as "people" to Jitsi, that means you need at least one non-guest participant (who can thus kick or mute people) for the room to exist. We don't want SkotOS human staff to have to be logged in for the room to exist. And that's really where the trouble starts.

So: we need a SkotOS admin-type account to be logged into any rooms we want to exist. And they need to be logged in all the time. If they ever log out, the room disappears. No pressure.

The simplest Jitsi security method that meets that need is "internal_hashed", which in this case means "there are a small number of manually-created accounts and everybody else is a guest." In our case, that's *one* manually-created account.

Let's refer to that Jitsi account as "skotosadmin" and the program that stays constantly connected as SkotOS Jitsi Admin.

## Debian versus Docker

It's possible to install Jitsi from Debian packages instead of using Docker-Compose. As a rule, don't.

* The Debian packages are less up-to-date. For instance, when I first installed Jitsi they only supported BOSH instead of WebSockets
* Errors on the forums with Debian-based installs tended to get dev responses starting with "first install the latest using Docker, then test to see if this error still occurs."
* The Debian packages have, in my experience, had weird breakages that weren't present with Docker. If you check the Git history of the Stackscript, you'll see that I tried to use Debian packages first.

It's also easier to reliably get the exact same result with Docker than Debian - Debian allows (and encourages!) re-pushing the exact same package version number with new bugfixes, for instance. That's not good if you want to be able to repeatedly install the exact same thing and have it work.

I'm aware that Docker makes it harder to reach in and inspect Jitsi internals. My experience was that that was the lesser of the two evils.

## Trying to Control Jitsi Headless: Puppeteer Isn't Great

Jitsi doesn't make it easy to control it headlessly. But that's exactly what we want to do with the SkotOS Jitsi Admin described above.

It's possible to use Puppeteer (headless Chrome) to keep a connection open. Two problems with that:

* Headless Chrome uses a lot of resources. It's simulating a full browser, Javascript and all.
* The normal in-browser Javascript Jitsi API can only connect to one chatroom at a time.

Between those, it means you'd be using a *ton* of memory to hold many rooms open. It would be really, really inefficient.

## Trying to Control Jitsi Headless: JXS

There's a load-tester that the Jitsi devs wrote to connect headless from a Node.js program. It's called JXS. JXS, on paper, looks *perfect*. It holds multiple connections open. It's designed to not take too many resources. It operates in XMPP but doesn't need WebRTC (or a browser) to be active.

The only difficulty is that it doesn't do much. And it can't use the Javascript API. And it basically exchanges raw, low-level chunks of XML directly on websockets. Well, and that it uses a weird Webpacker-based syntax to make all that happen, but that bit's not too hard to fix.

But that means if you want to add functionality that JXS doesn't currently have (as I write this: logging in with a password, for instance) then you're going to need some raw XML dumps to put into our JXS-like program.

So how do we get raw XML dumps?

## Dumping Network Connections: Google Chrome's Developer Tools

Bring up Chrome's developer tools (for me: command-alt-J). Pick the "network" tab, which will initially be empty.

Make sure you can see the list of network connections. This may require expanding the Dev Tools part of the window. You're looking for a message about hitting command-R to reload, or a list of different loaded files with status, type, etc.

Go to the URL you care about. For Jitsi stuff this will probably start with "meet" - you want to go through the same operations in the Jitsi UI that your headless app will need to do.

The front page of Jitsi Meet doesn't open a websocket. You'll probably need to go to a room to see what you want.

Once you get into the room, the thing you're looking for will have type "websocket" and a name like "xmpp-websocket?room=myroomname". Right-click on its name and "Save all as HAR with content".

Chrome HAR files are a thing, and you may be able to get a decent viewer. You can also look through the messages in the Google Chrome UI, though there are a ton of them and I wouldn't if I were you.

The list of messages, inside your HAR (JSON) file, is in a list called \_webSocketMessages. It shouldn't be hard to find in the file with text-search.

That's your list of sent and received XML messages that implement the XMPP connection. It should look like the same kind of XML messages that the SkotOS Jitsi Admin code uses.

You can put it into a text editor and sift that way. You can also extract things as JSON. Here's a Ruby example:

~~~
$ irb
> 2.7.1 :001 > require "json"
 => true
2.7.1 :002 > packet_data = JSON.parse(File.read "/Users/noah/Desktop/meet.testing-14.madrubyscience.com.har")
2.7.1 :003 > packet_data["log"]["entries"].select { |e| e["_resourceType"] == "websocket" }.size
 => 2
2.7.1 :004 > ws_entries = packet_data["log"]["entries"].select { |e| e["_resourceType"] == "websocket" }
2.7.1 :005 > ws_entries[0].keys
 => ["_initiator", "_priority", "_resourceType", "_webSocketMessages", "cache", "pageref", "request", "response", "serverIPAddress", "startedDateTime", "time", "timings"]
2.7.1 :006 > ws_entries[0]["_webSocketMessages"].size
 => 73
2.7.1 :007 > ws_entries[0]["_webSocketMessages"][0]["data"]
 => "<open to=\"guest.meet.jitsi\" version=\"1.0\" xmlns=\"urn:ietf:params:xml:ns:xmpp-framing\"/>"
~~~

## Failed Dumping Methods: SSLsplit, MITMProxy

There are multiple tools that will decode your HTTPS connections, allowing you to get the XML dumps you need. They're all pretty painful to use. SSLsplit and MITMproxy are probably the most common two as I write this. I had zero luck with either one, possibly because the instructions to set up Mac packet filtering didn't seem to be doing the right thing.

You can supposedly set up SSLsplit on the server side or the client side. There are a number of blog posts about how to do this. I'm not finding any great ones. [Here's an example](https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/intercepting-ssl-and-https-traffic-with-mitmproxy-and-sslsplit/).

There's probably a way to make them work. When I just tried them as written, they didn't. There are also other possible methods that looked maybe-promising (Charles Proxy, Wireshark.)

You may need to figure something out later. A lot of these instructions do *not* keep working long-term. MacOS changes what it allows and which tools work. Chrome changes what tools exist and what they do. So: you may need to figure out how to dump encrypted (HTTPS/WSS) websocket traffic in the future.
