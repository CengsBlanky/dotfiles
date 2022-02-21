function l
    if command -q exa
        exa --long --header --links --sort=name --git $argv
    end
end
