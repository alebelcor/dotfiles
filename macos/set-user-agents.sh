#!/usr/bin/env bash
#
# Sets programs to be run in the background without requiring user input.
#
# More information here: http://www.launchd.info/
#

setup_agent() {
	local destination="$HOME/Library/LaunchAgents/"
	local configuration_file="$destination/$1"

	# Unload the configuration file, just in case.
	launchctl unload "$configuration_file" > /dev/null 2>&1

	# Copy the configuration file.
	cp "$1" "$destination"

	# Load the configuration file.
	launchctl load "$configuration_file" > /dev/null
}

printf "› Setting user agents.\\n"

# Set up "Launch Fitbit Connect" agent.
setup_agent "launch-fitbit-connect.plist"
