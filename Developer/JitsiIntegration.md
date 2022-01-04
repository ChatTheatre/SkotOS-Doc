# Jitsi Integration with SkotOS

Jitsi is an open-source project that allows scalable audio and video chat with large numbers of users via WebRTC in the browser. It does a lot more than that, in fact.

SkotOS uses it for scriptable audio chat. Let's talk about how the two work together. This is a developer background document. We also have a [how to set up Jitsi](../setup_jitsi.md) document.

Last updated: Jan 2021.

## MERRY Instructions

Want to mess with audio chat from Merry? Here's the quick version:

There's a client_control action that can be used to send a SKOOT code. You can send that action from Merry using Act(). It takes two arguments: an $id and a $val. The $id should be 80, and the val should be a structure of JSON arguments.

This will only work if the user is using a sufficiently-recent version of Orchil on a Jitsi-enabled SkotOS game. It's harmless to send these codes when they're unsupported &mdash; they don't do anything if Jitsi isn't set up or isn't working for some reason.

Here are the JSON fields and what they do:

domain (string): the hostname of the Jitsi server (may change, rarely.)
name (string): the Jitsi name/nickname of the user (should not change.)
room (string): the Jitsi room to connect to, if present.
roomPrefix (string): prefix to add before the room name (currently unused/ignored.)
muted (string, values "muted" or "unmuted"): whether to mute/unmute the user, at the server's request.
jwt (string): jwt token permitting access to the specified room. If room is given, jwt should be as well.

Note that nearly all fields are optional in at least some cases. If name, domain, muted, room, etc. don't change, it's fine to simple not supply them. Some (e.g. muted) never have to be supplied at all if they retain their default initial value.

## MERRY Actual Instructions

Do you not use Merry that often? I'm a bit new to it too. Log into the game and there's a command-line tool that will let you evaluate little snippets of Merry code. It can be finicky, but it'll do this quite nicely.

~~~
+tool merry eval Act($actor, "client_control", $id: 80, $val: "{ 'muted': 'muted' }"), 0
~~~

That will send message 80 (Jitsi info) with the supplied value (server-mute the user). You can see the result of this in the Javascript console for your game client.

Note that if you send a CHAT_SET_MUTED (81) message, you won't be able to unmute yourself with the buttons. You'll have to send another server message to unmute.

(The comma-zero at the end may look a bit odd. And it is. Due to how +tool merry eval works, you have to use an expression that returns a value. So when calling a function like Act that does not, we add a return value afterward. You don't need it when evaluating anything that returns a value, or when writing Merry in other cases. Basically, "+tool merry eval" is odd and this is one case where you notice that.)

## SkotOS-to-Browser Integration

We extend the long-time SkotOS model of Alice commands ("SKOOT" commands, see skoot/include/client.h) to include some Jitsi-specific messages. A specific Jitsi user can only be in a single chatroom at one time, and we can control a few other Jitsi-specific things about them:

* what chatroom/channel the user is subscribed to
* whether the user is currently muted by the SkotOS server
* user registration information like their Display Name

Note that the user may mute *themselves* or choose not to subscribe to Jitsi, and this will override anything the server sends. No user should be opted into audio chat without their permission. However, a server-sent mute *should* mute a user who is not otherwise muted. Similarly, when the server-sent mute is lifted, the user's own mute setting is restored, whether that's "muted" or "unmuted."

"Not connected to Jitsi" is also a perfectly good setting on the user's part and shouldn't/can't be overridden by the server-sent SKOOT events.

## Improving Security

You can read more about [Jitsi work and improvements](./JitsiWork.md) here if you'd like some history of how we came to these decisions and/or would like to improve our Jitsi integration model.
