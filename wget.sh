#!/bin/bash
clear
#
# CREATED By SSHAXOR.MY.ID
#
export NC="\e[0m"
export YELLOW='\033[1;33m'
export WH='\033[1;37m'
export RED="\033[1;31m"
export GREEN='\033[0;32m'
export COLBG='\E[40;1;41m'

clear
echo -e "$RED ███████╗███████╗██╗  ██╗ █████╗ ██╗  ██╗ ██████╗ ██████╗ $NC";
echo -e "$RED ██╔════╝██╔════╝██║  ██║██╔══██╗╚██╗██╔╝██╔═══██╗██╔══██╗ $NC";
echo -e "$RED ███████╗███████╗███████║███████║ ╚███╔╝ ██║   ██║██████╔╝ $NC";
echo -e "$WH ╚════██║╚════██║██╔══██║██╔══██║ ██╔██╗ ██║   ██║██╔══██╗ $NC";
echo -e "$WH ███████║███████║██║  ██║██║  ██║██╔╝ ██╗╚██████╔╝██║  ██║ $NC";
echo -e "$WH ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ $NC";
echo "                                                     Owner : Dedi Humaedi";
echo "                                                         ";
read -p " Masukkan authoken [>] : " inputauth

license=$(curl -sS https://raw.githubusercontent.com/ndhet/ip/main/izinsc | grep $inputauth | awk '{print $3}')
authoken=$(curl -sS https://raw.githubusercontent.com/ndhet/ip/main/izinsc | awk '{print $4}' | grep $inputauth)
client=$(curl -sS https://raw.githubusercontent.com/ndhet/ip/main/izinsc | grep $inputauth | awk '{print $2}')

echo -e "[ ${GREEN}INFO${NC} ] Preparing the install script"
echo -e "[ ${GREEN}INFO${NC} ] Aight good ... installation is ready"
sleep 2
echo -ne "[ ${GREEN}INFO${NC} ] Check permission : "
if [ "$inputauth" = "$authoken" ]; then
        echo -e "$GREEN Permission Accepted $NC"
		sleep 1
		clear
        else
        echo -e "$RED Permission Denied $NC"
        exit
fi

echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e " $RED${NC}${COLBG}           • AUTO SCRIPT INSTALL RDP •           ${NC}$RED$NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
IPVPS=$(curl -s ipinfo.io/ip)
ISP=$(curl -s https://ipapi.co/$IPVPS/org)
CITY=$(curl -s https://ipapi.co/$IPVPS/city)
echo -e "$RED $NC Memory Usage   : $uram / $tram"
echo -e "$RED $NC ISP & City     : $ISP & $CITY"
echo -e "$RED $NC IP-VPS         : ${RED}$IPVPS${NC}"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${GREEN}[01]${NC} • Windows 2012  ${GREEN}[05]${NC} • Windows 10"
echo -e "  ${GREEN}[02]${NC} • Windows 2016  ${GREEN}[06]${NC} • Windows 11"
echo -e "  ${GREEN}[03]${NC} • Windows 2019  ${GREEN}[07]${NC} • Custom Link GZ"
echo -e "  ${GREEN}[04]${NC} • Windows 2022  ${GREEN}[00]${NC} • Batal"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e "$RED┌─────────────────────────────────────────────────┐$NC"
echo -e "$RED $NC Version     :${RED} 1.0 Beta Version${NC}"
echo -e "$RED $NC Client Name : $client"
echo -e "$RED $NC License     : $license"
echo -e "$RED└─────────────────────────────────────────────────┘$NC"
echo -e "$RED┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$RED ${NC}                  • SSHAXOR •                  $RED $NC"
echo -e "$RED└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p "  Pilih [>] : " PILIHOS

case "$PILIHOS" in
	1|"") PILIHOS="http://167.172.78.82/GPISERVER2019.gz"  IFACE="Ethernet Instance 0";;
	2) PILIHOS="http://167.172.78.82/GPISERVER2016.gz"  IFACE="Ethernet Instance 0";;
	3) PILIHOS="https://hadongpho.com/css/gz/windows2012.gz"  IFACE="Ethernet Instance 0";;
	4) PILIHOS="http://167.172.78.82/GPISERVER2022.gz"  IFACE="Ethernet Instance 0";;
	5) PILIHOS="https://hadongpho.com/css/gz/windows10.gz"  IFACE="Ethernet Instance 0 2";;
	6) PILIHOS="https://hadongpho.com/css/gz/windows11.gz"  IFACE="Ethernet Instance 0 2";;
	7) read -p "Masukkan Link GZ mu : " PILIHOS;;
	*) echo "pilihan salah"; exit;;
