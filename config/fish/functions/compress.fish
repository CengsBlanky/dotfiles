function compress
    if test (count $argv) -lt 1
        echo "Usage: compress <format> <file_or_directory> [output_file]"
        echo "Supported formats: gz (gzip), bz2 (bzip2), xz (xz), zip (zip)"
        return 1
    end

    set input $argv[1]
    set output $argv[2]
    set format $argv[3]

    if not test -e $input
        echo "Error: '$input' does not exist."
        return 1
    end

    if test -z "$format"
        set format "gz"
    end

    if test -z "$output"
        set output (basename $input).tar.$format
    end

    switch $format
        case gz
            tar -czf $output $input
        case bz2
            tar -cjf $output $input
        case xz
            tar -cJf $output $input
        case zip
            zip -r $output $input
        case 7z
            7z a -mx=9 $output $input
        case '*'
            echo "Error: Unsupported format '$format'."
            return 1
    end

    echo "Compressed '$input' to '$output'."
end
