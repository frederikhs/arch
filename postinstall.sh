sudo pacman -S \
    lightdm \
    lightdm-gtk-greeter \
    arandr \
    i3-wm \
    i3status \
    dmenu \
    gnome-terminal \
    chromium \
    tree \
    curl \
    htop \
    nano \
    flameshot \
    make \
    jq \
    git \
    code \
    imwheel
    --noconfirm

sudo systemctl enable lightdm

echo "Xcursor.size: 24" > ~/.Xresources
