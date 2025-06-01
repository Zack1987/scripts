#!/bin/bash
echo "update system"
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo "installed programs"
sudo apt install -y \
                kde-standard \
                build-essential \
                wget \
                unzip \
                curl \
                git \
                python3-full \
                python3-pip \
                snapd \
                flatpak \
                mysql-client \
                mysql-server \
                htop \
                lsb-release \
                ca-certificates \
                apache2 \
                software-properties-common \
                apt-transport-https \
                gnupg \

echo "Cleaning up"
sudo apt autoremove -y
sudo apt clean





echo "snap installed programs"
sudo snap install \
    code-insiders --classic \
    blender --classic \
    spotify --classic \
    vlc --classic \
    gimp --edge \
    inkscape --classic \
    obs-studio --classic \
    discord --classic \
    darktable --edge \
    joplin-desktop --classic \
    pycharm-community --edge --classic \
    firefox --classic \
    prusaslicer --classic \
    kdenlive --classic \
    libreoffice --classic \
    proton-mail --classic \
    drawio --classic \
    bitwarden --classic \
    audacity --classic \
    arduino --classic \
    krita --classic \


# installing Calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# installing Solaar
sudo add-apt-repository ppa:solaar-unifying/stable
sudo apt update
sudo apt install solaar

# installing wazuh
curl -sO https://packages.wazuh.com/4.10/wazuh-install.sh && sudo bash ./wazuh-install.sh -a

# installing Virtualbox
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] http://download.virtualbox.org/virtualbox/debian $(. /etc/os-release && echo "$VERSION_CODENAME") contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
sudo apt update
sudo apt install virtualbox-7.1 -y
vboxmanage -v | cut -dr -f1
wget https://download.virtualbox.org/virtualbox/7.1.0/Oracle_VirtualBox_Extension_Pack-7.1.0.vbox-extpack
sudo vboxmanage extpack install Oracle_VirtualBox_Extension_Pack-7.1.0.vbox-extpack -y
sudo usermod -aG vboxusers $USER




# finish installs
sudo reboot
