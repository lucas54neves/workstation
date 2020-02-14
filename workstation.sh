#!/bin/bash
echo
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
echo "URLs dos programas externos"
echo "=================================="
URL_Google_Chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_Insync="https://d2t3ff60b2tol4.cloudfront.net/builds/insync_3.0.29.40727-bionic_amd64.deb"
URL_MegaSync="https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb"

echo
echo "=================================="
echo "Instalacao de programas no apt"
echo "=================================="
sudo apt install update -y
sudo apt install git -y
sudo apt install apt-transport-https -y
sudo apt install ca-certificates -y
sudo apt install curl -y
sudo apt install gnupg-agent -y
sudo apt install software-properties-common -y
sudo apt install ktorrent -y
sudo apt install gcc -y
sudo apt install make -y
sudo apt install usb-creator-gtk -y
sudo apt install mysql-workbench -y
sudo apt install nautilus-dropbox -y
sudo apt install virtualbox-qt -y
sudo apt install atom -y
echo
echo "=================================="
echo "Instalacao de programas no snap"
echo "=================================="
sudo snap install spotify

echo
echo "=================================="
echo "Download de programas externos"
echo "=================================="
wget -c "$URL_Google_Chrome" -P "$DiretorioDeDownloads"
wget -c "$URL_Insync" -P "$DiretorioDeDownloads"
wget -c "$URL_MegaSync" -P "$DiretorioDeDownloads"

echo
echo "=================================="
echo "Instalacao dos programas externos"
echo "=================================="
sudo apt install update -y
sudo dpkg -i $DiretorioDeDownloads/*.deb
sudo apt-get -f install -y

echo
echo "=================================="
echo "Configuracao necessaria para o VirtualBox"
echo "=================================="
sudo /sbin/vboxconfig

echo
echo "=================================="
echo "Instalacao do Docker"
echo "=================================="
sudo apt install update -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo
echo "=================================="
echo "Instalacao do Docker-Compose"
echo "=================================="
sudo apt install update -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo
echo "=================================="
echo "Atualizacao"
echo "=================================="
sudo apt update -y
sudo apt upgrade -y
