function sysupdate
    onproxy
    paru && paru -Sc --noconfirm
    echo " npm global binary update:"
    npm -g update
    echo " pipx global binary update:"
    pipx upgrade-all; or pipx reinstall-all
    offproxy
end
