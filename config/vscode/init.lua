---@diagnostic disable: undefined-global
local opt = vim.opt
local g = vim.g

opt.number = true
opt.relativenumber = true
opt.scrolloff = 5
opt.title = true
opt.wildmenu = true
opt.showmatch = true
opt.hlsearch = true
opt.backup = false
opt.swapfile = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 3
opt.showmode = false
opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true
opt.expandtab = true
opt.shiftround = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.mousehide = true
opt.mouse = ''
opt.cursorline = true
opt.cursorlineopt="number"
opt.linebreak = true
opt.splitright = true
opt.splitbelow = true
opt.shortmess:append('W')
opt.clipboard:append("unnamedplus")
g.python3_host_prog = '/usr/bin/python3'

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
    setnmap('<Space>', '<C-f>')
    setnmap('u', '<C-b>')
  end
end})

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
      vim.opt_local.textwidth = 120;
      vim.opt_local.formatoptions:remove({'l'})
      vim.opt_local.formatoptions:append({']'})
    end
})

autocmd({"FileType"}, {
    pattern = { "html", "xhtml", "htmldjango", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "yaml", "sql", "json", "vim", "lua", "dart", "svelte", "http", "xml", "go" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

local command = vim.api.nvim_create_user_command
local to_sysreg = function (modifier)
  local filename = vim.fn.expand(modifier)
  vim.fn.setreg('+', filename)
  print(filename)
end
-- write filename to default register
command('Rname',
  function() to_sysreg('%') end,
  { desc = "relative file name", }
)
command('Tname',
  function() to_sysreg('%:t') end,
  { desc = "tail of the file name" }
)
command('Fname',
  function() to_sysreg('%:p') end,
  { desc = "full path of file name" }
)

local setmap = function (mode, key, action)
  local opts = { silent = true, nowait = true }
  vim.keymap.set(mode, key, action, opts)
end

setmap('i', 'jk', '<Esc>')
setmap('n', '<Enter>', '<Cmd>w<CR>')
setmap('n', '<leader>q', '<Cmd>xa<CR>')
setmap('n', '<M-w>', '<Cmd>close<CR>')
setmap('n', '<M-o>', '<C-w>o')
setmap('n', '<leader>-', '<Cmd>split<CR>')
setmap('n', '<leader>/', '<Cmd>vsplit<CR>')
setmap('n', 'gy', '<Cmd>%y<CR>')
setmap('n', 'gl', '^yg_')
setmap('n', '<C-j>', '<C-f>')
setmap('n', '<C-k>', '<C-b>')
setmap('n', '<leader>`', 'g~iw')
setmap('n', '<C-p>', '<Cmd>b#<CR>')
setmap('n', '<Space>b', '<Cmd>bd<CR>')
setmap('n', '<C-n>', '<Cmd>bn<CR>')
setmap('v', '<leader>`', 'g~')
setmap('v', '<C-j>', '<C-f>')
setmap('v', '<C-k>', '<C-b>')
