---
sort: 1
---

# Parser Intro

In chat theatre, the parser is the special code that collects what you enter at the command line and translates it into some meaningful action. The parser is robust and allows for complex commands, but before diving into [creating your own commands](././Tutorials_and_Examples/Verbs/VerbsPart1BasicSetup.md), you should first have some basic understanding of the capabilities and limitations of the parser.

## Parser Grammar

The parser's **grammar** is the set of rules that determines how the user's input is translated into the output string. In general, inputs follow the syntax of:

`verb [adverb (optional)] [arguments (optional)]` or `[adverb (optional)] verb [arguments (optional)]`

### Verbs

Each verb is an object that contains the rules for what arguments can be used with that verb. The +verb command is a quick and easy way to see where the verb object is and what the rules are for it (exmaple: +verb run). 

See also: [built-in verbs](./Verbs.md).

### Adverbs

Adverbs are optional descriptors that are used to add flavor to a command. For example, `sigh` conveys a different tone than `sigh sarcastically`. Adverbs are contained in multiple alphabetized lists (see the Socials:AdvCats:Evokes folder in Tree of Woe). The +adverb command is used to view, add, and remove adverbs.

See also: [built-in adverbs](./Verbs.md).

### Other Arguments

* Direct/Indirect Object(s) - Some verbs accept one or more targets. Targets include objects or details of objects. Examples: `shake my fist` or `shake my fist at sky` or `shake my left fist and my right fist at sky`. Targetted objects can be direct ('my fist') or indirect ('sky'). An indirect object (iob) differs from an direct object (dob) in that it is preceeded by a preposition. The verb object defines how many objects can be targeted and how they are targeted (directly or indirectly).
* Prepositions - Indirect objects are required to be proceeded by a preposition. Prepositions include with, using, at, over, under, beside, close to, away from, etc.
* Evoke - The evoke is the spoken word enclosed in quotation marks.

### Exceptions

When creating a verb, it is possible to overwrite the grammar and use your own code to parse the inputted text. This is done by flagging the verb as **raw**. 

You can also alter the outputted string using code. See [the advanced verb tutorial](././Tutorials_and_Examples/Verbs/VerbsPart2AddingCodeToCommands.md).

Lastly, if you want to just SAY something without using any verbs/adverbs, you can simply enclose words in quotes and press enter:

```
"I like apples"
You say, "I like apples."
```

## Special Commands

Special commands are verbs that begin with a symbol (@, +). 

* `@commands` - Out of Character (OOC) commands start with the @ symbol. These commands can be used by anyone and usually provide information and perform a function that does not display any output in the client. See also: [built-in @commands](./At_Commands.md).
* `+commands` - Staff commands start with the + symbol. These commands can only be used by users with dev privileges. See also: [staff +commands](./Staff_Plus_Commands.md).

## Examples

Some examples of accepted inputs include, but are not limited to:

| Syntax | Example Input | Example Output |
|-----------------|-------------------|-------------------|
| *verb* | run | You run. |
| *verb adverb* | run leisurely | You run leisurely. |
| *adverb verb* | leisuresly run | You leisurely run. |
| *verb "evoke"* | run "Wheee!" | You run, "Wheee!" |
| *verb adverb preposition object* | run leisurely over ground | You run leisurely over the ground. |
| *verb preposition object and object adverb* | run over ground and sidewalk leisurely | You run over the ground and the sidewalk leisurely. |
| *"evoke"* | "I like apples" | You say, "I like apples." |
|-----------------|-------------------|-------------------|




