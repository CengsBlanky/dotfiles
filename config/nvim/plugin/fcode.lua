---@diagnostic disable: undefined-global
local function codewin(opts)
  -- Get the current buffer content
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand('%:t')
  local ft_cmd = {
    python = "python3",
    java = "java",
    javascript = "node",
    typescript = "bun",
    fish = "fish -c",
    lua = "lua",
    go = "go run",
  }
  local cmd = ft_cmd[filetype]
  if not cmd then
    vim.notify("Unsupported filetype: " .. filetype, vim.log.levels.WARN)
    return
  end
  -- Create a temporary file with a proper extension
  local tempfile = os.tmpname() .. '.' .. filetype
  local f = io.open(tempfile, 'w')
  if f == nil then
    vim.notify("can not create tmpfile")
    return
  end
  f:write(table.concat(lines, '\n'))
  f:close()

  -- Execute command and capture output
  local handle = io.popen(cmd .. ' ' .. vim.fn.shellescape(tempfile) .. ' 2>&1')
  if handle == nil then
    vim.notify("can not create tmpfile")
    return
  end
  local result = handle:read('*a')
  handle:close()
  os.remove(tempfile)

  -- Create a scratch buffer for the output
  local buf = nil
  if opts and vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Create a floating window
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local win_opts = {
    relative = 'editor',
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    style = 'minimal',
    border = 'rounded',
    title = " " .. cmd .. " " .. filename .. " ",
    title_pos = "center",
  }
  -- Split result into lines and put in buffer
  local output_lines = vim.split(result:gsub('\r', ''), '\n')
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output_lines)
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  -- Set buffer and window options
  vim.api.nvim_buf_set_option(buf, 'filetype', 'output')
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_win_set_option(win, 'number', true)
  vim.api.nvim_win_set_option(win, 'relativenumber', true)
  vim.api.nvim_win_set_option(win, 'wrap', true)

  -- Add keymaps to close window
  local close_win = function() vim.api.nvim_win_close(win, true) end
  vim.keymap.set('n', 'q', close_win, { buffer = buf })
  vim.keymap.set('n', '<Esc>', close_win, { buffer = buf })
  return { buf = buf, win = win }
end

local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

vim.api.nvim_create_user_command("ToggleShowResult", function ()
  if vim.api.nvim_win_is_valid(state.floating.win) then
    vim.api.nvim_win_hide(state.floating.win)
  else
    state.floating = codewin { buf = state.floating.buf }
  end
end, {})

vim.api.nvim_create_user_command("CodeWin", function ()
  if vim.api.nvim_win_is_valid(state.floating.win) then
    vim.api.nvim_win_hide(state.floating.win)
  else
    state.floating = codewin { buf = state.floating.buf }
  end
end, {})
vim.api.nvim_set_keymap('n', '<Space>r', '<cmd>CodeWin<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<Space>t', '<cmd>ToggleShowResult<CR>', { noremap = true, silent = true, nowait = true })
