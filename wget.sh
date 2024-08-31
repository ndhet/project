#!/bin/bash
clear
#
# CREATED By SSHAXOR.MY.ID
#
export NC="\e[0m"
export YELLOW='\033[1;93m'
export WH='\033[1;97m'
export RED="\033[1;91m"
export GREEN='\033[1;92m'
export BLUE='\033[1;94m'
export COLBG='\E[40;1;41m'
export MG='\033[1;95m'
colors=('\033[0;31m' '\033[0;32m' '\033[0;33m' '\033[0;34m' '\033[0;35m' '\033[0;36m')

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
echo ""
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

echo -e "$BLUE┌─────────────────────────────────────────────────┐${NC}"
echo -e " $BLUE${NC}${COLBG}           • AUTO SCRIPT INSTALL RDP •           ${NC}$BLUE$NC"
echo -e "$BLUE└─────────────────────────────────────────────────┘${NC}"
echo -e "$BLUE┌─────────────────────────────────────────────────┐${NC}"
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
IPVPS=$(curl -s ipinfo.io/ip)
ISP=$(curl -s https://ipapi.co/$IPVPS/org)
CITY=$(curl -s https://ipapi.co/$IPVPS/city)
echo -e "$BLUE $NC Memory Usage   : $uram / $tram"
echo -e "$BLUE $NC ISP & City     : $ISP & $CITY"
echo -e "$BLUE $NC IP-VPS         : ${RED}$IPVPS${NC}"
echo -e "$BLUE└─────────────────────────────────────────────────┘${NC}"
echo -e "$BLUE┌─────────────────────────────────────────────────┐${NC}"
echo -e "  [${MG} 1 ${NC}] • Windows 2012 [${GREEN}ON${NC}] [${MG} 5 ${NC}] • Windows 10 [${GREEN}ON${NC}]"
echo -e "  [${MG} 2 ${NC}] • Windows 2016 [${RED}OFF${NC}] [${MG} 6 ${NC}] • Windows 11 [${GREEN}ON${NC}]"
echo -e "  [${MG} 3 ${NC}] • Windows 2019 [${RED}OFF${NC}] [${MG} 7 ${NC}] • Custom  GZ [${RED}OFF${NC}]"
echo -e "  [${MG} 4 ${NC}] • Windows 2022 [${RED}OFF${NC}] [${MG} x ${NC}] • Batal"
echo -e "$BLUE└─────────────────────────────────────────────────┘${NC}"
echo -e "$BLUE┌─────────────────────────────────────────────────┐$NC"
echo -e "$BLUE $NC Version     :${RED} 1.0 Beta Version${NC}"
echo -e "$BLUE $NC Client Name : $client"
echo -e "$BLUE $NC License     : $license"
echo -e "$BLUE└─────────────────────────────────────────────────┘$NC"
echo -e "$BLUE┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$BLUE ${NC}                  • SSHAXOR •                  $BLUE $NC"
echo -e "$BLUE└─────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p "  Pilih [>] : " PILIHOS

case "$PILIHOS" in
	1|"") PILIHOS="http://128.199.70.121/windows2012.gz"  IFACE="Ethernet" OS=10;;
	2) PILIHOS="https://hadongpho.com/css/gz/GPISERVER2016.gz"  IFACE="Ethernet Instance 0";;
	3) PILIHOS="https://hadongpho.com/css/gz/GPISERVER19.gz"  IFACE="Ethernet Instance 0";;
	4) PILIHOS="https://hadongpho.com/css/gz/GPISERVER2022.gz"  IFACE="Ethernet Instance 0";;
	5) PILIHOS="http://128.199.70.121/windows10.gz"  IFACE="Ethernet Instance 0 2" OS=10;;
	6) PILIHOS="http://128.199.70.121/windows11.gz"  IFACE="Ethernet Instance 0 2" OS=11;;
	7) read -p "Masukkan Link GZ mu : " PILIHOS
		IFACE="Ethernet Instance 0 2"
		;;
	*) echo "Instalasi dibatalkan"; exit;;
esac

IP4=$(curl -4 -s icanhazip.com)
GW=$(ip route | awk '/default/ { print $3 }')

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

cd.>%windir%\GetAdmin
if exist %windir%\GetAdmin (del /f /q "%windir%\GetAdmin") else (
echo CreateObject^("Shell.Application"^).ShellExecute "%~s0", "%*", "", "runas", 1 >> "%temp%\Admin.vbs"
"%temp%\Admin.vbs"
del /f /q "%temp%\Admin.vbs"
exit /b 2)

netsh -c interface ip set address name="$IFACE" static $IP4 255.255.240.0 $GW
netsh -c interface ip add dnsservers name="$IFACE" address=1.1.1.1 index=1 validate=no
netsh -c interface ip add dnsservers name="$IFACE" address=8.8.4.4 index=2 validate=no

cd /d "%ProgramData%/Microsoft/Windows/Start Menu/Programs/Startup"
del /f /q net.bat
exit
EOF

wget -q --no-check-certificate -O- $PILIHOS | gunzip | dd of=/dev/vda bs=3M status=progress > /dev/null 2>&1 &
PID=$!

# Display a rotating spinner while wget is running
spin='|/-\'
i=0

echo -e "${colors[0]}┌─────────────────────────────────────────────────┐${NC}"

echo -e " ${colors[1]} Proses memerlukan waktu, tunggu sebentar ${NC}"

echo -e " ${colors[2]} Jangan diclose, proses -+ 5 Menit ${NC}"

echo -e "${colors[3]}└─────────────────────────────────────────────────┘${NC}"

# Center the loading text
echo -n "  Loading "

# Spinner loop
while kill -0 $PID 2> /dev/null; do
    i=$(( (i+1) % 4 ))
    color_index=$(( (color_index+1) % 6 )) # Cycle through colors
    printf "\b${colors[$color_index]}${spin:$i:1}${NC}"
    sleep 0.1
done

# Clear the loading spinner when done
tput cup 10 $((cols / 2 - 8))

sudo mkdir /tmp/windows

if [ "$OS" -eq 10 ]; then
	sudo ntfsfix /dev/vda3
	sudo mount /dev/vda3 /tmp/windows
	cd /tmp/windows/ProgramData/Microsoft/Windows/Start\ Menu/Programs/StartUp/
	cp -f /tmp/net.bat net.bat
	clear

elif [ "$OS" -eq 11 ]; then
	sudo ntfsfix /dev/vda3
	sudo mount /dev/vda3 /tmp/windows
	cd /tmp/windows/ProgramData/Microsoft/Windows/Start\ Menu/Programs/Startup/
	cp -f /tmp/net.bat net.bat
	clear

else
    sudo ntfsfix /dev/vda1
	sudo mount /dev/vda1 /tmp/windows
	cd /tmp/windows/ProgramData/Microsoft/Windows/Start\ Menu/Programs/StartUp/
	cp -f /tmp/net.bat net.bat
	clear
fi

echo -e "[ ${GREEN}INFO${NC} ] Instalation is Complate "
echo -e "[ ${GREEN}INFO${NC} ] Switch to Boot From Hard Drive"
sleep 2
for i in {5..1}; do
    echo -ne "[ ${GREEN}INFO${NC} ] Shutdown in $i seconds...\033[0K\r"
    sleep 1
done
poweroff

netsh -c interface ip set address name="Ethernet" static 165.22.48.129 255.255.240.0 165.22.48.1
netsh -c interface ip add dnsservers name="$IFACE" address=1.1.1.1 index=1 validate=no
netsh -c interface ip add dnsservers name="$IFACE" address=8.8.4.4 index=2 validate=no
