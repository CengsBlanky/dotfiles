function l
    if command -q exa
        exa --long --header --links --sort=name --git $argv
    else
        ls -lh
    end
end
