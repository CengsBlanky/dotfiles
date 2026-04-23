function kan
    if test (count $argv) -lt 1
        echo "provide a url to play"
        return 1
    end
    set -l url $argv[1]
    set -l proxy_addr ""
    set -l noproxy_site "bilibili.com" "bilivideo.com" "bilivideo.cn" "douyin.com"
    set -l found 0
    set -l video_format "best[height<=720]/best[height<=480]/best[height<=1080]/best"
    for site in $noproxy_site
        if string match -q "*$site*" "$url"
            set found 1
            break
        end
    end
    # not found, use proxy
    if test $found -eq 0
        set proxy_addr (grep -m 1 -e "^socks" $HOME/.local/share/proxy.info | tr -d "\n")
        echo "using proxy: $proxy_addr"
    else
        set -l choosen_fmt (yt-dlp --proxy="$proxy_addr" -F "$url" | tail -n +3 | fzf | awk '{print $1}')
        if test -n "$choosen_fmt"
            set video_format "$choosen_fmt"
        else
            set video_format best
        end
    end
    set -l metajson (yt-dlp --proxy="$proxy_addr" -j "$url" 2>/dev/null)
    if test -z "$metajson"
        echo "Failed to fetch metadata"
        return 1
    end
    set -l title (echo "$metajson" | jq -r '"\(.title) - \(.uploader)"')

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
