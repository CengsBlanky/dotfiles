function l
    if command -q exa
        exa --long --links --sort=Extension --git $argv
    else
        ls -lh
    end
end
