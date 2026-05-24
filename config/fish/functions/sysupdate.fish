function sysupdate
    onproxy
    paru && paru -Sc --noconfirm
    offproxy
    utilupdate
end
