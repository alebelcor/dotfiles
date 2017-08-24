#!/bin/sh

# Check for Homebrew.
if test ! $(which brew)
then
  echo "› Installing Homebrew.\n"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null
fi
