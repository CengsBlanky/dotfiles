---@diagnostic disable: undefined-global
local command = vim.api.nvim_create_user_command
local to_sysreg = function (modifier)
  local filename = vim.fn.expand(modifier)
  vim.fn.setreg('+', filename)
  print(filename)
end
-- write filename to buffer
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
  { desc = "full path file name" }
)
-- trim lines of selected or entire buffer
local trim_all = function(opts)
  local range = opts.range
  -- visual selection
  if range == 2 then
    vim.cmd(string.format('%d,%ds/^\\s\\+\\|\\s\\+$//ge', opts.line1, opts.line2))
  else
    vim.cmd('%s/^\\s\\+\\|\\s\\+$//ge')
  end
end
command('Trim', trim_all, {
    range = true,
    desc = "trim lines",
  })

command('Tsort', function(opts)
  trim_all(opts)
  if opts.range == 2 then
    vim.cmd(string.format('%d,%dsort u', opts.line1, opts.line2))
  else
    vim.cmd('%sort u')
  end
end, {
    range = true,
    desc = "trim lines and sort unique",
  })

local setmap = function (mode, key, action)
  local opts = { silent = true, nowait = true }
  vim.keymap.set(mode, key, action, opts)
end
setmap('n', '<leader>t', '<cmd>Trim<CR>')
setmap('v', '<leader>t', '<cmd>Trim<CR>')
setmap('n', '<leader>u', '<cmd>Tsort<CR>')
setmap('v', '<leader>u', '<cmd>Tsort<CR>')
-- TODO use diagon as ascii translator in visual mode
