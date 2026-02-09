function transtorrent
    set -l SERVICE_NAME "transmission-daemon.service"
    echo "start $SERVICE_NAME..."
    if not systemctl is-active --quiet $SERVICE_NAME
        sudo systemctl start $SERVICE_NAME
        sleep 0.5s
    end
    open "http://localhost:9091"
end

