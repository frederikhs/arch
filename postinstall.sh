set -e

sudo pacman -S \
    lightdm \
    lightdm-gtk-greeter \
    arandr \
    i3-wm \
    i3status \
    dmenu \
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
    iwd \
    openssh \
    --noconfirm

sudo systemctl enable lightdm

echo "Xcursor.size: 24" > ~/.Xresources

# Docker post installation
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo groupadd docker || echo "ok"
sudo usermod -aG docker fhs

echo "Done"
