#!/bin/sh

# Check for Homebrew.
if test ! "$(command -v brew)"
then
  printf "› Installing Homebrew.\\n"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
