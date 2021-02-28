# Programs to be installed in APT
programsToBeInstalledAPT=(
    "git"
    "anki"
    "mpv"
    "mplayer"
    "python3-distutils"
    "curl"
    "apt-transport-https"
    "ca-certificates"
    "gnupg-agent"
    "software-properties-common"
    "virtualbox"
)

function installAptPrograms() {
    # Update Repository List
    sudo apt update

    # Install programs
    for programName in "${programsToBeInstalledAPT[@]}"; do
        sudo apt install "$programName" -y
    done
}
