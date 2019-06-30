#!/bin/sh

# Check for `nodenv`.
if test ! "$(command -v nodenv)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] nodenv is not installed.\\n"
	exit 1
fi

# Initialize `nodenv`.
nodenv init > /dev/null 2>&1

# Set path to current folder.
DOTFILES_NODE="${DOTFILES}/node"

# Setup default packages list.
if test "$(brew list nodenv/nodenv/nodenv-default-packages)"
then
	# Set path to nodenv root.
	NODENV_ROOT="$(nodenv root)"

	# Ensure destination folder exists.
	mkdir -p "${NODENV_ROOT}/plugins"

	# Create a symbolic link for the file.
	ln -sf "${DOTFILES_NODE}/default-packages" "${NODENV_ROOT}/default-packages"
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] nodenv-default-packages is not installed.\\n"
	exit 1
fi

# Install the hooks for existing `nodenv` versions.
if test "$(brew list nodenv/nodenv/nodenv-package-rehash)"
then
	nodenv package-hooks install --all > /dev/null 2>&1
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] nodenv-package-rehash is not installed.\\n"
	exit 1
fi

# Update `nodenv` and plugins.
if test "$(brew list nodenv/nodenv/nodenv-update)"
then
	nodenv update > /dev/null 2>&1
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] nodenv-update is not installed.\\n"
	exit 1
fi

# Get the latest Node.js LTS version number.
LATEST_LTS_VERSION=$(curl -s https://nodejs.org/dist/index.json 2>/dev/null | \
	grep -e '"lts":"[A-Z][a-z]\+"' | \
	grep -oe '"version":"\(v[.0-9]\+\)"' | \
	grep -oe '[.0-9]\+' | \
	head -n1\
)

# Check if that version is installed, otherwise install it.
if ! (nodenv versions | grep -qe "${LATEST_LTS_VERSION}")
then
	printf "› Installing Node.js v%s.\\n" "${LATEST_LTS_VERSION}"
	nodenv install "${LATEST_LTS_VERSION}" 1> /dev/null

	printf "› Setting global version of Node for all shells to v%s.\\n" "${LATEST_LTS_VERSION}"
	nodenv global "${LATEST_LTS_VERSION}" 1> /dev/null
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] Node.js v%s is already installed.\\n" "${LATEST_LTS_VERSION}"
fi
