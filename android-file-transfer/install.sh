#!/bin/sh

# Check for Android File Transfer.
if ! test -d "/Applications/Android File Transfer.app"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] Android File Transfer.app is not installed.\\n"
	exit 1
fi

# Kill agent in charge of opening the app when a device is connected via USB.
killall "Android File Transfer Agent" > /dev/null 2>&1

# Remove agent from login items to prevent it from re-opening later on.
osascript -e 'tell application "System Events" to delete login item "Android File Transfer Agent"' > /dev/null 2>&1
