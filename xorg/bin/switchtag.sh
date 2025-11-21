#!/bin/bash

# Get all client IDs from dwmmonitor.json, excluding the selected client.
client_ids=$(dwm-msg get_monitors | jq -r '.[] | .clients.all[] as $all | .clients.selected as $selected | $all | select(. != $selected)' | sort -u)

# Create an empty associative array to hold the formatted client information and their IDs.
declare -A client_map
declare -A bitmask_map
bitmask_map["1"]=1
bitmask_map["2"]=2
bitmask_map["4"]=3
bitmask_map["8"]=4
bitmask_map["16"]=5
bitmask_map["32"]=6
bitmask_map["64"]=7
bitmask_map["128"]=8
bitmask_map["256"]=9

# Loop through each client ID and get its information.
for id in $client_ids; do
    # Get client details from dwm-msg.
    client_data=$(dwm-msg get_dwm_client $id)

    # Extract tags and name using jq.
    tags=$(echo "$client_data" | jq -r '.tags')
    name=$(echo "$client_data" | jq -r '.name')

    # Format the string.
    formatted_info=$(printf "%s: %s" "${bitmask_map["$tags"]}" "$name")

    # Store the mapping from formatted info to client ID.
    client_map["$formatted_info"]=$tags
done

# Pipe the client information to dmenu and get the user's choice.
# only get one starting tag with awk
selected_choice=$(printf "%s\n" "${!client_map[@]}" | awk '!seen[$1]++' | sort -n | dmenu -i)

# If the user made a selection, switch to that client.
if [ -n "$selected_choice" ]; then
    selected_id=${client_map["$selected_choice"]}
    dwm-msg run_command view "$selected_id"
fi
