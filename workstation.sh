#!/bin/bash

# Downloads directory
downloadsDirectory="$HOME/Downloads"

# Programs to be installed in APT
programsToBeInstalledAPT=(
    "git"
    "anki"
    "mpv"
    "make"
    "gcc"
    "python3"
    "python3-distutils"
    "apt-transport-https"
    "ca-certificates"
    "curl"
    "gnupg-agent"
    "software-properties-common"
    "snapd"
    "mplayer"
    "mysql-server"
    "gparted"
    "python3-gpg"
    "sqlite3"
    "npm"
    "libgl1-mesa-dri:i386"
    "libgl1:i386"
    "libc6:i386"
    "libglu1-mesa-dev"
    "freeglut3-dev"
    "mesa-common-dev"
    "python3-venv"

)

# Programs to be installed in Snap
programsToBeInstalledSnap=(
    "telegram-desktop"
    "spotify"
    "vlc"
    "youtube-dl"
    "insomnia"
    "dbeaver-ce"
    "mysql-workbench-community"
)
programsToBeInstalledSnapClassic=(
	"slack"
)

# External program URLs
URLs=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://download.virtualbox.org/virtualbox/6.1.16/virtualbox-6.1_6.1.16-140961~Ubuntu~eoan_amd64.deb"
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb"
    "https://dl.discordapp.net/apps/linux/0.0.12/discord-0.0.12.deb"
    "https://repo.steampowered.com/steam/archive/precise/steam_latest.deb"
    "https://az764295.vo.msecnd.net/stable/e5a624b788d92b8d34d1392e4c4d9789406efe8f/code_1.51.1-1605051630_amd64.deb"
    "https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup64.deb"
    "https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.30857_amd64.deb"
    "https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb"
)

# Remove eventual APT locks
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/loc

# Remove snap block
sudo rm /etc/apt/preferences.d/nosnap.pref

# System update
sudo apt update
sudo apt upgrade -y

# Installing APT programs
## Update Repository List
sudo apt update
## Install programs
for programName in "${programsToBeInstalledAPT[@]}"; do
    sudo apt install "$programName" -y
done

# Installing Snap programs
## Update Repository List
sudo apt update
## Install programs
for programName in "${programsToBeInstalledSnap[@]}"; do
    sudo snap install "$programName"
done
## Install classic programs
for programName in "${programsToBeInstalledSnapClassic[@]}"; do
	sudo snap install "$programName" --classic
done

# Download external programs
for url in "${URLs[@]}"; do
    wget -c "$url" -P "$downloadsDirectory"
done

# Installing external programs
## Update Repository List
sudo apt update
# Install External Programs
sudo dpkg -i $downloadsDirectory/*.deb
sudo apt install -fy

# Remove deb files
rm $downloadsDirectory/*.deb

# Required VirtualBox configuration
sudo /sbin/vboxconfig

# Install Docker
## Uninstall old versions
sudo apt remove docker docker.io containerd runc
## Set up the repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
## Install Docker Engine
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io 

# Manage Docker as a non-root user
## Create the docker group.
sudo groupadd docker
## Add your user to the docker group.
sudo usermod -aG docker $USER
## Restart docker service
sudo service docker restart

# Install Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Node LTS
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
## Install build tools
sudo apt install -y build-essential

# Install Yarn
## Set up the repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
## Install Yarn
sudo apt update && sudo apt install -y yarn

# Install Plank
# Add repository
sudo add-apt-repository -y ppa:ricotz/docky
# Update repository list
sudo apt update
# Install program
sudo apt install -y plank

# Install OBS Studio
## Install FFmpeg
sudo apt install -y ffmpeg
## Add repository
sudo add-apt-repository -y ppa:obsproject/obs-studio
## Update repository list
sudo apt update
## Install program
sudo apt install -y obs-studio

# Complete workstation installation
sudo apt update
sudo apt full-upgrade -y
