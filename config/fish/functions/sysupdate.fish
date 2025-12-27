function sysupdate
    npm -g update
    pipx upgrade-all
    sudo pacman -Syu && sudo pacman -Sc --noconfirm
    onproxy
    yay -Sua && yay -Sc
    offproxy
end
