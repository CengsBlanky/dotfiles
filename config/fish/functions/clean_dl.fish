function clean_dl
    set -l dl_dir $HOME/Downloads
    if test -d $dl_dir
        rm -rf $dl_dir/*
    end
end
