function fish_prompt
    set -l last_status $status
    set -l pwd_color_bare '88c0d0'
    set -l err_color 'c92a2a'
    set -l prompt_icon_color 'a3be8c'
    set -l bg_color '4a4a4a'
    set_color -b $bg_color
    set_color -o $pwd_color_bare

    echo -n (basename (prompt_pwd))
    if not test $last_status -eq 0
        set_color -o $err_color
        printf ' %s' $last_status
    end
    set_color -b normal
    set_color $bg_color
    echo -n ' '
    set_color normal
end
