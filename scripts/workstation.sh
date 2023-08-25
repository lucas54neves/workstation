#!/bin/bash

# Downloads directory
downloadsDirectory="$HOME/Downloads"

# System update
sudo apt update && sudo apt upgrade -y

if dpkg -l | grep -q wget; then
    # Notify the user
    echo "wget is installed."
else
    # Notify the user
    echo "wget is not installed."
    
    # Install Wget
    sudo apt install -y wget
fi

# Check if VirtualBox is already installed
if dpkg -l | grep -q virtualbox; then
    # Notify the user
    echo "VirtualBox is already installed."
fi

# Check if VirtualBox is not installed
if ! dpkg -l | grep -q virtualbox; then
    # Notify the user
    echo "VirtualBox is not installed."
    
    # Install required dependencies
    sudo apt install -y virtualbox virtualbox-ext-pack

    # Notify the user
    echo "VirtualBox has been installed."
fi

# Check if VSCode is already installed
if which code >/dev/null 2>&1; then
    # Notify the user
    echo "Visual Studio Code is already installed."
fi

if ! which code >/dev/null 2>&1; then
	# Notify the user
	echo "Visual Studio Code is not installed."
	
    # VSCode url
	url="https://az764295.vo.msecnd.net/stable/6c3e3dba23e8fadc360aed75ce363ba185c49794/code_1.81.1-1691620686_amd64.deb"

    # Download deb file
	wget -c "$url" -O "$downloadsDirectory/vscode.deb"
	
	# Notify the user
	echo "Visual Studio Code will be installed."
fi

# Check if Google Chrome is already installed
if dpkg -l | grep -q chrome; then
    # Notify the user
    echo "Google Chrome is already installed."
fi

if ! dpkg -l | grep -q chrome; then
	# Notify the user
	echo "Google Chrome is not installed."
	
    # Google Chrome url
	url="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

    # Download deb file
	wget -c "$url" -O "$downloadsDirectory/chrome.deb"
	
	# Notify the user
	echo "Google Chrome will be installed."
fi

# Install External Programs
for file in "$downloadsDirectory"/*.deb; do
	if [ -e "$file" ]; then
		# Install package
        sudo dpkg -i $downloadsDirectory/*.deb

        # Notify the user
		echo "Installed: $file"
        
        # Remove file
		rm "$file"

        # Notify the user
		echo "Removed: $file"
	fi
done

# Forcefully installs packages without asking for confirmation and automatically resolves broken dependencies
sudo apt install -fy

# Notify the user
echo "External programs installed"

