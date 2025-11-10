#!/usr/bin/env fish
set -l cmd $argv
set -l tmpfile (mktemp --suffix=fish_notify)
eval $cmd >$tmpfile 2>&1
set -l cmd_status $status

set -l icon "dialog-information"
set -l urgency "normal"
if test $cmd_status -ne 0
    set icon "dialog-error"
    set urgency "critical"
end

set -l output (cat $tmpfile | string collect)
rm $tmpfile
if test -n "$output"
    notify-send -i $icon -u $urgency $output
end
