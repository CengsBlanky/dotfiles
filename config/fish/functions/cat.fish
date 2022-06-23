function cat
    if command -q bat
        bat -pp --theme="Nord" $argv
    else if command -q batcat
        batcat -pp --theme="base16" $argv
    else
        /usr/bin/cat $argv
    end
end
