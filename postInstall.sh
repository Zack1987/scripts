#!/bin/bash

# postInstall.sh - Basic Ubuntu post-install script

set -e

echo "Updating package lists..."
sudo apt update

echo "Upgrading installed packages..."
sudo apt upgrade -y

echo "Installing common utilities..."
sudo apt install -y \
    build-essential \
    curl \
    wget \
    git \
    vim \
    htop \
    unzip \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    python3-pip \
    snapd \
    flatpak \
    python3-full \
    mysql-client \
    mysql-server \
    

echo "Cleaning up..."
sudo apt autoremove -y
sudo apt clean

echo "Installing snap packages..."
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


echo "Packages installed from GitHub..."
git clone https://github.com/pwr-Solaar/Solaar.git



echo "Post-installation setup complete!"