function md
    set -l suffix (date +%Y%m%d)
    set -l mdfile $HOME/temp/$argv$suffix.html
    if test ! -f $mdfile
        pandoc $argv > $mdfile
    end
    xdg-open $mdfile
end
