#!/bin/bash

baidu_loc_req=$(cat "$HOME/.local/share/baidu_location.req" | tr -d '\n\t')
baidu_location=$(curl --noproxy -X 'GET' -s --insecure "$baidu_loc_req")
coordinate=$(echo $baidu_location | jq -r '.content.point.y + "," + .content.point.x')
address_info=$(echo $baidu_location | jq -r '.address')
save_file="$HOME/.local/share/weather.info"
tmp_err_file=$(mktemp)
weather=$(curl -s "http://wttr.in/$coordinate?format=%c%t" 2>$tmp_err_file)
echo "$address_info update at $(date --rfc-3339=seconds)" >$save_file
if [[ -n "$weather" ]]; then
    echo $weather >>$save_file
else
    # use baidu weather as fallback
    baidu_ak=$(cat "$HOME/.local/share/baidu_ak" | tr -d '\n\t')
    req_location=$(echo $baidu_location | jq -r '.content.point.x + "," + .content.point.y')
    baidu_weather_req="https://api.map.baidu.com/weather/v1/?location=$req_location&data_type=now&ak=$baidu_ak"
    weather_rsp=$(curl --noproxy -X 'GET' -s --insecure "$baidu_weather_req" 2>&1)
    rsp_status=$(echo "$weather_rsp" | jq -r '.status')
    if [[ "0" -eq "$rsp_status" ]]; then
        echo "$weather_rsp" | jq -r '.result.now.text + " " + (.result.now.temp | tostring) + "℃"' >>$save_file
    else
        echo "baidu api failed response: $weather_rsp" >$tmp_err_file
    fi
fi

if [[ -s "$tmp_err_file" ]]; then
    error_log="$HOME/.local/share/weatherUpdateErr.log"
    echo "$(date --rfc-3339=seconds) [ERROR]:" >$error_log
    cat "$tmp_err_file" >>$error_log
    rm $tmp_err_file
fi
