# Developing with Jitsi

Jitsi is a recent addition to SkotOS, and quite heavy on the operational requirements. Here, you can find some notes on working with it.

Note that this is about writing new Jitsi capabilities and problems we've had when doing so: you can also read about [how Jitsi currently works with SkotOS](./JitsiIntegration.md).

## A Tiny Jitsi History

Jitsi is based on XMPP (a.k.a. Jabber), an old AOL-era instant message protocol. XMPP is used to exchange information to set up WebRTC (that's the audio and/or video chat) with one XMPP connection corresponding to one WebRTC connection, mostly. Jitsi has built a chatroom service (JiCoFo), a service for three-plus-person chat (Jitsi Videobridge) and a number of other components, some of which are meant for old-style video phones and we don't use them (e.g. JiGaSi.)

Jitsi was originally built as a SIP-based telephony service, and WebRTC was added later as the standard emerged. It's built by what was originally the company Blue Jimp, which was purchased by Atlassian and later purchased by 8x8. Blue Jimp and the core Jitsi team still seems to exist as an entity, based on online dev support and checkins.

## Jitsi's Security Model

In Jitsi, a [room only exists if somebody is in it](https://jitsi.org/security/). No participants? No room. That was standard for chat protocols of the XMPP era. Jitsi has two primary security models: everybody gets full rights ("unsecured"), or some people (["Hosts"](https://community.jitsi.org/t/permissions-of-users-and-admins/33086)) get moderator rights and there are optional non-moderator guests.

If everybody gets full rights ("unsecured"), that means anybody can kick anybody else out of a room. But it also means anybody can create a room, and you don't need a privileged moderator to be in every room. That's how we're initially building. But it means our participants can, if they know a little Jitsi and Javascript, do things they aren't supposed to &mdash; e.g. mute everybody, kick other guests, or set a password on the room so nobody can get in until they leave. So in the long term, we have to switch to the Host model rather than unsecured.

In the short term, we punted on that and used the "unsecured" model. We [tried quite hard](https://github.com/WebOfTrustInfo/prototype_vRWOT/issues/5) to make the Host model work. You can see a lot of it in the commit history of SkotOS/deploy_scripts/stackscript/linode_stackscript.sh, for instance. And in the attempted work in [the currently unused SkotOS-jitsi-admin repo](https://github.com/ChatTheatre/SkotOS-jitsi-admin).

## What Would a Better Model Look Like?

It's *possible* to give everybody an account dynamically (e.g. with JWT) but you still don't get any real granularity about what they can do: they get full moderator rights or only guest rights. So that's not much of an improvement.

Which leaves us with the last model: some people can have full rights, but anybody who *cannot* kick out or mute other participants needs to be a guest (or similar no-moderator-rights entity.)

Since in Jitsi rooms only exist if people are in them, and only moderators count as "people" to Jitsi, that means you need at least one non-guest participant (who can thus kick or mute people) for the room to exist. We don't want SkotOS human staff to have to be logged in for the room to exist. And that's really where the trouble starts.

So: we need a SkotOS admin-type account to be logged into any rooms we want to exist. And they need to be logged in all the time. If they ever log out, the room disappears. No pressure.

The simplest Jitsi security method that meets that need is "internal_hashed", which in this case means "there are a small number of manually-created accounts and everybody else is a guest." In the case of this proposed model, there would be *one* manually-created account.

Let's refer to that Jitsi account as "skotosadmin" and the program that stays constantly connected as SkotOS-jitsi-admin.

SkotOS-jitsi-admin attempted to connect as skotosadmin to a number of dynamically-created Jitsi rooms. It was based on [jxs](https://github.com/jitsi/jxs), a headless load-test program that did a similar thing with only anonymous guest accounts. Unfortunately, directly connecting and logging into xmpp with normal credentials... just didn't seem to work. After taking [a number of packet dumps from websocket connections with the web UI client](https://github.com/ChatTheatre/SkotOS-jitsi-admin/tree/master/packet_captures), it became clear that Jitsi was using a weird XMPP domain (easy to fix) and a fairly bizarre setup where it connected anonymously, and also with the skotosadmin account, and set up a session ID with skotosadmin to log in via the anonymous connection. However, trying to do what the skotosadmin websocket connection was doing... simply failed.

## Headless Jitsi: No Joy

The basic difficulty is that we wanted a nonhuman user, not running a browser, to hold Jitsi rooms open. Since Jitsi rooms only exist if at least on XMPP connection is attached to them, it seemed the obvious way. We're far from the first people to want this, though I can't find evidence that anybody is successfully doing what we want...

We [tried a number of approaches](https://github.com/WebOfTrustInfo/prototype_vRWOT/issues/5), including modifying jxs as described above, and a [Puppeteer-based approach](https://gist.github.com/saghul/179feba3df9f12ddf316decd0181b03e) that failed because running a headless Chrome is fairly memory-intensive... And the Jitsi API used in the browser seems to only be willing to log into a single chatroom at once, so to run ten chatrooms we'd need ten copies of headless Chrome. That's completely unreasonable.

It seems like the jxs-based approach *should* work. But for some reason, the xmpp client didn't seem to be doing the right thing. Perhaps it would have been possible to go to an even lower level than jxs and rebuild the key exchange (SASL SCRAM-SHA-1). Or perhaps there was some simple way to make the xmpp client do the right thing that I couldn't figure out. The obvious things all failed, even after fixing those bugs that I could identify after reading all the websocket exchanges [in captures of web-client logins](https://github.com/ChatTheatre/SkotOS-jitsi-admin/tree/master/packet_captures).

## Headless Jitsi: Future Possibilities

Jitsi seems fragile when you use it in unexpected ways. That makes it hard to predict what will work. It's not ***impossible*** that the jxs method would have worked with a little more cajoling, although it seems difficult. Are there any other possiblities?

Definitely.

For instance, jitsi-meet (the JS application) is built on top of lib-jitsi-meet, which is a nominally-headless Jitsi library, designed for creating your own Jitsi UI in Javascript (does anybody do that?)

It's clear that Jitsi-meet always keeps a maximum of one conference room open. It's not clear if that limitation is built into lib-jitsi-meet. And it looks like it *might* be possible to use lib-jitsi-meet headless, and it would definitely be possible to do it in Puppeteer.

The flip side of this is that lib-jitsi-meet is around 45,000 lines of Javascript. And Jitsi-meet, the normal app built on it, is around 150,000 lines. So exploring this could take a lot of time, work and code.

## Debian versus Docker

It's possible to install Jitsi from Debian packages instead of using Docker-Compose. As a rule, don't.

* The Debian packages are less up-to-date. For instance, when I first installed Jitsi they only supported BOSH instead of WebSockets
* Errors on the forums with Debian-based installs tended to get dev responses starting with "first install the latest using Docker, then test to see if this error still occurs."
* The Debian packages have, in my experience, had weird breakages that weren't present with Docker. If you check the Git history of the Stackscript, you'll see that I tried to use Debian packages first.

It's also easier to reliably get the exact same result with Docker than Debian - Debian allows (and encourages!) re-pushing the exact same package version number with new bugfixes, for instance. That's not good if you want to be able to repeatedly install the exact same thing and have it work.

I'm aware that Docker makes it harder to reach in and inspect Jitsi internals. My experience was that that was the lesser of the two evils.

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
