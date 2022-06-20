function fish_prompt
    set -l prompt_color '66a80f'
    echo -n (basename (prompt_pwd))
    set_color $prompt_color
    echo -n '  '
    set_color normal
end
