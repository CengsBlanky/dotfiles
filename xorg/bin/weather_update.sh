#!/bin/bash

baidu_location=$(curl --noproxy -X 'GET' -s --insecure 'https://api.map.baidu.com/location/ip?coor=bd09ll&ak=nGMOlIE09UWDVhflZaN0Vz5hqIEl0bjj')
point_info=$(echo $baidu_location | jq -r '.content.point.y + "," + .content.point.x')
address_info=$(echo $baidu_location | jq -r '.address')
save_file="$HOME/.local/share/weather.info"
weather=$(curl -s "http://wttr.in/$point_info?format=%c%t" 2>/dev/null)
if [[ -n "$weather" ]]; then
    echo "$address_info update at $(date --rfc-3339=seconds)" >$save_file
    echo $weather >>$save_file
fi
