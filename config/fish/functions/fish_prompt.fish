function fish_prompt
    set -l last_status $status
    set -l pwd_color 'ffd8a8'
    set -l prompt_color 'ffb90f'
    set -l err_color 'c92a2a'
    set_color $pwd_color

    echo -n (basename (prompt_pwd))

    if not test $last_status -eq 0
        set_color -o $err_color
        printf ' %s' $last_status
    end

    set_color $prompt_color
    echo -n "  "
    set_color normal
end
