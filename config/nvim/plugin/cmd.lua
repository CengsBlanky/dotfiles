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
    local fmt = ':%!fmt'
    if opts.args and opts.args ~= "" then
      local width = opts.args + 1
      fmt = ':%!fmt --width=' .. width .. ' --goal=' .. width
      vim.wo.colorcolumn = tostring(width)
    else
      vim.wo.colorcolumn = ""
    end
    vim.cmd(fmt)
  end,
  { nargs = '?', desc = "format text width to specific length or default to fmt" }
)

command('Quit',
  function()
    local count = vim.api.nvim_get_current_buf()
    if count == 1 then
      vim.cmd('q')
    else
      vim.cmd('bd')
    end
  end,
  { desc = "close buffer or quit when only one buffer exists" }
)
