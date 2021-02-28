function installDocker() {
    # Uninstall old versions Docker
    sudo apt remove docker docker-engine docker.io

    # Update Repository List
    sudo apt update

    # Install Docker.io
    sudo apt install -y docker.io
}
