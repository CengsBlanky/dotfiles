function l
    if command -q exa
        exa --color=always --long --links --sort=Extension --git $argv
    else
        ls -lh
    end
end
