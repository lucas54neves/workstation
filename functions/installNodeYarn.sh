function installNodeYarn() {
    # Update Repository List
    sudo apt update
    
    # Set up the repository Node LTS
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    
    # Install Node LTS
    sudo apt install -y nodejs

    # Installing Yarn
    sudo npm install --global yarn
}
