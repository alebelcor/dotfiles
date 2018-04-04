#!/bin/sh

printf "› Installing Spectacle keyboard shortcuts.\\n"

# Install Spectacle keyboard shortcuts.
cp -r Shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json 2> /dev/null
