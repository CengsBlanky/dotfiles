function onproxy
    set -l proxy_addr (grep -m 1 -e "^http" $HOME/.local/share/proxy.info | tr -d "\n")
    set -l socks_addr (grep -m 1 -e "^socks" $HOME/.local/share/proxy.info | tr -d "\n")
    set -gx HTTPS_PROXY $proxy_addr
    set -gx HTTP_PROXY $proxy_addr
    set -gx https_proxy $proxy_addr
    set -gx http_proxy $proxy_addr
    set -gx all_proxy $socks_addr
    set -gx ALL_PROXY $socks_addr
end
