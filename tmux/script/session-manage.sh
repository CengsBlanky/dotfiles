#!/usr/bin/env bash
# tmux-fzf-session: fuzzy switch/kill/create tmux sessions with preview

# If not in tmux and no other sessions exist, prompt to create a new one.
if ! tmux has-session 2>/dev/null && [ -z "$TMUX" ]; then
    read -rp "New session name: " name
    tmux new -s "${name:-default}"
    exit 0
fi

help=$(printf "Enter: attach\nC-r: rename\nC-n: new\nC-x: kill")

while true; do
    current=$(tmux display-message -p -F '#S' 2>/dev/null)
    sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | grep -v "^${current}$" | grep -v '^$')

    # FZF with preview and custom key bindings handled via --expect
    # This is a more robust way to handle interactive commands.
    output=$(echo "$sessions" | fzf \
        --style "full" \
        --reverse \
        --prompt="[${current}]> " \
        --footer="$help" \
        --preview="tmux capture-pane -ep -t {} | head -30" \
        --expect=ctrl-r,ctrl-n,ctrl-x)

    # Exit if fzf was cancelled (e.g., by pressing Esc)
    if [ -z "$output" ]; then
        exit 0
    fi

    key=$(head -n1 <<<"$output")
    selection=$(tail -n +2 <<<"$output")

    case "$key" in
    ctrl-r)
        if [ -n "$selection" ]; then
            read -ep "rename $selection to: " newName
            if [ -n "$newName" ]; then
                tmux rename-session -t "$selection" "$newName"
            fi
        fi
        ;;
    ctrl-n)
        # Prompt for a new session name using the shell's read command
        read -ep "New session name: " createName
        if [ -n "$createName" ]; then
            # Create the session in the background
            tmux new-session -c $HOME -d -s "$createName"
            if [ -n "$TMUX" ]; then
                tmux switch-client -t "$createName"
            else
                tmux attach-session -t "$createName"
            fi
            exit 0
        fi
        # If no name was given, loop to show fzf again
        ;;
    ctrl-x)
        # Ensure a session was actually selected before trying to kill
        if [ -n "$selection" ]; then
            tmux kill-session -t "$selection"
        fi
        # Loop will continue, effectively reloading fzf
        ;;
    "") # This is the case for the 'enter' key
        if [ -n "$selection" ]; then
            if [ -n "$TMUX" ]; then
                # Inside tmux, switch client, but not to the same session
                if [ "$selection" != "$current" ]; then
                    tmux switch-client -t "$selection"
                fi
            else
                # Outside tmux, attach to session
                tmux attach-session -t "$selection"
            fi
            exit 0 # Exit after successful action
        else
            # User pressed enter on an empty selection, just exit
            exit 0
        fi
        ;;
    esac
done
