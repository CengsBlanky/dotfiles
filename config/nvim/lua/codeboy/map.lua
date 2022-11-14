local keymap = vim.keymap

keymap.set('i', 'jk', '<Esc>')
keymap.set('n', '<Enter>', ':w<CR>', { silent = true })
keymap.set('n', '<C-s>', ':wa<CR>', { silent = true })
keymap.set('n', '<leader>q', ':xa<CR>', { nowait = true })
keymap.set('n', 'gy', ':%y<CR>')
keymap.set('n', 'gl', '^yg_')
keymap.set('n', '<M-w>', ':close<CR>', { silent = true })
keymap.set('n', '<M-o>', '<C-w>o', { silent = true })
keymap.set('n', '<Space>b', ':bd<CR>', { silent = true, nowait = true })
keymap.set('n', '<C-n>', ':bn<CR>', { silent = true, nowait = true })
keymap.set('n', '<M-]>', ':bn<CR>', { silent = true })
keymap.set('n', '<M-[>', ':bp<CR>', { silent = true })
keymap.set('n', '<C-p>', ':b#<CR>', { silent = true })
keymap.set('n', '<leader>-', ':split<CR>', { silent = true })
keymap.set('n', '<leader>/', ':vsplit<CR>', { silent = true })
keymap.set('n', '<M-h>', '<C-w>h', { silent = true })
keymap.set('n', '<M-j>', '<C-w>j', { silent = true })
keymap.set('n', '<M-k>', '<C-w>k', { silent = true })
keymap.set('n', '<M-l>', '<C-w>l', { silent = true })

keymap.set('v', '<Space>f', ':\'<,\'>%!jq<CR>', { silent = true })
