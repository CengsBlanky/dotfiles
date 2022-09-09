function tmux_weather
    set -l query "http://wttr.in/$CUR_LOCATION?format=%c%t"
    curl -s $query
end
