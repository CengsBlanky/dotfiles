function sysupdate
    sudo pacman -Sy
    sudo pacman -Syu && yay -Sua && sudo pacman -Sc && yay -Sc
end
