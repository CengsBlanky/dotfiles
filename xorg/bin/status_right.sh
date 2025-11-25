#!/bin/bash

battery {
    batlink=$(find /sys/class/power_supply/ -name "BAT[0-9]" | tail -1)
    bat_status=$(cat $batlink/status)
    percent=$(cat $batlink/capacity)
    bat=""
    if [[ "$bat_status" = "Discharging" && $percent -le 70 ]]; then
        bat="🔋$percent%"
    fi
    return $bat
}

while true; do
    LOCALTIME=$(date '+%Y-%m-%d %H:%M %a')
    WEATHER=$(sed -n '2p' "$HOME/.local/share/weather.info" 2>/dev/null)
    xsetroot -name "$WEATHER $(battery) 🗓 $LOCALTIME"
    sleep 25s
done
