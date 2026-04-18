function ytplay
    mpv --no-video \
    --script=/etc/mpv/scripts/sponsorblock_minimal.lua \
    --ytdl-format="bestaudio[abr<=64]/bestaudio[abr<=96]/bestaudio" \
    --term-playing-msg="Title: \${media-title}" \
    --ytdl-raw-options="proxy=http://localhost:7897" \
    --cache-secs=15 \
    --demuxer-max-bytes=8MiB \
    --demuxer-max-back-bytes=4MiB \
    "$argv"
end
