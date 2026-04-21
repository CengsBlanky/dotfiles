function yt-subtitle
    set -l proxy_addr (grep -m 1 -e "^socks" $HOME/.local/share/proxy.info | tr -d "\n")
    yt-dlp --config-location ~/.config/yt-dlp/subtitle_config --proxy $proxy_addr "$argv"
end
