function proxy_up
    set -l proxy_addr http://localhost:7897
    set -gx HTTPS_PROXY $proxy_addr
    set -gx HTTP_PROXY $proxy_addr
end
