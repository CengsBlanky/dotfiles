function tmux_weather
    set -l query "http://wttr.in/$MY_CUR_LOCATION?format=%c+%t"
    curl -s $query
end
