install_openjdk11() {
    # Check if OpenJDK 11 is installed
    if type -p java >/dev/null && [[ $(java -version 2>&1) == *"openjdk version \"11"* ]]; then
        # OpenJDK 11 is installed
        JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
        echo "OpenJDK 11 is installed. Version: $JAVA_VERSION"
    else
        # OpenJDK 11 is not installed
        echo "OpenJDK 11 is not installed."
        sudo add-apt-repository -y ppa:openjdk-r/ppa
        sudo apt update
        sudo apt install -y openjdk-11-jdk
    fi
}