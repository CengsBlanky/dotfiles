#!/bin/bash

# Simple calculator using dmenu and bc

# Define the dmenu command with your preferred settings
DMENU_COMMAND="dmenu -p Calculate: -l 0 -nb #2e3440 -nf #ebdbb2 -sb #4c566a -sf #1d2021"

# Get the calculation expression from the user
expression=$(echo "" | $DMENU_COMMAND)

# Check if the user entered something
if [ -n "$expression" ]; then
    # Perform the calculation using bc with 2 decimal places scale
    result=$(echo "scale=2; $expression" | bc -l 2>&1)

    notify-send "Calculate:" "$expression = $result"
fi
