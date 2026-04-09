#!/bin/bash

windows=$(wmctrl -l | grep -v '^$')
declare -A win_map
menu_items=()
index=1

while IFS=' ' read -r win_id desktop host window_name; do
    win_map["$index"]="$win_id"
    menu_items+=("$index. $window_name")
    ((index++))
done <<<"$windows"

selected=$(printf "%s\n" "${menu_items[@]}" | dmenu -i -l 64)

[ -z "$selected" ] && exit 0

sel_index=$(echo "$selected" | cut -d'.' -f1)
target_id=${win_map[$sel_index]}
wmctrl -i -a "$target_id"
