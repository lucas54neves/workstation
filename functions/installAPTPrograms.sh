# Installing APT programs
function installAPTPrograms() {
    for programName in "$@"; do
        sudo apt install "$programName" -y
    done
}