#!/usr/bin/env bash
# List top 10 processes by total RAM usage, combining duplicates.

ps -eo comm=,rss= | awk '
{
    name = $1
    rss  = $2
    mem[name] += rss
}
END {
    for (name in mem) {
        printf "%s\t%d\n", name, mem[name]
    }
}
' | sort -t$'\t' -k2 -rn | head -30 | awk -F'\t' '{
    if ($2 >= 1048576) {
        printf "%-20s %8.2f GB\n", $1, $2 / 1048576
    } else if ($2 >= 1024) {
        printf "%-20s %8.1f MB\n", $1, $2 / 1024
    } else {
        printf "%-20s %8.1f kB\n", $1, $2
    }
}'
