function vi
    if command -q /usr/local/bin/vim
        /usr/local/bin/vim $argv
    else
        $EDITOR $argv
    end
end
