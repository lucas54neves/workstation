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
    "discord"
    "vlc"
    "youtube-dl"
    "insomnia"
    "dbeaver-ce"
    "mysql-workbench-community"
)
# Programs to be installed in Snap
programsToBeInstalledSnapClassic=(
    "code"
    "node"
)

# External program URLs
URLs=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://download.virtualbox.org/virtualbox/6.1.10/virtualbox-6.1_6.1.10-138449~Ubuntu~eoan_amd64.deb"
    "https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.2.5.40859-focal_amd64.deb"
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb"
    "https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync-xUbuntu_20.04_amd64.deb"
)

# Remove eventual APT locks
removeAPTLocks

# Remove snap block
removeSnapBlock

# System update
updateSystem

# Installing APT programs
updateRepositoryList
installAPTPrograms "${programsToBeInstalledAPT[@]}"

# Installing Snap programs
updateRepositoryList
installSnapPrograms "${programsToBeInstalledSnap[@]}"
installSnapProgramsClassic "${programsToBeInstalledSnapClassic[@]}"

# Download external programs
downloadExternalPrograms "${URLs[@]}"

# Installing external programs
updateRepositoryList
installExternalPrograms $downloadsDirectory

# Remove deb files
removeDebFiles $downloadsDirectory

# Required VirtualBox configuration
configVirtualBox

# Install Docker
installDocker

# Manage Docker as a non-root user
manageDockerAsANonRootUser

# Install Docker-compose
installDockerCompose

# Install Yarn
installYarn

# Install Plank
installPlank

# Complete workstation installation
completeWorkstationInstallation

# Reboot the system
echo 'The system will reboot in 10 seconds.'
sleep 10
reboot
