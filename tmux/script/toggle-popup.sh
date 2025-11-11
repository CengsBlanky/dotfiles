#!/bin/bash

session_name="persist-popup"

tmux has-session -t "$session_name" 2>/dev/null || tmux new-session -d -s "$session_name" -c '#{pane_current_path}'

if tmux list-sessions -F "#{session_name} #{session_attached}" | grep -w "$session_name" | grep -q '1$'; then
    tmux detach-client
else
    tmux display-popup -w '80%' -h '80%' -b 'rounded' -d '#{pane_current_path}' -E "tmux attach -t $session_name -c '#{pane_current_path}'"
fi
