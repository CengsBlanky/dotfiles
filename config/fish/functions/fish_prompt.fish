function fish_prompt
    set -l last_status $status
    set -l pwd_color '5e81ac'
    set -l prompt_color '2b8a3e'
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
