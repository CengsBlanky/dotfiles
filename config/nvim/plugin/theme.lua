vim.cmd("colorscheme kanagawa")
local opt = vim.opt
opt.termguicolors = true
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.winblend = 0
opt.background = 'dark'

function LspStatusLine()
  local count = {}
  local levels = {
    errors = vim.diagnostic.severity.ERROR,
    warnings = vim.diagnostic.severity.WARN,
    info = vim.diagnostic.severity.INFO,
    hints = vim.diagnostic.severity.HINT,
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#DiagnosticError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#DiagnosticWarn# " .. count["warnings"]
  end
  if count["info"] ~= 0 then
    info = " %#DiagnosticInfo# " .. count["info"]
  end
  if count["hints"] ~= 0 then
    hints = " %#DiagnosticHint#󰌶 " .. count["hints"]
  end

  return errors .. warnings .. hints .. info .. "%0*"
end

-- statusline
vim.opt.statusline = '%r %f%m%{%v:lua.LspStatusLine()%}%=%18(%l,%v/%L%)%24(%{&fileformat}%Y%)%9( %{&fileencoding}%) '
