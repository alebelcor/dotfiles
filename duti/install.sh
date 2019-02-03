#!/bin/sh

# Check for `duti`.
if test ! "$(command -v duti)"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] duti is not installed.\\n"
	exit 1
fi

printf "› Settings default applications for various file types.\\n"

# Set default applications for various document types.
duti "${HOME}/.duti" > /dev/null
