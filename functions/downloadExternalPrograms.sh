# Download external programs
function downloadExternalPrograms() {
    for url in "$@"; do
    wget -c "$url" -P "$downloadsDirectory"
    done
}