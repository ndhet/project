#!/bin/bash

# Tambahkan repository dan update sistem
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-add-repository universe -y
sudo apt update -y
sudo apt upgrade -y

# Install dependencies
sudo apt -y install curl git build-essential unzip nodejs make gcc python2-minimal libapache2-mod-php7.2 php7.2 php7.2-common

#CLONE FROM GITHUB
git clone https://github.com/c9/core.git c9sdk
cd c9sdk
scripts/install-sdk.sh

read -p 'Username : ' user
read -p 'Password : ' pass
IPVPS=$(curl -s ipinfo.io/ip)

screen -S c9
node server.js -l $IPVPS -p 2024 -a $user:$pass -w /root
