plugin_paths = { "/usr/share/jitsi-meet/prosody-plugins/" }

-- domain mapper options, must at least have domain base set to use the mapper
muc_mapper_domain_base = "meet.jitsi";

external_service_secret = "EXTERNAL SERVICE SECRET GOES HERE";
external_services = {
     { type = "stun", host = "meet.jitsi", port = 3478 },
     { type = "turn", host = "meet.jitsi", port = 3478, transport = "udp", secret = true, ttl = 86400, algorithm = "turn" },
     { type = "turns", host = "meet.jitsi", port = 5349, transport = "tcp", secret = true, ttl = 86400, algorithm = "turn" }
};

cross_domain_bosh = false;
consider_bosh_secure = true;
-- https_ports = { }; -- Remove this line to prevent listening on port 5284

-- https://ssl-config.mozilla.org/#server=haproxy&version=2.1&config=intermediate&openssl=1.1.0g&guideline=5.4
ssl = {
    protocol = "tlsv1_2+";
    ciphers = "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384"
}

unlimited_jids = {
    "focus@auth.meet.jitsi",
    "jvb@auth.meet.jitsi"
}

VirtualHost "meet.jitsi"
    -- enabled = false -- Remove this line to enable this host
    -- authentication = "anonymous"
    authentication = "token"
    -- Properties below are modified by jitsi-meet-tokens package config
    -- and authentication above is switched to "token"
    app_id="APP_ID_GOES_HERE"
    app_secret="APP_SECRET_GOES_HERE"
    -- Assign this host a certificate for TLS, otherwise it would use the one
    -- set in the global section (if any).
    -- Note that old-style SSL on port 5223 only supports one certificate, and will always
    -- use the global one.
    ssl = {
        key = "/etc/prosody/certs/meet.jitsi.key";
        certificate = "/etc/prosody/certs/meet.jitsi.crt";
    }
    av_moderation_component = "avmoderation.meet.jitsi"
    speakerstats_component = "speakerstats.meet.jitsi"
    conference_duration_component = "conferenceduration.meet.jitsi"
    -- we need bosh
    modules_enabled = {
        "bosh";
        "pubsub";
        "ping"; -- Enable mod_ping
        "speakerstats";
        "external_services";
        "conference_duration";
        "muc_lobby_rooms";
        "av_moderation";
    }
    c2s_require_encryption = false
    lobby_muc = "lobby.meet.jitsi"
    main_muc = "conference.meet.jitsi"
    -- muc_lobby_whitelist = { "recorder.meet.jitsi" } -- Here we can whitelist jibri to enter lobby enabled rooms

Component "conference.meet.jitsi" "muc"
    restrict_room_creation = true
    storage = "memory"
    modules_enabled = {
        "muc_meeting_id";
        "muc_domain_mapper";
        "polls";
        "token_verification";
	"token_moderation";
    }
    admins = { "focus@auth.meet.jitsi" }
    muc_room_locking = false
    muc_room_default_public_jids = true

-- internal muc component
Component "internal.auth.meet.jitsi" "muc"
    storage = "memory"
    modules_enabled = {
        "ping";
    }
    admins = { "focus@auth.meet.jitsi", "jvb@auth.meet.jitsi" }
    muc_room_locking = false
    muc_room_default_public_jids = true

VirtualHost "auth.meet.jitsi"
    ssl = {
        key = "/etc/prosody/certs/auth.meet.jitsi.key";
        certificate = "/etc/prosody/certs/auth.meet.jitsi.crt";
    }
    modules_enabled = {
        "limits_exception";
    }
    authentication = "internal_hashed"

-- Proxy to jicofo's user JID, so that it doesn't have to register as a component.
Component "focus.meet.jitsi" "client_proxy"
    target_address = "focus@auth.meet.jitsi"

Component "speakerstats.meet.jitsi" "speakerstats_component"
    muc_component = "conference.meet.jitsi"

Component "conferenceduration.meet.jitsi" "conference_duration_component"
    muc_component = "conference.meet.jitsi"

Component "avmoderation.meet.jitsi" "av_moderation_component"
    muc_component = "conference.meet.jitsi"

Component "lobby.meet.jitsi" "muc"
    storage = "memory"
    restrict_room_creation = true
    muc_room_locking = false
    muc_room_default_public_jids = true
