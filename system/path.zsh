#!/usr/bin/env zsh

HOMEBREW_PREFIX=$(brew --prefix)
ZSH="$HOME/projects/dotfiles"

# Adding coreutils, `sed`, `grep` tools.
path=("$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin" $path)

# Making sure Homebrew programs are used instead of the system-provided ones.
path=("$HOMEBREW_PREFIX/bin" $path)
path=("$HOMEBREW_PREFIX/sbin" $path)

# Adding local /bin folder.
path=("$ZSH/bin" $path)

# Adding coreutils' man pages.
export MANPATH="$HOMEBREW_PREFIX/man:$HOMEBREW_PREFIX/git/man:$HOMEBREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH"
