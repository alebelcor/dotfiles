#!/usr/bin/env zsh

# Do not send analytics.
export HOMEBREW_NO_ANALYTICS=1

# Disable auto-update checks.
export HOMEBREW_NO_AUTO_UPDATE=1

# Do not permit redirects from secure HTTPS to insecure HTTP.
export HOMEBREW_NO_INSECURE_REDIRECT=1

# Abort installation of cask if no checksum is defined.
export HOMEBREW_CASK_OPTS='--require-sha'
