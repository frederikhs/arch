## Install some packages
`sudo pacman -S i3-wm gnome-terminal lightdm lightdm-gtk-greeter dmenu chromium tree curl htop nano flameshot make jq git i3status --noconfirm`

## Enable some packages
`sudo systemctl enable lightdm`

## Set cursor size (optional)
`echo "Xcursor.size: 24" > ~/.Xresources`

## Edit lighdm to set up monitors on boot
`sudo nano /etc/lightdm/lightdm.conf`

Insert:
```
display-setup-script=xrandr --output DP-2 --primary --auto --right-of DP-5 --mode 2560x1440 --rate 165.00
session-setup-script=xrandr --output DP-2 --primary --auto --right-of DP-5 --mode 2560x1440 --rate 165.00
```

# Finished, reboot
Now reboot and see lightdm greeter allowing you to login and i3 start automatically with monitors configured
