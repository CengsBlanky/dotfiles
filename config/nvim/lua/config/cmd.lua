---@diagnostic disable: undefined-global
local init_file = "~/.config/nvim/init.lua"
vim.api.nvim_create_user_command('Reloadrc', 'source ' .. init_file, {})
