function sysupdate
    npm -g update
    sudo pacman -Syu && sudo pacman -Sc --noconfirm
    onproxy
    yay -Sua && yay -Sc
    offproxy
end
