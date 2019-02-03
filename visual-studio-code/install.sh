#!/bin/sh

# Check for Visual Studio Code.
if test ! "$(command -v code)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] Visual Studio Code is not installed.\\n"
	exit 1
fi

printf "› Installing Visual Studio Code settings.\\n"

# Uninstall extensions

# vscode-icons
code --uninstall-extension "robertohuertasm.vscode-icons" > /dev/null 2>&1

# Install extensions

# Brewfile
code --install-extension "sharat.vscode-brewfile" > /dev/null 2>&1
# Code Spell Checker
code --install-extension "streetsidesoftware.code-spell-checker" > /dev/null 2>&1
# EditorConfig for VS Code
code --install-extension "editorconfig.editorconfig" > /dev/null 2>&1
# markdownlint
code --install-extension "davidanson.vscode-markdownlint" > /dev/null 2>&1
# Material Icon Theme
code --install-extension "PKief.material-icon-theme" > /dev/null 2>&1
# npm
code --install-extension "eg2.vscode-npm-script" > /dev/null 2>&1
# npm Intellisense
code --install-extension "christian-kohler.npm-intellisense" > /dev/null 2>&1
# One Monokai Theme
code --install-extension "azemoh.one-monokai" > /dev/null 2>&1
# shellcheck
code --install-extension "timonwong.shellcheck" > /dev/null 2>&1

# Set path to current folder.
DOTFILES_VSCODE="${DOTFILES}/visual-studio-code"

# Set up Visual Studio Code settings.
ln -sf "${DOTFILES_VSCODE}/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
