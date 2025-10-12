---@diagnostic disable: undefined-global
local autocmd = vim.api.nvim_create_autocmd
local setnmap = function (action, cmd)
  vim.keymap.set('n', action, cmd, { nowait = true, silent = true, buffer = true })
end

autocmd({"FileType"}, { callback = function()
  vim.opt.formatoptions:remove({'o'})
  vim.opt.formatoptions:append({'M'})
  -- set readonly map
  if not vim.bo.modifiable or vim.bo.readonly then
    setnmap('q', '<Cmd>bd<CR>')
    setnmap('u', '<C-b>')
    setnmap('<space>', '<C-f>')
  end
end})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    -- Return to last edit position when opening files
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd({"FileType"}, {
    pattern = {"markdown", "text", "log", "http", "rest"},
    callback = function()
      setnmap('j', 'gj')
      setnmap('k', 'gk')
      setnmap('0', 'g0')
      setnmap('$', 'g$')
    end
})
-- for markdown readibility
autocmd({"FileType"}, {
    pattern = { "markdown" },
    callback = function()
      vim.opt_local.formatoptions:remove({'l'})
      vim.opt_local.formatoptions:append({']'})
    end
})

autocmd({"FileType"}, {
    pattern = { "nerdtree" },
    callback = function()
      vim.opt_local.cursorline = true
      vim.opt_local.cursorlineopt="number,line"
      vim.opt_local.wrap = true
      setnmap('<C-j>', '<C-f>')
      setnmap('<C-k>', '<C-b>')
    end
})

autocmd({"BufEnter"}, {
  pattern = {"*.log"},
  callback = function ()
    vim.opt_local.wrap = true
  end
})

autocmd({"BufRead"}, {
    pattern = {"*.hex", "*.xxd"},
    callback = function()
      vim.opt_local.filetype = "xxd"
    end
})

autocmd({"FileType"}, {
    pattern = { "html", "xhtml", "htmldjango", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "yaml", "sql", "json", "vim", "lua", "dart", "svelte", "http", "xml", "go" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

autocmd({"FileType"}, {
    pattern = {"go", "gomod"},
    callback = function()
      -- golang use tab instead of spaces
      vim.opt_local.expandtab = false
      vim.opt_local.listchars = {
        tab = "  ",
      }
    end
})

autocmd({"BufReadPost"}, {
    pattern = {"quickfix"},
    callback = function()
      setnmap('<Enter>', '<Enter>')
    end
})
