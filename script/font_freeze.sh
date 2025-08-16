for file in ~/Downloads/CascadiaMono/*.ttf; do
    dest_name=$(basename $file)
    pyftfeatfreeze -f 'zero' $file $dest_name -v
done

