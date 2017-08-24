#!/bin/sh

echo "› Installing Node.js.\n"

# Check for `nodenv`.
if test ! $(which nodenv)
then
	printf "\r  [ \u001b[33mWARN\u001b[39m ] nodenv is not installed.\n";
	exit 1;
fi

# Initialize `nodenv`.
nodenv init > /dev/null 2>&1

# Get the latest Node.js LTS version number
latest_lts_version=$(curl -s https://nodejs.org/dist/index.json 2>/dev/null | \
	grep -e '"lts":"[A-Z][a-z]\+"' | \
	grep -oe '"version":"\(v[.0-9]\+\)"' | \
	grep -oe '[.0-9]\+' | \
	head -n1\
)

# Check if it's already installed.
is_latest_lts_installed=$(nodenv versions | grep -qe $latest_lts_version)

if test $? = 0
then
	printf "\r  [ \033[00;34mINFO\033[0m ] Node.js v$latest_lts_version is already installed.\n"
else
	echo "› Installing Node.js v$latest_lts_version.\n"
	nodenv install "$latest_lts_version" > /dev/null

	echo "› Setting global version of Node for all shells to v$latest_lts_version.\n"
	nodenv global "$latest_lts_version" > /dev/null
fi

echo "› Installing npm global packages.\n"
npm install --global \
	hpm-cli \
	movie-draft-cli \
	pure-prompt \
	speed-test \
	tp-feature-branch-name-cli \
	xo \
> /dev/null 2>&1

# Rehash `nodenv` to install shims for all executables.
nodenv rehash > /dev/null