esac

IP4=$(curl -4 -s icanhazip.com)
GW=$(ip route | awk '/default/ { print $3 }')
IFACE="Ethernet Instance 0 2"
IFACE2="Ethernet"
IFACE3="Ethernet Instance 0"

cat >/tmp/net.bat<<EOF
@echo off
title SSHAXOR AUTO CREATE RDP DigitalOcean
color F2
echo.
echo   ____ ____  _   _    _    __  _____  ____  
echo  / ___/ ___^|^| ^| ^| ^|  / \   \ \/ / _ \^|  _ \ 
echo  \___ \___ \^| ^|_^| ^| / _ \   \  / ^| ^| ^| ^|_) ^|
echo   ___) ^|__) ^|  _  ^|/ ___ \  /  \ ^|_^| ^|  _ ^< 
echo  ^|____/____/^|_^| ^|_/_/   \_\/_/\_\___/^|_^| \_\                                             
echo.
echo ================================================ 
echo            [ SCRIPT AUTO INSTALL RDP ]
echo                OWNER DEDI HUMAEDI
echo ================================================
echo.

netsh -c interface ip set address name="$IFACE" static $IP4 255.255.240.0 $GW
netsh -c interface ip add dnsservers name="$IFACE" address=1.1.1.1 index=1 validate=no
netsh -c interface ip add dnsservers name="$IFACE" address=8.8.4.4 index=2 validate=no

netsh -c interface ip set address name="$IFACE2" static $IP4 255.255.240.0 $GW
netsh -c interface ip add dnsservers name="$IFACE2" address=1.1.1.1 index=1 validate=no
netsh -c interface ip add dnsservers name="$IFACE2" address=8.8.4.4 index=2 validate=no

netsh -c interface ip set address name="$IFACE3" static $IP4 255.255.240.0 $GW
netsh -c interface ip add dnsservers name="$IFACE3" address=1.1.1.1 index=1 validate=no
netsh -c interface ip add dnsservers name="$IFACE3" address=8.8.4.4 index=2 validate=no

cd.>%windir%\GetAdmin
if exist %windir%\GetAdmin (del /f /q "%windir%\GetAdmin") else (
echo CreateObject^("Shell.Application"^).ShellExecute "%~s0", "%*", "", "runas", 1 >> "%temp%\Admin.vbs"
"%temp%\Admin.vbs"
del /f /q "%temp%\Admin.vbs"
exit /b 2)

netsh -c interface ip set address name="$IFACE" static $IP4 255.255.240.0 $GW
netsh -c interface ip add dnsservers name="$IFACE" address=1.1.1.1 index=1 validate=no
netsh -c interface ip add dnsservers name="$IFACE" address=8.8.4.4 index=2 validate=no

netsh -c interface ip set address name="$IFACE2" static $IP4 255.255.240.0 $GW
netsh -c interface ip add dnsservers name="$IFACE2" address=1.1.1.1 index=1 validate=no
netsh -c interface ip add dnsservers name="$IFACE2" address=8.8.4.4 index=2 validate=no

netsh -c interface ip set address name="$IFACE3" static $IP4 255.255.240.0 $GW
netsh -c interface ip add dnsservers name="$IFACE3" address=1.1.1.1 index=1 validate=no
netsh -c interface ip add dnsservers name="$IFACE3" address=8.8.4.4 index=2 validate=no

cd /d "%ProgramData%/Microsoft/Windows/Start Menu/Programs/Startup"
del /f /q net.bat
exit
EOF

wget --no-check-certificate -O- $PILIHOS | gunzip | dd of=/dev/vda bs=3M status=progress

sudo mkdir /tmp/windows
sudo ntfsfix /dev/vda1
sudo mount -o rw /dev/vda1 /tmp/windows
#cd /tmp/windows/ProgramData/Microsoft/Windows/Start\ Menu/Programs/StartUp/
#cp -f /tmp/net.bat net.bat


#echo 'Your server will turning off in 3 second'
#sleep 5
