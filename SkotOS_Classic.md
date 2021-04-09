# SkotOS Classic

There's a problem with well-maintained code, pragmatic decisions and using the right tool for the job.

It's not very exciting.

There was a breathless moment where SkotOS had been just about cleaned up (thanks for that, Shentino!) and released to the world, mostly working.

And we've moved past that, by years now, and it's a great deal smaller, simpler, more focused and easier to use.

More boring, if you're the sort of software developer who fancies yourself to be a Victorian explorer in a pith helmet.

But through the magic of Git, you can have the original experience. You can even compare notes to what other explorers found before you and what they did with it.

## The SkotOS Classic Experience: The Hard Way

If you can't run the code, you're only guessing at what it does. But then you also don't need to actually get it running. You can check out any of the Git revisions below and quietly look through the code at that point.

It's kind of relaxing. I love the detective work of tracking down various ideas striped through the code. You only have source control for recent changes, so mostly you're reading the code itself for clues. I could do it all day.

Of course, you're left with the mystery, "did this work? did it *ever* work?" And it may itch at you that you can't answer it.

## The SkotOS Classic Experience: The Very Hard Way

You're reading further down this page, so I assume you're a glutton for punishment. Specifically, the kind of punishment where you set up ancient code and try to get it to work.

Before we had any other repos that used SkotOS, SkotOS got a lot of cleanup work, especially as regards its setup and deployment scripts. Noah Gibbs showed up and yanked out a bunch of old authentication code, most of it unused, and set up a terrible little micro-auth-server for local development.

But SkotOS was still basically SkotOS-plus-The-Gables, you could set it up without another "game" repo, nearly all the old WOE stuff was still sitting around, etc. You can configure it and set it up, but it's not the easiest experience. If you asked your Operations Department at your job to deploy this for you they would rate it as "pretty darn annoying" but not "completely unreasonable."

Note: you may want to check out the repo on a Linux machine, not a Mac, because some of the directories have names that differ only in uppercase/lowercaseness, so some filenames and WOE names don't quite work... Of course, there are other errors like that (the spawn Data object!) where somebody clearly mangled it before that, too. Oopsie!

## The SkotOS Classic Experience: The Really Quite Especially Hard Way

When Noah Gibbs showed up to work on SkotOS (roughly: September of 2020), Shentino had done a lot of work. A lot of effort had gone into making SkotOS boot cold, and it basically worked. You, too, could have the "Noah experience" of arriving on the scene of a DGD server that works (you should telnet in first!) but isn't at all easy to set up, and there's no reasonable configuration for how to put together a lot of the pieces. But most of the pieces are the same as now, roughly, and the server basically works and runs if you know how to tickle it.

If you're reading through the source, this is also in some sense the "sweet spot" for how complete it is. Older nonfunctional WOE objects haven't been removed. Ancient subsystems like the DGD-based UserDB haven't been hacked out, even though they hadn't been used for years, even then. Pathways have been carved through the ruins, but the ruins are still basically intact. The SkotOS repo was also still a game (The Gables) rather than a trimmed-down library for making games - the DGD Manifest system was still unwritten, and you pretty much needed everything to live in a single repo.

Also, the old docs were still in the SkotOS repo, not the SkotOS-Doc repo. So it's "complete" in that sense, too.

For this experience, clone the SkotOS repo and "git checkout skotos_classic".

## The SkotOS Classic Experience: The Fantastically Hard Way

The very first public SkotOS code came in the first commit to the [ChatTheatre/SkotOS Git repository](https://github.com/ChatTheatre/SkotOS). This code didn't work, not really. It had been "sanitised" &mdash; that is, it had had the things Skotos Tech didn't think it should release like people's personal chat-bodies and passwords removed.

But after that, it had to be explored, nursed back to health and gotten working. There are a lot of ways to do that. Want to compare your results to what Shentino did back in the day?

After cloning the repository you can "git checkout 4d2116d045d63c4c091e3fc30cd702cfc68fd28d", which is the very first commit.

## The Compleat SkotOS

So is that "all of SkotOS?" Not at all. In fact, there's no such thing.

SkotOS was a loose confederation of many games, built by many volunteers. ChatTheatre's SkotOS Git repo is the heritage of one part of that loose confederation, with the occasional bits of others thrown in and a fair bit of new work on top of it.

That "loose confederation" part means you couldn't get every functional piece of SkotOS in a single server, working, all at once, in the same way you couldn't have "all of Java" or "all of Ruby on Rails." SkotOS was a shifting, evolving group of games being built along the way by people who wanted or needed new features. And some new features were adopted, while others were lost to time.

Heck, some of the code isn't here because we don't have legal rights to distribute it any more. You've never even ***seen*** those parts, and it's unlikely you ever will.
