#!/usr/bin/env bash
#
# Install Google Chrome extensions.
#

# Check for Google Chrome.
if ! test -d "/Applications/Google Chrome.app"
then
	printf "\\r  [ \\033[0;33mWARN\\033[0m ] Google Chrome.app is not installed.\\n"
	exit 1
fi

# Ensure destination folder exists.
DESTINATION="${HOME}/Library/Application Support/Google/Chrome/External Extensions"
mkdir -p "${DESTINATION}"

# List of Google Chrome extensions to install.
EXTENSIONS=(

	# 1Password – Password Manager
	"aeblfdkhhhdcdjpifhhbdiojplfjncoa"

	# Clear Downloads
	"bknoejjhcfmakcibhifepfkegpjdnadk"

	# Decentraleyes
	"ldpochfccmkkmhdbclfhpagapcfdljkj"

	# DuckDuckGo Privacy Essentials
	"bkdgflcldnnnapblkhphbgpggdiikppg"

	# Google Analytics Opt-out Add-on (by Google)
	"fllaojicojecljbmefodhfapmkghcbnh"

	# IBA Opt-out (by Google)
	"gbiekjoijknlhijdjbaadobpkdhmoebb"

	# Keepa - Amazon Price Tracker
	"neebplgakaahbhdphmkckjjcegoiijjo"

	# Momentum
	"laookkfknpbbblfpciffpaejjkokdgca"

	# Privacy Badger
	"pkehgijcmpdhfbdbbnkijodmdjhbjlgp"

	# Protect My Choices
	"hdgloanjhdcenjgiafkpbehddcnonlic"

	# React Developer Tools
	"fmkadmapgofadopljbjfkapdkoienihi"

	# Reddit Enhancement Suite
	"kbmfpngjjgdllneeigpgjifpgocmfgmb"

	# Refined GitHub
	"hlepfoohegkhhmjieoechaddaejaokhf"

	# Return YouTube Dislike
	"gebbhagfogifgggkldgodflihgfeippi"

	# SponsorBlock for YouTube - Skip Sponsorships
	"mnjggcdmjocbbbhaepdhchncahnbgone"

	# uBlock Origin Lite
	"ddkjiahejlhfcafbddmgiahcphecmpfh"
)

# Define content for JSON files.
JSON_CONTENT='{"external_update_url": "https:\/\/clients2.google.com\/service\/update2\/crx"}'

# Create `.json` files, one for each extension to be installed.
for extension_id in "${EXTENSIONS[@]}"
do
	echo "${JSON_CONTENT}" > "${DESTINATION}/${extension_id}.json"
done
