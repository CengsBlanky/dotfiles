function vi
    if command -q /usr/bin/vi
        /usr/bin/vi $argv
    else if command -q /usr/local/bin/vim
        /usr/local/bin/vim $argv
    else if command -q /usr/bin/vim
        /usr/bin/vim $argv
    end
end
