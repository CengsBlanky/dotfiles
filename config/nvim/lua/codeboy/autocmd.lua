local myGroup = vim.api.nvim_create_augroup("MyGroup", {})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"vim"},
    callback = function() vim.opt_local.foldmethod = "marker" end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = { "html", "css", "javascript", "typescript", "vue", "yaml", "sql", "json", "vim", "lua", "dart"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"json"},
    callback = function() vim.keymap.set('n', '<Space>f', ':%!jq<CR>', { silent = true }) end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"*"},
    callback = function()
        vim.opt.formatoptions:remove({'o'})
    end
})

vim.api.nvim_create_autocmd({"BufReadPost"}, {
    group = myGroup,
    pattern = {"quickfix"},
    callback = function()
      vim.keymap.set('n', '<Enter>', '<Enter>', { silent = true })
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"markdown"},
    callback = function()
        vim.opt.wrap = true
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"java" , "rust"},
    callback = function()
      vim.keymap.set('i', ';', '<Esc>A;', { silent = true })
    end
})
