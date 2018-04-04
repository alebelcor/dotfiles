#!/bin/sh

# Check for Homebrew.
if test ! "$(command -v brew)"
then
  printf "› Installing Homebrew.\\n"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null
fi
