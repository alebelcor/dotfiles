#!/bin/sh

# Check for `safe-rm`.
if test ! "$(command -v safe-rm)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] safe-rm is not installed.\\n"
	exit 1
fi

printf "› Installing safe-rm settings.\\n"

# Set path to current folder.
DOTFILES_SAFE_RM="${ZSH}/safe-rm"

# Ensure destination folder exists.
mkdir -p "${HOME}/.config"

# Create a symbolic link for the configuration file.
ln -sf "${DOTFILES_SAFE_RM}/safe-rm" "${HOME}/.config/safe-rm"
