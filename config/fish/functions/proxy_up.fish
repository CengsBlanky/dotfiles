function proxy_up
    set -l proxy_addr http://127.0.0.1:7890
    set -gx HTTPS_PROXY $proxy_addr
    set -gx HTTP_PROXY $proxy_addr
end
