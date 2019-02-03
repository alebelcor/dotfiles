#!/usr/bin/env bash
#
# Install Google Chrome extensions.
#

# Ensure destination folder exists.
DESTINATION="${HOME}/Library/Application Support/Google/Chrome/External Extensions"
mkdir -p "${DESTINATION}"

# Define list of Google Chrome extensions to install.
EXTENSIONS=(

	# 1Password: Password Manager and Secure Wallet
	"aomjjhallfgjeglblehebfpbcfeobpgk"

	# Clear Downloads
	"bknoejjhcfmakcibhifepfkegpjdnadk"

	# Decentraleyes
	"ldpochfccmkkmhdbclfhpagapcfdljkj"

	# Google Analytics Opt-out Add-on (by Google)
	"fllaojicojecljbmefodhfapmkghcbnh"

	# Hacker News Enhancement Suite
	"bappiabcodbpphnojdiaddhnilfnjmpm"

	# HTTPS Everywhere
	"gcbommkclmclpchllfjekcdonpmejbdp"

	# IBA Opt-out (by Google)
	"gbiekjoijknlhijdjbaadobpkdhmoebb"

	# JSON Formatter
	"bcjindcccaagfpapjjmafapmmgkkhgoa"

	# minerBlock
	"emikbbbebcdfohonlaifafnoanocnebl"

	# Momentum
	"laookkfknpbbblfpciffpaejjkokdgca"

	# NoCountryRedirect (NCR)
	"ciboebddidackjicoeoiigdnbmchkdll"

	# Protect My Choices
	"hdgloanjhdcenjgiafkpbehddcnonlic"

	# Reddit Enhancement Suite
	"kbmfpngjjgdllneeigpgjifpgocmfgmb"

	# Refined GitHub
	"hlepfoohegkhhmjieoechaddaejaokhf"

	# Refined Twitter
	"nlfgmdembofgodcemomfeimamihoknip"

	# Tab Size on GitHub
	"ofjbgncegkdemndciafljngjbdpfmbkn"

	# The Great Suspender
	"klbibkeccnjlkjkiokjodocebajanakg"

	# uBlock Origin
	"cjpalhdlnbpafiamejdnhcphjbkeiagm"
)

# Define content for JSON files.
JSON_CONTENT='{"external_update_url": "https:\/\/clients2.google.com\/service\/update2\/crx"}'

# Create `.json` files, one for each extension to be installed.
for extension_id in "${EXTENSIONS[@]}"
do
	echo "${JSON_CONTENT}" > "${DESTINATION}/${extension_id}.json"
done
