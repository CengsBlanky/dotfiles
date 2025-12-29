#!/bin/bash

baidu_req=$(cat "$HOME/.local/share/baidu_location.req" | tr -d '\n\t')
baidu_location=$(curl --noproxy -X 'GET' -s --insecure "$baidu_req")
coordinate=$(echo $baidu_location | jq -r '.content.point.y + "," + .content.point.x')
address_info=$(echo $baidu_location | jq -r '.address')
save_file="$HOME/.local/share/weather.info"
weather=$(curl -s "http://wttr.in/$coordinate?format=%c%t" 2>/dev/null)
if [[ -n "$weather" ]]; then
    echo "$address_info update at $(date --rfc-3339=seconds)" >$save_file
    echo $weather >>$save_file
else
    # can not get weather info mostly because of internet connection error
    echo "" >$save_file
fi
