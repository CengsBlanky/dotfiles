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
    if [[ "Discharging" == "$bat_status" && $percent -lt 80 ]]; then
        printf "🔋$percent%%"
    elif [[ "Charging" == "$bat_status" && $percent -lt 100 ]]; then
        printf "⚡$percent%%"
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
    echo "$(volume)$(brightness) $(battery) $(weather) $(localtime)"
}

# wait for preparation
while true
do
    status
    read -t 29 -r event || true
done < <(
    # PipeWire volume changes
    pactl subscribe 2>/dev/null | grep --line-buffered "sink\|source" || true &
    # Brightness changes
    inotifywait -me close_write /sys/class/backlight/*/brightness 2>/dev/null || true &
    # keep FIFO open
    cat
)
