#!/bin/bash

barpid=$(pstree -lp | grep status_right | sed "s/.*sleep(\([0-9]\+\)).*/\1/")
kill "$barpid"
