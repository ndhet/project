#!/bin/bash

clear
apt update -y
apt upgrade -y
apt install python2 -y
apt install build-essential -y
curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt install nodejs -y

#CLONE FROM GITHUB
git clone https://github.com/c9/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh

read -p 'Username : ' user
read -p 'Password : ' pass
IPVPS=$(curl -s ipinfo.io/ip)

screen -S c9
node server.js -l $IPVPS -p 2024 -a $user:$pass
