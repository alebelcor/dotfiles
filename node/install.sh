#!/bin/sh

# Check for `nodenv`.
if test ! "$(command -v nodenv)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] nodenv is not installed.\\n"
	exit 1
fi

# Check for `git`.
if test ! "$(command -v git)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] git is not installed.\\n"
	exit 1
fi

# Initialize `nodenv`.
nodenv init > /dev/null 2>&1

# Install `nodenv` plugins.
mkdir -p "$(nodenv root)"/plugins
cd "$(nodenv root)"/plugins || exit 1

# Install the `nodenv-package-rehash` plugin.
if test ! -d "nodenv-package-rehash"
then
	printf "› Installing nodenv-package-rehash plugin.\\n"
	git clone https://github.com/nodenv/nodenv-package-rehash.git > /dev/null 2>&1

	printf "› Initialize nodenv-package-rehash plugin.\\n"
	nodenv package-hooks install --all > /dev/null 2>&1
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] nodenv-package-rehash is already installed.\\n"
fi

# Get path to `node` folder.
DOTFILES_NODE="$(dirname "$(realpath "$0")")"

# Install the `nodenv-default-packages` plugin.
cp "$DOTFILES_NODE/default-packages" "$(nodenv root)/"

if test ! -d "nodenv-default-packages"
then
	printf "› Installing nodenv-default-packages plugin.\\n"
	git clone https://github.com/nodenv/nodenv-default-packages.git > /dev/null 2>&1
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] nodenv-default-packages is already installed.\\n"
fi

# Install the `nodenv-update` plugin.
if test ! -d "nodenv-update"
then
	printf "› Installing nodenv-update plugin.\\n"
	git clone https://github.com/nodenv/nodenv-update.git > /dev/null 2>&1
	nodenv update > /dev/null 2>&1
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] nodenv-update is already installed.\\n"
fi

# Get the latest Node.js LTS version number.
latest_lts_version=$(curl -s https://nodejs.org/dist/index.json 2>/dev/null | \
	grep -e '"lts":"[A-Z][a-z]\+"' | \
	grep -oe '"version":"\(v[.0-9]\+\)"' | \
	grep -oe '[.0-9]\+' | \
	head -n1\
)

# Check if that version is installed, otherwise install it.
if test ! "$(nodenv versions | grep -qe "$latest_lts_version")"
then
	printf "› Installing Node.js v%s.\\n" "$latest_lts_version"
	nodenv install "$latest_lts_version" > /dev/null 2>&1

	printf "› Setting global version of Node for all shells to v%s.\\n" "$latest_lts_version"
	nodenv global "$latest_lts_version" > /dev/null 2>&1
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] Node.js v%s is already installed.\\n" "$latest_lts_version"
fi
