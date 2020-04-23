load_lib secrets
load_lib kv
load_lib ldap
load_lib docker

require_network webapp
require_network ldap

create_input_kv base_domain
create_input_kv time_zone

create_generate_secret meet_user_pass
create_generate_secret meet_jicofo_component_secret
create_generate_secret meet_jicofo_auth_pass
create_generate_secret meet_jvb_auth_pass
create_generate_secret meet_jigasi_xmpp_pass
create_generate_secret meet_jibri_recorder_pass
create_generate_secret meet_jibri_xmpp_pass

export BASE_DOMAIN=$(get_kv base_domain)
export TIME_ZONE="Europe/Copenhagen"
export LDAP_BASE_DN=$(get_kv ldap_base_dn)
export MEET_USER_PASS=$(get_secret meet_user_pass)
export JICOFO_COMPONENT_SECRET=$(get_secret meet_jicofo_component_secret)
export JICOFO_AUTH_PASSWORD=$(get_secret meet_jicofo_auth_pass)
export JVB_AUTH_PASSWORD=$(get_secret meet_jvb_auth_pass)
export JIGASI_XMPP_PASSWORD=$(get_secret meet_jigasi_xmpp_pass)
export JIBRI_RECORDER_PASSWORD=$(get_secret meet_jibri_recorder_pass)
export JIBRI_XMPP_PASSWORD=$(get_secret meet_jibri_xmpp_pass)

export XMPP_DOMAIN="meet.jitsi"
export RESTART_POLICY=unless-stopped
export TZ=Europe/Amsterdam

# XMPP component password for Jicofo
JICOFO_COMPONENT_SECRET=b3bfe780d1d053210cf6f53aba056294

# XMPP password for Jicofo client connections
JICOFO_AUTH_PASSWORD=16c82532c0105e0d81391f9e514850f0

# XMPP password for JVB client connections
JVB_AUTH_PASSWORD=7a251e6e0547f5d96b2e7327f5c6177b

# XMPP password for Jigasi MUC client connections
JIGASI_XMPP_PASSWORD=9b9772ed548338f442e3d43d13967211

# XMPP recorder password for Jibri client connections
JIBRI_RECORDER_PASSWORD=1acff6754dc9ae958294c519b0534e0a

# XMPP password for Jibri client connections
JIBRI_XMPP_PASSWORD=5764fed506979f2d0206b876ad6e2cdd

ldap_create_app meet "$MEET_USER_PASS"

