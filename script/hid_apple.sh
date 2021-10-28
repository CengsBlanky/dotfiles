#! /bin/sh
# @since   2021-10-28 01:49
# @author  zengshuai
# @version 1.0

# replace <value> below with the one that worked for you in the previous step (0, 1 or 2)
# example: echo "options hid_apple fnmode=2 | sudo tee /etc/modprobe.d/hid_apple.conf"
# this will erase any pre-existing contents from /etc/modprobe.d/hid_apple.conf
echo "options hid_apple fnmode=2" | sudo tee /etc/modprobe.d/hid_apple.conf
# change below file to 2
sudo nvim /sys/module/hid_apple/parameters/fnmode
# refresh to img
sudo dracut -f /boot/initramfs-5.14.13-200.fc34.x86_64.img
