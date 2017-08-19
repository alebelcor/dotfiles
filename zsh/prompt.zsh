#!/usr/bin/env zsh

# Prevent prompt from checking whether the current git remote has been updated
export PURE_GIT_PULL=0

# Set up prompt
autoload -U promptinit
promptinit
prompt pure
