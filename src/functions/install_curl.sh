install_curl() {
    # Check if cURL is installed
    if which curl >/dev/null; then
        # cURL is installed
        CURL_VERSION=$(curl --version | head -n 1)
        echo "cURL is installed. Version: $CURL_VERSION"
    else
        # cURL is not installed
        echo "cURL is not installed."
        sudo apt install -y curl
    fi
}