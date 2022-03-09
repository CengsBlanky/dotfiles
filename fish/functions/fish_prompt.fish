function fish_prompt --description 'Write out the prompt'
    set -l user_name_color '009acd'
    set -l user_host_color '5e81ac'
    set -l user_cwd_color '8fbcbb'
    set -l user_prompt_symbol_color '2b8a3e'
    set -l red_color 'ff2b2b'
    set -l gray_color '868e96'

    set -l last_status $status

    printf '%s[%s%s%s@%s%s%s]%s ' \
        (set_color $gray_color) \
        (set_color $user_name_color) $USER \
        (set_color $gray_color) \
        (set_color $user_host_color) (prompt_hostname) \
        (set_color $gray_color)
    # PWD
    set_color $user_cwd_color
    echo -n (prompt_pwd)

    if not test $last_status -eq 0
        set_color $red_color
        printf ' [%s]' $last_status
    end

    set_color normal

    __terlar_git_prompt
    fish_hg_prompt

    echo;

    set_color $user_prompt_symbol_color

    if not test $last_status -eq 0
        set_color $red_color
    end

    # echo -n '➤ '
    echo -n '$ '
    set_color normal
end
