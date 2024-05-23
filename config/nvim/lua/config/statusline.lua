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
    errors = " %#LspError#󰅙 " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspWarn# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspHint#󰌵 " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspInfo#󰋼 " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%0*"
end

-- statusline
vim.opt.statusline = '%-5r%f%m%{%v:lua.lspStatusline()%}%=%-(%{&fileformat}%Y%)%12P%16(%l,%c/%L%)'
