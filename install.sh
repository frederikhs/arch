#!/bin/bash
set -e

if [ $EUID -ne 0 ]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

USERNAME=$(id -nu "$SUDO_UID")

sudo pacman -S \
    iwd \
    openssh \
    inetutils \
    nm-connection-editor \
    network-manager-applet \
    bluez \
    sof-firmware \
    lightdm \
    lightdm-gtk-greeter \
    arandr \
    i3-wm \
    i3status \
    i3lock \
    dmenu \
    light \
    dunst \
    man-db \
    nitrogen \
    alacritty \
    chromium \
    docker \
    docker-buildx \
    docker-compose \
    tree \
    curl \
    wget \
    htop \
    vim \
    flameshot \
    make \
    jq \
    yq \
    git \
    code \
    imwheel \
    fuse \
    openvpn \
    bash-completion \
    peek \
    nautilus \
    ttf-dejavu \
    ttf-liberation \
    ttf-font-awesome \
    noto-fonts \
    noto-fonts-emoji \
    zip \
    unzip \
    pulsemixer \
    net-tools \
    dnsutils \
    speedtest-cli \
    keychain \
    openresolv \
    wireguard-tools \
    hey \
    terraform \
    spotify-launcher \
    go \
    firewalld \
    --noconfirm

sudo systemctl enable lightdm

echo "Xcursor.size: 24" > $HOME/.Xresources

# Docker post installation
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo groupadd docker || echo "ok"
sudo usermod -aG docker "$USERNAME"

# Light post installation
sudo usermod -a -G video "$USERNAME"

# Allow users to run nmcli assuming root
sudo chmod +s /usr/bin/nmcli

# Install yay
if [ ! -d "$HOME/yay" ]; then
  sudo -u "$USERNAME" git clone https://aur.archlinux.org/yay.git $HOME/yay
  (cd $HOME/yay && sudo -u "$USERNAME" git makepkg -si)
else
  echo "yay already installed"a
fi

# Update everything
sudo -u "$USERNAME" yay -Sy

# Install
sudo -u "$USERNAME" yay -S --noconfirm --noprovides --answerdiff=None --answerclean=None \
 slack-desktop \
 postman-bin

echo "Done"
