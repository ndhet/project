#!/bin/bash
service apache2 stop
cd /root/
echo "=========================================="
echo ""
read -p "Masukan Domain : " domain
read -p "Masukan User : " user
wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --register-account -m kimochilol@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /home/$user/$domain.crt --keypath /home/$user/$domain.key
sleep 0.5
clear
service apache2 start
echo "Selesai "
