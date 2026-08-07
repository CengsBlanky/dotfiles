#!/bin/bash

/usr/bin/keepassxc --keyfile ~/.local/share/secret/system.key ~/.local/share/keyrings/system.kdbx &
$HOME/.local/bin/eudic.AppImage &
/usr/bin/firefox &
alacritty &
