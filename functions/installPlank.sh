#!/bin/bash

# Install the Plank dock
function installPlank() {
    # Add repository
    sudo add-apt-repository -y ppa:ricotz/docky
    # Update repository list
    sudo apt-get update
    # Install program
    sudo apt-get install -y plank
}
