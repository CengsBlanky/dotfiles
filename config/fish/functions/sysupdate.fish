function sysupdate
    onproxy
    paru && paru -Sc --noconfirm
    utilupdate
    offproxy
end
