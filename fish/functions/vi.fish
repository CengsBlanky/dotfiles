function vi
    if command -q vim
        vim $argv
    else
        $EDITOR $argv
    end
end
