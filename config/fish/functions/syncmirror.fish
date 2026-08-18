function syncmirror
    sudo reflector --verbose --country China --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
    cat /etc/pacman.d/mirrorlist
end
