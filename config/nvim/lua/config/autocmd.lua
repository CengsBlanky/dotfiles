---@diagnostic disable: undefined-global
vim.api.nvim_create_autocmd({"FileType"}, {
    callback = function()
        vim.opt.formatoptions:remove({'o'})
        vim.opt.formatoptions:append({'M'})
    end
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
    callback = function()
      if not vim.bo.modifiable then
        vim.keymap.set('n', 'u', '<C-b>', { buffer = true, silent = true, nowait = true })
        vim.keymap.set('n', '<Space>', '<C-f>', { buffer = true, silent = true, nowait = true })
        vim.keymap.set('n', 'q', '<C-w>c', { buffer = true, silent = true, nowait = true })
      end
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"markdown", "text", "log"},
    callback = function()
      vim.keymap.set('n', 'j', 'gj', { silent = true, nowait = true })
      vim.keymap.set('n', 'k', 'gk', { silent = true, nowait = true })
    end
})
-- for markdown readibility
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = { "markdown" },
    callback = function()
      vim.opt_local.textwidth = 120;
      vim.opt_local.formatoptions:remove({'l'})
      vim.opt_local.formatoptions:append({']'})
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = { "nerdtree" },
    callback = function()
      vim.opt_local.cursorline = true
      vim.opt_local.cursorlineopt="number,screenline"
    end
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {"*.log"},
  callback = function ()
    vim.bo.filetype = "log"
    vim.opt_local.wrap = true
  end
})

vim.api.nvim_create_autocmd({"BufRead"}, {
    pattern = {"*.hex", "*.xxd"},
    callback = function()
      vim.opt_local.filetype = "xxd"
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = { "html", "xhtml", "css", "scss", "javascript", "typescript", "vue", "yaml", "sql", "json", "vim", "lua", "dart", "svelte"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"go"},
    callback = function()
      -- golang use tab instead of spaces
      vim.opt_local.expandtab = false
    end
})

vim.api.nvim_create_autocmd({"BufReadPost"}, {
    pattern = {"quickfix"},
    callback = function()
      vim.keymap.set('n', '<Enter>', '<Enter>', { silent = true })
    end
})

-- restore last cursor position
vim.cmd[[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") && &filetype !~# 'commit' && index(['xxd', 'gitrebase'], &filetype) == -1 | exe "normal! g'\"" | endif
]]
