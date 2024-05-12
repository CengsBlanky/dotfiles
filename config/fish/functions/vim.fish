function vim
    set -l nvim_bin /usr/local/nvim/bin/nvim
    set -l vim_bin /usr/local/bin/vim
    if command -q $nvim_bin
        $nvim_bin $argv
    else if command -q $vim_bin
        $vim_bin $argv
    else
        vi $argv
    end
end
