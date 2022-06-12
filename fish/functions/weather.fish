function weather
    set -l location $argv[1]

    if test -z "$location"
        set location $MY_CUR_LOCATION
    end

    set -l query "http://wttr.in/$location"
    curl -s $query
end
