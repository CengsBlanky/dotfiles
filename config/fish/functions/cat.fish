function cat
    if test (count $argv) -eq 1; and string match "*.md" $argv[1]; and command -q glow
        glow $argv
    else if command -q bat
        bat -pp --theme="Nord" $argv
    else if command -q batcat
        batcat --style=plain --theme="base16" $argv
    else
        /usr/bin/cat $argv
    end
end
