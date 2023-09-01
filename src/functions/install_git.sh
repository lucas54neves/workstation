install_git() {
    # Check if Git is installed
    if which git >/dev/null; then
        # Git is installed
        GIT_VERSION=$(git --version | awk '{print $3}')
        echo "Git is installed. Version: $GIT_VERSION"
    else
        # Git is not installed
        echo "Git is not installed."
        sudo apt install -y git
    fi
}