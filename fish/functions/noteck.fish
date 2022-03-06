function noteck
    set -l curyear (date +%Y)
    set -l ckdate (date +%F)
    set -l journalDir $HOME/notes/journal/$curyear 
    set -l dayago $argv[1]

    if test -n "$dayago"; and test $dayago -ge 1
        set ckdate (date --date=$dayago" day ago" +%F)
    end

    set -l journalfilename $journalDir/$ckdate.md

    if test -f $journalfilename
        if command -q glow
            glow $journalfilename
        else
            less $journalfilename
        end
    else
        echo "note at "$ckdate" not found."
        false
    end
end
