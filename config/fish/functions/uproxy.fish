function start_proxy
    set -l proxy_addr http://127.0.0.1:7890
    set -gx HTTPS_PROXY $proxy_addr
    set -gx HTTP_PROXY $proxy_addr
    set -gx https_proxy $proxy_addr
    set -gx http_proxy $proxy_addr
end
