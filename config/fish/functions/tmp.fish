function tmp
    set -l ft ""
    if test (count $argv) -ge 1
        set ft "."$argv[1]
    end
    set -l temp_dir $HOME/tmp
    set -l temp_file (mktemp --tmpdir=$temp_dir --suffix=$ft -t "tmp_XXXXXXXXXX")
    vim $temp_file
end
