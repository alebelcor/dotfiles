#!/bin/sh

# Check for "NextDNS".
if ! test -d "/Applications/NextDNS.app"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] NextDNS.app is not installed.\\n"
	exit 1
fi

printf "› Setting NextDNS settings.\\n"

printf "\\r[ \\033[0;33m??\\033[0m ] What is your NextDNS configuration ID?\\n"
read -r -e nextdns_config_id

# Use custom configuration for NextDNS app.
defaults write io.nextdns.NextDNSMac config -string "${nextdns_config_id}"
