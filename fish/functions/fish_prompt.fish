function fish_prompt
    set -l prompt_color '66a80f'
    set -l pwd_color '5e81ac'
    
    set_color $pwd_color
    echo -n (basename (prompt_pwd))
    set_color $prompt_color
    echo -n '  '
    set_color normal
end
