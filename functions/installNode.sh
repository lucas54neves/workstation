# Install Node
function installNode() {
    curl -sL https://deb.nodesource.com/setup_$1.x | sudo -E bash -
    sudo apt install -y nodejs
}