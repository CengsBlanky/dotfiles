function hex
    if test (count $argv) -ne 1
        echo "requires only one filename!"
        return 1
    end

    set -l xxd (command -s xxd)
    set -l hexdump (command -s hexdump)

    set -l cmd
    if command -q $xxd
        set cmd $xxd
    else if command -q $hexdump
        set cmd $hexdump
    else
        echo "no valid program to convert binary to hex file"
        echo "suggestion: install xxd or hexdump"
        return 1
    end

    $cmd $argv > $argv.hex
end
