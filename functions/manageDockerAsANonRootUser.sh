# Manage Docker as a non-root user
function manageDockerAsANonRootUser() {
    ## Create the docker group.
    sudo groupadd docker
    ## Add your user to the docker group.
    sudo usermod -aG docker $USER
    # Activate the changes to groups
    newgrp docker
}