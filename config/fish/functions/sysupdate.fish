function sysupdate
    onproxy
    paru && paru -Sc --noconfirm
    echo " bun self upgrade and update global cli tools:"
    bun upgrade && bun update -g
    echo " pipx update global cli tools:"
    pipx upgrade-all; or pipx reinstall-all
    offproxy
end
