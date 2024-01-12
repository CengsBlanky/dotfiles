function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold blue
            echo " "
        case insert
            set_color --bold green
            echo " "
        case visual
            set_color --bold yellow
            echo " "
        case replace_one
            set_color --bold brmagenta
            echo " "
        case '*'
            set_color --bold red
            printf "󰊠 "
    end
    set_color normal
end
