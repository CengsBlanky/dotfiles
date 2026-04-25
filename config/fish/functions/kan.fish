function kan
    if test (count $argv) -lt 1
        echo "provide a url to play"
        return 1
    end
    set -l url $argv[1]
    set -l proxy_addr ""
    set noproxy_sites (string trim (string split , (cat $HOME/.local/share/noproxy.txt)))
    for site in $noproxy_sites
        if string match -q "*$site*" "$url"
            mpv "$url"
            return
        end
    end
    set proxy_addr (grep -m 1 -e "^socks" $HOME/.local/share/proxy.info | tr -d "\n")
    echo "using proxy: $proxy_addr"
    set -l metajson (yt-dlp --proxy="$proxy_addr" -j "$url" 2>/dev/null)
    if test -z "$metajson"
        echo "Failed to fetch metadata"
        return 1
    end
    set -l title (echo "$metajson" | jq -r '"\(.title) - \(.uploader)"')

    set -l video_format "best[height<=720]/best[height<=480]/best[height<=1080]/best"
    yt-dlp -q --no-warnings \
        --proxy "$proxy_addr" \
        --cookies-from-browser firefox \
        --remote-components ejs:npm \
        --format "$video_format" \
        --embed-subs \
        -o - "$url" |
        mpv \
            --script=/etc/mpv/scripts/sponsorblock_minimal.lua \
            --force-media-title="$title" \
            --force-seekable=yes \
            -
end
