#!/bin/bash

barpid=$(pstree -lp | awk '/status_right/ && /sleep/' | sed "s/.*sleep(\([0-9]\+\)).*/\1/")
# kill if sleeping
if [[ -n "$barpid" && "$barpid" =~ ^[0-9]+$ ]]; then
    kill "$barpid"
fi
