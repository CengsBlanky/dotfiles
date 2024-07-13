---@diagnostic disable: undefined-global
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
vim.opt.statusline = '%r %f%m%{%v:lua.lspStatusline()%}%=%(%{&fileformat}%Y%)%16(%l/%L%)'

-- todo
-- show lsp progress
