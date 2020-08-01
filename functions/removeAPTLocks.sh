# Remove eventual APT locks
function removeAPTLocks() {
    sudo rm /var/lib/dpkg/lock-frontend
    sudo rm /var/cache/apt/archives/loc
}