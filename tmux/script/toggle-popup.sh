#!/bin/bash

session_name='popup'
current_dir='#{pane_current_path}'

tmux has-session -t "$session_name" 2>/dev/null || tmux new-session -d -s "$session_name" -c "$current_dir"

if tmux list-sessions -F "#{session_name} #{session_attached}" | grep -q "^$session_name 1\$"; then
    tmux detach-client -s "$session_name"
else
    tmux display-popup \
        -d "$current_dir" \
        -w '70%' -h '70%' \
        -E "tmux attach-session -t $session_name"
fi
