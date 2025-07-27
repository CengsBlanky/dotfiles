#!/bin/bash

LOCATION=江宁区
curl -s "http://wttr.in/$LOCATION?format=%c%t" 2>/dev/null >~/.weather
