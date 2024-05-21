#!/usr/bin/fish
set -l argc (count $argv)
if not test $argc -eq 2
    echo "source dir or target dir required!"
    echo "Usage: ./nf_patch.fish [source_dir] [target_dir]"
    exit 1
end

set -l src_dir $argv[1]
set -l target_dir $argv[2]
# in case target directory is not yet created
mkdir -p $target_dir
set -l font_files (find $src_dir -maxdepth 1 -name "*.ttf" -type f )
set -l font_count (count $font_files)
echo found $font_count font file\(s\) to patch...
echo "patched font file will save to $target_dir"
set -l patched_count 0

for font_file in $font_files
    set -l err_log "$font_file.err"
    fontforge --script $HOME/Apps/FontPatcher/font-patcher --no-progressbars --adjust-line-height --careful --complete $font_file --out $target_dir &> $err_log
    # check patch result
    if not test $status -eq 0
        echo "$font_file patch failed! check error log: $err_log for details"
    else
        rm $err_log
        echo "$font_file patched finished."
        set patched_count (math $patched_count + 1)
    end
end

echo "$patched_count out of $font_count font patched done!"
