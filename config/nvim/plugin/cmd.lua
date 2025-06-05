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
local function trim_all(opts)
  local start_line = opts.line1
  local end_line = opts.line2
  if opts.range == 0 then
    start_line = 1
    end_line = vim.fn.line('$')
  end
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, start_line - 1, end_line, false)
  local new_lines = {}
  for i, line in ipairs(lines) do
    new_lines[i] = line:gsub("^%s+", ""):gsub("%s+$", "")
  end
  vim.api.nvim_buf_set_lines(buf, start_line - 1, end_line, false, new_lines)
end
command('Trim', trim_all, {
  nargs = '?',
  range = '%',
  addr = 'lines',
  desc = "trim lines",
})
vim.keymap.set({ 'n', 'v' }, '<leader>t', '<cmd>Trim<CR>', { silent = true, nowait = true })
-- TODO use diagon as ascii translator in visual mode
