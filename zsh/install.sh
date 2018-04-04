#!/bin/sh

printf "› Installing ZSH.\\n"

# Check if ZSH is installed.
if test ! "$(command -v zsh)"
then
	printf "\\r  [ \\u001b[33mWARN\\u001b[39m ] ZSH is not installed.\\n";
	exit 1;
fi

# Check if ZSH is in `/etc/shells`.
if test ! "$(grep --quiet "$HOMEBREW_PREFIX/bin/zsh" "/etc/shells")"
then
	# Ask for the administrator password upfront.
	sudo -v

	# Keep-alive: update existing `sudo` time stamp until script has finished.
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

	printf "› Adding ZSH to the list of shells.\\n"
	echo "$HOMEBREW_PREFIX/bin/zsh" | sudo tee -a /etc/shells > /dev/null
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] ZSH is already in \"/etc/shells\".\\n"
fi

# Check if current shell is ZSH.
if test ! "$ZSH_NAME" = "zsh"
then
	printf "› Changing shell to ZSH.\\n"
	chsh -s "$HOMEBREW_PREFIX/bin/zsh"
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] ZSH is already the default shell.\\n"
fi

# Check if ZSH prompt is installed.
if test ! "$(npm ls --global --depth 0 pure-prompt)"
then
	printf "› Installing ZSH prompt.\\n"
	npm install --global pure-prompt > /dev/null
else
	printf "\\r  [ \\033[00;34mINFO\\033[0m ] ZSH prompt is already installed.\\n";
fi

# Create "projects" folder in case it doesn't exist.
mkdir -p "$HOME/projects"
