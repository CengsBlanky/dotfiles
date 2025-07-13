#!/bin/bash

LOCATION=江宁区
while true; do
    curl -s "http://wttr.in/$LOCATION?format=%c%t" 2>/dev/null >~/.weather
    sleep 10m
done
