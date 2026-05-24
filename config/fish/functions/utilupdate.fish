function utilupdate
    function echob
        echo -e "\033[1;34m$argv\033[0m"
    end
    echob " npm update:"
    npm update -g
    pnpm completion fish >~/.config/fish/completions/pnpm.fish
    echob " bun update:"
    bun upgrade && bun completions && bun update --global --latest
    echob " pipx update:"
    pipx upgrade-all; or pipx reinstall-all
    register-python-argcomplete --shell fish pipx >~/.config/fish/completions/pipx.fish
    echob " uv update:"
    uv self update && uv tool upgrade --all
    uv generate-shell-completion fish >~/.config/fish/completions/uv.fish
    uvx --generate-shell-completion fish >~/.config/fish/completions/uvx.fish
end
