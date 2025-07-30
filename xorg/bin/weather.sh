#!/bin/bash

LOCATION=江宁区
curl -x http://localhost:7890 -s "http://wttr.in/$LOCATION?format=%c%t" 2>/dev/null >~/.weather
