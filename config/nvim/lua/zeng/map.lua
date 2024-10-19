---@diagnostic disable: undefined-global
local map = vim.keymap.set

local opts = { silent = true, nowait = true }

map('i', 'jk', '<Esc>', opts)
map('n', '<Enter>', '<Cmd>w<CR>', opts)
map('n', '<C-s>', '<Cmd>wa<CR>', opts)
map('n', '<leader>q', '<Cmd>xa<CR>', opts)
map('n', '<M-w>', '<Cmd>close<CR>', opts)
map('n', '<M-o>', '<C-w>o', opts)
map('n', '<leader>-', '<Cmd>split<CR>', opts)
map('n', '<leader>/', '<Cmd>vsplit<CR>', opts)
map('n', '<M-h>', '<C-w>h', opts)
map('n', '<M-j>', '<C-w>j', opts)
map('n', '<M-k>', '<C-w>k', opts)
map('n', '<M-l>', '<C-w>l', opts)
map('n', 'gy', '<Cmd>%y<CR>', opts)
map('n', 'gl', '^yg_', opts)
map('n', '<C-j>', '<C-f>', opts)
map('n', '<C-k>', '<C-b>', opts)
map('n', '<leader>`', 'g~iw', opts)
map('v', '<leader>`', 'g~', opts)
map('v', '<C-j>', '<C-f>', opts)
map('v', '<C-k>', '<C-b>', opts)
map('n', '<M-,>', '<C-w><', opts)
map('n', '<M-.>', '<C-w>>', opts)
map('n', '<M-t>', '<C-w>+', opts)
map('n', '<M-s>', '<C-w>-', opts)
-- buffer ops
map('n', '<C-p>', '<Cmd>b#<CR>', opts)
map('n', '<Space>b', '<Cmd>bd<CR>', opts)
map('n', '<C-n>', '<Cmd>bn<CR>', opts)
