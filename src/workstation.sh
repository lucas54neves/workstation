#!/bin/bash

source functions/install_dropbox.sh

# # Downloads directory
# downloadsDirectory="$HOME/Downloads"

# # System update
# sudo apt update && sudo apt upgrade -y

# if which wget >/dev/null 2>&1; then
#     # Notify the user
#     echo "wget is installed."
# else
#     # Notify the user
#     echo "wget is not installed."
    
#     # Install Wget
#     sudo apt install -y wget
# fi

# # Check if VirtualBox is already installed
# if which virtualbox >/dev/null 2>&1; then
#     # Notify the user
#     echo "VirtualBox is already installed."
# fi

# # Check if VirtualBox is not installed
# if ! which virtualbox >/dev/null 2>&1; then
#     # Notify the user
#     echo "VirtualBox is not installed."
    
#     # Install required dependencies
#     sudo apt install -y virtualbox virtualbox-ext-pack

#     # Notify the user
#     echo "VirtualBox has been installed."
# fi

# # Check if VSCode is already installed
# if which code >/dev/null 2>&1; then
#     # Notify the user
#     echo "Visual Studio Code is already installed."
# fi

# if ! which code >/dev/null 2>&1; then
# 	# Notify the user
# 	echo "Visual Studio Code is not installed."
	
#     # VSCode url
# 	url="https://az764295.vo.msecnd.net/stable/6c3e3dba23e8fadc360aed75ce363ba185c49794/code_1.81.1-1691620686_amd64.deb"

#     # Download deb file
# 	wget -c "$url" -O "$downloadsDirectory/vscode.deb"
	
# 	# Notify the user
# 	echo "Visual Studio Code will be installed."

# fi

# # Check if Google Chrome is already installed
# if which chrome >/dev/null 2>&1; then
#     # Notify the user
#     echo "Google Chrome is already installed."
# fi

# if ! which chrome >/dev/null 2>&1; then
# 	# Notify the user
# 	echo "Google Chrome is not installed."
	
#     # Google Chrome url
# 	url="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

#     # Download deb file
# 	wget -c "$url" -O "$downloadsDirectory/chrome.deb"
	
# 	# Notify the user
# 	echo "Google Chrome will be installed."
# fi

# # Check if GitKraken is already installed
# if which gitkraken >/dev/null 2>&1; then
#   echo "GitKraken is already installed."
# fi

# # Check if GitKraken is not installed
# if ! which gitkraken >/dev/null 2>&1; then
# 	# Notify the user
# 	echo "GitKraken is not installed."
	
#     # Google Chrome url
# 	url="https://release.gitkraken.com/linux/gitkraken-amd64.deb"

#     # Download deb file
# 	wget -c "$url" -O "$downloadsDirectory/gitkraken.deb"
	
# 	# Notify the user
# 	echo "GitKraken will be installed."
# fi

# # Check if Anki is already installed
# if which anki >/dev/null 2>&1; then
# 	# Notify the user
# 	echo "Anki is already installed."
# fi

# # Check if Anki is already installed
# if ! which anki >/dev/null 2>&1; then
# 	# Add the Anki PPA repository
# 	sudo add-apt-repository -y ppa:anki-team/stable

# 	# Update package list
# 	sudo apt update

# 	# Check if mplayer is already installed
# 	if which mplayer >/dev/null 2>&1; then
# 		# Notify the user
# 		echo "mplayer is already installed."
# 	fi

# 	# Check if mplayer is not  installed
# 	if ! which mplayer >/dev/null 2>&1; then
# 		# Notify the user
# 		echo "mplayer is not already installed."
		
# 		# Install mplayer
# 		sudo apt install -y mplayer

# 		# Notify the user
# 		echo "mplayer has been installed."
# 	fi

# 	# Install Anki
# 	sudo apt install -y anki

# 	# Notify the user
# 	echo "Anki has been installed."
# fi

# # Check if DBeaver is already installed
# if which dbeaver-ce >/dev/null 2>&1; then
#     # Notify the user
#     echo "DBeaver is already installed."
# fi

# # Check if DBeaver is not installed
# if which dbeaver-ce >/dev/null 2>&1; then
#     # Import DBeaver GPG key
#     wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -

#     # Add the DBeaver repository
#     echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

#     # Update package list
#     sudo apt update

#     # Install DBeaver Community Edition
#     sudo apt install -y dbeaver-ce

#     # Notify the user
#     echo "DBeaver Community Edition has been installed."
# fi

# # Install External Programs
# for file in "$downloadsDirectory"/*.deb; do
# 	if [ -e "$file" ]; then
# 		# Install package
#         sudo dpkg -i $downloadsDirectory/*.deb

#         # Notify the user
# 		echo "Installed: $file"
        
#         # Remove file
# 		rm "$file"

#         # Notify the user
# 		echo "Removed: $file"
# 	fi
# done

# # Forcefully installs packages without asking for confirmation and automatically resolves broken dependencies
# sudo apt install -fy

# # Notify the user
# echo "External programs installed"

install_dropbox


