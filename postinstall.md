## Run postinstall.sh

`./postinstall.sh`


## Setup screens

`sudo nano /etc/lightdm/lightdm.conf`

Insert:
```
display-setup-script=xrandr --output DP-2 --primary --auto --right-of DP-5 --mode 2560x1440 --rate 165.00
session-setup-script=xrandr --output DP-2 --primary --auto --right-of DP-5 --mode 2560x1440 --rate 165.00
```

# Finished, reboot
Now reboot and see lightdm greeter allowing you to login and i3 start automatically with monitors configured
