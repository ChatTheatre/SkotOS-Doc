---
title: Games and Multiple Repositories
---

Current SkotOS games are divided into multiple repositories: there's [core SkotOS](https://github.com/ChatTheatre/SkotOS), there's the game itself (e.g. [gables](https://github.com/ChatTheatre/gables_game), [RWOT](https://github.com/WebOfTrustInfo/prototype_vRWOT)), and then there may be multiple SkotOS plugins that are added to core SkotOS (e.g. [NIP](https://github.com/ChatTheatre/nip-plugin), [mgeneric](https://github.com/ChatTheatre/mgeneric-plugin), [lib:Fx](https://github.com/ChatTheatre/effects-plugin)) . The plan is that there will be more and more small libraries extracted from SkotOS, to make a nice simple clean core, over time.

DGD, the language SkotOS is written in, doesn't really have a library system. Arguably, SkotOS is the first DGD-based project to seriously need one.

So our primary tool for separating these components and using them together is dgd-manifest, part of [dgd-tools](https://github.com/ChatTheatre/dgd-tools), which was initially written for SkotOS.

You can find more documentation on DGD manifest [in its own repository](https://github.com/ChatTheatre/dgd-tools#using-dgd-manifest-with-your-dgd-application). But DGD-manifest isn't SkotOS-only, so it's useful to also document a bit about how to use it with SkotOS.

## The Root

Dgd-manifest puts together a DGD root directory from the files of the different components of the application. Most commonly that's the core SkotOS root directory as a base, and then the plugins in appropriate subdirectories, and then the game overlays its own files on top.

Here's an example of how that can be done:

~~~
{
    "name": "vRWOT Virtual Conference Space",
    "version": "0.1.0",
    "description": "A virtual meeting place",
    "config": {
      "app_root": "root",
      "editors": 0,
      "telnet_ports": [11098],
      "ports": [11099, 11017, 11070, 11071, 11080, 11089, 11090, 11091, 11443],
      "dump_file": "skotos.database"
    },
    "unbundled_goods": [
        {
            "name": "SkotOS",
            "git": {
                "url": "https://github.com/ChatTheatre/SkotOS.git",
                "branch": "master"
            },
            "paths": {
                "skoot": "."
            },
            "dependencies": [
                "https://raw.githubusercontent.com/ChatTheatre/mgeneric-combat-plugin/main/mgeneric-combat-plugin.goods",
                "https://raw.githubusercontent.com/ChatTheatre/language-plugin/main/language-plugin.goods",
                "https://raw.githubusercontent.com/ChatTheatre/article-plugin/main/article-plugin.goods",
                "https://raw.githubusercontent.com/ChatTheatre/azmail-plugin/main/azmail-plugin.goods",
                "https://raw.githubusercontent.com/ChatTheatre/mgeneric-plugin/main/mgeneric-plugin.goods",
                "https://raw.githubusercontent.com/ChatTheatre/shared-plugin/main/shared-plugin.goods",
                "https://raw.githubusercontent.com/ChatTheatre/effects-plugin/main/effects-plugin.goods",
                "https://raw.githubusercontent.com/ChatTheatre/nip-plugin/main/nip-plugin.goods"
            ]
        }
    ]
}
~~~

In this example, vRWOT uses core SkotOS from ChatTheatre/SkotOS's master branch, and also adds a list of additional plugins from .goods files (DGD-manifest libraries) with raw GitHub URLs.

## Clean It All Up

There are a lot of points of connection here. How do you make sure a change you made gets used? Here's the whole list of things that you might need to do. If you want to be sure you're getting a clean install, do all of them.

* first, update your SkotOS, plugin and game code; commit and push as needed; remove extraneous files
* make sure the game's dgd.manifest points to the correct repo and branch for SkotOS core and/or plugins
* stop any server(s) currently running (e.g. with deploy_scripts/mac/stop_server.sh)
* consider removing skotos.database, with all the in-memory objects; this will destroy *all* user data if you do it, which can be good or bad depending
* dgd-manifest install - this will rebuild your root directory with the latest code from SkotOS and plugins, and remove any files it doesn't recognise
* run setup.sh or equivalent (set up libraries and dependencies, start servers, etc)

## Limitations of DGD-Manifest

Dgd-manifest doesn't ever try to combine multiple files into one. So anything you want to use with it needs to deal with that. It *is* fine for dgd-manifest to put files from different plugins into the same directory. And sometimes a game will include a modified version of a parent file. But if you want to combine content from multiple plugins, or from a game and a plugin, that's hard. So keep it in mind.

Dgd-manifest is designed as a very simple DGD library system. But it tries hard *not* to be specific to SkotOS. So a lot of SkotOS concepts that aren't "raw" DGD concepts aren't included. For instance, see the next section about the portbase.

## Difficulties with Files vs In-Memory Objects

SkotOS allows modifying objects directly in memory, with the Tree of WOE or similar. It also allows modifying XML files on disk.

This can sometimes cause problems. How do you make sure the right changes take precedence? How do you merge changes. These are, in general, hard problems.

DGD-manifest doesn't solve them, but it *does* try not to make them any harder.

Dgd-manifest *only* uses a file-based approach. When it updates anything, it updates files. Dgd-manifest will never do anything to signal your SkotOS server to reload. If you want that to happen, you'll need to do it yourself.

So: when dgd-manifest copies files around, it has pretty much exactly the same effects as if you, yourself, had just copied those files into the same places. It's not trying to do anything fancy. There's enough "fancy" going on with SkotOS already. Adding more would be bad.

## The SkotOS Portbase

A specific SkotOS game will use a portbase (see [SkotOS ports](./SkotOS_Ports.md)), usually 11000. In theory you can use a different one, but it may be difficult &mdash; we hardcode port numbers in a surprising number of places. The SkotOS core library tries to respect the PORTBASE environment variable if it's set, so you may be able to get away with overriding it in your game... But you're likely to need to do it in a lot of different scripts.

And your game will need to set its port numbers in the DGD manifest file.

Right now (Jan 2021) the portbase is hardcoded in many places and will need to be updated in many places. You'll also need to fully restart your DGD game, probably deleting the old database file. So you would normally ***only*** ever update the portbase when creating a new game, since it's so hard to update an old one.

While we're open to fixing how hard this is, there's a lot of work to it. If there were a single place to find the portbase (e.g. the instance file,) we'd need some sort of signaling system for when data in the instance file changes, and then everything that uses it would need to dynamically reload. And many things (e.g. deploy scripts) don't check the instance file, and they would need to. None of this is impossible, but it's also not done.
