local myGroup = vim.api.nvim_create_augroup("MyGroup", {})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"vim"},
    callback = function() vim.opt_local.foldmethod = "marker" end
})

vim.api.nvim_create_autocmd({"BufRead"}, {
  group = myGroup,
  pattern = {"*.log"},
  callback = function ()
    vim.bo.filetype = "log"
    vim.opt_local.wrap = true
  end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = { "html", "xhtml", "css", "scss", "javascript", "typescript", "vue", "yaml", "sql", "json", "vim", "lua", "dart", "svelte"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
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
