#!/bin/sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Add "E-book Viewer" app to Launchpad.
sudo ln -sf "/Applications/calibre.app/Contents/ebook-viewer.app" "/Applications/E-book Viewer.app"

# Force re-register "E-book Viewer" app so that it's available on context menus.
# Rebuilding of the LaunchServices database is done at a later point.
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f "/Applications/calibre.app/Contents/ebook-viewer.app"
