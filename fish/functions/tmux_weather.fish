function tmux_weather
    set -l cur_location '郑场镇'
    set -l query "http://wttr.in/$cur_location?format=%c%t"
    curl -s $query
end
