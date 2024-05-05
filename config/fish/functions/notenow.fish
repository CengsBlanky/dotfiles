function notenow
    set -l curdate (date +%Y%m%d)
    set -l curtime (date +%H:%M)
    set -l curyear (date +%Y)
    set -l journalDir $HOME/notes/journal/$curyear 
    set -l journalfilename $journalDir/$curdate.md
    set -l lastminute ""

    if test ! -d $journalDir
        mkdir -p $journalDir
    end

    if test ! -f $journalfilename
        echo -n "# Note for $curdate" > $journalfilename
    else
        set lastminute (cat $journalfilename | grep -e '^#\{2\}\ [0-2][0-9]:[0-6][0-9]$' | tail -n 1)
    end

    if test "$lastminute" = "## $curtime"
        $EDITOR -c "norm Gzzo" \
            -c "startinsert" $journalfilename
    else
        $EDITOR -c "norm G2o" \
            -c "norm GI## $curtime" \
            -c "norm G2o" \
            -c "norm zz" \
            -c "startinsert" $journalfilename
    end
end
