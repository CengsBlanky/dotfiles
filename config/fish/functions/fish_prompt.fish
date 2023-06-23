function fish_prompt
    set -l last_status $status
    set -l icon_color '000000'
    set -l icon_bg_color '868e96'
    set -l pwd_color '2e3440'
    set -l pwd_bg_color 'adb5bd'
    set -l err_color 'c92a2a'
    set -l err_bg_color 'd8dee9'

    set_color $icon_color
    set_color -b $icon_bg_color
    echo -n " "
    set_color -b $pwd_bg_color
    set_color $icon_bg_color
    echo -n ""

    set_color $pwd_color
    echo -n (basename (prompt_pwd))
    set_color $pwd_bg_color
    set_color -ob $err_bg_color
    echo -n ""

    if not test $last_status -eq 0
        set_color -o $err_color
        printf '%s' $last_status
    end
    set_color -b normal
    set_color -o $err_bg_color
    echo -n ""
    set_color normal
end
