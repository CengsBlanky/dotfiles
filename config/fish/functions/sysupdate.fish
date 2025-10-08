function sysupdate
    sudo pacman -Syu && yay -Sua && sudo pacman -Sc && yay -Sc
end
