---@diagnostic disable: undefined-global
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.wildmenu = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.scrolloff = 10
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.mousehide = true
vim.opt.mouse = ''
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.cursorlineopt="number"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.list = true
vim.opt.listchars = {
  tab = "  ¦",
}

vim.g.python3_host_prog = '/usr/bin/python3'
