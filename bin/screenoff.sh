#!/bin/bash

delay=1
notify-send "screen will be turned off after $delay seconds."
sleep "$delay"s
xset dpms force off
