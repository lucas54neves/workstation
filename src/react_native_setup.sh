#!/bin/bash

source functions/uodate_system.sh
source functions/install_node_lts.sh
source functions/install_git.sh
source functions/install_openjdk11.sh
source functions/install_snap.sh
source functions/install_android_studio.sh
source functions/install_curl.sh

uodate_system
install_node_lts
install_git
install_openjdk11
install_snap
install_android_studio
install_curl
