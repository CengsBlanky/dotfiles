#!/bin/bash

volume() {
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    if grep -q '[MUTED]' <<< "$vol"; then
        printf "  "
    else
        printf "  %.0f%%" $(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -oE '[0-9]+\.[0-9]+') * 100" | bc)
    fi
}

brightness() {
    printf " 󰖨 %s" $(brightnessctl info -m | cut -d',' -f4)
}

battery() {
    batlink=$(find /sys/class/power_supply/ -name "BAT[0-9]" | tail -1)
    bat_status=$(cat $batlink/status)
    percent=$(cat $batlink/capacity)
    bat=""
    bat="🔋$percent%"
    return $bat
}

while true; do
    sleep 2s
    LOCALTIME=$(date '+%Y-%m-%d %H:%M %a')
    WEATHER=$(sed -n '2p' "$HOME/.local/share/weather.info" 2>/dev/null)
    xsetroot -name "$(volume)$(brightness) $WEATHER $(battery) 🗓 $LOCALTIME"
    sleep 25s
done
