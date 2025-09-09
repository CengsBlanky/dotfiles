#!/bin/bash

location=${MY_CUR_LOCATION:-"南京"}
while true; do
    sleep 5s
    curl -x http://localhost:7890 -s "http://wttr.in/$location?format=%c%t" 2>/dev/null >"$XDG_RUNTIME_DIR/weather.info"
    sleep 30m
done
