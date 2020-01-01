#!/bin/sh

# Check for `dnscrypt-proxy`.
if test ! "$(command -v dnscrypt-proxy)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] dnscrypt-proxy is not installed.\\n"
	exit 1
fi

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# List of DNS servers. The fastest is automatically picked.
# INFO: https://dnscrypt.info/public-servers
DNS_SERVERS="'cloudflare', 'google', 'quad9-dnscrypt-ip4-filter-pri'"

# Add the servers to the configuration file.
sed -i -re "s/^\#\s+server_names\s+=\s+.*/server_names = [${DNS_SERVERS}]/gi" "${HOMEBREW_PREFIX}/etc/dnscrypt-proxy.toml"

# Create Bitbar plugins folder if it doesn't exist.
mkdir -p "${HOME}/.config/bitbar"

# Download "dnscrypt-proxy switcher" plugin for Bitbar.
cd "${HOME}/.config/bitbar"
curl --location --remote-name --silent --header 'Accept: application/vnd.github.v3.raw' 'https://api.github.com/repos/jedisct1/bitbar-dnscrypt-proxy-switcher/contents/dnscrypt-proxy-switcher.10s.sh'

# Update the switcher theme.
sed -i -re "s/^THEME=\"(.+)\"/\THEME=\"emoji\"/gi" "dnscrypt-proxy-switcher.10s.sh"

# Set proper permissions.
chmod +x "dnscrypt-proxy-switcher.10s.sh"

# Start the service.
sudo brew services start dnscrypt-proxy > /dev/null 2>&1

# Reload the plugin, in case BitBar is already running.
open 'bitbar://refreshPlugin?name=dnscrypt-proxy-switcher.*?.sh' > /dev/null 2>&1
