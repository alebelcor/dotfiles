#!/bin/sh

# Check for `duti`.
if test ! "$(command -v duti)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] duti is not installed.\\n"
	exit 1
fi

printf "› Settings default applications for various file types.\\n"

# Set path to current folder.
DOTFILES_DUTI="${DOTFILES}/duti"

# Ensure destination folder exists.
mkdir -p "${HOME}/.config"

# Create a symbolic link for the configuration file.
ln -sf "${DOTFILES_DUTI}/duti" "${HOME}/.config/duti"

# Set default applications for various document types.
duti "${HOME}/.config/duti" > /dev/null
