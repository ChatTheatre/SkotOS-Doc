---
title: Exploring and Debugging SkotOS
---

SkotOS is deep, complex, and has been worked on by many hands over many years. It's huge, sprawling and fascinating. It ran (and runs!) at least one text game for over 20 years. It has older features in varying states of deprecation, and it has many different implementations of many of its features. Some things don't work. Some things have pretty clearly never worked. There's just a lot there.

And much like an ancient city covered in the jungle, that can make exploration very rewarding! The trick is getting into the interesting parts where you can study, take notes, and find interesting loot.

This guide can help.

## Local Setup

If you've [set up your SkotOS for local development](setup.md), the most important debugging tool is an admin/dev-type account, such as the "admin" and "bobo" accounts in the default local setup. Note that you're sometimes prevented from logging in as "admin", probably because it's a root-type ultra-privileged account. So you're going to need a non-admin dev account for a lot of this.

You can log into the [telnet and binary ports](SkotOS_Ports.md) as an admin user with almost no other setup. You don't need a body, a production account or all sorts of other things. On the less-fortunate side, you don't ***have*** a body necessarily and you can't easily see what normal users of SkotOS are doing. This is a sort of back-door login for playing with DGD code at the lowest level.

And if you learn DGD from some less complex setting like [eOS](https://github.com/ChatTheatre/eOS), that's good news &mdash; this is the mode that works like you're used to.

Once you've logged in, you have the ability to execute small snippets of code with the "code" command. For instance, if you type `"/usr/System/initd"->shutdown()` then you can shut down SkotOS.

You can use the "compile" command to recompile objects. If you've changed the code, that won't just automatically change the behaviour of the game. You have to compile the program. If you "compile /usr/System/initd.c", for instance, that will update the code to initd to match the most recent code in the .c file.

You can also recompile all users of a library with the "upgrade" command. If you "upgrade /lib/string.c" it will recompile /lib/string and update all users of it.

## Changing Local Passwords

The default local setup uses a single authentication method, which is called DevUserD. A full, production SkotOS game has DevUserD for its most privileged developers but users a UserDB (such as thin-auth) for everything else. For local development you don't want to have to manage one of those.

To change local passwords or developer passwords, log in as a developer on the developer telnet port (10098 by default.) The use this command:

    code "/usr/System/sys/devuserd"->set_password("username", "password")

This can create a new user if "username" isn't already a developer. It can also change the password of an existing user. It's not a great idea to leave extremely-privileged accounts on the highly-insecure default passwords.

## Updating Code and Statedumps

If you restore from a statedump (the skotos.database file), then the code and data comes from that statedump file. If you haven't recompiled your initd after your last changes then it's still not recompiled. Whatever set of users are in devuserd, they're still the same ones after you restore.

This means that changing code in initd can be fiddly. The initd is normally only loaded, and its create() function called, on a new, cold boot. If you update create() for a long-running daemon process like System/initd or System/sys/devuserd, it may never be called again. After all, that object was created long ago. In some sense the initd for Castle Marrach, a long-running SkotOS game, was called over twenty years ago and never will be again.

One alternative is to define a method called patch(). You'll see them in many places. When an object is ***recompiled***, its patch() method will be called. This is done via the SkotOS object manager, registered with the Kernellib.

## Recompiling Code and Running Privileged Code

If you're using the wiztool via the telnet port, the "compile" command has no security restrictions. That's important, because you can't normally just write code to compile objects in the System directory - try it with `code compile_object("/usr/System/initd")` and you'll discover you can't. But cd into /usr/System and type `compile initd.c` and it'll do it without complaint.

Using the "compile" command will let you update LPC files dynamically. To update other file types (e.g. SAM files to generate HTML) you may need to change them and cold-boot or find a way to dynamically import new versions (e.g. TreeOfWoe builder interface.)

Note: as of early Oct 2020, the TreeOfWoe builder interface doesn't work by clicking on it in the browser. There may be an alternative way to use it, but I haven't found it (yet?)

## Finding Images and Other Files

There's a great Unix command called "Find" that I love. You can easily locate files if you know the extension, including image files. To find a particular filename pattern under the current directory:

~~~
find . -name "*.xml"
~~~

Image files are a bit more subtle - you'd like to be able to find everything called "foo.gif" and "FOO.JPEG" and so on. So you'd like to match against upper- and lowercase both, and you'd like to match a variety of different things, not just one.

Here's a find incantation that will do that:

~~~
find . -iname "*.gif" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png"
~~~

## Dumping LPC Objects on The Gables

The live version of The Gables uses slightly different code and data than the checked-in GitHub version. It's essentially the original live source of this information, but needs objects to be appropriately "scrubbed" of things like user data before they can join the public source code.

I've added the vault tool (skoot/usr/System/sys/tool/vault) to The Gables, which permits object dumping for sync'ing with the public code.

To use that tool for dumping objects, you give it an operation and wait for it to complete:

```
code "/usr/System/sys/tool/vault"->dump_single_object("Theatre:Theatres:Gables")
code "/usr/System/sys/tool/vault"->save_subdir("Theatre")
code "/usr/System/sys/tool/vault"->save_subdir("")
```

The final line of code above is a "save everything" instruction. Everything is saved under skoot/data/vault in subdirectories according to registered object names.

Here's what The Gables shows on your network connection when you attempt a full object dump:

```
> code "/usr/System/sys/tool/vault"->save_subdir("")
$37 = nil
> Can't dump Base:Actions, no state root (lpc: /base/sys/actions)
Can't dump Base:DerivedBase, no state root (lpc: /base/sys/base)
Can't dump Base:DerivedDetails, no state root (lpc: /base/sys/details)
Can't dump Base:DerivedInitial, no state root (lpc: /base/sys/initial)
Can't dump Base:Init, no state root (lpc: /base/initd)
Can't dump Core:DerivedCore, no state root (lpc: /core/sys/handler)

> Can't dump Generic:Init, no state root (lpc: /usr/Generic/initd)
Can't dump HTTP:Init, no state root (lpc: /usr/HTTP/initd)
Error dumping :LinkZone:MaleLarge
> Can't dump SID:Daemon, no state root (lpc: /usr/SID/sys/sid)
Can't dump SkotOS:API, no state root (lpc: /usr/SkotOS/sys/api)
Can't dump SkotOS:Assistd, no state root (lpc: /usr/SkotOS/sys/assistd)
Can't dump SkotOS:Merry, no state root (lpc: /usr/SkotOS/sys/merry)
Can't dump SkotOS:Profiler, no state root (lpc: /usr/SkotOS/sys/profiler)
Can't dump SkotOS:Sync, no state root (lpc: /usr/SkotOS/sys/sync)
Can't dump TextIF:Info, no state root (lpc: /usr/TextIF/sys/infod)
Can't dump Theatre:Init, no state root (lpc: /usr/Theatre/initd)
Can't dump Tool:Config, no state root (lpc: /usr/Tool/sys/config)
Error dumping :UserAPI:InitCan't dump UserAPI:UDatD, no state root (lpc: /usr/UserAPI/sys/udatd)
Finished
```

Here are errors from the system log during that same time:

```
Oct  7 07:41:23 ** error:Bad argument 1 for kfun sizeof [caught]
error:     /usr/System/sys/tool/vault
error: 719     -                              work
error: 249     -                              dump_single_object
error:  90     -                              write_object
error:  35     /usr/SID/lib/stateimpex        export_state
error: 242     -                              export_element
error: 242     -                              export_element
error: 249     -                              export_element
error: 175     -                              raw_value
error:  95     -                              execute_call
error:     /base/obj/thing#1759           LinkZone:MaleLarge
error: 548     /base/lib/thing                query_ascii_initial_property
error:  65     /usr/System/lib/sys_auto       mixed_to_ascii
error:     /usr/System/sys/textdata
error: 116     -                              private_to_ascii
error:     /usr/SkotOS/data/merry#-1
error: 273     /usr/SkotOS/data/merry         query_source
error: 164     -                              expand_to_source



Oct  7 07:44:46 ** error:node UserAPI:Init unknown [caught]
error:     /usr/System/sys/tool/vault
error: 719     -                              work
error: 249     -                              dump_single_object
error:  90     -                              write_object
error:  26     /usr/SID/lib/stateimpex        export_state
error:     /usr/SID/sys/sid               SID:Daemon
error: 192     -                              get_root_node
error: 185     -                              get_node
Oct  7 07:44:51 ** debug:memory_watcher: 78 MB in use; 204 MB allocated
```

And you can check vault_error.log, but it will only contain records of the same "can't dump" messages from your console, saying they have no state root.

## Destroying Objects with the Vault Tool

In addition to dumping objects, the Vault tool can destroy them, individually or in subdirectories. For instance, let's say on cold-boot SkotOS I've been bothered by the fact that I hate fish, and SkotOS has some of them. Ew.

I can delete them from the vault ***before*** boot easily (`rm -rf skoot/Shared/Unsorted/S7/Pendragon/Animals/Fish`). But if I had a running copy of SkotOS they would still potentially be in memory and in my statedumps. Ew! No fish in my statedumps!

Luckily they can be removed, one at a time or all at once.

```
code "/usr/System/sys/tool/vault"->destruct_object("Shared:Unsorted:S7:Pendragon:Animals:Fish:chub")
code "/usr/System/sys/tool/vault"->destruct_subdir("Shared:Unsorted:S7:Pendragon:Animals:Fish")
```

## Installing the Vault Tool

Have an old SkotOS game you'd like to get LPC objects from? The Vault tool would be a great choice... But the game doesn't have it.

To install the vault tool, you'll need to copy it into place and compile it from the wiztool interface. That means you need a developer account, and to telnet in on the developer telnet port.

Once you do, you'll need to copy some files into place from [ChatTheatre/SkotOS](https://github.com/ChatTheatre/SkotOS):

* [skoot/usr/System/sys/tool](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/usr/System/sys/tool)
* [skoot/usr/System/lib/tool](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/usr/System/lib/tool)
* [skoot/usr/System/sys/tlsd.c](https://github.com/ChatTheatre/SkotOS/tree/master/skoot/usr/System/sys/tlsd.c)

You should also make the skoot/data/vault directory, initially empty.

Copy those files into place. Then compile the tool from the wiztool interface:

```
> cd /usr/System/sys/
/usr/System/sys
> compile tlsd.c
$0 = </usr/System/sys/tlsd>
> compile tool/vault.c
$1 = </usr/System/sys/tool/vault>
```

Now, with luck, you can export LPC objects as normal with the vault tool.

## LPC Object Export to Git

If you have a directory of LPC XML object files, we'd recommend you put everything under a "vault" directory. So if you're exporting into skoot/data/vault, you might plan to make your Git repository in the "data" directory, or copy out just the files you want into a new empty directory's "vault" subdirectory.

When you're trying to put them in Git, the "gh" command-line Git tool can help. If you have Homebrew you can use "brew install gh" to install it.

```
brew install gh  # Install it
gh auth login    # Hook up gh to your github account - it'll tell you a series of steps to do this via browser
```

Once it's installed you can create new Git repos and upload them with a few commands:

```
cd /my/directory/of/objects
gh repo create lots-of-lpc-objects --private  # this is the repo name on GitHub. You can also use --public for public.
git init  # Make this local directory a Git repo
git add Theatre Lovecraft  # Add the files by name, or just "git add ." for all files
git commit -m "Add my exported LPC objects"  # Here's a commit message
git remote add origin git@github.com:saraht45/lots-of-lpc-objects.git  # This should match the repo name earlier
```

After you've created the repo that way, you can use "git add" then "git commit" then "git push" to make later changes to the same repo:

```
cd /my/directory/of/objects
git add .  # Tell Git you'd like to add all the changed files
git commit -m "Updates to my LPC objects"
git push   # This will upload everything to GitHub
```

## Bootstrapping an Old Game Statedump

It's possible that at some point you'll get a statedump of an old Skotos (or other DGD) game. This poses the question, "what if the game is mostly secured from the outside, but I control the interpreter, the statedump and the file system?" In theory this means that you have utter control. In practice, it may be challenging to log in as administrator and look around. Here are some hints.

DGD Statedump files are neither compressed nor encrypted. This means you can see and change raw strings pretty easily.

SkotOS's devuserd uses a very simple user_to_hash object where each dev user's name is mapped to the hexadecimal version of the md5 hash of their username plus their password. Here's how that looks when written in SkotOS-flavoured LPC such as Merry:

    user_to_hash["user7"] = to_hex(hash_md5("user7" + "the_password"));

If you have access to a local-to-you SkotOS server you can write an object which inherits from /lib/string, calculates that value and sends it to you or writes it to a file. Then you can put it into the right place in the statedump.

How do you "put it into the right place?" If you calculate the hash, it will be the same length as every other md5 hash. That means that if you can find a user/password pair with privilege (for old SkotOS games that might be: dworkin, christophera) then you can calculate a new hash for that name with a trivial password. Then you can search through the statedump and replace one with the other.

How do you search through the statedump and replace one with another? A good text editor can do it. So can your general-purpose language of choice. I use Ruby, myself. Here's one way to do that (substitute your own large hash values):

    Noahs-MBP-2:3000 noah$ irb
    2.7.0 :001 > dump_contents = File.read("skotos.database"); nil
     => nil
    2.7.0 :002 > dc = dump_contents.gsub("first_large_hash", "second_large_hash"); nil
     => nil
    2.7.0 :003 > File.open("skotos_mod.database", "wb") { |f| f.write(dump_contents) }

The big challenge is that a statedump is a large binary file, so some editors will choke and die. That's why I use Ruby, and you might do something similar in another language. Make sure after patching that your new statedump is byte-for-byte the exact same size as the old one.

Note that if you have a privileged account from that game, none of this is needed. Once you have that, you can use the "set_password" trick to add a new developer account from your first privileged account.
