---
title: Setting Up A/V Chat for SkotOS
layout: default
---

Newer SkotOS games support using [Jitsi]() for audio and video chat channels. The development Linode setup will install Jitsi on the same server as your game, by default. That's not a bad way to start, but you'll eventually want to change it.

## Jitsi and Local Dev

Right now it's not easy to install Jitsi and run it locally. By default SkotOS won't use Jitsi for local installs.

You can follow the instructions below to install Jitsi and then point your local game at it. But you'll usually want to do Jitsi-specific game development using a VPS.

## How to Install Jitsi At First

When you're still developing your game, the default setup is great. Jitsi should be installed and running on the same Linode (or similar) VPS you already have.

Once you have more than a few users, you'll probably want Jitsi to run on its own host. That's more expensive, but also works better. When that happens, you'll want to use apt-get to uninstall packages with "jitsi" in the name on your local server, and switch to a Jitsi server on a new host.

Why separate hosts? Partly because Jitsi puts a lot of load on the server -- you don't want high Jitsi load to slow down the SkotOS game server. Partly because Jitsi requires a lot of resources, and you'd like to scale it separately. Even a very small server can run a SkotOS game for a *lot* of users. If your users are doing a lot of video chat with Jitsi, you'll need a more expensive server much sooner.

## How to Install a Separate Jitsi Server

SkotOS uses a different Jitsi installation than the default out-of-the-box configuration. It needs two nonstandard things:

* support for JWT login
* the [token_moderation Jitsi plugin](https://github.com/nvonahsen/jitsi-token-moderation-plugin)

You can read through the [SkotOS Linode StackScript](https://github.com/ChatTheatre/SkotOS/blob/master/deploy_scripts/stackscript/linode_stackscript.sh) for examples of how to install these things. SkotOS doesn't maintain a standalone Jitsi install script... Though you might be able to install SkotOS and Jitsi on a large server and then just use Jitsi. An idle SkotOS game install is pretty lightweight.

JWT login is *mostly* supported by Jitsi Meet, though not perfectly. You can find instructions for how to install JWT for Jitsi in multiple places:

* [Meetrix blog post](https://meetrix.io/blog/webrtc/jitsi/meet/how-to-authenticate-users-to-Jitsi-meet-using-JWT-tokens.html)
* [Doganbros blog post](https://doganbros.com/index.php/jitsi/jitsi-installation-with-jwt-support-on-ubuntu-20-04-lts/)

These are *both* install instructions - either is fine, but you may find omissions/errors in either one, so it's useful to have both and compare them.

Note that Debian and Ubuntu work in slightly different ways here - I recommend using Ubuntu, not Debian, for your Jitsi installation. It's just easier to debug.

Also, it's expected that you have to add the `?jwt=XXXX` parameter to the end of your URLs to get into rooms. That's part of what I mean by "mostly" supported - it works, but some of the web UI doesn't expect you to be using JWT. That's not an issue when using JWT for SkotOS.

### Can I Use Docker?

Jitsi has both a Debian package install and a Docker install. The main difficulty with using Docker is that it normally pre-packages the configuration files, so they can be more challenging to modify. If you'd like, you can read their docker-compose scripts and modify the configuration files before they're copied in.

So: yes, using Docker is possible. It's a bit more challenging if you're not already familiar with Docker-Compose. Also, if you're installing a new Jitsi server because you need higher performance, make sure you're familiar with the issues around using Docker with a lot of cores and processes.

### What About Websocket Support?

Current Jitsi JWT doesn't use websockets. So instead make sure that BOSH is set up correctly on the usual HTTP/HTTPS ports.
