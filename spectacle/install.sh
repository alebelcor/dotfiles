#!/bin/sh

# Check for Spectacle.
if ! test -d "/Applications/Spectacle.app"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] Spectacle.app is not installed.\\n"
	exit 1
fi

printf "› Installing Spectacle keyboard shortcuts.\\n"

# Get path to `spectacle` folder.
DOTFILES_SPECTACLE="$(dirname $(realpath $0))"

# Install Spectacle keyboard shortcuts.
cp "$DOTFILES_SPECTACLE/Shortcuts.json" "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
