---@diagnostic disable: undefined-global
local init_file = "~/.config/nvim/init.lua"
vim.api.nvim_create_user_command('Reloadrc', 'source ' .. init_file, {})
-- copy current filename to clipboard
vim.api.nvim_create_user_command('Pname',
  function()
    vim.fn.setreg('+', vim.fn.expand('%'))
  end, {})

vim.api.nvim_create_user_command('Fname',
  function()
    vim.fn.setreg('+', vim.fn.expand('%:t'))
  end, {})
