# ~/.config/fish/functions/se.fish
# Safe Extract: Extract archives into a dedicated folder
# Usage: se <archive_file>

function se --description "Safely extract archive into its own folder"
    set -l RED (set_color red)
    set -l GREEN (set_color green)
    set -l NC (set_color normal)

    # Check argument count
    if test (count $argv) -ne 1
        echo "$RED Error:$NC Please provide exactly one archive file."
        echo "Usage: se <archive_file>"
        return 1
    end

    set -l FILE $argv[1]

    # Check if file exists
    if not test -f "$FILE"
        echo "$RED Error:$NC File '$FILE' not found."
        return 1
    end

    # Get basename and determine clean folder name
    set -l BASENAME (basename "$FILE")
    set -l FOLDERNAME "$BASENAME"

    # Strip multi-part extensions intelligently
    switch "$BASENAME"
        case '*.tar.gz' '*.tgz'
            set FOLDERNAME (string replace -r '\.tar\.gz$|\.tgz$' '' "$BASENAME")
        case '*.tar.bz2'
            set FOLDERNAME (string replace -r '\.tar\.bz2$' '' "$BASENAME")
        case '*.tar.xz'
            set FOLDERNAME (string replace -r '\.tar\.xz$' '' "$BASENAME")
        case '*.tar.7z'
            set FOLDERNAME (string replace -r '\.tar\.7z$' '' "$BASENAME")
        case '*.tar.Z' '*.tar.lz' '*.tar.lzma'
            set FOLDERNAME (string replace -r '\.tar\.[^.]+$' '' "$BASENAME")
        case '*'
            set FOLDERNAME (string replace -r '\.[^.]+$' '' "$BASENAME")
    end

    echo "Creating directory: ./$FOLDERNAME"
    mkdir -p "$FOLDERNAME"

    # Helper to check if command exists
    function _cmd_exists
        type -q $argv[1]
    end

    # Extraction logic
    switch "$FILE"
        case '*.tar.gz' '*.tgz'
            echo "$GREEN Extracting$NC $FILE (tar.gz) ..."
            tar -xzf "$FILE" -C "$FOLDERNAME"

        case '*.tar.xz'
            echo "$GREEN Extracting$NC $FILE (tar.xz) ..."
            tar -xJf "$FILE" -C "$FOLDERNAME"

        case '*.tar.bz2'
            echo "$GREEN Extracting$NC $FILE (tar.bz2) ..."
            tar -xjf "$FILE" -C "$FOLDERNAME"

        case '*.tar.7z'
            if not _cmd_exists 7z
                echo "$RED Error:$NC '7z' not found. Install p7zip-full."
                return 1
            end
            echo "$GREEN Extracting$NC $FILE (tar.7z) ..."
            7z x "$FILE" -so | tar -xf - -C "$FOLDERNAME"

        case '*.7z'
            if not _cmd_exists 7z
                echo "$RED Error:$NC '7z' not found. Install p7zip-full."
                return 1
            end
            echo "$GREEN Extracting$NC $FILE (7z) ..."
            7z x "$FILE" -o"$FOLDERNAME" >/dev/null

        case '*.tar'
            echo "$GREEN Extracting$NC $FILE (tar) ..."
            tar -xf "$FILE" -C "$FOLDERNAME"

        case '*.gz'
            echo "$GREEN Extracting$NC $FILE (gz) ..."
            gunzip -c "$FILE" > "$FOLDERNAME/"(string replace -r '\.gz$' '' (basename "$FILE"))

        case '*.zip'
            echo "$GREEN Extracting$NC $FILE (zip) ..."
            unzip -q "$FILE" -d "$FOLDERNAME"

        case '*.bz2'
            echo "$GREEN Extracting$NC $FILE (bz2) ..."
            bunzip2 -c "$FILE" > "$FOLDERNAME/"(string replace -r '\.bz2$' '' (basename "$FILE"))

        case '*.xz'
            echo "$GREEN Extracting$NC $FILE (xz) ..."
            unxz -c "$FILE" > "$FOLDERNAME/"(string replace -r '\.xz$' '' (basename "$FILE"))

        case '*'
            echo "$RED Error:$NC Unsupported file format: $FILE"
            echo "Supported: .zip .tar.gz .tgz .tar.bz2 .tar.xz .tar.7z .7z .gz .bz2 .xz .tar"
            return 1
    end

    # Check success
    if test $status -eq 0
        echo "$GREEN Success!$NC Files extracted to: ./$FOLDERNAME"
    else
        echo "$RED Extraction failed.$NC (Check required tools)"
        rmdir "$FOLDERNAME" 2>/dev/null
        return 1
    end
end
