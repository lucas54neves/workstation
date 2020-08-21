# Installing Snap programs
function installSnapProgramsClassic() {
    for programName in "$@"; do
        sudo snap install "$programName" --classic
    done
}
