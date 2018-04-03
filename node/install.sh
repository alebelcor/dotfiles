#!/bin/sh

DOTFILES_NODE=$(pwd -P)

# Check for `nodenv`.
if test ! $(which nodenv)
then
	printf "\r  [ \u001b[33mWARN\u001b[39m ] nodenv is not installed.\n"
	exit 1
fi

# Check for `git`
if test ! $(which git)
then
	printf "\r  [ \u001b[33mWARN\u001b[39m ] git is not installed.\n"
	exit 1
fi

# Initialize `nodenv`.
nodenv init > /dev/null 2>&1

# Install nodenv plugins.
mkdir -p "$(nodenv root)"/plugins
cd "$(nodenv root)"/plugins

# Install the nodenv-package-rehash plugin.
if test ! -d "nodenv-package-rehash"
then
	echo "› Installing nodenv-package-rehash plugin.\n"
	git clone https://github.com/nodenv/nodenv-package-rehash.git > /dev/null 2>&1

	echo "› Initialize nodenv-package-rehash plugin.\n"
	nodenv package-hooks install --all > /dev/null 2>&1
else
	printf "\r  [ \033[00;34mINFO\033[0m ] nodenv-package-rehash is already installed.\n"
fi

# Install the nodenv-default-packages plugin.
cp -r "$DOTFILES_NODE/default-packages" "$(nodenv root)/" 2> /dev/null

if test ! -d "nodenv-default-packages"
then
	echo "› Installing nodenv-default-packages plugin.\n"
	git clone https://github.com/nodenv/nodenv-default-packages.git > /dev/null 2>&1
else
	printf "\r  [ \033[00;34mINFO\033[0m ] nodenv-default-packages is already installed.\n"
fi

# Install the nodenv-update plugin.
if test ! -d "nodenv-update"
then
	echo "› Installing nodenv-update plugin.\n"
	git clone https://github.com/nodenv/nodenv-update.git > /dev/null 2>&1
	nodenv update > /dev/null 2>&1
else
	printf "\r  [ \033[00;34mINFO\033[0m ] nodenv-update is already installed.\n"
fi

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
	nodenv install "$latest_lts_version" > /dev/null 2>&1

	echo "› Setting global version of Node for all shells to v$latest_lts_version.\n"
	nodenv global "$latest_lts_version" > /dev/null 2>&1
fi
