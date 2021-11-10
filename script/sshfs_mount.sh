#! /bin/sh bash
# @since   2021-11-10 15:20
# @author  zengshuai
# @version 1.0

sudo sshfs -o allow_other,default_permissions pi@192.168.10.108:/home/pi/dotfiles ~/mnt/pi
