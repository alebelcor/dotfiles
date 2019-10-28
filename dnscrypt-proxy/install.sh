#!/bin/sh

# Check for `dnscrypt-proxy`.
if test ! "$(command -v dnscrypt-proxy)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] dnscrypt-proxy is not installed.\\n"
	exit 1
fi

# Start the service.
brew services start dnscrypt-proxy > /dev/null 2>&1
