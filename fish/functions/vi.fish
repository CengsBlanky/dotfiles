function vi
    if command -q /usr/bin/vim
        /usr/bin/vim $argv
    else
        $EDITOR $argv
    end
end
