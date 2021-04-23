# What's a StoryBuilder? (SkotOS Roles)

SkotOS is descended of old-style text MUDs. And like them, it has a bit of confusion about exactly who is allowed to do what. When you have volunteers writing code and doing staff-style maintenance for your game, and your game is also sort of a world, things can get a bit muddled.

## So Players Write Code?

Old MUDs have historically had a lot of problems with abuse - the staff were volunteers, the building and software dev were done by whoever could do it. Some abuse of power was going to happen no matter what. But some had an easier time with it than others.

There are technical measures that can help, and SkotOS uses many of them.

The first is to have multiple clear levels of authority. You don't want a random person to come up to your admin, volunteer, and instantly have full power over your whole player base. Multiple levels of authority make it easier to give a volunteer *some* power and let them earn trust.

Let's talk about how Skotos Tech made those divisions, and how SkotOS enables them.

(Note: this section could use a lot more technical detail. I'll add it as I find it.)

## Ordinary Players

Obviously regular players are a lot of your game's world. Technical "authority" is all well and good, but most of what a player sees day-to-day is other players.

In a technical sense, players can use "plain" verbs (no punctuation in front) and out-of-character verbs (e.g. @who, @allow). They get a certain amount of leniency to "make" things happen around them (e.g. emotes/socials.) But mostly SkotOS works hard to limit what a character can do ***to*** another character without permission. That means limiting how emotes work &mdash; if you can just write to the room, "BoboTheGriefer flings ketchup all over everybody's fancy clothes"... Well, it'd be nice if you had the option ***not*** to do that.

The [Consent System](../Story_Builder/ConsentSystem.md) is a lot of how this is accomplished in practice.

## Story Guides

Imagine recruiting players to help you run part of a game. Depending what you wanted to do, you could just say "hey, everybody online, here's what I'd like you to do in-game, let's go do it." In some games that happens.

Story Guides are a step above that. They have a class of verbs that start with ! that they can use. But basically they play the game from a player's point of view, using player-style commands.

## Story Hosts and Story Builders

A Story Host or Story Builder can create or edit [in-game objects](../Story_Builder/woe_workflow.md) and commands, making them significantly more capable than Story Guides.

This means they need more tools - not only commands that start with a +, but also the Tree of WOE, an editing interface to change and create in-game objects. SkotOS builds game content mostly in [SAM and MERRY](../Story_Builder/LanguageExplanation.md), in-game dynamic languages.

There's a lot of [documentation for Story Builders](../Story_Builder/) that will be important if you take this role.

I can't tell if StoryCoders are advanced StoryBuilders, doing underlying Merry work for game subsystems, or if they're more like developers.

(Note: there may be a technical distinction between Story Builders and Story Hosts, but so far I'm not finding it.)

## Staff, Developers, Administrators

Above this level, distinctions tend to get blurry. Mostly in SkotOS, and especially the way you're likely to use it, these are all *mostly* the same thing.

Skotos Tech had cross-game staff members &mdash; folks who were generally-speaking staff, but who didn't necessarily work on every specific game. SkotOS makes a distinction between somebody being staff in the UserDB, and having permissions to build on any one specific game. If you have only one game, this is probably all a bit more than you need. That's why you'll have to add the game's specific tag to your developer accounts in thin-auth &mdash; you have to mark yourself as a developer, but also as having permissions on your specific game.

It's possible to be staff with full permissions but not be a software developer &mdash; but such a staff member will still receive the ***permissions*** to write software, even if they never do so. Similarly, a software developer normally needs pretty extensive permissions.

An "administrator" was often a catch-all category in older MUDs which meant staff, maintainer, software developer and often other roles to boot. SkotOS mostly rolls this into the staff/developer category.

Anybody in this category can use all the commands mentioned earlier, and the Story Builder tools for editing WOE objects.

In addition, they can use [the SkotOS Wiztool](../Developer/SkotOS_Wiztool.md). There are internal permissions at the DGD level of SkotOS, which are complicated. But mostly SkotOS doesn't try to micromanage who gets what DGD permissions. Mostly a user has Wiztool access or they don't.

## Unix/MacOS Permissions

None of these permissions necessarily allow you to log into the host that contains the game server. That's entirely separate.

However, someone who has access on the Unix server may be able to parlay that into in-game privilege with some work. That means if you gave such access to ordinary players, you'd pretty certainly regret it.

Normally, the way to solve this is to give server access only to people in the staff/developer/admin category.

## Chat Lines

Many of these roles get in-game chat lines to coordinate with each other.

## Miscellaneous Other Roles

There are roles which I haven't tracked down yet. What's a "Story Teller?" Is that like a Story Host? Not sure. An "honoured guest" receives full Story Host command access, which suggests they're more of a builder than a dignitary. Is Story Plotter a separate level?
