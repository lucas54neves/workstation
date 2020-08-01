# Installing Snap programs
function installSnapPrograms() {
    for programName in "$@"; do
        sudo snap install "$programName"
    done
}