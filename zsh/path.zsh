#!/usr/bin/env zsh

ZSH="$HOME/projects/dotfiles"

# Add custom functions.
fpath=("$ZSH/functions" $fpath)

# Additional completion definitions for ZSH.
fpath=("$(brew --prefix)/share/zsh-completions" $fpath)
