#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Check if cURL is installed
if which curl >/dev/null; then
	# cURL is installed
	CURL_VERSION=$(curl --version | head -n 1)
	echo "cURL is installed. Version: $CURL_VERSION"
else
	# cURL is not installed
	echo "cURL is not installed."
	sudo apt install -y curl
fi

# Check if Node.js is installed
if which node >/dev/null; then
	# Node.js is installed
	NODE_VERSION=$(node -v)
	echo "Node.js is installed. Version: $NODE_VERSION"
else
	# Node.js is not installed
	echo "Node.js is not installed."
	sudo apt install -y gcc g++ make
	curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
	sudo apt install -y nodejs
fi

# Check if Git is installed
if which git >/dev/null; then
	# Git is installed
	GIT_VERSION=$(git --version | awk '{print $3}')
	echo "Git is installed. Version: $GIT_VERSION"
else
	# Git is not installed
	echo "Git is not installed."
	sudo apt install -y git
fi

# Check if OpenJDK 11 is installed
if type -p java >/dev/null && [[ $(java -version 2>&1) == *"openjdk version \"11"* ]]; then
	# OpenJDK 11 is installed
	JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
	echo "OpenJDK 11 is installed. Version: $JAVA_VERSION"
else
	# OpenJDK 11 is not installed
	echo "OpenJDK 11 is not installed."
	sudo add-apt-repository -y ppa:openjdk-r/ppa
	sudo apt update
	sudo apt install -y openjdk-11-jdk
fi

FILE_TO_SEARCH="/home/lucas/.bashrc"

SEARCH_STRING="export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"

# Check if the string exists in the file
if grep -q "$SEARCH_STRING" "$FILE_TO_SEARCH"; then
    echo "The string '$SEARCH_STRING' was found in '$FILE_TO_SEARCH'."
else
    echo "The string '$SEARCH_STRING' was not found in '$FILE_TO_SEARCH'."
	echo "$SEARCH_STRING" >> $FILE_TO_SEARCH
fi

SEARCH_STRING="export ANDROID_HOME=~/Android/Sdk"

# Check if the string exists in the file
if grep -q "$SEARCH_STRING" "$FILE_TO_SEARCH"; then
    echo "The string '$SEARCH_STRING' was found in '$FILE_TO_SEARCH'."
else
    echo "The string '$SEARCH_STRING' was not found in '$FILE_TO_SEARCH'."
	echo "$SEARCH_STRING" >> $FILE_TO_SEARCH
fi

SEARCH_STRING="export PATH=$PATH:$ANDROID_HOME/emulator"

# Check if the string exists in the file
if grep -q "$SEARCH_STRING" "$FILE_TO_SEARCH"; then
    echo "The string '$SEARCH_STRING' was found in '$FILE_TO_SEARCH'."
else
    echo "The string '$SEARCH_STRING' was not found in '$FILE_TO_SEARCH'."
	echo "$SEARCH_STRING" >> $FILE_TO_SEARCH
fi

SEARCH_STRING="export PATH=$PATH:$ANDROID_HOME/tools"

# Check if the string exists in the file
if grep -q "$SEARCH_STRING" "$FILE_TO_SEARCH"; then
    echo "The string '$SEARCH_STRING' was found in '$FILE_TO_SEARCH'."
else
    echo "The string '$SEARCH_STRING' was not found in '$FILE_TO_SEARCH'."
	echo "$SEARCH_STRING" >> $FILE_TO_SEARCH
fi

SEARCH_STRING="export PATH=$PATH:$ANDROID_HOME/tools/bin"

# Check if the string exists in the file
if grep -q "$SEARCH_STRING" "$FILE_TO_SEARCH"; then
    echo "The string '$SEARCH_STRING' was found in '$FILE_TO_SEARCH'."
else
    echo "The string '$SEARCH_STRING' was not found in '$FILE_TO_SEARCH'."
	echo "$SEARCH_STRING" >> $FILE_TO_SEARCH
fi

SEARCH_STRING="export PATH=$PATH:$ANDROID_HOME/platform-tools"

# Check if the string exists in the file
if grep -q "$SEARCH_STRING" "$FILE_TO_SEARCH"; then
    echo "The string '$SEARCH_STRING' was found in '$FILE_TO_SEARCH'."
else
    echo "The string '$SEARCH_STRING' was not found in '$FILE_TO_SEARCH'."
	echo "$SEARCH_STRING" >> $FILE_TO_SEARCH
fi

# Check if the program is installed as a Snap package
if snap list | grep -q "android-studio"; then
	echo "Android Studio is installed."
else
	echo "Android Studio is not installed."
	sudo snap install android-studio --classic
fi

