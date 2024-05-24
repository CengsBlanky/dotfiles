---@diagnostic disable: undefined-global
local myGroup = vim.api.nvim_create_augroup("ZS", {})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"*"},
    callback = function()
        vim.opt.formatoptions:remove({'o'})
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"markdown", "text", "log"},
    callback = function()
      vim.keymap.set('n', 'j', 'gj', { silent = true, nowait = true })
      vim.keymap.set('n', 'k', 'gk', { silent = true, nowait = true })
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = { "nerdtree" },
    callback = function()
      vim.opt_local.cursorline = true
      vim.opt_local.cursorlineopt="number,screenline"
    end
})

vim.api.nvim_create_autocmd({"BufRead"}, {
  group = myGroup,
  pattern = {"*.log"},
  callback = function ()
    vim.bo.filetype = "log"
    vim.opt_local.wrap = true
  end
})

vim.api.nvim_create_autocmd({"BufRead"}, {
    group = myGroup,
    pattern = {"*.hex", "*.xxd"},
    callback = function()
      vim.opt_local.filetype = "xxd"
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
    pattern = {"go"},
    callback = function()
      -- golang use tab instead of spaces
      vim.opt_local.expandtab = false
    end
})

vim.api.nvim_create_autocmd({"BufReadPost"}, {
    group = myGroup,
    pattern = {"quickfix"},
    callback = function()
      vim.keymap.set('n', '<Enter>', '<Enter>', { silent = true })
    end
})

-- restore last cursor position
vim.cmd[[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype !~# 'commit' && index(['xxd', 'gitrebase'], &filetype) == -1 | exe "normal! g'\"" | endif
]]
