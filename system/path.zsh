#!/usr/bin/env zsh

# Adding coreutils, `sed`, `grep` tools.
path=("${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin" $path)

# Ensure Homebrew programs are used instead of the system-provided ones.
path=("${HOMEBREW_PREFIX}/bin" $path)
path=("${HOMEBREW_PREFIX}/sbin" $path)

# Adding local `/bin` folder.
path=("${DOTFILES}/bin" $path)

# Adding coreutils' man pages.
export MANPATH="${HOMEBREW_PREFIX}/man:${HOMEBREW_PREFIX}/git/man:${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnuman:${MANPATH}"
