function ll
    if command -q exa
        exa -l --color always --icons --git -a -s type $argv
    else
        ls -lAh $argv
    end
end
