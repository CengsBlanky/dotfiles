function fish_prompt
    set -l last_status $status
    set -l pwd_color_bare '88c0d0'
    set -l err_color 'c92a2a'
    set -l prompt_icon_color 'a3be8c'

    set_color -o $pwd_color_bare
    echo -n (basename (prompt_pwd))
    if not test $last_status -eq 0
        set_color -o $err_color
        printf ' %s' $last_status
    end
    set_color -o $prompt_icon_color
    echo -n "  "
    # 󰁕          󰵵 󰑆 󰒖   󰣥󰥭 󰁕
    set_color normal
end
