function stoptrans
    set -l SERVICE_NAME "transmission-daemon.service"
    if systemctl is-active --quiet $SERVICE_NAME
        echo "stopping $SERVICE_NAME..."
        sudo systemctl stop $SERVICE_NAME
    else
        echo "$SERVICE_NAME is not running."
    end
end
