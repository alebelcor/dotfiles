#!/bin/sh

# Check for Ghostty.
if ! test -d "/Applications/Ghostty.app"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] Ghostty.app is not installed.\\n"
	exit 1
fi

printf "› Installing Ghostty settings.\\n"

# Set path to current folder.
DOTFILES_GHOSTTY="${DOTFILES}/ghostty"

# Ensure destination folder exists.
mkdir -p "${HOME}/.config/ghostty"

# Create a symbolic link for the configuration file.
ln -sf "${DOTFILES_GHOSTTY}/config" "${HOME}/.config/ghostty/config"
