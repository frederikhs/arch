#!/bin/bash
set -e

if [ $EUID -ne 0 ]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

sudo pacman -S \
    iwd \
    openssh \
    nm-connection-editor \
    network-manager-applet \
    lightdm \
    lightdm-gtk-greeter \
    arandr \
    i3-wm \
    i3status \
    i3lock \
    dmenu \
    light \
    gnome-terminal \
    chromium \
    docker \
    docker-compose \
    tree \
    curl \
    htop \
    nano \
    flameshot \
    make \
    jq \
    git \
    code \
    imwheel \
    --noconfirm

sudo systemctl enable lightdm

echo "Xcursor.size: 24" > ~/.Xresources

# Docker post installation
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo groupadd docker || echo "ok"
sudo usermod -aG docker fhs

# Light post installation
sudo usermod -a -G video fhs

echo "Done"
