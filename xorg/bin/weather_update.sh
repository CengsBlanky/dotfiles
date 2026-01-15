#!/bin/bash

baidu_loc_req=$(cat "$HOME/.local/share/baidu_location.req" | tr -d '\n\t')
baidu_location=$(curl --noproxy -X 'GET' -s --insecure "$baidu_loc_req")
coordinate=$(echo $baidu_location | jq -r '.content.point.y + "," + .content.point.x')
address_info=$(echo $baidu_location | jq -r '.address')
save_file="$HOME/.local/share/weather.info"
weather=$(curl -s "http://wttr.in/$coordinate?format=%c%t" 2>/dev/null)
echo "$address_info update at $(date --rfc-3339=seconds)" >$save_file
if [[ -n "$weather" ]]; then
    echo $weather >>$save_file
else
    # use baidu weather as fallback
    baidu_ak=$(cat "$HOME/.local/share/baidu_ak" | tr -d '\n\t')
    req_location=$(echo $baidu_location | jq -r '.content.point.x + "," + .content.point.y')
    baidu_weather_req="https://api.map.baidu.com/weather/v1/?location=$req_location&data_type=now&ak=$baidu_ak"
    curl --noproxy -X 'GET' -s --insecure "$baidu_weather_req" | jq -r '.result.now.text + " " + (.result.now.temp | tostring) + "℃"' >>$save_file
fi
