function sysupdate
    sudo pacman -Syu && sudo pacman -Sc --noconfirm
    uproxy
    yay -Sua && yay -Sc
end
