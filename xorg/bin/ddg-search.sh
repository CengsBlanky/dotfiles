#!/bin/bash

# Prompt user for search query using dmenu
query=$(echo "" | dmenu -p "DuckDuckGo Search:")

# If the user entered something, open browser with the query
if [ -n "$query" ]; then
    xdg-open "https://duckduckgo.com/?q=$(echo "$query" | sed 's/ /+/g')"
fi
