function listen
    read -l proxy_addr < $HOME/.local/share/proxy.info

    if test -f "$argv[1]"
        for url in (cat "$argv[1]")
            if test -z "$url"
                continue
            end

            set -l metajson (yt-dlp --proxy="$proxy_addr" -j "$url" 2>/dev/null)
            if test -z "$metajson"
                echo "Failed to fetch metadata: $url"
                continue
            end

            set -l title (echo "$metajson" | jq -r '"\(.title) - \(.uploader)"')

            yt-dlp -q --no-warnings \
            --proxy "$proxy_addr" \
            --format "worstaudio" \
            --remote-components ejs:npm \
            -o - "$url" |
            mpv --no-video \
            --script=/etc/mpv/scripts/sponsorblock_minimal.lua \
            --term-playing-msg="$title" \
            --cache-secs=20 \
            --demuxer-max-bytes=12MiB \
            --demuxer-max-back-bytes=6MiB \
            --force-seekable=yes \
            -
        end
        return
    end

    set -l metajson (yt-dlp --proxy="$proxy_addr" -j "$argv" 2>/dev/null)
    if test -z "$metajson"
        echo "Failed to fetch metadata"
        return 1
    end

    set -l title (echo "$metajson" | jq -r '"\(.title) - \(.uploader)"')

    yt-dlp -q --no-warnings \
    --proxy "$proxy_addr" \
    --remote-components ejs:npm \
    --format "worstaudio" \
    -o - "$argv" |
    mpv --no-video \
    --msg-level=ffmpeg=error \
    --script=/etc/mpv/scripts/sponsorblock_minimal.lua \
    --term-playing-msg="$title" \
    --cache=yes \
    --cache-secs=300 \
    --demuxer-max-bytes=32MiB \
    --demuxer-max-back-bytes=16MiB \
    --force-seekable=yes \
    -
end
