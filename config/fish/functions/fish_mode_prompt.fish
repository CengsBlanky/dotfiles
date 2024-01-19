function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold "81a1c1"
        case insert
            set_color --bold "a3be8c"
        case visual
            set_color --bold yellow
        case replace_one
            set_color --bold brmagenta
        case '*'
            set_color --bold red
    end
    # set_color --bold "81a1c1"
    echo "$USER"
    set_color --bold "d08770"
    echo "@"
    set_color normal
end
