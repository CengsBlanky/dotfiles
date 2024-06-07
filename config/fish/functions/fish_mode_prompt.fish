function fish_mode_prompt
    set -l bg_color '3a3a3a'
    set -l last_status $status
    set -l pwd_color_bare '88c0d0'
    set -l err_color 'c92a2a'
    set -l prompt_icon_color 'a3be8c'

    set_color -b $bg_color
    set_color -o $pwd_color_bare
    echo -n (basename (prompt_pwd))
    if not test $last_status -eq 0
        set_color -o $err_color
        printf ' %s' $last_status
    end
    switch $fish_bind_mode
        case insert
            set_color --bold "a3c18c"
            echo -n " "
        case default
            set_color --bold "81a1c6"
            echo -n " 󰅶"
        case visual
            set_color --bold yellow
            echo -n " 󰦪"
        case replace_one
            set_color --bold brmagenta
            echo -n ' '
        case '*'
            set_color --bold red
            echo -n ' '
    end
    set_color -b normal
    set_color --bold $bg_color
    echo -n ' '
    set_color normal
end
