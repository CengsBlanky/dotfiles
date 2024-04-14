---@diagnostic disable: undefined-global
local keymap = vim.keymap

local opts = { silent = true, nowait = true }

keymap.set('i', 'jk', '<Esc>', opts)
keymap.set('n', '<Enter>', ':w<CR>', opts)
keymap.set('n', '<C-s>', ':wa<CR>', opts)
keymap.set('n', '<leader>q', ':xa<CR>', opts)
keymap.set('n', '<M-w>', ':close<CR>', opts)
keymap.set('n', '<M-o>', '<C-w>o', opts)
keymap.set('n', '<leader>-', ':split<CR>', opts)
keymap.set('n', '<leader>/', ':vsplit<CR>', opts)
keymap.set('n', '<M-h>', '<C-w>h', opts)
keymap.set('n', '<M-j>', '<C-w>j', opts)
keymap.set('n', '<M-k>', '<C-w>k', opts)
keymap.set('n', '<M-l>', '<C-w>l', opts)
keymap.set('n', 'gy', ':%y<CR>', opts)
keymap.set('n', 'gl', '^yg_', opts)
keymap.set('n', '<C-j>', '<C-f>', opts)
keymap.set('n', '<C-k>', '<C-b>', opts)
keymap.set('n', '<leader>`', 'g~iw', opts)
keymap.set('v', '<leader>`', 'g~', opts)
keymap.set('v', '<C-j>', '<C-f>', opts)
keymap.set('v', '<C-k>', '<C-b>', opts)
