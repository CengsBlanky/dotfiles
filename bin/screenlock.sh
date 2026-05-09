#!/bin/bash

delay=1
notify-send "screen will be turned off and locked."
sleep "$delay"s
xset dpms force off
slock
