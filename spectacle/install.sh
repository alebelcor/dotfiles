#!/bin/sh

# Check for Spectacle.
if ! test -d "/Applications/Spectacle.app"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] Spectacle.app is not installed.\\n"
	exit 1
fi

printf "› Installing Spectacle keyboard shortcuts.\\n"

# Set path to current folder.
DOTFILES_SPECTACLE="${DOTFILES}/spectacle"

# Install Spectacle keyboard shortcuts.
ln -sf "${DOTFILES_SPECTACLE}/Shortcuts.json" "${HOME}/Library/Application Support/Spectacle/Shortcuts.json"
