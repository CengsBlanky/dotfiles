function sendkeys
    for _pane in (tmux list-panes -s -F '#{pane_id}')
        tmux send-keys -t $_pane (string join ' ' $argv) Enter
    end
end
