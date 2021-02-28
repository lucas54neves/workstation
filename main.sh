#!/bin/bash

source functions/updateSystem.sh
source functions/installAptPrograms.sh
source functions/installExternalPrograms.sh
source functions/installSnapPrograms.sh
source functions/installDocker.sh
source functions/installNodeYarn.sh
source functions/installOBS.sh
source functions/completeInstallation.sh
source functions/checkPrograms.sh

updateSystem
installAptPrograms
installExternalPrograms
installSnapPrograms
installDocker
installNodeYarn
installOBS
completeInstallation
checkPrograms
