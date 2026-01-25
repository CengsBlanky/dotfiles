function files
    if command -q exa
        exa --only-files --show-symlinks --color=auto --long --sort=Extension --git $argv
    else
        find . -maxdepth 1 -type f
    end
end
