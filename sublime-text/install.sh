#!/bin/sh

printf "› Installing Sublime Text settings.\\n"

# Set up Sublime Text settings.
cp -r Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/ 2> /dev/null

# Set up Sublime Text key bindings.
cp -r "Default (OSX).sublime-keymap" ~/Library/Application\ Support/Sublime\ Text*/Packages/User/ 2> /dev/null

# Set up Markdown Editing settings.
cp -r Markdown.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/ 2> /dev/null

# Set up Package Control settings.
# Package Control will automatically install the packages listed in this file.
cp -r "Package Control.sublime-settings" ~/Library/Application\ Support/Sublime\ Text*/Packages/User/ 2> /dev/null

# Install Package Control.
# Sublime Text will automatically install the package on the next run.
cd ~/Library/Application\ Support/Sublime\ Text*/Installed\ Packages/ || exit 1
wget --quiet https://packagecontrol.io/Package%20Control.sublime-package
