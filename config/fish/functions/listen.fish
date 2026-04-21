function listen
    set -l proxy_addr (grep -m 1 -e "^socks" $HOME/.local/share/proxy.info | tr -d "\n")
    if test -f "$argv[1]"
        for url in (cat "$argv[1]")
            yplay $url $proxy_addr
        end
        return
    end
    yplay $argv $proxy_addr
end

function yplay
    set -l url $argv[1]
    set -l proxy $argv[2]
    if test -z "$url"
        return
    end

    set -l metajson (yt-dlp --proxy="$proxy" -j "$url" 2>/dev/null)
    if test -z "$metajson"
        echo "Failed to fetch metadata: $url"
        return
    end

    set -l title (echo "$metajson" | jq -r '"\(.title) - \(.uploader)"')

    yt-dlp -q --no-warnings \
    --proxy "$proxy" \
    --format "worstaudio" \
    --remote-components ejs:npm \
    -o - "$url" |
    mpv --no-video \
    --script=/etc/mpv/scripts/sponsorblock_minimal.lua \
    --term-playing-msg="$title" \
    --cache-secs=300 \
    --demuxer-max-bytes=64MiB \
    --demuxer-max-back-bytes=32MiB \
    --force-seekable=yes \
    -
end
