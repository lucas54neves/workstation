install_node_lts() {
    # Check if Node.js is installed
    if which node >/dev/null; then
        # Node.js is installed
        NODE_VERSION=$(node -v)
        echo "Node.js is installed. Version: $NODE_VERSION"
    else
        # Node.js is not installed
        echo "Node.js is not installed."
        sudo apt install -y gcc g++ make
        curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
        sudo apt install -y nodejs
        sudo npm install --global yarn
    fi
}