---
title: Setting Up A/V Chat for SkotOS
layout: default
---

Newer SkotOS games support using [Jitsi](https://meet.jit.si/) for audio and video chat channels. You'll need to do some manual setup if you want to do that.

Note: Jitsi for SkotOS uses a nonstandard Jitsi config. So you can't use a hosted meet.jit.si server, including the free one. You'll need to run a custom hosted Jitsi instance.

This guide assumes you already have [SkotOS installed on a VPS](/setup_vps.md). Jitsi is normally installed after SkotOS is already working.

## Multi-Host Setup

Jitsi runs on a separate server from the SkotOS game-related apps. That's partly because Jitsi can use a lot of server resources like memory and bandwidth. And it's partly because Jitsi is quite particular about its setup, so it's hard to install "bare" on the same server.

Docker-based Jitsi install is possible, but it can make the server resource problems even more severe. You'll also need a bit of expertise with Docker-Compose to modify the configuration files appropriately. Even if you install with Docker, I recommend using a separate host.

## How to Install Your Jitsi Server

(Note: look for jitsi_stackscript.sh in the SkotOS deploy directory. If that's unsuitable for some reason, use the directions below.)

SkotOS uses a different Jitsi installation than the default out-of-the-box Jitsi configuration. It needs two nonstandard things:

* support for JWT login
* the [token_moderation Jitsi plugin](https://github.com/nvonahsen/jitsi-token-moderation-plugin)

JWT login is *mostly* supported by Jitsi Meet, though not perfectly. You can find instructions for how to install JWT for Jitsi in multiple places:

* [Meetrix blog post](https://meetrix.io/blog/webrtc/jitsi/meet/how-to-authenticate-users-to-Jitsi-meet-using-JWT-tokens.html) (note: some typos, including in package names)
* [Doganbros blog post](https://doganbros.com/index.php/jitsi/jitsi-installation-with-jwt-support-on-ubuntu-20-04-lts/) (note: left/right quotes should instead be plain single quotes)
* [Jitsi JWT setup guide](https://meetrix.io/blog/webrtc/jitsi/meet/how-to-authenticate-users-to-Jitsi-meet-using-JWT-tokens.html) - useful for additional reference
* the [token_moderation Jitsi plugin](https://github.com/nvonahsen/jitsi-token-moderation-plugin) - you'll need to install this

The top two are both install instructions - either is fine, but you will find omissions/errors in either one, so it's useful to have both and compare them.

Once you have a successful Jitsi-with-JWT installation, follow the directions in the bottom link to install token_moderation.

Note that Debian and Ubuntu work in slightly different ways here - **I recommend using Ubuntu, not Debian, for your Jitsi installation**. It's just easier to debug. I've hit significant problems trying to install Jitsi with JWT on Debian.

Also, it's expected that you have to add the `?jwt=XXXX` parameter to the end of your URLs to get into rooms. That's part of what I mean by JWT being "mostly" supported by Jitsi - it works, but some of the web UI doesn't expect you to be using JWT. That's not an issue when using JWT for SkotOS.

Current Jitsi JWT doesn't support websockets. So make sure that BOSH (XMPP-over-HTTP) is set up correctly on the usual HTTP/HTTPS ports and do *not* use Websocket XMPP protocols. The Jitsi JWT guides above do this correctly, if you use them.

## Using Jitsi with SkotOS Deploy Scripts

Having a Jitsi server installed is nice. Let's talk about how to hook it up to your SkotOS server.

By default, a newly-installed SkotOS server does *not* have Jitsi set up. Once you've set up Jitsi, you'll need to run a script to set it up.

Recent SkotOS stackscripts will clone the chat_admin_server source into /var/chat_admin_server. First, go to that directory and run "git checkout main" and "git pull" to make sure it's up-to-date. There should be a deploy/skotos directory containing useful scripts.

Here are some scripts you should find there:

* configure-jitsi.sh - set up chat_admin_server with your Jitsi server
* unconfigure-jitsi.sh - unhook chat_admin_server from Jitsi and shut it down
* start-chat-admin.sh - a task run automatically via cron to run chat_admin_server if it's not already

There should be a cron task for the skotos user that runs start-chat-admin.sh once per minute if (and only if) there's no file in /var/chat_admin_server to tell it not to (called NO_START.txt).

After you've correctly installed your Jitsi server by one of the methods on this page you can hook it up to SkotOS by running configure-jitsi.sh. You'll need your JWT app ID and JWT app secret from your Jitsi install, and the DNS name of your Jitsi server. Once you have them, here's what you run:

~~~
/var/chat_admin_server/deploy/skotos/configure-jitsi.sh my-jitsi-fqdn.my-domain.com MyJitsiJWTAppId MyJitsiJWTAppSecret
~~~

Use your own Jitsi hostname, app ID and app secret instead of the placeholders above.

Once you've run that, the script will tell you to telnet into your DGD server and recompile a file called /usr/System/initd.c. That's how you tell DGD to reload its instance file and use the new Jitsi settings.

## Finding Your Settings

I assume you have the hostname for your Jitsi server &mdash; that's just the name you use in the browser or with SSH to get to the server. But your JWT app ID and app secret can be a bit harder to find. They're sensitive information (like passwords), so often they won't be printed anywhere obvious. You should ***absolutely not*** email them around or otherwise let other people see them &mdash; anybody with your Jitsi JWT app ID and app secret can be a moderator on your Jitsi server on any channel, kick anybody else off, etc, and you can't stop them (until you change the passwords.)

So: where do you find those? You'll need to ssh into your Jitsi server and look in a file called something like "/etc/prosody/conf.avail/myjitsi.my-domain.com.cfg.lua". I say "something like" that because it will have your Jitsi hostname in the filename, not "myjitsi.my-domain.com" like I show here.

Open the config file and search for "app_id". You should find a line with "app_id=something" and the next line will start with "app_secret=". The things in quotes (don't include the quotes) are your Jitsi JWT app ID and your Jitsi JWT app secret.

So you'll need them to run configure-jitsi.sh And the hostname in the config file's name is the hostname you should use with configure-jitsi.sh.

Once you've run that, the script will tell you to telnet into your DGD server and recompile a file called /usr/System/initd.c. That's how you tell DGD to reload its instance file and use the new Jitsi settings.

## Configuring Jitsi by Hand

It's possible that configure-jitsi.sh won't work for you for some reason. You can read through it and see what it does. I've also documented the basic steps below. The more your Jitsi configuration is different from what we expect, the more likely you are to need to make some changes manually.

For SkotOS Jitsi support, you'll need to modify the instance file for your DGD server, and you'll need to run chat_admin_server.

### Modifying your Instance file

Your instance file is in skoot/usr/System/data/instance, under your DGD root. If you're using the Linode Stackscripts, that means it's in /var/skotos/skoot/usr/System/data/instance.

You'll need to add a line to the end:

~~~
jitsi_host my_jitsi.my_domain.com
~~~

Obviously replace "my_jitsi.my_domain.com" with your actual Jitsi DNS name.

Now you'll need your SkotOS server to use the new settings in the instance file. Connect to the telnet port (normally: "telnet localhost 11098" or "telnet game.my_domain.com 11098"), log in as your privileged "skott" account and do the following:

~~~
cd /usr/System
compile initd.c
~~~

This will re-read the instance file and use the new settings.

### Running chat_admin_server

First, "git clone" a copy of [the chat_admin_server repo](https://github.com/ChatTheatre/chat_admin_server). Copy config-example.json to config.json in the same directory. You're going to need to fill in the config file properly, and you'll need to run the server.

The Jitsi domain should match your internal Jitsi XMPP domain. That can be meet.jitsi for a Docker install, but it's usually based on your Jitsi hostname. Look in your prosody config file under /etc/prosody/config.avail on the lines with VirtualHost to check.

The Jitsi app_id and secret should match the ones in your Jitsi configuration (see above for how to check.)

The "outbound" config is for the Jitsi port of your SkotOS server. If you're running chat_admin_server on the same host as SkotOS, you won't need to change the config from host 127.0.0.1 and port 11091.

The "inbound" config is if you want to connect to the server for credentials or testing &mdash; SkotOS doesn't need it and won't use it. You can remove that section completely, or leave it as-is. If you're running chat_admin_server on a different host than SkotOS's DGD server for some reason, please be ***very careful of your firewall rules***, and change the JSON configuration to the new location. It's a very bad idea to run chat_admin_server unfirewalled on the open internet.

After you update the JSON configuration file, you should restart chat_admin_server.

Once you've done all that, you'll need to make sure that chat_admin_server is running. It's a Node.js program, so your SkotOS server should already have Node installed. To run the server:

~~~
node src/main.js config.json
~~~

You'll need to add this to your cron setup, or otherwise make sure the server gets started automatically. There's a chat_admin_server deploy script that can run the server for you (see above) or you can do it manually like this.

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
