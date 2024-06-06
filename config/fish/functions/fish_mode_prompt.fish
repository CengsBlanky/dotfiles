function fish_mode_prompt
    set -l bg_color '4a4a4a'
    set_color -b $bg_color
    switch $fish_bind_mode
        case default
            set_color --bold "81a1c6"
            echo -n "󰅶 "
        case insert
            set_color --bold "a3c18c"
            echo -n " "
        case visual
            set_color --bold yellow
            echo -n "󰦪 "
        case replace_one
            set_color --bold brmagenta
            echo -n ' '
        case '*'
            set_color --bold red
    end
end
