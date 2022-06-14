function vis
    if command -q /usr/bin/vim
        sudo /usr/bin/vim $argv
    else
        sudo $EDITOR $argv
    end
end
