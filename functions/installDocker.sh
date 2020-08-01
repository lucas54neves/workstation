# Install Docker
function installDocker() {
    ## Uninstall old versions
    sudo apt remove docker docker.io containerd runc
    ## Set up the repository
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
    ## Install Docker Engine
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io 
}