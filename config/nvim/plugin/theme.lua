---@diagnostic disable: undefined-global
vim.cmd("colorscheme kanagawa")
local opt = vim.opt
opt.termguicolors = true
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.winblend = 0
opt.background = 'dark'

function _G.lspStatusline()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#DiagnosticVirtualTextError#󰅙 " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#DiagnosticVirtualTextWarn# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#DiagnosticVirtualTextHint#󰌵 " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#DiagnosticVirtualTextInfo#󰋼 " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%0*"
end

-- statusline
vim.opt.statusline = '%r %f%m%{%v:lua.lspStatusline()%}%=%18(%l/%L%)%24(%{&fileformat}%Y%)%9( %{&fileencoding}%)'
