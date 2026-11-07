#!/bin/bash
set -euo pipefail # just in case an error occurs

# no comments for you 
# it was hard to write 
# so it should be hard to read

RED="\e[0;31m"
GREEN="\e[0;32m"
RESET="\e[0m"
if [ ! -f /etc/debian_version ]; then
    echo -e "$RED[ERROR]$RESET You're not even running Debian!"
    exit
else
    echo -e "$GREEN[SUCCESS]$RESET You're running a Debian based distro. Contiuning..."
fi

if [[ "$EUID" -ne 0 ]]; then
   echo -e "$RED[ALERT]$RESET Fuck it! You're not running the script as root" 
   exit 1
fi

apt install nano ufw

# ------------ DOCKER ------------
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo rm get-docker.sh
# ------------ DOCKER END ------------





