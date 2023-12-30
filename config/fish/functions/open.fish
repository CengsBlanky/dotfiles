function open
    set -l params $argv
    set -l pcnt (count $params)
    if test $pcnt -eq 0
        set params .
    end
    xdg-open $params
end
