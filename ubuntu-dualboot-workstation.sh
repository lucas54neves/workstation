#!bin/bash
# Remove eventual APT locks
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/loc

# Update the system
sudo apt update
sudo apt upgrade -y

# Downloads directory
downloadsDirectory="$HOME/Downloads"

# External program URLs
URLs=(
	"https://az764295.vo.msecnd.net/stable/d2e414d9e4239a252d1ab117bd7067f125afd80a/code_1.50.1-1602600906_amd64.deb"
	"https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
	"https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb"
	"https://dl.discordapp.net/apps/linux/0.0.12/discord-0.0.12.deb"
)

# Programs to be installed in APT
programsToBeInstalledAPT=(
	"git"
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
	"libglu1-mesa-dev"
	"freeglut3-dev"
	"mesa-common-dev"
	"ffmpeg"
)

# Programs to be installed in Snap
programsToBeInstalledSnap=(
	"telegram-desktop"
	"spotify"
	"insomnia"
	"dbeaver-ce"
	"mysql-workbench-community"
)

# Programs to be installed in Snap
programsToBeInstalledSnapClassic=(
	"node"
)

# Installing APT programs
for programName in "${programsToBeInstalledAPT[@]}"; do
	sudo apt install "$programName" -y
done

# Download external programs
for url in "${URLs[@]}"; do
	wget -c "$url" -P "$downloadsDirectory"
done

# Installing external programs
sudo dpkg -i $downloadsDirectory/*.deb
sudo apt install -fy

# Remove deb files
rm $downloadsDirectory/*.deb

# Installing Snap programs
for programName in "${programsToBeInstalledSnap[@]}"; do
	sudo snap install "$programName"
done
for programName in "${programsToBeInstalledSnapClassic[@]}"; do
	sudo snap install "$programName" --classic
done

# Install Docker
## Uninstall old versions
sudo apt remove docker docker.io containerd runc
## Set up the repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
## Install Docker Engine
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Install Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install the Plank dock
## Add repository
sudo add-apt-repository -y ppa:ricotz/docky
## Update repository list
sudo apt-get update
## Install program
sudo apt-get install -y plank

# Install Yarn
## Set up the repository
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
## Install Yarn
sudo apt update && sudo apt install -y yarn

# Install OBS
## Set up the repository
sudo add-apt-repository ppa:obsproject/obs-studio
## Install OBS
sudo apt-get update && sudo apt-get install -y obs-studio

# Complete workstation installation
sudo apt update
sudo apt full-upgrade -y