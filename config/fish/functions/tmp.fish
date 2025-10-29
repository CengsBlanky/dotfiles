function tmp
    set -l temp_dir $HOME/tmp
    set -l temp_file (mktemp --tmpdir=$temp_dir)
    vim $temp_file
end
