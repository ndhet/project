#!/bin/bash
#
# CREATED By SSHAXOR.MY.ID
#
echo "Pilih OS yang ingin anda install"
echo "	1) Windows 2019(Default)"
echo "	2) Windows 2016"
echo "	3) Windows 2012"
echo "	4) Windows 10"
echo "	5) Windows 2022"
echo "	6) Windows 11"
echo "	7) Pakai link gz mu sendiri"

read -p "Pilih [1]: " PILIHOS

case "$PILIHOS" in
	1|"") PILIHOS="http://167.172.78.82/GPISERVER2019.gz"  IFACE="Ethernet Instance 0";;
	2) PILIHOS="http://167.172.78.82/GPISERVER2016.gz"  IFACE="Ethernet Instance 0";;
	3) PILIHOS="https://hadongpho.com/css/gz/windows2012.gz"  IFACE="Ethernet Instance 0";;
	4) PILIHOS="https://hadongpho.com/css/gz/windows10.gz"  IFACE="Ethernet Instance 0 2";;
	5) PILIHOS="http://167.172.78.82/GPISERVER2022.gz"  IFACE="Ethernet Instance 0";;
	6) PILIHOS="https://hadongpho.com/css/gz/windows11.gz"  IFACE="Ethernet Instance 0 2";;
	7) read -p "Masukkan Link GZ mu : " PILIHOS;;
	*) echo "pilihan salah"; exit;;
esac

echo "Merasa terbantu dengan script ini? Anda bisa memberikan dukungan melalui QRIS kami https://sshaxor.my.id/qris"

read -p "Masukkan password untuk akun Administrator (minimal 12 karakter): " PASSADMIN

IP4=$(curl -4 -s icanhazip.com)
GW=$(ip route | awk '/default/ { print $3 }')


cat >/tmp/net.bat<<EOF
@ECHO OFF
cd.>%windir%\GetAdmin
if exist %windir%\GetAdmin (del /f /q "%windir%\GetAdmin") else (
echo CreateObject^("Shell.Application"^).ShellExecute "%~s0", "%*", "", "runas", 1 >> "%temp%\Admin.vbs"
"%temp%\Admin.vbs"
del /f /q "%temp%\Admin.vbs"
exit /b 2)
net user Administrator $PASSADMIN


netsh -c interface ip set address name="$IFACE" static $IP4 255.255.240.0 $GW
netsh -c interface ip add dnsservers name="$IFACE" address=1.1.1.1 index=1 validate=no
netsh -c interface ip add dnsservers name="$IFACE" address=8.8.4.4 index=2 validate=no

cd /d "%ProgramData%/Microsoft/Windows/Start Menu/Programs/Startup"
del /f /q net.bat
exit
EOF

wget --no-check-certificate -O- $PILIHOS | gunzip | dd of=/dev/vda bs=3M status=progress

sudo mkdir /tmp/windows
sudo ntfsfix /dev/vda1
sudo mount -o rw /dev/vda1 /tmp/windows
cd "/tmp/windows/ProgramData/Microsoft/Windows/Start\ Menu/Programs/Startup"
cp -f /tmp/net.bat net.bat
sudo unmount /dev/vda1

echo 'Your server will turning off in 3 second'
sleep 3
poweroff

