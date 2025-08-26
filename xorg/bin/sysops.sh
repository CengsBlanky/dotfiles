#!/bin/bash

options=" reboot
⏻ shutdown"
chosen=$(echo -e "$options" | dmenu -i)
case "$chosen" in
    reboot) sudo systemctl reboot ;;
    shutdown) sudo systemctl poweroff ;;
esac
