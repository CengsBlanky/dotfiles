---@diagnostic disable: undefined-global
local init_file = "~/.config/nvim/init.lua"
local command = vim.api.nvim_create_user_command
command('Reloadrc', 'source ' .. init_file, {})
-- copy current filename to clipboard
command('Pname',
  function()
    vim.fn.setreg('+', vim.fn.expand('%'))
  end, {})

command('Fname',
  function()
    vim.fn.setreg('+', vim.fn.expand('%:t'))
  end, {})
