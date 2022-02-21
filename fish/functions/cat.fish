function cat
    if command -q bat
        bat -pp --theme="Nord" $argv
    else
        cat $argv
    end
end
