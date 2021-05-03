# Using a Modified SkotOS

Sometimes you want to test a patch to SkotOS &mdash; or another library &mdash; in your game. We'll use The Gables as an example.

## Patching SkotOS

Right now SkotOS dumps state (an automatic backup to skotos.database) very frequently. Your game is getting bigger, and the load from that is noticeable. Sometimes it's slowing down your game enough to feel like periodic freezes. That's not great.

So you're going to patch usr/System/initd.c to dump less often. Easy-peasy.

You have the SkotOS repo cloned. You make sure master is nice and fresh. And then you make a new branch:

~~~
git checkout master
git checkout -b fewer_statedumps
~~~

Now you open up skoot/usr/System/initd.c and change DUMP_INTERVAL from 200 (just over 3 minutes) to 2000 (just over 30 minutes.) You commit your changes and push them:

~~~
git add skoot/usr/System/initd.c
git commit -m "Change DUMP_INTERVAL to about 30 minutes"
git push
~~~

But how do you test it? Head over to gables_game and have a look at its dgd.manifest. Here's the section you care about:

~~~
    "unbundled_goods": [
        {
            "name": "SkotOS",
            "git": {
                "url": "https://github.com/ChatTheatre/SkotOS.git",
                "branch": "master"
            },
            "paths": {
                "skoot": "."
            }
        }
~~~

See that URL and branch? Change them to the URL for ***your*** SkotOS repository and the branch name you chose (perhaps "fewer_statedumps" above?)

Now when you run "dgd-manifest update" (or test, or install) it will pull from your SkotOS repo, not the main ChatTheatre one.

## Booting Clean

Keep in mind that if you already have a skotos.database file, it will have the old version of that file compiled. You can compile the file with the Wiztool for the change above, and it will take effect right after the next statedump. But some changes don't work like that.

For instance if you change the create() function of an non-cloneable object that already exists, it won't ever be called. After all, the object already exists. Unless you destroy it and recreate it, create() doesn't get called.

The easiest way to handle this is to stop your server, delete skotos.database and restart clean. This will take 5-10 minutes to compile everything on startup, but you're guaranteed that there will be no lingering stale objects from an old statedump.

## But What About Scripts?

What if the object you want to change isn't inside DGD? That happens sometimes.

Luckily, DGD Manifest creates some symlinks that can help you. Under gables_game, after you've run "dgd-manifest install" (or update), there will be a .repos directory containing symlinks to the various named goods that you depend on - bundled and unbundled both.

You can use those symlinks to refer to your dependencies even if their Git information changes. For an example, search gables_game/deploy_scripts/mac/start_server.sh for ".repos". You'll see that it sets a SKOTOS_DIR from that symlink, and then uses the SKOTOS_DIR to find its deploy scripts.
