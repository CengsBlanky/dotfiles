function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    printf '%s[%s%s%s@%s%s%s]%s ' \
        (set_color 868e96) \
        (set_color $user_name_color) (whoami) \
        (set_color 868e96) \
        (set_color $user_host_color) (hostname | cut -d . -f 1) \
        (set_color 868e96) \

    # PWD
    set_color $user_cwd_color
    echo -n (prompt_pwd)

    if not test $last_status -eq 0
        set_color $fish_color_error
        printf ' [%s]' $last_status
    end

    set_color normal

    __terlar_git_prompt
    fish_hg_prompt
    printf '\n'

    set_color $user_prompt_symbol_color

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '➤ '
    set_color normal
end
