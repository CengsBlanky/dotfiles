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

for font_file in $font_files
    fontforge --script $HOME/Apps/FontPatcher/font-patcher --no-progressbars --adjust-line-height --careful --complete $font_file --out $target_dir &> patch.log
    printf "%s %s\n" $font_file "patched finished, see patch.log for details"
end

echo "font patch done!"
