#!/usr/bin/env zsh

# Adding coreutils to $PATH.
path=("${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin" $path)

# Adding `find`, `locate`, `updatedb`, `xargs` to $PATH.
path=("${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin" $path)

# Adding `sed` to $PATH.
path=("${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin" $path)

# Adding `grep` to $PATH.
path=("${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin" $path)

# Ensure Homebrew programs are used instead of the system-provided ones.
path=("${HOMEBREW_PREFIX}/bin" $path)
path=("${HOMEBREW_PREFIX}/sbin" $path)

# Adding local `/bin` folder.
path=("${DOTFILES}/bin" $path)

# Adding coreutils' man pages.
export MANPATH="${HOMEBREW_PREFIX}/man:${HOMEBREW_PREFIX}/git/man:${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnuman:${MANPATH}"
