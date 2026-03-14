function sc -d "Compresses a file with a specified format"
    # Get the file and format from the arguments
    set -l file $argv[1]
    set -l format $argv[2]

    # Check if a file was provided
    if test -z "$file"
        echo "Usage: compress <file> [format]"
        echo "Supported formats: gz, xz, bz2, 7z, zip"
        return 1
    end

    # Set the default format to 7z if not provided
    if test -z "$format"
        set format "7z"
    end

    set -l source_file ""
    set -l output_file ""

    # Check if the input file has a compression extension
    set -l extension (string split -r -m 1 '.' "$file" | sed -n 2p)

    if contains -- $extension gz xz bz2 7z zip
        if not test -e "$file"
            set source_file (string replace -r "\.$extension\$" '' "$file")
            set output_file "$file"
            set format $extension
        else
            set source_file "$file"
            set output_file "$file.$format"
        end
    else
        set source_file "$file"
        set output_file "$file.$format"
    end

    # Check if the source file exists
    if not test -e "$source_file"
        if test (string match -r '\.tar$' "$source_file")
            set -l tar_file (string replace -r '\.tar$' '' "$source_file")
            if test -e "$tar_file"
                set source_file "$tar_file"
            else
                echo "Error: source file: '$source_file' or '$tar_file' not exist."
                return 1
            end
        end
    end

    # Check if the output file already exists
    if test -e "$output_file"
        echo "Error: Output file '$output_file' already exists."
        return 1
    end

    echo "Compressing '$source_file' to '$output_file' using '$format'..."

    # Compress the file based on the format
    switch $format
        case gz
            7z a -tgzip "$output_file" "$source_file"
        case xz
            7z a -txz "$output_file" "$source_file"
        case bz2
            7z a -tbzip2 "$output_file" "$source_file"
        case 7z
            7z a "$output_file" "$source_file"
        case zip
            7z a -tzip "$output_file" "$source_file"
        case '*'
            echo "Error: Unsupported format '$format'."
            rm -f "$output_file" # Clean up if we created an empty file
            return 1
    end
end
