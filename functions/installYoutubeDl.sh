# Install Youtube-dl
function installYoutubeDl() {
    ## Add the repository
    sudo add-apt-repository -y ppa:nilarimogard/webupd8
    ## Update the APT
    sudo apt update
    ## Install the program
    sudo apt install -y youtube-dl
}