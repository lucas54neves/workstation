#!/bin/bash

# Downloads directory
downloadsDirectory="$HOME/Downloads/"

# External program URLs
URLs=(
  "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
  "https://cdn.zoom.us/prod/5.6.20278.0524/zoom_amd64.deb"
  "https://release.gitkraken.com/linux/gitkraken-amd64.deb"
  "https://dl.discordapp.net/apps/linux/0.0.15/discord-0.0.15.deb"
  "https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb"
  "https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_20.10.6~3-0~ubuntu-focal_amd64.deb"
  "https://az764295.vo.msecnd.net/stable/054a9295330880ed74ceaedda236253b4f39a335/code_1.56.2-1620838498_amd64.deb"
)

# Programs to be installed in APT
programsToBeInstalledAPT=(
  "git"
  "mpv"
  "mplayer"
  "python3"
  "python3-distutils"
  "python3-venv"
  "anki"
  "ffmpeg"
  "obs-studio"
  "apt-transport-https"
  "ca-certificates"
  "curl"
  "gnupg"
  "gnupg-agent"
  "software-properties-common"
  "lsb-release"
  "virtualbox"
  "virtualbox-ext-pack"
)

# Programs to be installed in Snap
programsToBeInstalledSnap=(
  "postman"
  "spotify"
  "telegram-desktop"
  "dbeaver-ce"
)

# Programs to be installed in Snap in classic mode
programsToBeInstalledSnapClassic=(
  "slack"
)

# Third-party repositories
thirdPartyRepositories=(
  "ppa:obsproject/obs-studio"
)

# System update
sudo apt update && sudo apt upgrade -y

# Add third-party repositories
for repositoryName in "${thirdPartyRepositories[@]}"; do
  sudo apt-add-repository -y "$repositoryName"
done

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

# Install NodeJS LTS
## Set up the repository Node LTS
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

## Install Node LTS
sudo apt install -y nodejs

# Installing Yarn
sudo npm install --global yarn
