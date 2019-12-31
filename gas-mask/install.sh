#!/bin/sh

# Check for "Gas Mask".
if ! test -d "/Applications/Gas Mask.app"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] Gas Mask.app is not installed.\\n"
	exit 1
fi

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

printf "› Setting domain settings.\\n"

# Set path to current folder.
DOTFILES_GAS_MASK="${DOTFILES}/gas-mask"

# Ensure destination folders exist.
mkdir -p "${HOME}/Library/Gas Mask/Local"
mkdir -p "${HOME}/Library/Gas Mask/Remote"
mkdir -p "${HOME}/Library/Gas Mask/Combined"

# Clean up destination folders.
rm -rf "${HOME}/Library/Gas Mask/Local"/*
rm -rf "${HOME}/Library/Gas Mask/Remote"/*
rm -rf "${HOME}/Library/Gas Mask/Combined"/*

# Create a symbolic link for the (local) hosts file.
ln -sf "${DOTFILES_GAS_MASK}/local.hst" "${HOME}/Library/Gas Mask/Local"

# Download the (remote) blacklist hosts file.
cd "${HOME}/Library/Gas Mask/Remote"
curl --location --silent 'http://sbc.io/hosts/hosts' --output 'sbc.io.hst'

# Create a symbolic link for the (combined) hosts file.
ln -sf "${DOTFILES_GAS_MASK}/combined.hst" "${HOME}/Library/Gas Mask/Combined"

# Flush the DNS cache. Use it after modifying the hosts file.
sudo dscacheutil -flushcache
sudo killall -HUP mDNSResponder

printf "\\r  [ \\033[00;34mINFO\\033[0m ] Remember to open \"Gas Mask\", edit the combined hosts file, and save it for changes to take effect.\\n"
