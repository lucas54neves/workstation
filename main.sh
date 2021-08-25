#!/bin/bash

# Constants
declare -i programsInstalled=0
declare -i programsNotInstalled=0

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
  "https://iriun.gitlab.io/iriunwebcam-2.4.1.deb"
  "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.16.0-amd64.deb"
  "https://download.dbeaver.com/community/21.1.0/dbeaver-ce_21.1.0_amd64.deb"
  "https://repo.steampowered.com/steam/archive/precise/steam_latest.deb"
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
  "docker-compose"
  "virtualbox"
  "virtualbox-ext-pack"
  "android-tools-adb"
  "libgl1-mesa-dri:i386"
  "libgl1:i386"
  "libc6:i386"
  "default-jre"
  "default-jdk"
  "python3-pip"
)

# Programs to be installed in Snap
programsToBeInstalledSnap=(
  "postman"
  "telegram-desktop"
  "vlc"
)

# Third-party repositories
thirdPartyRepositories=(
  "ppa:obsproject/obs-studio"
)

# Programs to be checked in APT at the end of the script
programsToCheckedAPT=(
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
  "docker-compose"
  "virtualbox"
  "virtualbox-ext-pack"
  "docker"
  "node"
  "zoom"
  "gitkraken"
  "code"
  "dropbox"
  "discord"
  "google-chrome-stable"
  "virtualbox"
  "iriun"
  "slack"
  "dbeaver"
  "spotify"
  "android-tools-adb"
  "steam"
)

# Programs to be checked in Snap at the end of the script
programsToCheckedSnap=(
  "postman"
  "telegram-desktop"
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

# Install Yarn
sudo npm install --global yarn

# Install Spotify
## Configure Spotify debian repository
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

## Update repository
sudo apt update

## Install the Spotify client
sudo apt install -y spotify-client

# Script execution report
echo "==========================="
echo "=== Installation report ==="
echo "==========================="
echo "Checking..."
echo "==========================="

for programName in "${programsToCheckedAPT[@]}"; do
  package=$(dpkg --get-selections | grep "$programName" ) 
  if [ -n "$package" ];
  then
    programsInstalled=`expr ${programsInstalled} + 1`
  else
    echo "### $programName was not istalled ###"
    programsNotInstalled=`expr ${programsNotInstalled} + 1`
  fi
done

for programName in "${programsToCheckedSnap[@]}"; do
  package=$(snap list | grep "$programName" ) 
  if [ -n "$package" ]
  then
    programsInstalled=`expr ${programsInstalled} + 1`
  else
    echo "### $programName was not istalled ###"
    programsNotInstalled=`expr ${programsNotInstalled} + 1`
  fi
done

yarnWasInstallated=$(npm list -g --depth=0 | grep yarn)
IFS='@' read -r -a yarnVersion <<< $yarnWasInstallated
if [ -n "${yarnVersion[1]}" ]
then
  programsInstalled=`expr ${programsInstalled} + 1`
else
  echo "### yarn was not istalled ###"
  programsNotInstalled=`expr ${programsNotInstalled} + 1`
fi

echo "==========================="

echo "==========================="
echo "Programs that was installed: "${programsInstalled}
echo "Programs that was not installed: "${programsNotInstalled}
echo "==========================="
