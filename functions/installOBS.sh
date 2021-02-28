function installOBS() {
    # Update Repository List
    sudo apt update
    
    # Install FFmpeg
    sudo apt-get install -y ffmpeg
    
    # Set up the repository
    sudo add-apt-repository -y ppa:obsproject/obs-studio
    
    # Install OBS Studio
    sudo apt install -y obs-studio
}
