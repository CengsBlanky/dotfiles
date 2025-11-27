function sysupdate
    sudo pacman -Syu && sudo pacman -Sc --noconfirm
    onproxy
    yay -Sua && yay -Sc
end
