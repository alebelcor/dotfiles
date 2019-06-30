#!/usr/bin/env zsh

# Initialize `nodenv`.
if test "$(command -v nodenv)"
then
	eval "$(nodenv init - --no-rehash)"
fi
