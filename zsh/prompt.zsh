#!/usr/bin/env zsh

# Prevent prompt from checking whether the current git remote has been updated.
export PURE_GIT_PULL=0

# Do not include untracked files in dirtiness check. Mostly useful on large repos.
export PURE_GIT_UNTRACKED_DIRTY=0

# Set up prompt.
autoload -U promptinit
promptinit
prompt pure
