#!/bin/sh

# Check for "NextDNS".
if ! test -d "/Applications/NextDNS.app"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] NextDNS.app is not installed.\\n"
	exit 1
fi

printf "› Setting Next DNS settings.\\n"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set path to current folder.
DOTFILES_NEXTDNS="${DOTFILES}/nextdns"

# Set path to local config file.
DOTFILES_NEXTDNS_CONFIG="${DOTFILES_NEXTDNS}"/dnscrypt-proxy.toml

# Set path to `dnscrypt-proxy` config file.
DOTFILES_NEXTDNS_DNSCRYPT_PROXY_CONFIG="${HOMEBREW_PREFIX}"/etc/dnscrypt-proxy.toml

# Generate `dnscrypt-proxy` configuration for NextDNS if it doesn't exist.
if ! test -f "${DOTFILES_NEXTDNS_CONFIG}"
then
  printf "› Generating \"dnscrypt-proxy.toml\" configuration for NextDNS.\\n\\n"

	printf "\\r[ \\033[0;33m??\\033[0m ] What is your NextDNS configuration ID?\\n"
  read -r -e nextdns_config_id

	printf "\\r[ \\033[0;33m??\\033[0m ] What is your NextDNS DNS Stamp for that configuration ID?\\n"
  read -r -e nextdns_dns_stamp

	if ! test -n "${nextdns_config_id-}" || ! test -n "${nextdns_dns_stamp-}"
	then
		printf "\\r  [ \\033[0;33mWARN\\033[0m ] Missing configuration ID or DNS Stamp. Configuration file could not be created.\\n"
		exit 1
	fi

	# Create `dnscrypt-proxy.toml` for NextDNS based on example file
	sed -e "s/NEXTDNS_CONFIG_ID/${nextdns_config_id}/g" -e "s/NEXTDNS_DNS_STAMP/${nextdns_dns_stamp}/g" "${DOTFILES_NEXTDNS_CONFIG}".example > "${DOTFILES_NEXTDNS_CONFIG}"

	printf "  [ \\033[00;34mINFO\\033[0m ] Successfully created \"dnscrypt-proxy.toml\" configuration for NextDNS.\\n\\n"
else
	# Otherwise, extract the configuration ID from the existing `dnscrypt-proxy.toml` file.
	nextdns_config_id=$(grep -o -m 1 "NextDNS-.*" "${DOTFILES_NEXTDNS_CONFIG}" | sed "s/.*-//;s/'.*//")
fi

# Use custom configuration for NextDNS app.
defaults write io.nextdns.NextDNSMac config -string "${nextdns_config_id}"

# Remove bottom section of the (existing) `dnscrypt-proxy` configuration, i.e. remove NextDNS section if it exists.
sed -i 's/^## Mostly useful for testing your own servers.$/&\n/;/^## Mostly useful for testing your own servers.\n$/q' "${DOTFILES_NEXTDNS_DNSCRYPT_PROXY_CONFIG}"

# Append local (NextDNS) configuration to `dnscrypt-proxy` config file.
cat "${DOTFILES_NEXTDNS_CONFIG}" >> "${DOTFILES_NEXTDNS_DNSCRYPT_PROXY_CONFIG}"

# Restart the dnscrypt-proxy service.
sudo brew services restart dnscrypt-proxy > /dev/null 2>&1
