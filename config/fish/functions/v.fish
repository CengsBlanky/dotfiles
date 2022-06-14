function v
    if command -q /usr/local/bin/vim
        /usr/local/bin/vim -u ~/.vim/vanilla.vim $argv
    end
end
