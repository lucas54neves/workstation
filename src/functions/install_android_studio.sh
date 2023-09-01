install_android_studio() {
    FILE_TO_SEARCH="/home/lucas/.bashrc"

    SEARCH_STRING="export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"

    # Check if the string exists in the file
    if grep -q "$SEARCH_STRING" "$FILE_TO_SEARCH"; then
        echo "The string '$SEARCH_STRING' was found in '$FILE_TO_SEARCH'."
    else
        echo "The string '$SEARCH_STRING' was not found in '$FILE_TO_SEARCH'."
        echo "$SEARCH_STRING" >> $FILE_TO_SEARCH
    fi

    SEARCH_STRING="export ANDROID_HOME=~/Android/Sdk"

    # Check if the string exists in the file
    if grep -q "$SEARCH_STRING" "$FILE_TO_SEARCH"; then
        echo "The string '$SEARCH_STRING' was found in '$FILE_TO_SEARCH'."
    else
        echo "The string '$SEARCH_STRING' was not found in '$FILE_TO_SEARCH'."
        echo "$SEARCH_STRING" >> $FILE_TO_SEARCH
    fi

    # Check is snal is not installed
    if ! which snap >/dev/null; then
        # Import function that install snap
        source ./install_snap.sh

        # Install snap
        install_snap
    fi

    # Check if the program is installed as a Snap package
    if snap list | grep -q "android-studio"; then
        echo "Android Studio is installed."
    else
        echo "Android Studio is not installed."
        sudo snap install android-studio --classic
    fi
}