function ll
    if command -q exa
        exa -l --color always --icons -a -s type --git $argv
    else
        ls -lAh $argv
    end
end
