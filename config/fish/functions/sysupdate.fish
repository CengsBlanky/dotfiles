function sysupdate
    onproxy
    paru && paru -Sc --noconfirm
    echo " npm update:"
    npm update -g
    echo " bun update:"
    bun upgrade && bun update --global --latest
    echo " pnpm update:"
    pnpm self-update && pnpm update --global
    echo " pipx update:"
    pipx upgrade-all; or pipx reinstall-all
    echo " uv update:"
    uv self update && uv tool upgrade --all
    offproxy
end
