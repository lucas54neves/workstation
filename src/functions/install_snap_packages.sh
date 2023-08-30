install_snap_packages() {
    # Programs to be installed in Snap
    programsToBeInstalledSnap=(
        "dbeaver-ce"
        "postman"
        "telegram-desktop"
        "spotify"
    )

    # Programs to be installed in Snap in Classic Mode
    programsToBeInstalledSnapClassic=(
        "slack"
    )

    # Check if Snap is already installed
    if snap --version >/dev/null 2>&1; then
        # Notify the user
        echo "Snap is already installed."
    fi

    # Check if Snap is already installed
    if ! snap --version >/dev/null 2>&1; then
        # Notify the user
        echo "Snap is not installed."
        
        # Update package list
        sudo apt update
        
        # Install Snap
        sudo apt install -y snapd

        # Enable classic snap support (optional, only if needed)
        # sudo snap install --classic snapd

        # Notify the user
        echo "Snap has been installed."
    fi

    # Install programs with Snap
    for programName in "${programsToBeInstalledSnap[@]}"; do
        sudo snap install "$programName"
    done

    # Install programs with Snap in classic model
    for programName in "${programsToBeInstalledSnapClassic[@]}"; do
        sudo snap install "$programName" --classic
    done
}

install_snap_packages
