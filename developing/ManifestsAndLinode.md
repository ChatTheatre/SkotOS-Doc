# DGD Manifests and Linode

You can use [DGD manifests](https://github.com/ChatTheatre/dgd-tools/) to assemble a DGD application from component parts.

How does it work?

## The Basics

The manifest-capable app has a directory of files and a list of components. When you run "dgd-manifest install" it assembles those components and files into an application, which by default is under ".root". So if RWOT is installed as /var/rwot, its assembled root is in "/var/rwot/.root".

When creating a Linode with a stackscript, this is normally done by the stackscript.

## Updating a Distribution

If you run "dgd-manifest install" again, it will delete the old files and copy the new files into the root directory. This is not a good idea if DGD is currently running. It will also destroy any additional files that DGD has created under its root directory.

Normally you would shut down DGD, assemble the app, and re-run it.

This process is useful and appropriate when figuring out how to package a game for distribution to others. It is less useful when you're updating a running application.

## Updating In Place

If you want to update a file on a running server, it can be more complicated.

If you update a DGD ".c" file, you'll need to recompile it using "compile" or "upgrade" from the telnet port.

If you update a WOE object, you may want to make the same change via the Tree of WOE (or in-game editing), or you may want to destroy and reimport the object.

If you update a file that is reloaded every time such as the Orchil HTTP client, you may want to copy it into the generated ".root" directory.

Version 0.1.7 and higher of dgd-manifest have a "dgd-manifest update" command to re-copy files from the app root into the generated root. This will overwrite any changes in the generated root, which may be good or bad depending on your workflow.
