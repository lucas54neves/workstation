install_snap() {
    # Check if Snap is installed
    if which snap >/dev/null; then
        # Snap is installed
        echo "Snap is installed."
    else
        # Snap is not installed
        echo "Snap is not installed."
        sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup
        sudo apt install -y snapd
    fi
}