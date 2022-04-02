function weather
    set -l default_location '郑场镇'
    set -l location $argv[1]

    if test -z "$location"
        set location $default_location
    end

    set -l query "http://wttr.in/$location"
    curl -s $query
end
