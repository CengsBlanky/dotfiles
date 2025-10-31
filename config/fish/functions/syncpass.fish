function syncpass
    rclone bisync $HOME/rclone/onedrive/keepass/ onedrive:keepass/ --progress
end
