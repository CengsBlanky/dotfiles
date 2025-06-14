function proxy_up
    set -l proxy_addr http://127.0.0.1:7897
    set -gx HTTPS_PROXY $proxy_addr
    set -gx HTTP_PROXY $proxy_addr
    # set -gx NO_PROXY "localhost,127.0.0.1,10.96.0.0/12,192.168.59.0/24,192.168.49.0/24,192.168.39.0/24"
end
