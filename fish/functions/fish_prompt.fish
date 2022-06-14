function fish_prompt
    set -l pwd_color '8fbcbb'
    set -l err_color 'c92a2a'
    set -l gray_color '868e96'
    set -l dir_background '434c5e'
    set -l cherry_color 'fa5252'
    set -l banana_color 'ffd43b'
    set -l square_color '74c0fc'

    set -l last_status $status
    set_color -o $pwd_color
    set_color -b $dir_background

    set_color -o $square_color
    echo -n 'ﯟ '
    set_color -o $pwd_color

    echo -n (prompt_pwd)
    
    if not test $last_status -eq 0
        set_color -o $err_color
        printf ' %s' $last_status
    end

    set_color -b normal
    set_color $dir_background
    echo -n ''
    set_color normal
end
