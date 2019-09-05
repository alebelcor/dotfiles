#!/bin/sh

# Check for `rbenv`.
if test ! "$(command -v rbenv)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] rbenv is not installed.\\n"
	exit 1
fi

# Initialize `rbenv`.
rbenv init > /dev/null 2>&1

# Get the latest Ruby version number.
LATEST_VERSION=$(rbenv install --list | grep -v - | tail -1 | tr -d '[[:space:]]')

# Check if that version is installed, otherwise install it.
if ! (rbenv versions | grep -qe "${LATEST_VERSION}")
then
	printf "› Installing Ruby v%s.\\n" "${LATEST_VERSION}"
	rbenv install "${LATEST_VERSION}" 1> /dev/null

	printf "› Setting global version of Ruby for all shells to v%s.\\n" "${LATEST_VERSION}"
	rbenv global "${LATEST_VERSION}" 1> /dev/null
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] Ruby v%s is already installed.\\n" "${LATEST_VERSION}"
fi
