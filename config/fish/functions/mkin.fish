function mkin
    if test (count $argv) -eq 1
        mkdir -p $argv
        cd $argv
    else
        echo "one directory only"
    end
end
