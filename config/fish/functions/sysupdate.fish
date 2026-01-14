function sysupdate
    sudo pacman -Syu && sudo pacman -Sc --noconfirm
    onproxy
    yay -Sua && yay -Sc
    paru -Sua
    offproxy
    npm -g update
    pipx upgrade-all; or pipx reinstall-all
end
