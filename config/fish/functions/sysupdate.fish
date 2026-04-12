function sysupdate
    onproxy
    paru && paru -Sc --noconfirm
    echo " npm update:"
    npm update -g
    echo " bun update:"
    bun upgrade && bun completions && bun update --global --latest
    echo " pnpm update:"
    pnpm self-update && pnpm update --global
    pnpm completion fish >~/.config/fish/completions/pnpm.fish
    echo " pipx update:"
    pipx upgrade-all; or pipx reinstall-all
    register-python-argcomplete --shell fish pipx >~/.config/fish/completions/pipx.fish
    echo " uv update:"
    uv self update && uv tool upgrade --all
    uv generate-shell-completion fish >~/.config/fish/completions/uv.fish
    uvx --generate-shell-completion fish >~/.config/fish/completions/uvx.fish
    offproxy
end
