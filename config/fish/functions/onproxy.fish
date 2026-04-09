function onproxy
    read -l proxy_addr < $HOME/.local/share/proxy.info
    set -gx HTTPS_PROXY $proxy_addr
    set -gx HTTP_PROXY $proxy_addr
    set -gx https_proxy $proxy_addr
    set -gx http_proxy $proxy_addr
end
