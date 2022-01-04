# Jitsi Integration with SkotOS

Jitsi is an open-source project that allows scalable audio and video chat with large numbers of users via WebRTC in the browser. It does a lot more than that, in fact.

SkotOS uses it for scriptable audio chat. Let's talk about how the two work together.

(NOTE: some of this isn't implemented as I write this. These docs should be updated in June 2021 or later.)

## MERRY Instructions

Want to mess with audio chat from Merry? Here's the quick version:

There's a client_control action that can be used to send a SKOOT code. You can send that action from Merry using Act(). It takes two arguments: an $id and a $val. The $id should be one of the codes below (80, 81 or 82). Each code below says what the $val should be.

80 (CHAT_SET_ROOM): set the Jitsi room. The value should be the name of the new Jitsi room. A user may only subscribe to one Jitsi room at a time. Jitsi room names don't distinguish between upper- and lowercase, and they ignore spaces (and punctuation?)
81 (CHAT_SET_MUTED): the value should be "true" or "false". Note that the user may always choose to be disconnected or unmuted and you can't override that. But if you mute them, you should later send an unmute.
82 (CHAT_SET_NAME): set the user's Jitsi display name (a.k.a. nickname.)

This will only work if the user is using a sufficiently-recent version of Orchil on a Jitsi-enabled SkotOS game. But it's normally harmless to send these codes when they're unsupported.

## MERRY Actual Instructions

Do you not use Merry that often? I'm a bit new to it too. Log into the game and there's a command-line tool that will let you evaluate little snippets of Merry code. It can be finicky, but it'll do this quite nicely.

~~~
+tool merry eval Act($actor, "client_control", $id: 82, $val: "DoesntReadExampleText"), 0
~~~

That will send message 82 ("change my Jitsi nickname") to the supplied value ("DoesntReadExampleText"). You can see the result of this in the Javascript console for your game client.

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
