function transmission
    set -l SERVICE_NAME "transmission-daemon.service"
    if [ (count $argv) -ge 1 ]
        if systemctl is-active --quiet $SERVICE_NAME
            sudo systemctl stop $SERVICE_NAME
            echo "$SERVICE_NAME stopped."
        else
            echo "$SERVICE_NAME is inactive."
        end
    else
        echo "start $SERVICE_NAME..."
        if not systemctl is-active --quiet $SERVICE_NAME
            sudo systemctl start $SERVICE_NAME
            sleep 0.5s
        end
        echo "tranmission web interface start in browser..."
        open "http://localhost:9091"
    end
end
