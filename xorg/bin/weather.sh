#!/bin/bash

location=${MY_CUR_LOCATION:-"南京"}
while true; do
    curl -x http://localhost:7890 -s "http://wttr.in/$location?format=%c%t" 2>/dev/null >~/.weather
    sleep 30m
done
