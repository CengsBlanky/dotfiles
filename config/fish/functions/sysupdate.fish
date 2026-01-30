function sysupdate
    onproxy
    paru && paru -Sc --noconfirm
    echo " npm global update:"
    npm update -g
    echo " bun self upgrade and update global cli tools:"
    bun upgrade && bun update -g
    echo " pipx update global cli tools:"
    pipx upgrade-all; or pipx reinstall-all
    echo " uv self update and tool upgrade:"
    uv self update && uv tool upgrade --all
    offproxy
end
