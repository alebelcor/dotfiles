#!/usr/bin/env zsh

alias e='exit'

# Enable aliases to be sudo'd.
alias sudo='sudo '

# Enable colored `grep` output.
alias grep='grep --color'

# Easier navigation.
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'

# Shortcuts.
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias p='cd ~/projects'

# Add this to long-running commands to know when they're done.
alias end="say 'Done'"

# Flush the DNS cache (for El Capitan). Use it after modifying the hosts file.
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;'

# Detect which `ls` flavor is in use.
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag='--color'
else # OS X `ls`
	colorflag='-G'
fi

# Always use color output for `ls`.
alias ls='command ls ${colorflag}'

# Replace `rm` with `safe-rm` to prevent accidental deletion of important files.
alias rm='safe-rm'
