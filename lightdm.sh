#!/bin/bash
set -e

if [ "$(hostname)" != "rod" ]; then
  echo "only run this on rod"
  exit 1
fi

if [ $EUID -ne 0 ]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

sudo sed -i 's/.*display-setup-script.*/display-setup-script = xrandr --output DP-2 --primary --auto --right-of DP-5 --mode 2560x1440 --rate 165.00/' /etc/lightdm/lightdm.conf
sudo sed -i 's/.*session-setup-script.*/session-setup-script = xrandr --output DP-2 --primary --auto --right-of DP-5 --mode 2560x1440 --rate 165.00/' /etc/lightdm/lightdm.conf
sudo sed -i 's/.*greeter-setup-script.*/greeter-setup-script = xrandr --output DP-2 --primary --auto --right-of DP-5 --mode 2560x1440 --rate 165.00/' /etc/lightdm/lightdm.conf
