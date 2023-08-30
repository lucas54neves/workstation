#!/bin/bash

install_dropbox() {
    # Check if Dropbox is already installed
    if which dropbox >/dev/null 2>&1; then
        echo "Dropbox is already installed."
        exit 0
    fi

    # Check if Dropbox is not installed
    if ! which dropbox >/dev/null 2>&1; then
        # Notify the user
        echo "Dropbox is not installed."

        # Add the Dropbox repository key
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E

        # Add the Dropbox repository to sources.list
        echo "deb [arch=amd64] http://linux.dropbox.com/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/dropbox.list

        # Update package list
        sudo apt update

        # Install Dropbox
        sudo apt install -y dropbox python3-gpg

        # Notify the user
        echo "Dropbox has been installed."
    fi
}
