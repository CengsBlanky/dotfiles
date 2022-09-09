function cat
    if command -q bat
        bat -pp --theme="gruvbox-dark" $argv
    else
        cat $argv
    end
end
