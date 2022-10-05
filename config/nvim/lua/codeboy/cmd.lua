local init_file = "~/.config/nvim/init.lua"
vim.api.nvim_create_user_command('Editrc', 'edit ' .. init_file, {})
vim.api.nvim_create_user_command('Reloadrc', 'source ' .. init_file, {})
vim.api.nvim_create_user_command('Curdate', function() vim.api.nvim_set_current_line(os.date("%Y-%m-%d")) end, {})
vim.api.nvim_create_user_command('Curtime', function() vim.api.nvim_set_current_line(os.date("%Y-%m-%d %X")) end, {})
