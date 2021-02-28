# Programs to be installed in Snap
programsToBeInstalledSnap=(
    "postman"
    "mysql-workbench-community"
)

function installSnapPrograms() {
    # Update Repository List
    sudo apt update
    
    # Install programs
    for programName in "${programsToBeInstalledSnap[@]}"; do
        sudo snap install "$programName"
    done
}
