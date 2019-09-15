#!/usr/bin/env zsh

# Automatically load functions in `functions` folder.
autoload -U "${DOTFILES}"/functions/*(:t)

# ==========================================================================
# ZSH options
# ==========================================================================

# More info: http://zsh.sourceforge.net/Doc/Release/Options.html

# -- Changing Directories

# If you type `foo`, and it isn't a command, and it is a directory
# in your cdpath, go there.
setopt AUTO_CD

# Don't push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# -- Completion

# When completing from the middle of a word, move the cursor
# to the end of the word.
setopt ALWAYS_TO_END

# Show completion menu on successive tab press.
# Needs `unsetop MENU_COMPLETE` to work.
setopt AUTO_MENU

# Any parameter that is set to the absolute name of a directory immediately
# becomes a name for that directory.
setopt AUTO_NAME_DIRS

# Don't expand aliases _before_ completion has finished.
# like: `git comm-[tab]`
setopt COMPLETE_ALIASES

# Allow completion from within a word/phrase.
setopt COMPLETE_IN_WORD

# Turn off beeping only for ambiguous completions.
unsetopt LIST_BEEP

# Do not autoselect the first completion entry.
unsetopt MENU_COMPLETE

# -- Expansion and Globbing

# ...

# -- History

# Allow multiple terminal sessions to all append to one ZSH command history.
setopt APPEND_HISTORY

# Add timestamps to history.
setopt EXTENDED_HISTORY

# When trimming history, lose oldest duplicates first.
setopt HIST_EXPIRE_DUPS_FIRST

# Do not write events to history that are duplicates of previous events.
setopt HIST_IGNORE_DUPS

# Remove command from history when first character on the line is a space.
setopt HIST_IGNORE_SPACE

# Remove extra blanks from each command line being added to history.
setopt HIST_REDUCE_BLANKS

# Don't execute, just expand history.
setopt HIST_VERIFY

# Add commands as they are typed, don't wait until shell exit.
setopt INC_APPEND_HISTORY

# Share history between sessions.
setopt SHARE_HISTORY

# -- Initialisation

# ...

# -- Input/Output

# Suggest commands when they don't exist.
setopt CORRECT

# Spelling correction for arguments.
unsetopt CORRECT_ALL

# Query the user before executing `rm` with a star, e.g. `rm *` or `rm path/*`.
unsetopt RM_STAR_SILENT

# Wait 10 seconds until executing `rm` with a star, e.g. `rm path/*`.
setopt RM_STAR_WAIT

# -- Job Control

# Don't nice background tasks to avoid slowness.
unsetopt BG_NICE

# -- Prompting

# Enable parameter expansion, command substitution, and arithmetic expansion
# in the prompt.
setopt PROMPT_SUBST

# -- Scripts and Functions

# Allow functions to have local options.
setopt LOCAL_OPTIONS

# Allow functions to have local traps.
setopt LOCAL_TRAPS

# -- Shell Emulation

# ...

# -- Shell State

# ...

# -- Zle

# ...

# ==========================================================================
# Key bindings
# ==========================================================================

# Set ZSH Line Editor to use emacs mode.
bindkey -e

# Move backwards (per word) using: ⌥ + ←
bindkey '^[[1;3D' backward-word

# Move forward (per word) using: ⌥ + →
bindkey '^[[1;3C' forward-word

# Set forward delete (i.e. erase to the right) to "delete ⌦" key on Mac
bindkey '^[[3~' delete-char
