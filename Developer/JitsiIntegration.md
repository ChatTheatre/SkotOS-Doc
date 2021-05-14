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

## SkotOS-to-Browser Integration

We extend the long-time SkotOS model of Alice commands ("SKOOT" commands, see skoot/include/client.h) to include some Jitsi-specific messages. A specific Jitsi user can only be in a single chatroom at one time, and we can control a few other Jitsi-specific things about them:

* what chatroom/channel the user is subscribed to
* whether the user is currently muted by the SkotOS server
* user registration information like their Display Name

Note that the user may mute *themselves* or choose not to subscribe to Jitsi, and this will override anything the server sends. No user should be opted into audio chat without their permission. However, a server-sent mute *should* mute a user who is not otherwise muted. Similarly, when the server-sent mute is lifted, the user's own mute setting is restored, whether that's "muted" or "unmuted."

"Not connected to Jitsi" is also a perfectly good setting on the user's part and shouldn't/can't be overridden by the server-sent SKOOT events.

## Jitsi Security Model

SkotOS uses an [unsecured](https://jitsi.org/security/) Jitsi installation. That way rooms can be created dynamically on-demand. To avoid users abusing their automatically-granted moderator powers, we hide the Jitsi UI as much as possible.

This means we don't expose the full normal web UI via NGinX on meet.&lt;game-domain&gt;, though we ***do*** expose the Jitsi external JS API since that's needed for SkotOS-based games to use Jitsi.

But we can hook into the Jitsi API to get simple information like muting, subscribing to rooms and user lists in a fairly straightforward way.

## Improving Security

You can read more about [Jitsi work and improvements](./JitsiWork.md) here if you'd like some history of how we came to these decisions and/or would like to improve our Jitsi integration model.
