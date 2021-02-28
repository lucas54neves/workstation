# Downloads directory
downloadsDirectory="$HOME/Downloads/"

# External program URLs
URLs=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
    "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.13.0-amd64.deb"
    "https://az764295.vo.msecnd.net/stable/622cb03f7e070a9670c94bae1a45d78d7181fbd4/code_1.53.2-1613044664_amd64.deb"
    "https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.30857_amd64.deb"
    "https://download.dbeaver.com/community/7.3.5/dbeaver-ce_7.3.5_amd64.deb"
    "https://linux.dropbox.com/packages/ubuntu/dropbox_2020.03.04_amd64.deb"
    "https://dl.discordapp.net/apps/linux/0.0.13/discord-0.0.13.deb"
)

function installExternalPrograms() {
    # Update Repository List
    sudo apt update
    
    # Download external programs
    for url in "${URLs[@]}"; do
        wget -c "$url" -P "$downloadsDirectory"
    done
    
    # Install External Programs
    sudo dpkg -i $downloadsDirectory/*.deb
    sudo apt install -fy
}
