#!/bin/bash

# Import functions
for file in functions/*.sh; do
    source $file
done

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
# Programs to be installed in Snap
programsToBeInstalledSnapClassic=(
    "node"
)

# External program URLs
URLs=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://download.virtualbox.org/virtualbox/6.1.10/virtualbox-6.1_6.1.10-138449~Ubuntu~eoan_amd64.deb"
    "https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.2.5.40859-focal_amd64.deb"
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb"
    "https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb"
    "https://dl.discordapp.net/apps/linux/0.0.12/discord-0.0.12.deb"
    "https://az764295.vo.msecnd.net/stable/d2e414d9e4239a252d1ab117bd7067f125afd80a/code_1.50.1-1602600906_amd64.deb"
)

# Remove eventual APT locks
echo
echo "Eventual APT locks will be removed"
echo
sleep 5
removeAPTLocks

# Remove snap block
echo
echo "Snap block will be removed"
echo
sleep 5
removeSnapBlock

# System update
echo
echo "System will be updated"
echo
sleep 5
updateSystem

# Installing APT programs
echo
echo "APT programs will be installed"
echo
sleep 5
updateRepositoryList
installAPTPrograms "${programsToBeInstalledAPT[@]}"

# Installing Snap programs
echo
echo "Snap programs will be installed"
echo
sleep 5
updateRepositoryList
installSnapPrograms "${programsToBeInstalledSnap[@]}"
installSnapProgramsClassic "${programsToBeInstalledSnapClassic[@]}"

# Download external programs
echo
echo "External programs will be downloaded"
echo
sleep 5
downloadExternalPrograms "${URLs[@]}"

# Installing external programs
echo
echo "External programs will be installed"
echo
sleep 5
updateRepositoryList
installExternalPrograms $downloadsDirectory

# Remove deb files
echo
echo "Deb files will be removed"
echo
sleep 5
removeDebFiles $downloadsDirectory

# Required VirtualBox configuration
echo
echo "Required VirtualBox configuration will be configurated"
echo
sleep 5
configVirtualBox

# Install Docker
echo
echo "Docker will be installed"
echo
sleep 5
installDocker

# Manage Docker as a non-root user
echo
echo "Docker will be configured for use by non-root users"
echo
sleep 5
manageDockerAsANonRootUser

# Install Docker-compose
echo
echo "Docker-compose will be installed"
echo
sleep 5
installDockerCompose

# Install Yarn
echo
echo "Yarn will be installed"
echo
sleep 5
installYarn

# Install Plank
echo
echo "Plank will be installed"
echo
sleep 5
installPlank

# Complete workstation installation
echo
echo "Workstation installation will be completed"
echo
sleep 5
completeWorkstationInstallation

# Reboot the system
echo 'The system will reboot in 10 seconds.'
sleep 10
reboot
