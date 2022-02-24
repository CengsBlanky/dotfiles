function vi
    if test -x vim
        vim $argv
    else
        $EDITOR $argv
end
