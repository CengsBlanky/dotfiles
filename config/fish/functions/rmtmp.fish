function rmtmp
    set -l tmpdir $HOME/tmp
    if test -d $tmpdir
        rm -rf $tmpdir/*
    end
end
