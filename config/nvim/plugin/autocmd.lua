---@diagnostic disable: undefined-global
local autocmd = vim.api.nvim_create_autocmd
local map_opts = { nowait = true, silent = true, buffer = true }

autocmd({"FileType"}, { callback = function()
  vim.opt.formatoptions:remove({'o'})
  vim.opt.formatoptions:append({'M'})
  -- set readonly map
  if not vim.bo.modifiable or vim.bo.readonly then
    vim.keymap.set('n', 'q', '<Cmd>bd<CR>', map_opts)
    vim.keymap.set('n', '<Space>', '<C-f>', map_opts)
    vim.keymap.set('n', 'u', '<C-b>', map_opts)
  end
  -- restore last postion
  local last_line = vim.fn.line("'\"")
  local filetype = vim.bo.filetype
  if last_line > 1 and last_line <= vim.fn.line("$") and
    filetype ~= "commit" and not vim.tbl_contains({"xxd", "gitrebase"}, filetype) then
    vim.cmd("normal! g'\"")
  end
  -- disbale syntax for large file
  local max_fsize = 1024 * 1024
  local max_lsize = 1000
  local top_lsize = #(vim.api.nvim_buf_get_lines(0, 0, 1, false)[1])
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
  vim.b.large_buf = false
  if ok and stats and (top_lsize > max_lsize or stats.size > max_fsize) then
    vim.cmd[[syntax off]]
    vim.opt_local.foldmethod = "manual"
    vim.opt_local.spell = false
    vim.b.large_buf = true
  end
end})

autocmd({"LspAttach"}, {
  callback = function ()
    if vim.b.large_buf then
      vim.lsp.stop_client(vim.lsp.get_clients())
    end
  end
})

autocmd({"FileType"}, {
    pattern = {"markdown", "text", "log"},
    callback = function()
      vim.keymap.set('n', 'j', 'gj', map_opts)
      vim.keymap.set('n', 'k', 'gk', map_opts)
    end
})
-- for markdown readibility
autocmd({"FileType"}, {
    pattern = { "markdown" },
    callback = function()
      vim.opt_local.textwidth = 120;
      vim.opt_local.formatoptions:remove({'l'})
      vim.opt_local.formatoptions:append({']'})
    end
})

autocmd({"FileType"}, {
    pattern = { "nerdtree" },
    callback = function()
      vim.opt_local.cursorline = true
      vim.opt_local.cursorlineopt="number,screenline"
    end
})

autocmd({"BufEnter"}, {
  pattern = {"*.log"},
  callback = function ()
    vim.bo.filetype = "log"
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
      vim.keymap.set('n', '<Enter>', '<Enter>', map_opts)
    end
})

