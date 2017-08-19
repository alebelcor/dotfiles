#!/usr/bin/env zsh

export HOMEBREW_PREFIX=$(brew --prefix)

export MANPATH="$(brew --prefix)/man:$(brew --prefix)/git/man:$(brew --prefix)/opt/coreutils/libexec/gnuman:$MANPATH"

# Adding coreutils, `sed`, `grep` tools
path=("$(brew --prefix)/opt/coreutils/libexec/gnubin" $path)

# Making sure Homebrew programs are used instead of the system-provided ones.
path=("$(brew --prefix)/bin" $path)
path=("$(brew --prefix)/sbin" $path)

# Adding local /bin folder
path=("$ZSH/bin" $path)
