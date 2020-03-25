#!/usr/bin/env bash

# Check for Visual Studio Code.
if test ! "$(command -v code)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] Visual Studio Code is not installed.\\n"
	exit 1
fi

printf "› Installing Visual Studio Code extensions and settings.\\n"

# Get list of installed extensions.
INSTALLED_EXTENSIONS=$(code --list-extensions)

# Define list of extensions to uninstall.
EXTENSIONS_TO_UNINSTALL=(

	# vscode-icons
	"robertohuertasm.vscode-icons"

)

for installed_extension in "${INSTALLED_EXTENSIONS[@]}"
do
	if (printf '%s\n' "${EXTENSIONS_TO_UNINSTALL[@]}" | grep -q "${installed_extension}")
	then
		code --uninstall-extension "${installed_extension}" > /dev/null 2>&1
	fi
done

# Define list of extensions to install.
EXTENSIONS_TO_INSTALL=(

	# Auto Rename Tag
	"formulahendry.auto-rename-tag"

	# Brewfile
	"sharat.vscode-brewfile"

	# Code Spell Checker
	"streetsidesoftware.code-spell-checker"

	# Docker
	"ms-azuretools.vscode-docker"

	# DotENV
	"mikestead.dotenv"

	# EditorConfig for VS Code
	"EditorConfig.EditorConfig"

	# ESLint
	"dbaeumer.vscode-eslint"

	# GitLens
	"eamodio.gitlens"

	# GraphQL
	"prisma.vscode-graphql"

	# Import Cost
	"wix.vscode-import-cost"

	# LaTeX Workshop
	"james-yu.latex-workshop"

	# markdownlint
	"DavidAnson.vscode-markdownlint"

	# Material Icon Theme
	"PKief.material-icon-theme"

	# npm
	"eg2.vscode-npm-script"

	# npm Intellisense
	"christian-kohler.npm-intellisense"

	# One Monokai Theme
	"azemoh.one-monokai"

	# Path Intellisens
	"christian-kohler.path-intellisense"

	# Prettier - Code formatter
	"prettier.prettier-vscode"

	# Ruby
	"rebornix.ruby"

	# Sass
	"robinbentley.sass-indented"

	# shellcheck
	"timonwong.shellcheck"

	# Todo Tree
	"Gruntfuggly.todo-tree"

	# XML
	"redhat.vscode-xml"

	# YAML
	"redhat.vscode-yaml"

)

for extension_to_install in "${EXTENSIONS_TO_INSTALL[@]}"
do
	if ! (printf '%s\n' "${INSTALLED_EXTENSIONS[@]}" | grep -q "${extension_to_install}")
	then
		code --install-extension "${extension_to_install}" > /dev/null 2>&1
	fi
done

# Set path to current folder.
DOTFILES_VSCODE="${DOTFILES}/visual-studio-code"

# Set up Visual Studio Code settings.
ln -sf "${DOTFILES_VSCODE}/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
