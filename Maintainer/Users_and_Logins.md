---
title: Users and Logins
---

SkotOS handles most user management via [thin-auth](https://github.com/ChatTheatre/thin-auth).

You can get a full breakdown of the authentication layers, past and present, [here](Developer/DevAuthentication.md).

## Thin-Auth Users

A thin-auth user can be created as "staff" or "developer". That makes some difference, but the most powerful access is set per-game.

In your instance file, there's a setting called "access". The value of that setting (e.g. "gables", "jonkichi", "lovecraft") is the name of the game-specific staff setting for each SkotOS game. More specifically, if you set an access flag in SkotOS with that same name ("gables" if the instance file has "gables", etc.) then that user will get wiztool access on that game.

So the same user can have an account on a single thin-auth instance, but multiple games can use that thin-auth instance and give that user differing levels of access. This was useful for Skotos-the-company's setup with multiple games, but may be more than you need for a single-thin-auth, single-game setup.

The reason you care is this: when you make a new developer user, be sure to give them the correct access flag or they won't be able to do some kinds of building in your game.
