function stoptrans
    set -l SERVICE_NAME "transmission-daemon.service"
    if systemctl is-active --quiet $SERVICE_NAME
        sudo systemctl stop $SERVICE_NAME
        echo "$SERVICE_NAME stopped."
    else
        echo "$SERVICE_NAME is not running."
    end
end
