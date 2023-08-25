#!/bin/bash

# Update package list
sudo apt update

# Check if VirtualBox is already installed
if dpkg -l | grep -q virtualbox; then
    # Notify the user
    echo "VirtualBox is already installed."
fi

# Check if VirtualBox is not installed
if ! dpkg -l | grep -q virtualbox; then
    echo "VirtualBox is not installed."
    
    # Install required dependencies
    sudo apt install -y virtualbox virtualbox-ext-pack

    # Notify the user
    echo "VirtualBox has been installed."


# Check if VSCode is already installed
if dpkg -l | grep -q code; then
    echo "Visual Studio Code is already installed."
fi

# Check if VSCode is not installed
if ! dpkg -l | grep -q code; then
    # Notify the user
    echo "Visual Studio Code is not installed."

    # Install required dependencies
    if dpkg -l | grep -q software-properties-common; then
        echo "software-properties-common is installed."
    else
        echo "software-properties-common is not installed."
        sudo apt install -y software-properties-common
    fi

    if dpkg -l | grep -q apt-transport-https; then
        echo "apt-transport-https is installed."
    else
        echo "apt-transport-https is not installed."
        sudo apt install -y apt-transport-https
    
    if dpkg -l | grep -q wget; then
        echo "wget is installed."
    else
        echo "wget is not installed."
        sudo apt install -y wget

    # Add the Microsoft GPG key
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg

    # Add the Visual Studio Code repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

    # Update package list again
    sudo apt update

    # Install Visual Studio Code
    sudo apt install -y code

    # Notify the user
    echo "Visual Studio Code has been installed."
fi
