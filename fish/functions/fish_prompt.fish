function fish_prompt --description '[user]@[host]: pwd [prompt_symbol]'
    set -l user_name_color '4c6a92'
    set -l user_host_color $user_name_color
    set -l pwd_color 'a3be8c'
    set -l user_prompt_symbol_color '2b8a3e'
    set -l red_color 'ff2b2b'
    set -l gray_color '868e96'

    set -l last_status $status
    # printf '%s%s%s@%s%s%s%s' \
    #     (set_color $user_name_color) $USER \
    #     (set_color $gray_color) \
    #     (set_color $user_host_color) (prompt_hostname) \
    #     (set_color $gray_color)
    # PWD
    set_color $pwd_color
    echo -n (prompt_pwd)

    if not test $last_status -eq 0
        set_color $red_color
        printf ' [%s]' $last_status
    end

    set_color $user_prompt_symbol_color

    echo -n '  '
    set_color normal
end
