#!/bin/sh

# Check for `nodenv`.
if test ! "$(command -v nodenv)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] nodenv is not installed.\\n"
	exit 1
fi

# Check for `git` (needed for the plugins).
if test ! "$(command -v git)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] git is not installed.\\n"
	exit 1
fi

# Initialize `nodenv`.
nodenv init > /dev/null 2>&1

# Set paths.
NODENV_ROOT="$(nodenv root)"
NODENV_PLUGINS="${NODENV_ROOT}/plugins"

# Ensure plugins folder exists.
mkdir -p "${NODENV_PLUGINS}"

# Install "node-build-update-defs" plugin.
# INFO: https://github.com/nodenv/node-build-update-defs
if ! test -d "${NODENV_PLUGINS}"/node-build-update-defs
then
	printf "› Installing \"node-build-update-defs\" plugin.\\n"

	# Install with Git.
	git clone https://github.com/nodenv/node-build-update-defs.git "${NODENV_PLUGINS}"/node-build-update-defs 1> /dev/null
fi

# Get (scraped) node-build definitions.
nodenv update-version-defs > /dev/null

# Install "nodenv-default-packages" plugin.
# INFO: https://github.com/nodenv/nodenv-default-packages
if ! test -d "${NODENV_PLUGINS}"/nodenv-default-packages
then
	printf "› Installing \"nodenv-default-packages\" plugin.\\n"

	# Install with Git.
	git clone https://github.com/nodenv/nodenv-default-packages.git "${NODENV_PLUGINS}"/nodenv-default-packages 1> /dev/null

	# Set path to current folder.
	DOTFILES_NODE="${DOTFILES}/node"

	# Create a symbolic link for the file.
	ln -sf "${DOTFILES_NODE}/default-packages" "${NODENV_ROOT}"

	# Install default packages.
	# INFO: Run this when the `default-packages` file is updated.
	nodenv default-packages install --all 1> /dev/null
fi

# Install "nodenv-package-rehash" plugin.
# INFO: https://github.com/nodenv/nodenv-package-rehash
if ! test -d "${NODENV_PLUGINS}"/nodenv-package-rehash
then
	printf "› Installing \"nodenv-package-rehash\" plugin.\\n"

	# Install with Git.
	git clone https://github.com/nodenv/nodenv-package-rehash.git "${NODENV_PLUGINS}"/nodenv-package-rehash 1> /dev/null

	# Install the hook.
	nodenv package-hooks install --all 1> /dev/null
fi

# Install "nodenv-update" plugin.
# INFO: https://github.com/nodenv/nodenv-update
if ! test -d "${NODENV_PLUGINS}"/nodenv-update
then
	printf "› Installing \"nodenv-update\" plugin.\\n"

	# Install with Git.
	git clone https://github.com/nodenv/nodenv-update.git "${NODENV_PLUGINS}"/nodenv-update 1> /dev/null

	# Update `nodenv` and all installed plugins.
	nodenv update 1> /dev/null
fi

# Get the latest Node.js LTS version number.
LATEST_LTS_VERSION=$(curl -s https://nodejs.org/dist/index.json 2> /dev/null | \
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
