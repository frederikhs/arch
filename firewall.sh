#!/bin/bash
set -e

if [ $EUID -ne 0 ]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

sudo firewall-cmd --permanent --zone=home --add-service=http
sudo firewall-cmd --permanent --zone=home --add-service=https
sudo firewall-cmd --permanent --zone=home --add-service=ssh

if [ "$(hostname)" == "rod" ]; then
  sudo firewall-cmd --set-default-zone=home
elif [ "$(hostname)" == "g9" ]; then
  sudo firewall-cmd --set-default-zone=public
fi

sudo firewall-cmd --reload
sudo firewall-cmd --list-all
