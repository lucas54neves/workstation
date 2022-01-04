#!/bin/bash

# Downloads directory
downloadsDirectory="$HOME/Downloads/"

# Programs to be installed in APT
programsToBeInstalledAPT=(
    "git"
    "mpv"
    "mplayer"
    "python3"
    "python3-distutils"
    "python3-venv"
    "python3-gpg"
    "python3-pip"
    "anki"
    "apt-transport-https"
    "ca-certificates"
    "curl"
    "gnupg"
    "gnupg-agent"
    "software-properties-common"
    "lsb-release"
    "default-jre"
    "default-jdk"
)

# Programs to be installed in Snap
programsToBeInstalledSnap=(
    "dbeaver-ce"
    "postman"
    "telegram-desktop"
    "spotify"
)

# Programs to be installed in Snap in Classic Mode
programsToBeInstalledSnapClassic=(
    "slack"
)

# External program URLs
URLs=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://cdn.zoom.us/prod/5.9.1.1380/zoom_amd64.deb"
    "https://dl.discordapp.net/apps/linux/0.0.16/discord-0.0.16.deb"
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb"
    "https://az764295.vo.msecnd.net/stable/899d46d82c4c95423fb7e10e68eba52050e30ba3/code_1.63.2-1639562499_amd64.deb"
    "https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.4.00.26453_amd64.deb"
)

# Add repositories
sudo add-apt-repository -y ppa:openjdk-r/ppa

# System update
sudo apt update && sudo apt upgrade -y

# Install programs with APT
for programName in "${programsToBeInstalledAPT[@]}"; do
    sudo apt install -y "$programName"
done

# Install programs with Snap
for programName in "${programsToBeInstalledSnap[@]}"; do
    sudo snap install "$programName"
done

# Install programs with Snap in classic model
for programName in "${programsToBeInstalledSnapClassic[@]}"; do
    sudo snap install "$programName" --classic
done

# Download external programs
for url in "${URLs[@]}"; do
    wget -c "$url" -P "$downloadsDirectory"
done

# Install External Programs
sudo dpkg -i $downloadsDirectory/*.deb
sudo apt install -fy

# Install Node.js LTS
## Install the NodeSource Node.js LTS
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
## Install development tools to build native addons
sudo apt install -y gcc g++ make
## Install Node.js LTS
sudo apt install -y nodejs
## Install Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

# Install Docker
## Uninstall old versions
sudo apt-get remove docker docker.io containerd runc
## Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
## Set up the stable repository
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
## Install Docker Engine
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io
## Install Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose