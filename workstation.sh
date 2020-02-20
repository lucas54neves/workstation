#!/bin/bash
echo "=================================="
echo "Removendo travas eventuais do apt"
echo "=================================="
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

echo
echo "=================================="
echo "Atualizacao"
echo "=================================="
sudo apt update -y
sudo apt upgrade -y

echo
echo "=================================="
echo "Diretorio para os programas externos"
echo "=================================="
DiretorioDeDownloads="$HOME/Downloads/Packages"
mkdir "$DiretorioDeDownloads"

echo
echo "=================================="
echo "Programas a serem instalados"
echo "=================================="
ProgramasParaInstalar=(
    snapd
    git
    apt-transport-https
    ca-certificates
    curl
    gnupg-agent
    software-properties-common
    ktorrent
    gcc
    make
    usb-creator-gtk
    mysql-workbench
    python3-distutils
    anki
    python3-gpg
    mpv
    gcc
)

echo
echo "=================================="
echo "URLs dos programas externos"
echo "=================================="
URLs=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.0.29.40727-bionic_amd64.deb"
    "https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb"
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2019.02.14_amd64.deb"
    "https://download.virtualbox.org/virtualbox/6.1.2/virtualbox-6.1_6.1.2-135662~Ubuntu~bionic_amd64.deb"
    "https://atom-installer.github.com/v1.44.0/atom-amd64.deb?s=1581443298&ext=.deb"
    "https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb"
)

echo
echo "=================================="
echo "Instalacao de programas no apt"
echo "=================================="
sudo apt update -y
for NomePrograma in ${ProgramasParaInstalar[@]}; do
    sudo apt install "$NomePrograma" -y
done

echo
echo "=================================="
echo "Instalacao de programas no snap"
echo "=================================="
sudo snap install spotify

echo
echo "=================================="
echo "Download de programas externos"
echo "=================================="
for url in ${URLs[@]}; do
  wget -c "$url" -P "$DiretorioDeDownloads"
done

echo
echo "=================================="
echo "Instalacao dos programas externos"
echo "=================================="
sudo apt update -y
sudo dpkg -i $DiretorioDeDownloads/*.deb
sudo apt -f install -y

echo
echo "=================================="
echo "Configuracao necessaria para o VirtualBox"
echo "=================================="
sudo /sbin/vboxconfig

echo
echo "=================================="
echo "Instalacao do Docker"
echo "=================================="
sudo apt update -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu    bionic    stable"
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io -y

echo
echo "=================================="
echo "Instalacao do Docker-Compose"
echo "=================================="
sudo apt update -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo
echo "=================================="
echo "Finalizacao"
echo "=================================="
sudo apt update -y
sudo apt full-upgrade -y
