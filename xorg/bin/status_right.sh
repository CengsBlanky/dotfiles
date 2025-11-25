#!/bin/bash

volume() {
    vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    if grep -q '[MUTED]' <<<"$vol"; then
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
    if [[ "Not charging" == "$bat_status" && $percent -lt 80 ]]; then
        printf " 🔋 %s%%" "$percent"
    fi
}

localtime() {
    printf "🗓 $(date '+%Y-%m-%d %H:%M %a')"
}

weather() {
    info=$(sed -n '2p' "$HOME/.local/share/weather.info" 2>/dev/null)
    printf "$info"
}

status() {
    xsetroot -name "$(volume)$(brightness)  $(weather) $(localtime)$(battery)"
}

# wait for preparation
sleep 1s
while true; do
    $(status)
    sleep 25s
done
