function chnode
    set -l node $argv[1]
    set -l configfile /home/ubuntu/.config/clash/config.yaml
    set -l backupNodeDir '/home/ubuntu/.config/clash/config/config.yaml.'
    if test -z "$node"
        echo "Check status:"
    else
        ln -sf $backupNodeDir$node $configfile
        sudo systemctl restart clash
    end
    systemctl status clash
end
