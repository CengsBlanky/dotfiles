function fish_prompt
    set -l pwd_color '868e96'
    set -l err_color 'c92a2a'
    set -l gray_color '868e96'
    set -l dir_background '000'
    set -l love_color 'bf616a'
    set -l duck_color 'ffd43b'
    set -l taiji_color 'fff'

    set -l last_status $status
    set_color -o $pwd_color
    set_color -b $dir_background

    set_color -o $taiji_color
    echo -n 'ﭾ '
    set_color -o $pwd_color

    echo -n (prompt_pwd)
    
    if not test $last_status -eq 0
        set_color -o $err_color
        printf ' %s' $last_status
    end

    set_color -b normal
    set_color $dir_background
    echo -n ' '
    set_color normal
end
