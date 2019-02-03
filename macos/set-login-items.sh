#!/bin/sh

printf "› Adding login items.\\n"

for app in "BitBar" \
	"Caffeine" \
	"Flux" \
	"Google Chrome" \
	"Lightshot Screenshot" \
	"Spectacle";
do
	# Check if app is installed.
	if test -d "/Applications/${app}.app"
	then
		# Check if app is already a login item.
		if osascript -e "tell application \"System Events\" to get login item \"${app}\"" > /dev/null 2>&1
		then
			printf "\\r  [ \\033[0;33mWARN\\033[0m ] %s is already a login item.\\n" "${app}"
		else
			# Add app as a non-hidden login item.
			osascript -e "tell application \"System Events\" to make login item at end with properties {path: \"/Applications/${app}.app\", hidden: false}" > /dev/null
			printf "\\r  [ \\033[00;32mSUCCESS\\033[0m ] %s was added as a login item.\\n" "${app}"
		fi
	fi
done
