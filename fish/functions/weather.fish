function weather
    set -l today (date +%F)
    set -l weather_log "$HOME/tmp/weather$today.log"
    set -l cur_location '郑场镇'
    if test -n "$argv[1]"
        set cur_location $argv[1]
    end

    if test -f $weather_log
        cat $weather_log
    else
        set -l query "http://v2d.wttr.in/$cur_location?format=%C%t\n"
        set -l result (curl -s $query)
        curl -s $result | tee $weather_log
    end
end
