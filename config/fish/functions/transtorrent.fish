function transtorrent
    set -l SERVICE_NAME "transmission-daemon.service"
    echo "start $SERVICE_NAME..."
    sleep 0.5s
    if systemctl is-active --quiet $SERVICE_NAME
        open "http://localhost:9091" &
    else
        sudo systemctl start $SERVICE_NAME
    end
end

