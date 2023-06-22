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
    pattern = {"markdown", "text"},
    callback = function() 
      vim.opt.textwidth=128 
      vim.opt.wrap = true
      vim.opt.linebreak = true
      vim.keymap.set('n', 'j', 'gj', { silent = true })
      vim.keymap.set('n', 'k', 'gk', { silent = true })
    end
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
