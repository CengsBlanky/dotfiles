function font_freeze
    set -l argc (count $argv)
    if test $argc -lt 1
        echo "usage: font_freeze [source] [target](default to current dir)"
        exit 1
    end
    set -l source $argv[1]
    if test $argc -eq 1
        if test -f $source
            echo "freeze $source to slash zero, output is $dest_name"
            pyftfeatfreeze -f 'zero' $source $dest_name -v
        end
        if test -d $source
            find $source -type f | while read -l file
                echo "freeze $file to current directory"
                pyftfeatfreeze -f 'zero' $file (basename $file) -v
            end
        end
    else if test $argc -eq 2
        set -l target_dir $argv[2]
        mkdir -p $target_dir
        # trim trailing slash
        set target_dir (string trim --right --chars=/ "$target_dir")
        if test -f $source
            set -l target_name (basename $source)
            set -l target_file "$target_dir/$target_name"
            echo "freeze $source to slash zero, output is $target_file"
            pyftfeatfreeze -f 'zero' $source $target_file -v
        else if test -d $source
            find $source -type f | while read -l file
                set -l target_name (basename $file)
                set -l target_file "$target_dir/$target_name"
                echo "freeze $file to $target_file"
                pyftfeatfreeze -f 'zero' $file $target_file -v
            end
        end
    end
end
