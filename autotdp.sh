apt update -y
apt upgrade -y
clear
sudo apt install xrdp -y
clear
sudo systemctl enable xrdp
sudo systemctl start xrdp

sudo ufw status
sudo ufw allow 3389/tcp
sudo ufw reload
clear
apt install tasksel -y
tasksel install cinnamon-desktop
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
