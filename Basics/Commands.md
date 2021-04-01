# Commands

SkotOS has a lot of commands that you can enter as text. It also has things that you can do with widgets and windows &mdash; but there's usually also a way to do those things with text.

## Nearby Communication

There are a lot of simple verbs that let you say or act so that folks nearby can see it.

~~~
> say "Thank you."
You say, "Thank you."
> tell butler "I love your towel."
You tell a butler, "I love your towel."
> yawn expansively
You yawn expansively.
> scratch my nose languidly
You scratch your angular nose languidly.
> eat my shoes
You cannot eat white cotton shoes.
~~~

As that last one indicates, there are limits to what your character can do in the game.

By picking your verbs appropriately you can make it clear that you're being loud, that you're picking up on something somebody else said, or... Well, all those things English verbs do: ask, question, state, tell, continue, reply, respond, grin, frown, sneer.

## Chatmode

Going to be talking a lot? Chatmode makes that simpler. You can type "chatmode" to just ***say*** what you type instead of ***doing*** what you type. If you want to do something other than talk ("go north") then you'll need to precede it with a slash (type: "/go north").

Instead of a slash-and-verb you can start with a question mark to ask or an exclamation mark to exclaim.

## Consent

Sometimes you would like to do something ***to*** somebody or they'd like to do something to you. SkotOS prefers using consent for those times:

~~~
> 
say to hound "you're a good friend."
You say to a small hound, "you're a good friend."
A small hound tries to bounce you. This requires your consent. Type "@allow a small hound" or "@deny a small hound".
> @allow a small hound
You allow a small hound to bounce Noah.
A small hound moves from the southwestern closet to Noah.
A small hound bounces around you playfully.
~~~

Verbs starting with the at-sign like that are out-of-character. "@allow" is a game-y sort of concept, so its verb gets punctuation, unlike "say" or "go".

## Adverbs

You can modify your verbs with adverbs, as you saw above. You can't just type any word, for reasons of preventing abuse. Wondering what adverbs are available? You can type an appropriate verb and then just the first character or two and it'll show you the adverbs that begin with that.

~~~
> yawn ab
Do you mean abandonedly, abasedly, abashedly, abatedly, abatingly, abbreviatedly, aberrantly, abeyantly, abhorrently, abidingly, abjectly, ably, abnormally, abominably, abortedly, abrasively, abruptly, absent-mindedly, absently, absentmindedly, absolutely, absorbantly, absorbedly, absorbently, absorbingly, abstainedly, abstentiously, abstinently, abstractedly, abstractly, abstrusely, absurdly, abundantly, abusedly, abusively or abysmally?
~~~

And adverbs combine with the other things you've seen, naturally.

~~~
> whisper quietly to the butler "Hm, a hound."
You move from the front door to the floor.
You whisper quietly to a butler, "Hm, a hound."
~~~

## Online Help

There's pretty extensive online help. "help clothing", "help proximity" and "help skills" are all good starting points.

"help concepts" and "help topics" give lists with quite a few entries.

You can type "tip" to get a tip. They'll also show up occasionally on their own, unless you turn them off.

## Punctuation Verbs

Verbs that are just words are in character: "say", "yawn", "hiccup".

Verbs that start with an @ are out-of-character but can mostly be used by anybody: "@who", "@allow".

If you work on the game itself (story builder, story teller, developer, staff) you can use verbs that start with +. "+unlock", "+traits", "+obname". Some of them require an object, just like other verbs: "+traits my trousers". There isn't usually online help on these in the help system. But if you type the verb by itself it will often give usage information.

Storyguides get commands with a ! in front ("guide commands.") Storyhosts, "honoured guests" and up get commands with + ("host commands" or "dev commands.")

## Commands for Developers

You can [also read about how commands are implemented in SkotOS](../developing/CommandsForDevelopers.md). As befits a text game of long standing, it's a complicated system that has tried a lot of different approaches.
