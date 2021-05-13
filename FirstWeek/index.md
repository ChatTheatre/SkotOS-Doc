---
sort: 2
---
# Your First Week of SkotOS

Say you want to build a new game with SkotOS. What will you do first? How do you get started?

This includes your literal first week, but also how you keep getting better, digging deeper and learning more about SkotOS, one part at a time.

## Before You Do Anything

[Why Text?](../Basics/Why_Text.md)

## Before You Set Up Anything

Before you set up your own SkotOS game, you'll probably want to play one online. There are several choices. The [basic SkotOS commands](Basics/Commands.md) may help you with this.

[Castle Marrach](http://www.skotos.net/games/marrach) is the biggest and oldest of the SkotOS games. Active players are generally online and would love to help you learn the ropes and settle in. Alternately you could play on [Allegory of Empires](https://allegoryofempires.com/) or [Multiverse; Revelations](https://home.multirev.net/).

Once you've played a bit and seen what a SkotOS game can be, you'll probably want a place to try out silly things. I know I like to mess with a command parser to see what it does. So: you might enjoy [The Gables](https://gables.chattheatre.com). There's very little game there, and rarely any other players. But if you want somewhere quiet make gestures to yourself and generally understand what's going on, it's a fine choice.

Once you have a feel for what SkotOS ***is***, you can create your own little micro-world.

## Setting Up SkotOS For Yourself

Do you use a Mac? If so, good news - you can fork [The Gables GitHub repo](https://github.com/ChatTheatre/gables_game), then clone it and run gables_game/deploy_scripts/mac/setup.sh to get a local copy running on your Mac. You can log in with (by default) literally any account/password combination and it will assume you're not only legit, you deserve full admin right to the game server. Don't expose The Gables in this mode to the Internet, in case you were wondering.

For more details, we have a [pretty extensive setup page](../setup.md) with the details. Or you can read the Mac setup script, for full details in Bash-script form.

(You can also just clone the_gables and run that script. But then you'll just want to clone it as soon as you have any changes you want to check in.)

This setup is great for test-driving SkotOS and for doing local development.

(Want to do the same on Windows or Linux? Good at Windows or Linux? We'd love alternate setup scripts. But we don't routinely use those platforms, so we'd need somebody who would keep the script maintained! A broken script helps nobody...)

## Setting Up SkotOS So Other People Can Use It

(You can skip this step if you like. But at some point you'll need it.)

If you don't have a Mac or you want other people to be able to use your game, you'll want SkotOS running on a server.

Under gables_game/deploy_scripts/gables_stackscript.sh is... a Linode StackScript, basically a shellscript designed to fully create a new running VPS with The Gables running and everything working.

If you're using Linode, you can copy-and-paste that script into a new StackScript. Then start a new instance based on it. It will ask you for a domain name (an Internet game needs that!) and other information like, say, a master password (use a nice secure one.) Then it will set everything up on a nice new server which exposes itself as a login and account-creation server, a game server, and a Jitsi (audio chat) server.

We have [documentation on how to do that setup](../setup_vps.md) if you'd like more details.

## Changing Locations

The first and simplest way to change things in your game is with the Tree of WOE. It's your basic tool for adding and changing [WOE objects](../Story_Builder/woe_workflow.md).

So [let's go through how to do that](changing_locations_example.md).

## Better Objects: Making a Wearable Towel

SkotOS has some systems to check your objects and make sure you've done what you need to. This is called "proofing." Let's go through [an example of using +proof for proofing and make an item of clothing](./TowelTutorial.md).

(The example is a towel, though you could make a different piece of clothing if you like.)
