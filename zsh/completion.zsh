#!/usr/bin/env zsh

# Fish-like fast/unobtrusive autosuggestions for ZSH.
autosuggestions="$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

if test -f "$autosuggestions"
then
	source "$autosuggestions"
else
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] zsh-autosuggestions is not installed.\\n"
fi

# Syntax highlighting for ZSH.
syntax_highlighting="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if test -f "$syntax_highlighting"
then
	source "$syntax_highlighting"
else
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] zsh-syntax-highlighting is not installed.\\n"
fi

# Matches case insensitive for lowercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Pasting with tabs doesn't perform completion.
zstyle ':completion:*' insert-tab pending
