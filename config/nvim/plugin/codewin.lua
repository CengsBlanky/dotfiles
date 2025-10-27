---@diagnostic disable: undefined-global
-- for project or single file
local direct_run = function (command, filename)
  return command .. ' ' .. filename
end
local ft_cmd = {
  py = function (tmpname)
    return direct_run("python3", tmpname)
  end,
  java = function (tmpname)
    return direct_run("java", tmpname)
  end,
  js = function (tmpname)
    return direct_run("node", tmpname)
  end,
  ts = function (tmpname)
    return direct_run("bun", tmpname)
  end,
  lua = function (tmpname)
    return direct_run("lua", tmpname)
  end,
  go = function (tmpname)
    return direct_run("go run", tmpname)
  end,
  sh = function (tmpname)
    return direct_run("bash", tmpname)
  end,
  kt = function (tmpname)
    local no_ext_name = vim.fn.expand("%:p:r")
    return string.format("kotlinc %s -include-runtime -d %s.jar 2>&1 && java -jar %s.jar", tmpname, no_ext_name, no_ext_name)
  end,
  c = function (tmpname)
    return string.format("gcc -Wall %s -o a.out 2>&1 && ./a.out", tmpname)
  end,
}

local function codewin(opts)
  opts = opts or {}
  -- Get the current buffer content
  -- Create a scratch buffer for the output
  local buf = opts.buf or -1
  local title = opts.title
  local title_pos = "center"
  if not vim.api.nvim_buf_is_valid(buf) then
    local filename = vim.fn.expand('%:t')
    local ext = vim.fn.expand('%:e')
    local filetype = vim.bo.filetype
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local cmd = ft_cmd[ext]
    if cmd == nil then
      vim.notify("Unsupported filetype: " .. filetype, vim.log.levels.WARN)
      return
    end
    title = title or filetype .. " " .. filename
    -- TODO add execution time
    title_pos = "left"
    -- Create a temporary file with a proper extension
    local tempfile = os.tmpname() .. '.' .. ext
    local f = io.open(tempfile, 'w')
    if f == nil then
      vim.notify("can not create tmpfile for run")
      return
    end
    f:write(table.concat(lines, '\n'))
    f:close()

    -- Execute command and capture output
    local tmpf = vim.fn.shellescape(tempfile)
    local handle = io.popen(cmd(tmpf) .. ' 2>&1')
    if handle == nil then
      vim.notify("execution failed")
      return
    end
    local result = handle:read('*a')
    handle:close()
    os.remove(tempfile)

    buf = vim.api.nvim_create_buf(false, true)
    -- Split result into lines and put in buffer
    local output_lines = vim.split(result:gsub('\r', ''), '\n')
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output_lines)
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
    title = title,
    title_pos = title_pos,
  }
  local win = vim.api.nvim_open_win(buf, true, win_opts)

  -- Set buffer and window options
  vim.api.nvim_buf_set_option(buf, 'filetype', 'output')
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'hide')
  vim.api.nvim_win_set_option(win, 'number', true)
  vim.api.nvim_win_set_option(win, 'relativenumber', true)
  vim.api.nvim_win_set_option(win, 'wrap', true)

  -- Add keymaps to close window
  local hide_win = function() vim.api.nvim_win_hide(win) end
  vim.keymap.set('n', 'q', hide_win, { buffer = buf })
  vim.keymap.set('n', '<Esc>', hide_win, { buffer = buf })
  return { buf = buf, win = win, title = title }
end

local state = {
  floating = {
    buf = -1,
    win = -1,
    title = "",
  }
}

vim.api.nvim_create_user_command("ToggleWin", function ()
  if vim.api.nvim_win_is_valid(state.floating.win) then
    vim.api.nvim_win_hide(state.floating.win)
  else
    state.floating = codewin{ buf = state.floating.buf, win = state.floating.win, title = state.floating.title }
  end
end, {})
vim.api.nvim_create_user_command("CodeWin", function ()
  state.floating = codewin()
end, {})

vim.api.nvim_set_keymap('n', '<M-r>', '<cmd>CodeWin<CR>', { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap('n', '<M-t>', '<cmd>ToggleWin<CR>', { noremap = true, silent = true, nowait = true })
