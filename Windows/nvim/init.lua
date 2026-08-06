---@diagnostic disable: undefined-global
local opt = vim.opt
local g = vim.g
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5
opt.title = true
opt.wildmenu = true
opt.showmatch = true
opt.hlsearch = true
opt.backup = false
opt.swapfile = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 3
opt.showmode = false
opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true
opt.expandtab = true
opt.shiftround = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.mousehide = true
opt.mouse = ''
opt.signcolumn = 'yes'
opt.cursorline = true
opt.cursorlineopt="number"
opt.linebreak = true
opt.splitright = true
opt.splitbelow = true
opt.smoothscroll = true
opt.shortmess:append('W')
opt.clipboard:append("unnamedplus")
opt.list = true
opt.listchars = {
  tab = "  \\u00B7",
  trail = "\\u00B7",
}
-- autocmd
local autocmd = vim.api.nvim_create_autocmd
local setnmap = function (action, cmd)
  vim.keymap.set('n', action, cmd, { nowait = true, silent = true, buffer = true })
end

autocmd({"FileType"}, { callback = function()
  vim.opt.formatoptions:remove({'o'})
  vim.opt.formatoptions:append({'M'})
  vim.opt.textwidth = 0
  -- set readonly map
  if not vim.bo.modifiable or vim.bo.readonly then
    setnmap('q', '<Cmd>bd<CR>')
    setnmap('<Space>', '<C-f>')
    setnmap('u', '<C-b>')
  end
end})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    -- Return to last edit position when opening files
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd({"FileType"}, {
    pattern = {"markdown", "text", "log", "http", "rest"},
    callback = function()
      setnmap('j', 'gj')
      setnmap('k', 'gk')
      setnmap('0', 'g0')
      setnmap('$', 'g$')
    end
})
-- for markdown readibility
autocmd({"FileType"}, {
    pattern = { "markdown" },
    callback = function()
      vim.opt_local.formatoptions:remove({'l'})
      vim.opt_local.formatoptions:append({']'})
    end
})

autocmd({"FileType"}, {
    pattern = { "nerdtree" },
    callback = function()
      vim.opt_local.cursorline = true
      vim.opt_local.cursorlineopt="number,line"
      vim.opt_local.wrap = true
      setnmap('<C-j>', '<C-f>')
      setnmap('<C-k>', '<C-b>')
    end
})

autocmd({"BufEnter"}, {
  pattern = {"*.log"},
  callback = function ()
    vim.bo.filetype = "log"
    vim.opt_local.wrap = true
  end
})

autocmd({"BufRead"}, {
    pattern = {"*.hex", "*.xxd"},
    callback = function()
      vim.opt_local.filetype = "xxd"
    end
})

autocmd({"FileType"}, {
    pattern = { "html", "xhtml", "htmldjango", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "yaml", "sql", "json", "vim", "lua", "dart", "svelte", "http", "xml", "go" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

autocmd({"FileType"}, {
    pattern = {"go", "gomod"},
    callback = function()
      -- golang use tab instead of spaces
      vim.opt_local.expandtab = false
      vim.opt_local.listchars = {
        tab = "  ",
      }
    end
})

autocmd({"BufReadPost"}, {
    pattern = {"quickfix"},
    callback = function()
      setnmap('<Enter>', '<Enter>')
    end
})
-- keymap
---@diagnostic disable: undefined-global
local setmap = function (mode, key, action)
  local opts = { silent = true, nowait = true }
  vim.keymap.set(mode, key, action, opts)
end

vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

setmap("v", "<", "<gv")
setmap("v", ">", ">gv")
setmap('i', 'jk', '<Esc>')
setmap('n', '<Enter>', '<Cmd>w<CR>')
setmap('n', '<leader>q', '<Cmd>xa<CR>')
setmap('n', '<M-w>', '<Cmd>close<CR>')
setmap('n', '<M-o>', '<C-w>o')
setmap('n', '<leader>-', '<Cmd>split<CR>')
setmap('n', '<leader>/', '<Cmd>vsplit<CR>')
setmap('n', 'gy', '<Cmd>%y<CR>')
setmap('n', 'gl', '^yg_')
setmap({ 'n', 'v' }, '<C-j>', '<C-f>')
setmap({ 'n', 'v' }, '<C-k>', '<C-b>')
setmap('n', '<leader>`', 'g~iw')
setmap('n', '<C-p>', '<Cmd>b#<CR>')
setmap('n', '<Space>b', '<Cmd>bd<CR>')
setmap('n', '<C-n>', '<Cmd>bn<CR>')
setmap('v', '<leader>`', 'g~')
-- trim lines both end
setmap('n', '<leader>t', '<cmd>%s/^\\s\\+\\|\\s\\+$//ge<CR>')
setmap('v', '<leader>t', ":s/^\\s\\+\\|\\s\\+$//ge<CR>")
-- trim and delete empty lines
setmap('n', '<leader>e', '<cmd>%s/^\\s\\+\\|\\s\\+$//ge|:silent! %g/^\\s*$/d<CR>')
setmap('v', '<leader>e', ":s/^\\s\\+\\|\\s\\+$//ge|:silent! '<,'>g/^\\s*$/d<CR>")
-- trim delete and sort
setmap('n', '<leader>u', '<cmd>%s/^\\s\\+\\|\\s\\+$//ge|%sort u|:silent! %g/^\\s*$/d<CR>')
setmap('v', '<leader>u', ":s/^\\s\\+\\|\\s\\+$//ge|'<,'>sort u|:silent! '<,'>g/^\\s*$/d<CR>")
-- command
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
-- codewin
local ft_cmd = {
  python = "python3",
  java = "java",
  javascript = "node",
  typescript = "bun",
  lua = "lua",
  go = "go run",
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
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local filetype = vim.bo.filetype
    local cmd = ft_cmd[filetype]
    if not cmd then
      vim.notify("Unsupported filetype: " .. filetype, vim.log.levels.WARN)
      return
    end
    -- TODO add execution time
    title = " " .. cmd .. " " .. filename .. " "
    title_pos = "left"
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
      vim.notify("can not execute tmpfile")
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
  local height = math.floor(vim.o.lines * 0.6)
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
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "StatusLine", { fg = "" })
vim.api.nvim_set_hl(0, "Normal", { bg = "" })
vim.opt.statusline = '%r %f%m%=%18(%l,%v/%L%)%24(%{&fileformat}%Y%)%9( %{&fileencoding}%)'

-- batch diable built-in plugins
local disabled_plugins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "tohtml",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "tutor",
}

for _, plugin in ipairs(disabled_plugins) do
    g["loaded_" .. plugin] = 1
end

-- manage plugins
require("plugins")
