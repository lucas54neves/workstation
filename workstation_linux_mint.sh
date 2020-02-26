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
sudo apt update
sudo apt upgrade -y

echo
echo "=================================="
echo "Diretorio para os programas externos"
echo "=================================="
DiretorioDeDownloads="$HOME/Downloads"

echo
echo "=================================="
echo "Programas a serem instalados"
echo "=================================="
ProgramasParaInstalar=(
    git
    apt-transport-https
    ca-certificates
    curl
    gnupg-agent
    software-properties-common
    gcc
    make
    python3
    python3-distutils
    python3-gpg
    anki
    mpv
    gcc
    mysql-server
    mysql-workbench
)

echo
echo "=================================="
echo "URLs dos programas externos"
echo "=================================="
URLs=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2019.02.14_amd64.deb"
    "https://download.virtualbox.org/virtualbox/6.1.2/virtualbox-6.1_6.1.2-135662~Ubuntu~bionic_amd64.deb"
    "https://atom-installer.github.com/v1.44.0/atom-amd64.deb?s=1581443298&ext=.deb"
    "https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb"
    "https://repo.steampowered.com/steam/archive/precise/steam_latest.deb"
)

echo
echo "=================================="
echo "Instalacao de programas no apt"
echo "=================================="
sudo apt update
for NomePrograma in ${ProgramasParaInstalar[@]}; do
    sudo apt install "$NomePrograma" -y
done

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
sudo apt update
sudo dpkg -i $DiretorioDeDownloads/*.deb
sudo apt-get -f install -t
rm $DitetorioDeDownloads/*.deb

echo
echo "=================================="
echo "Configuracao necessaria para o VirtualBox"
echo "=================================="
sudo /sbin/vboxconfig

echo
echo "=================================="
echo "Instalacao do Docker"
echo "=================================="
sudo apt update
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu    bionic    stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

echo
echo "=================================="
echo "Instalacao do Docker-Compose"
echo "=================================="
sudo apt update
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo
echo "=================================="
echo "Instalacao do Spotify"
echo "=================================="
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt install spotify-client

echo
echo "=================================="
echo "Finalizacao"
echo "=================================="
sudo apt update
sudo apt full-upgrade -y
