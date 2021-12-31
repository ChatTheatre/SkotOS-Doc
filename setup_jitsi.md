---
title: Setting Up A/V Chat for SkotOS
layout: default
---

Newer SkotOS games support using [Jitsi](https://meet.jit.si/) for audio and video chat channels. You'll need to do some manual setup if you want to do that.

Note: Jitsi for SkotOS uses a nonstandard Jitsi config. So you can't use a hosted meet.jit.si server, including the free one. You'll need to run a custom hosted Jitsi instance.

## Basic Setup

Jitsi runs on a separate server from the SkotOS game-related apps. That's partly because Jitsi can use a lot of server resources like memory and bandwidth. And it's partly because Jitsi is quite particular about its setup, so it's hard to install "bare" on the same server.

Docker-based Jitsi install is possible, but it can make the server resource problems even more severe. You'll also need a bit of expertise with Docker-Compose to modify the configuration files appropriately. It's easier to use a separate standalone Jitsi server in most cases.

## How to Install a Jitsi Server

SkotOS uses a different Jitsi installation than the default out-of-the-box Jitsi configuration. It needs two nonstandard things:

* support for JWT login
* the [token_moderation Jitsi plugin](https://github.com/nvonahsen/jitsi-token-moderation-plugin)

(TODO: put together a SkotOS Ubuntu-based StackScript to install these)

JWT login is *mostly* supported by Jitsi Meet, though not perfectly. You can find instructions for how to install JWT for Jitsi in multiple places:

* [Meetrix blog post](https://meetrix.io/blog/webrtc/jitsi/meet/how-to-authenticate-users-to-Jitsi-meet-using-JWT-tokens.html) (note: some typos)
* [Doganbros blog post](https://doganbros.com/index.php/jitsi/jitsi-installation-with-jwt-support-on-ubuntu-20-04-lts/)

These are *both* install instructions - either is fine, but you may find omissions/errors in either one, so it's useful to have both and compare them.

Note that Debian and Ubuntu work in slightly different ways here - **I recommend using Ubuntu, not Debian, for your Jitsi installation**. It's just easier to debug. I've hit significant problems trying to install Jitsi with JWT on Debian.

Also, it's expected that you have to add the `?jwt=XXXX` parameter to the end of your URLs to get into rooms. That's part of what I mean by JWT being "mostly" supported by Jitsi - it works, but some of the web UI doesn't expect you to be using JWT. That's not an issue when using JWT for SkotOS.

Current Jitsi JWT doesn't support websockets. So make sure that BOSH (XMPP-over-HTTP) is set up correctly on the usual HTTP/HTTPS ports and do *not* use Websocket XMPP protocols. The Jitsi JWT guides above do this correctly, if you use them.

## Using Jitsi with SkotOS

Having a Jitsi server installed is nice. Let's talk about how to hook it up to your SkotOS server.

For SkotOS Jitsi support, you'll need to modify the instance file for your DGD server, and you'll need to run chat_admin_server.

### Modifying your Instance file

Your instance file is in skoot/usr/System/data/instance, under your DGD root. If you're using the Linode Stackscripts, that means it's in /var/skotos/skoot/usr/System/data/instance.

You'll need to add a line to the end:

~~~
jitsi_host my_jitsi.my_domain.com
~~~

Obviously replace "my_jitsi.my_domain.com" with your actual Jitsi DNS name.

### Running chat_admin_server

First, "git clone" a copy of [the chat_admin_server repo](https://github.com/ChatTheatre/chat_admin_server). Copy config-example.json to config.json in the same directory. You're going to need to fill in the config file properly, and you'll need to run the server.

The Jitsi domain ("meet.jitsi") can stay the same if you use the install instructions for Jitsi with JWT above. Otherwise, change it to match your internal Jitsi XMPP domain.

The Jitsi app_id and secret should match the ones in your Jitsi configuration (TODO: add instructions for which files to check for these.)

The "outbound" config is for the Jitsi port of your SkotOS server. If you're running chat_admin on the same host as SkotOS, you won't need to change the config from host 127.0.0.1 and port 11091. If you're running them on two separate servers, please be very careful of your firewall rules, and change the JSON configuration to the new location.

The "inbound" config is if you want to connect to the server for credentials or testing &mdash; SkotOS doesn't need it and won't use it. You can remove that section completely, or leave it as-is.

Note that if you install a new Jitsi server and want to use it, you'll need to update the JSON configuration file and restart chat_admin_server.

Once you've done all that, you'll need to make sure that chat_admin_server is running. It's a Node.js program, so your SkotOS server should already have Node installed. To run the server:

~~~
node src/main.js config.json
~~~

You'll need to add this to your cron setup, or otherwise make sure the server gets started automatically.

## Jitsi and Local Dev (Don't, If You Can Avoid It)

SkotOS requires a fairly specific Jitsi setup, including JWT login and a specific auth plugin. In other words, an existing Jitsi server that you have sitting around isn't going to work for SkotOS.

And you pretty certainly don't want to install a Jitsi server on your local development machine.

So: it's possible to configure your local dev box for Jitsi, usually by pointing it at the production Jitsi server for a production SkotOS game. This only works if you have the JWT secrets to set up a chat_admin_server, or if you can see their chat_admin server (which is highly insecure and should never be exposed to the open Internet.)

Normally you would *not* use Jitsi for local dev. If you need to do so (e.g. to debug Jitsi-specific code) then you'll need to run [chat_admin_server](https://github.com/ChatTheatre/chat_admin_server) with the production JWT secrets.

You can work around these problems by installing a new, separate Jitsi server as you would for a production game, and configuring chat_admin_server to run locally on your development computer like you would on a production game server. Then it's not a problem that you have the production JWT secrets on your development machine -- they're only the passwords for your development Jitsi server, not the Jitsi server for the real game.

## Jitsi and Instance Sizes

It's hard to get a straight answer about how much memory or CPU Jitsi will use. We paid a professional Jitsi organisation to get a recommendation for an active conference with around 100 participants, with most of them actually active most of the time.

Here's the instance size that they suggested for that use case:

~~~
Linode Dedicated 32GB
16 CPUs, 640GB storage, 32 GB RAM
~~~

You can test with a much smaller instance, including one with shared CPUs, when you're just getting started with a couple of users. It's easy to install a new, larger instance and reconfigure your SkotOS game to use it.

Our initial testing was with a shared vHost with 2GB of RAM and 1 CPU. For just two or three people online at once, that works okay. And it's much, much cheaper to keep running.
