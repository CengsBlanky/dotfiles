function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    printf '%s[%s%s%s@%s%s%s]%s ' \
        (set_color 868e96) \
        (set_color $user_name_color) (whoami) \
        (set_color 868e96) \
        (set_color $user_host_color) (hostname | cut -d . -f 1) \
        (set_color 868e96) \
        (set_color normal)

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
    echo

    set_color $user_prompt_symbol_color

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    switch $fish_bind_mode
    case default
        set -l prompt_color 5e81ac
    case insert
        set -l prompt_color a3be8c
    case replace_one
        set -l prompt_color fdb924
    case visual
        set -l prompt_color a5d8ff
    case '*'
        set -l prompt_color red
    end
    set_color -b $prompt_color
    echo -n '➤ '
    set_color normal
end
