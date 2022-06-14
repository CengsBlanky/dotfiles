function vim
    if command -q nvim
        nvim $argv
    else if command -q vim
        vim $argv
    else
        vi $argv
    end
end
