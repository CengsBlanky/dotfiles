function fish_mode_prompt
    set -l bg_color 2f2f38
    set -l last_status $status
    set -l pwd_color_bare 88c0d0
    set -l err_color c92a2a
    set -l prompt_icon_color a3be8c

    set -l insert_color 66c0d0
    if test -n "$HTTPS_PROXY"
        set insert_color 8686bf
    end

    set_color -o $pwd_color_bare
    set_color -b $bg_color
    echo -n (basename (prompt_pwd))
    if not test $last_status -eq 0
        set_color -o $err_color
        printf ' %s' $last_status
    end
    switch $fish_bind_mode
        case insert
            # set_color --bold "a3be8c"
            set_color --bold $insert_color
            echo -n "  "
        case default
            set_color --bold 5e81ac
            echo -n "  "
        case visual
            set_color --bold ebcb8b
            echo -n "  "
        case replace_one
            set_color --bold brmagenta
            echo -n '  '
        case '*'
            set_color --bold red
            echo -n '  '
    end
    set_color -b normal
    set_color $bg_color
    echo -n ''
    set_color normal
end
