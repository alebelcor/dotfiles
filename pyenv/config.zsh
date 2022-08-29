#!/usr/bin/env zsh

# Initialize `pyenv`.
if test "$(command -v pyenv)"
then
	eval "$(pyenv init -)"
fi
