function decompress
    if test (count $argv) -ne 1
        echo "Usage: decompress <archive_file>"
        return 1
    end

    set archive $argv[1]

    if not test -f $archive
        echo "Error: '$archive' does not exist or is not a file."
        return 1
    end

    switch $archive
        case '*.tar.gz' '*.tgz'
            tar -xzf $archive
        case '*.tar.bz2' '*.tbz2'
            tar -xjf $archive
        case '*.tar.xz' '*.txz'
            tar -xJf $archive
        case '*.zip'
            unzip $archive
        case '*'
            echo "Error: Unsupported archive format for '$archive'."
            return 1
    end

    echo "Decompressed '$archive'."
end
