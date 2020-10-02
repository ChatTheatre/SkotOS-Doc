---
title: Local Mode
---

SkotOS deals with [users and logins](Users_and_Logins.md) differently, depending how its [instance file](instance_file.md) and UserDB process are set up.

Note that a lot of this is under-explored in practice. It's not clear how much of this actually works as I describe it.

## LOCAL_USERDB

If the instance file does ***not*** contain the setting "standalone" and a host and port are configured in [a UserDB settings file](instance_file.md), then SkotOS will try to connect to an external UserDB process... At least, for [those accounts that work that way](Users_and_Logins.md).

## LOCAL_THEATRE

If "standalone" is set in the instance file, SkotOS will operate in "standalone mode" or LOCAL_THEATRE mode. The console should contain the following:

```
UserAPI/AUTHD: No UserDB configured; standalone mode.
```

We've been unable to get this to work, frankly. It's hard to say if it's a useful setting we've misunderstood, a formerly-useful setting that was broken by time, or if it was an idea that never reached functionality.

If you get it to be working and useful, please document it here! We take pull requests!

## LOCAL_LOCAL

If there's no UserDB configured with a settings file ***and*** no standalone, the mode is called LOCAL_LOCAL and it's what we recommend for local development. All your [users and logins](Users_and_Logins.md) will use the DevUserD. Your DGD-style admin/developer users will be essentially the same as your 'normal' users.

This is the mode that SkotOS uses out of the box, after you clone the repository.

In production you'll want to set up thin-auth and a UserDB. Once that happens, your DevUserD admin users will be different from your normal users, including builders and staff, and so a developer will need both sorts of accounts &mdash; and they'll be basically independent of each other.
