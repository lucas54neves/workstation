# Installing external programs
function installExternalPrograms() {
    sudo dpkg -i $1/*.deb
    sudo apt install -fy
}