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
DiretorioDeDownloads="$HOME/Downloads/Installation_Programs"

echo
echo "=================================="
echo "URLs de PPAs"
echo "=================================="
URL_PPA_Docker="https://download.docker.com/linux/ubuntu"

echo
echo "=================================="
echo "URLs dos programas externos"
echo "=================================="
URL_Google_Chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
URL_Atom="https://atom-installer.github.com/v1.44.0/atom-amd64.deb?s=1581443298&ext=.deb"
URL_Insync="https://d2t3ff60b2tol4.cloudfront.net/builds/insync-dolphin_3.0.22.40446_all.deb"
URL_VirtualBox="https://download.virtualbox.org/virtualbox/6.1.2/virtualbox-6.1_6.1.2-135662~Ubuntu~bionic_amd64.deb"
URL_MegaSync="https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb"
URL_Dropbox="https://linux.dropbox.com/packages/ubuntu/dropbox_2019.02.14_amd64.deb"

echo
echo "=================================="
echo "Configuracao necessario para o VirtualBox"
echo "=================================="
sudo apt install gcc -y
sudo apt install make -y
sudo /sbin/vboxconfig

echo
echo "=================================="
echo "Download de programas externos"
echo "=================================="
mkdir "$DiretorioDeDownloads"
wget -c "$URL_Google_Chrome" -P "$DiretorioDeDownloads"
wget -c "$URL_Atom" -P "$DiretorioDeDownloads"
wget -c "$URL_Insync" -P "$DiretorioDeDownloads"
wget -c "$URL_VirtualBox" -P "$DiretorioDeDownloads"
wget -c "$URL_MegaSync" -P "$DiretorioDeDownloads"
wget -c "$URL_Dropbox" -P "$DiretorioDeDownloads"

echo
echo "=================================="
echo "Instalacao dos programas externos"
echo "=================================="
sudo dpkg -i $DiretorioDeDownloads/*.deb
sudo apt-get -f install -y

echo
echo "=================================="
echo "Instalacao de programas no apt"
echo "=================================="
sudo apt install git -y
sudo apt install apt-transport-https -y
sudo apt install ca-certificates -y
sudo apt install curl -y
sudo apt install gnupg-agent -y
sudo apt install software-properties-common -y

echo
echo "=================================="
echo "Instalacao do Docker"
echo "=================================="
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo
echo "=================================="
echo "Instalacao do Docker-Compose"
echo "=================================="
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo
echo "=================================="
echo "Intalação do Spotify"
echo "=================================="
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
