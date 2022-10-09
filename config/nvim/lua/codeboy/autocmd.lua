local fileTypeOptionGroup = vim.api.nvim_create_augroup("FileTypeOption", {})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = fileTypeOptionGroup,
    pattern = {"vim"},
    callback = function() vim.opt_local.foldmethod = "marker" end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = fileTypeOptionGroup,
    pattern = { "html", "css", "javascript", "typescript", "vue", "yaml", "sql", "json", "vim", "lua" },
    callback = function() 
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = fileTypeOptionGroup,
    pattern = {"json"},
    callback = function() vim.keymap.set('n', '<Space>f', ':%!jq<CR>', { silent = true }) end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = fileTypeOptionGroup,
    pattern = {"*"},
    callback = function() 
        vim.opt.formatoptions:remove({'o'})
    end
})
