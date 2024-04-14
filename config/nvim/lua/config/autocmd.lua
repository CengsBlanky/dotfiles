---@diagnostic disable: undefined-global
local myGroup = vim.api.nvim_create_augroup("ZengShuai", {})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"*"},
    callback = function()
        vim.opt.formatoptions:remove({'o'})
        vim.opt.listchars = {
          tab = "  ¦",
        }
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"vim"},
    callback = function() vim.opt_local.foldmethod = "marker" end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = {"gitcommit"},
    callback = function() vim.opt_local.textwidth = 0 end
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
    pattern = { "asm", "make", "go" },
    callback = function()
      vim.opt_local.listchars:append {
        lead = "·",
      }
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

vim.api.nvim_create_autocmd({"FileType"}, {
    group = myGroup,
    pattern = { "html", "xhtml", "css", "scss", "javascript", "typescript", "vue", "yaml", "sql", "json", "vim", "lua", "dart", "svelte"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
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
