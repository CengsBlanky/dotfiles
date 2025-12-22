#!/bin/bash

mpd_status() {
    # Get the current MPD status using mpc
    state=$(mpc status 2>/dev/null | awk 'NR==2' | grep -oP '\[\K[^]]+' | tr -d '\n\t')
    music_info=$(mpc --quiet current --format '[%title%[ - %artist%]]|[%file%]')
    # Format output based on state
    case "$state" in
    playing)
        icon=" "
        ;;
    paused)
        icon="󰝛 "
        ;;
    *)
        icon=""
        music_info=""
        ;;
    esac

    # Truncate long song names
    max_len=40
    if [ ${#music_info} -gt $max_len ]; then
        music_info="${music_info:0:$((max_len - 3))}..."
    fi

    # Final output
    printf "${icon}${music_info} "
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
        printf " $percent%%"
    elif [[ "Charging" == "$bat_status" && $percent -lt 100 ]]; then
        printf "󰂄 $percent%%"
    fi
}

localtime() {
    printf "🗓 $(date '+%Y-%m-%d %H:%M %a')"
}

weather() {
    info=$(sed -n '2p' "$HOME/.local/share/weather.info" 2>/dev/null)
    printf "$info"
}

xsetroot -name "$(mpd_status)$(volume)$(brightness)$(battery)  $(weather) $(localtime)"
