#!/usr/bin/env bash
#
# Sets programs to be run in the background without requiring user input.
#
# More information here: http://www.launchd.info/
#
# Note: Set proper permissions for new `.plist`: `chmod 644 new.plist`
#

# Get path to `macos` folder.
DOTFILES_MACOS="$(dirname $(realpath "$0"))"

setup_agent() {
	local destination="${HOME}/Library/LaunchAgents/"
	local configuration_file="${destination}/$1"

	# Unload the configuration file, just in case.
	launchctl unload "${configuration_file}" > /dev/null 2>&1

	# Copy the configuration file.
	cp "${DOTFILES_MACOS}/$1" "${destination}"

	# Load the configuration file.
	launchctl load "${configuration_file}" > /dev/null
}

printf "› Setting user agents.\\n"

setup_agent "fitbit-connect-launcher.plist"

setup_agent "duti-watcher.plist"
