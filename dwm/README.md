# install x window lib

# window compositor picom

```sh
sudo apt install picom
```

# touchpach config

create file `/etc/X11/xorg.conf.d/30-touchpad.conf`

match device is touchpad location

get touchpad id or name
and show the props:
```sh
xinput list
xinput list-props [device id]
```

```sh
Section "InputClass"
    Identifier "touchpad catchall"
    MatchDevicePath "/dev/input/event3"
    Driver "libinput"
    Option "Tapping" "on"
    Option "NaturalScrolling" "on"
EndSection
```
