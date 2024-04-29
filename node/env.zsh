#!/usr/bin/env zsh

export ADBLOCK=true

# Disable Open Collective postinstall message
# https://github.com/opencollective/opencollective-postinstall
export DISABLE_OPENCOLLECTIVE=true

# Use sloppy mode by default, matching web browsers
export NODE_REPL_MODE='sloppy'

# Avoid submitting audit reports
# https://docs.npmjs.com/cli/v10/using-npm/config#audit
export NPM_CONFIG_AUDIT=false

# Disable funding message
# https://docs.npmjs.com/cli/v10/using-npm/config#fund
export NPM_CONFIG_FUND=false

# Disable progress bar
# https://docs.npmjs.com/cli/v10/using-npm/config#progress
export NPM_CONFIG_PROGRESS=false

# Suppress the update notification when using an older version of npm than the latest
# https://docs.npmjs.com/cli/v10/using-npm/config#update-notifier
export NPM_CONFIG_UPDATE_NOTIFIER=false

# Opt-out of Scarf (https://scarf.sh/) analytics
export SCARF_ANALYTICS=false
