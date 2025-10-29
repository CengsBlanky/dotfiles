#!/bin/bash

while true; do
    location=$(cat "$HOME/.local/share/location")
    if [[ -z "$location" ]]; then
        location="南京"
    fi
    save_file="$HOME/.local/share/weather.info"
    weather=$(curl -s "http://wttr.in/$location?format=%c%t" 2>/dev/null)
    if [[ -n "$weather" ]]; then
        echo "$location update at $(date --rfc-3339=seconds)" >$save_file
        echo $weather >>$save_file
    fi
    sleep 15m
done
