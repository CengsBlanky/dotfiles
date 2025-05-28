function ll
    if command -q exa
        exa --long --color always -all --sort type --git $argv
    else
        ls -lAh $argv
    end
end
