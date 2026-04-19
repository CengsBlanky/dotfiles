function ytlisten
    read -l proxy_addr < $HOME/.local/share/proxy.info
    set -l metajson (yt-dlp --proxy="$proxy_addr" -j "$argv")
    if test -z "$metajson"
        echo "Failed to fetch metadata"
        return 1
    end
    set -l title (echo "$metajson" | jq -r '"\(.title) - \(.uploader)"')

    yt-dlp -q --no-warnings \
    --proxy "$proxy_addr" \
    # --format "worstaudio[abr<=48]/worstaudio[abr<=64]/worstaudio[abr<=96]/worstaudio/worstaudio" \
    --format "worstaudio" \
    -o - "$argv" |
    mpv --no-video \
    --script=/etc/mpv/scripts/sponsorblock_minimal.lua \
    --term-playing-msg="$title" \
    --cache-secs=20 \
    --demuxer-max-bytes=12MiB \
    --demuxer-max-back-bytes=6MiB \
    --force-seekable=yes \
    -
end
