#!/bin/sh

# Check for `hostess`.
if test ! "$(command -v hostess)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] hostess is not installed.\\n"
	exit 1
fi

# Set domains from file.
sudo hostess -s apply domains.json

# Clean up.
sudo hostess -s fix
