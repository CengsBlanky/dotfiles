function vi
    if command -q /usr/local/bin/vim
        /usr/local/bin/vim $argv
    else
        vim $argv
    end
end
