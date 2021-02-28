programsToCheckedAPT=(
  "git"
  "anki"
  "mpv"
  "mplayer"
  "python3-distutils"
  "curl"
  "apt-transport-https"
  "ca-certificates"
  "gnupg-agent"
  "software-properties-common"
  "docker"
  "node"
  "obs-studio"
  "slack"
  "teams"
  "dbeaver"
  "dropbox"
  "discord"
  "google-chrome-stable"
)

programsToCheckedSnap=(
  "postman"
  "mysql-workbench-community"
)

function checkPrograms() {
  echo "==========================="
  echo "=== Installation report ==="
  echo "==========================="

  declare -i programsInstalled=0
  declare -i programsNotInstalled=0

  for programName in "${programsToCheckedAPT[@]}"; do
    package=$(dpkg --get-selections | grep "$programName" ) 
    if [ -n "$package" ];
    then
      echo "$programName was istalled."
     programsInstalled=`expr ${programsInstalled} + 1`
    else
      echo "### $programName was not istalled."
      programsNotInstalled=`expr ${programsNotInstalled} + 1`
    fi
  done

  for programName in "${programsToCheckedSnap[@]}"; do
    package=$(snap list | grep "$programName" ) 
    if [ -n "$package" ]
    then
      echo "$programName was istalled."
      programsInstalled=`expr ${programsInstalled} + 1`
    else
      echo "### $programName was not istalled."
      programsNotInstalled=`expr ${programsNotInstalled} + 1`
    fi
  done

  yarnWasInstallated=$(npm list -g --depth=0 | grep yarn)
  IFS='@' read -r -a yarnVersion <<< $yarnWasInstallated
  if [ -n "${yarnVersion[1]}" ]
  then
    echo "yarn was istalled."
    programsInstalled=`expr ${programsInstalled} + 1`
  else
    echo "### yarn was not istalled."
    programsNotInstalled=`expr ${programsNotInstalled} + 1`
  fi

  echo "==========================="
  echo "Programs that was installed: "${programsInstalled}
  echo "Programs that was not installed: "${programsNotInstalled}
  echo "==========================="
}