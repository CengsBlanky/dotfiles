#!/bin/bash

while true; do
    LOCALTIME=$(date '+%Y-%m-%d %H:%M %a')
    STATUS=$(cat /sys/class/power_supply/BAT0/status)
    BAT_PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
    BAT=""
    if [[ "$STATUS" = "Discharging" && $BAT_PERCENT -le 70 ]]; then
        BAT="🔋$BAT_PERCENT%"
    fi
    WEATHER=$(cat "$XDG_RUNTIME_DIR/weather.info" 2>/dev/null)
    xsetroot -name "$WEATHER $BAT 🗓 $LOCALTIME"
    sleep 25s
done
