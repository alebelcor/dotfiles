#!/bin/sh

# Check for `safe-rm`.
if test ! "$(command -v safe-rm)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] safe-rm is not installed.\\n"
	exit 1
fi

# Get the current directory path.
DOTFILES_SAFE_RM="$(pwd -P)"

# Create `.config` folder if it doesn't exist.
mkdir -p "${HOME}/.config"

# Create a symbolic link for the configuration file.
ln -s "${DOTFILES_SAFE_RM}/safe-rm" "${HOME}/.config/safe-rm"