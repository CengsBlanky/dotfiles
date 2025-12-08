#!/bin/bash

mpd_status() {
    # Get the current MPD status using mpc
    status=$(mpc status | awk 'NR==2')
    song=$(mpc current)

    # Extract state: playing, paused, stopped
    state=$(echo "$status" | grep -oP '\[\K[^]]+' | head -1)

    # Format output based on state
    case "$state" in
    playing)
        icon=" "
        ;;
    paused)
        icon="󰏤 "
        ;;
    *)
        icon=""
        song=""
        ;;
    esac

    # Truncate long song names
    max_len=20
    if [ ${#song} -gt $max_len ]; then
        song="${song:0:$((max_len - 3))}..."
    fi

    # Final output
    echo "${icon}${song} "
}

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
    xsetroot -name "$(mpd_status)$(volume)$(brightness) $(battery) $(weather) $(localtime)"
}

# wait for preparation
sleep 1s
while true; do
    # Wait for player event, but catch failures
    if ! mpc idle player >/dev/null 2>&1; then
        sleep 1
        continue
    fi
    $(status)
done &
while true; do
    $(status)
    sleep 25s
done
