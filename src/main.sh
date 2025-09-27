#!/bin/bash

updateSystem() {
	sudo apt update
	sudo apt upgrade -y
}

installAptPackages() {
	PACKAGES=(
	    curl
	    git
	    wget
	    libxcb-xinerama0
	    libxcb-cursor0
	    libnss3
	    mplayer
	    gcc
	    make
	    perl
	)

	for PKG in "${PACKAGES[@]}"; do
	    sudo apt install -y "$PKG"
	done
}

installDebFiles() {
	DOWNLOAD_DIRECTORY="$HOME/Downloads"

	if [ ! -d "$DOWNLOAD_DIRECTORY" ]; then
	    mkdir -p "$DOWNLOAD_DIRECTORY"
	fi

	URLS=(
		"https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
		"https://download.virtualbox.org/virtualbox/7.2.2/virtualbox-7.2_7.2.2-170484~Ubuntu~noble_amd64.deb"
		"https://downloads.cursor.com/production/3ccce8f55d8cca49f6d28b491a844c699b8719a3/linux/x64/deb/amd64/deb/cursor_1.6.45_amd64.deb"
	)

	for URL in "${URLS[@]}"; do
	    wget -P "$DOWNLOAD_DIRECTORY" "$URL"
	done

	deb_files=("$DOWNLOAD_DIRECTORY"/*.deb)

	for file in "${deb_files[@]}"; do
	    sudo dpkg -i "$file"
	done

	sudo apt install -f -y

	rm -v "$DOWNLOAD_DIRECTORY"/*.deb
}

installAnki() {
	EXTRACT_DIRECTORY="$DOWNLOAD_DIRECTORY/anki-launcher"

	ANKI_ARCHIVE="$DOWNLOAD_DIRECTORY/anki-launcher.tar.zst"

	ANKI_DOWNLOAD_URL="https://release-assets.githubusercontent.com/github-production-release-asset/7270538/f715703f-c43b-4ab6-8f95-6714bc5dc33b"

	if [ ! -d "$EXTRACT_DIRECTORY" ]; then
	    mkdir -p "$EXTRACT_DIRECTORY"
	fi

	wget -O "$ANKI_ARCHIVE" "$ANKI_DOWNLOAD_URL"

	tar --strip-components=1 -xaf "$ANKI_ARCHIVE" -C "$EXTRACT_DIRECTORY"
	cd $EXTRACT_DIRECTORY
	sudo "./install.sh"

	rm -v "$ANKI_ARCHIVE"
	rm -rf $EXTRACT_DIRECTORY
}

updateSystem
installAptPackages
installDebFiles
installAnki