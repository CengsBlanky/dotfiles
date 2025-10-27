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
command('LspOff',
  function() vim.cmd('LspStop!') end,
  { desc = "turn off lsp server once and for all" }
)
-- adjust file line width to specific width or 80
command('Format',
  function (opts)
    local width = opts.args ~= "" and opts.args or 80
    width = width + 1
    vim.cmd(':%!fmt --width=' .. width .. ' --goal=' .. width)
    vim.wo.colorcolumn = tostring(width)
  end,
  { nargs = '?', desc = "format text width to specific length or default to 80" }
)
