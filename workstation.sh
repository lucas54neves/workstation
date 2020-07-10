#!bin/bash

# Removing eventual APT locks
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

# Downloads directory
downloadsDirectory="$HOME/Downloads"

# Programs to be installed in APT
programsToBeInstalledAPT=(
    git
    anki
    mpv
    make
    gcc
    python3
    python3-distutils
    apt-transport-https
    ca-certificates
    curl
    gnupg-agent
    software-properties-common
    snapd
)

# Programs to be installed in Snap
programsToBeInstalledSnap=(
    telegram-desktop
)

# External program URLs
URLs=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"s
    "https://download.virtualbox.org/virtualbox/6.1.10/virtualbox-6.1_6.1.10-138449~Ubuntu~eoan_amd64.deb"
    "https://atom-installer.github.com/v1.48.0/atom-amd64.deb?s=1591785581&ext=.deb"
    "https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb"
    "https://az764295.vo.msecnd.net/stable/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/code_1.46.1-1592428892_amd64.deb"
    "https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.2.1.40839-bionic_amd64.deb"
)

# System update
sudo apt update && sudo apt upgrade -y

# Installing APT programs
sudo apt update
for programName in ${programsToBeInstalledAPT[@]}; do
    sudo apt install "$programName" -y
done

# Installing Snap programs
sudo apt update
for programName in ${programsToBeInstalledSnap[@]}; do
    sudo snap install "$programName"
done

# Download external programs
for url in ${URLs[@]}; do
  wget -c "$url" -P "$downloadsDirectory"
done

# Installing external programs
sudo apt update
sudo dpkg -i $downloadsDirectory/*.deb
sudo apt install -fy

# Required VirtualBox configuration
sudo /sbin/vboxconfig

# Install Docker
## Uninstall old versions
sudo apt remove docker docker-engine docker.io containerd runc
## Set up the repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
## Install Docker Engine
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Install Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Spotify
## Set up the repository
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
# deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
## Install Spotify client
sudo apt update && sudo apt install -y spotify-client

# Install Node
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

# Install Yarn
## Set up the repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
# deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
## Install Yarn
sudo apt update && sudo apt install -y yarn

# Install Insomnia
## Add to sources
# deb https://dl.bintray.com/getinsomnia/Insomnia /" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
## Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | sudo apt-key add -
## Refresh repository sources and install Insomnia
sudo apt update
sudo apt install insomnia

# Completion
sudo apt update
sudo apt full-upgrade -y
