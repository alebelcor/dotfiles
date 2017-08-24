#!/bin/sh

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "› Installing all appropriate updates from the Mac App Store.\n"
sudo softwareupdate --install --all > /dev/null 2>&1
