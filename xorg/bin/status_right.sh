#!/bin/bash

while true; do
    LOCALTIME=$(date '+%Y-%m-%d %H:%M %a')
    STATUS=$(cat /sys/class/power_supply/BAT1/status)
    BAT=""
    if [ "$STATUS" = "Discharging" ]; then
        BAT_PERCENT=$(cat /sys/class/power_supply/BAT1/capacity)
        BAT="🔋$BAT_PERCENT%"
    fi
    WEATHER=$(cat $XDG_RUNTIME_DIR/weather.info 2>/dev/null)
    xsetroot -name "$WEATHER $BAT 🗓 $LOCALTIME"
    sleep 30s
done
