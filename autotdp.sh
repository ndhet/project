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
