#!/bin/sh

# Check for Alacritty.
if ! test -d "/Applications/Alacritty.app"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] Alacritty.app is not installed.\\n"
	exit 1
fi

printf "› Installing Alacritty settings.\\n"

# Set path to current folder.
DOTFILES_ALACRITTY="${DOTFILES}/alacritty"

# Ensure destination folder exists.
mkdir -p "${HOME}/.config/alacritty"

# Create a symbolic link for the configuration file.
ln -sf "${DOTFILES_ALACRITTY}/alacritty.yml" "${HOME}/.config/alacritty/alacritty.yml"
