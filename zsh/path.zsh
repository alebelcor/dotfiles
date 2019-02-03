#!/usr/bin/env zsh

# Add custom functions.
fpath=("${DOTFILES}/functions" $fpath)

# Additional completion definitions for ZSH.
fpath=("${HOMEBREW_PREFIX}/share/zsh-completions" $fpath)
