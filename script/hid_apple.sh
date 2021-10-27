#! /bin/sh
# @since   2021-10-28 01:49
# @author  zengshuai
# @version 1.0

# replace <value> below with the one that worked for you in the previous step (0, 1 or 2)
# example: echo "options hid_apple fnmode=2 | sudo tee /etc/modprobe.d/hid_apple.conf"
# this will erase any pre-existing contents from /etc/modprobe.d/hid_apple.conf
echo "options hid_apple fnmode=<value>" | sudo tee /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u
sudo systemctl reboot
