function ls
    if command -q exa
        exa -G  --color auto --icons -a -s type $argv
    else
        ls $argv
    end
end
