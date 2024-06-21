---@diagnostic disable: undefined-global
local init_file = "~/.config/nvim/init.lua"
vim.api.nvim_create_user_command('Reloadrc', 'source ' .. init_file, {})
-- copy current filename to clipboard
vim.api.nvim_create_user_command('Pname',
  function(opts)
    vim.fn.setreg('+', vim.fn.expand('%:p'))
  end, {})

vim.api.nvim_create_user_command('Fname',
  function(opts)
    vim.fn.setreg('+', vim.fn.expand('%:t'))
  end, {})
