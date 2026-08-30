#!/bin/bash

/usr/bin/keepassxc --keyfile ~/.local/share/secret/system.key ~/.local/share/keyrings/system.kdbx &
/usr/bin/firefox &
alacritty &
