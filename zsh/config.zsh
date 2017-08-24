#!/usr/bin/env zsh

# ==========================================================================
# ZSH options
# ==========================================================================

# If you type `foo`, and it isn't a command, and it is a directory
# in your cdpath, go there.
setopt AUTO_CD

# Don't push multiple copies of the same directory onto the directory stack.
setopt PUSHD_IGNORE_DUPS

# Allow multiple terminal sessions to all append to one ZSH command history.
setopt APPEND_HISTORY

# Add timestamps to history.
setopt EXTENDED_HISTORY

# Add commands as they are typed, don't wait until shell exit.
setopt INC_APPEND_HISTORY

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

# Share history between sessions.
setopt SHARE_HISTORY

# When completing from the middle of a word, move the cursor
# to the end of the word.
setopt ALWAYS_TO_END

# Show completion menu on successive tab press.
# Needs `unsetop MENU_COMPLETE` to work.
setopt AUTO_MENU

# Any parameter that is set to the absolute name of a directory immediately
# becomes a name for that directory.
setopt AUTO_NAME_DIRS

# Allow completion from within a word/phrase.
setopt COMPLETE_IN_WORD

# Do not autoselect the first completion entry.
unsetopt MENU_COMPLETE

# Don't nice background tasks to avoid slowness.
setopt NO_BG_NICE

# Turn off beeping only for ambiguous completions.
setopt NO_LIST_BEEP

# Allow functions to have local options.
setopt LOCAL_OPTIONS

# Allow functions to have local traps.
setopt LOCAL_TRAPS

# Suggest commands when they don't exist.
setopt CORRECT

# Spelling correction for arguments
unsetopt CORRECT_ALL

# Enable parameter expansion, command substitution, and arithmetic expansion
# in the prompt.
setopt PROMPT_SUBST

# Don't expand aliases _before_ completion has finished.
#   like: git comm-[tab]
setopt COMPLETE_ALIASES

# ==========================================================================
# Key bindings
# ==========================================================================

# Set ZSH Line Editor to use emacs mode.
bindkey -e

# Move backwards (per word) using: Control + ←
bindkey '^[[1;5D' backward-word

# Move forward (per word) using: Control + →
bindkey '^[[1;5C' forward-word

# Set forward delete (i.e. erase to the right) to "delete ⌦" key on Mac
bindkey '^[[3~' delete-char
