function kan
    # watch online stream
    set -l proxy_addr (grep -m 1 -e "^socks" $HOME/.local/share/proxy.info | tr -d "\n")
    echo "using proxy: $proxy_addr"
    set -l metajson (yt-dlp --proxy="$proxy_addr" -j "$argv" 2>/dev/null)
    if test -z "$metajson"
        echo "Failed to fetch metadata"
        return 1
    end

    set -l title (echo "$metajson" | jq -r '"\(.title) - \(.uploader)"')

    yt-dlp -q --no-warnings \
    --proxy "$proxy_addr" \
    --format "best[height<=720]/best[height<=1080]/best" \
    --remote-components ejs:npm \
    --embed-subs \
    -o - "$argv" |
    mpv \
    --script=/etc/mpv/scripts/sponsorblock_minimal.lua \
    --force-media-title="$title" \
    --force-seekable=yes \
    -
end
