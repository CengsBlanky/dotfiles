#!/bin/bash

session_name='persist-popup'
current_dir='#{pane_current_path}'

tmux has-session -t "$session_name" 2>/dev/null || tmux new-session -d -s "$session_name" -c "$current_dir"

if tmux list-sessions -F "#{session_name} #{session_attached}" | grep -q "^$session_name 1\$"; then
    tmux detach-client -s "$session_name"
else
    session_dir=$(tmux display-message -t $session_name -p $current_dir)
    target_dir=$(tmux display-message -p $current_dir)
    change_dir=""
    if [[ "$session_dir" != "$target_dir" ]]; then
        change_dir="tmux send-keys -t $session_name \"cd $target_dir\" C-m &&"
    fi
    tmux display-popup \
        -d "$current_dir" \
        -w '70%' -h '70%' \
        -E "$change_dir tmux attach-session -t $session_name"
fi
