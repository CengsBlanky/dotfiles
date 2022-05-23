function l
    if command -q exa
        exa --long --links --sort=name --git $argv
    else
        ls -lh
    end
end
