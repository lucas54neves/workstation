#!/bin/bash

# Import functions
for file in functions/*.sh; do
    source $file
done

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
    mplayer
    mysql-server
    gparted
    python3-gpg
    sqlite3
)

# Programs to be installed in Snap
programsToBeInstalledSnap=(
    telegram-desktop
    spotify
)

# External program URLs
URLs=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://download.virtualbox.org/virtualbox/6.1.10/virtualbox-6.1_6.1.10-138449~Ubuntu~eoan_amd64.deb"
    "https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb"
    "https://az764295.vo.msecnd.net/stable/cd9ea6488829f560dc949a8b2fb789f3cdc05f5d/code_1.46.1-1592428892_amd64.deb"
    "https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.2.3.40853-focal_amd64.deb"
    "https://dbeaver.io/files/7.1.2/dbeaver-ce_7.1.2_amd64.deb"
    "https://cdn.mysql.com//Downloads/MySQLGUITools/mysql-workbench-community_8.0.21-1ubuntu20.04_amd64.deb"
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

# Install Node
installNode 12

# Install Yarn
installYarn

# Install Insomnia
installInsomnia

# Install Youtube-dl
installYoutubeDl

# Install Plank
installPlank

# Complete workstation installation
completeWorkstationInstallation

# Reboot the system
echo 'The system will reboot in 10 seconds.'
sleep 10
reboot
