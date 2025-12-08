function rmtmp
    set -l tmpdir $HOME/tmp
    if test -d $tmpdir
        rm $tmpdir/tmp_*
    end
end
