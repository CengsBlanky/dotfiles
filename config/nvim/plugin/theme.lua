---@diagnostic disable: undefined-global
local opt = vim.opt
opt.termguicolors = true
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.winblend = 0
opt.background = 'dark'

local glob_hl = function (name, option)
  vim.api.nvim_set_hl(0, name, option)
end

glob_hl("Normal", { fg = "#ced4da" })
glob_hl("Todo", { fg = "#ebcb8b", italic = false, bold = true })
glob_hl("Visual", { bg = "#495057" })
glob_hl("Search", { bg = "#495057" })
glob_hl("Folded", { fg = "DarkGray" })
glob_hl("WinSeparator", { fg = "#88c0d0" })
glob_hl("StatusLine", { fg = "#587284", bold = true })
glob_hl("DiagnosticVirtualTextError", { fg = "#bf616a" })
glob_hl("DiagnosticVirtualTextWarn", { fg = "#e1bb80" })
glob_hl("DiagnosticVirtualTextInfo", { fg = "#88c0d0" })
glob_hl("DiagnosticVirtualTextHint", { fg = "#a3be8c" })
-- treesitter
glob_hl("@comment.note", { fg = "#a3be8c", bold = true, italic = true, underline = true })
glob_hl("@comment.todo", { fg = "#ebcb8b", bold = true, italic = true, underline = true })
glob_hl("@comment.warning", { fg = "#000000", bg = "#ffb300", bold = true, italic = true, underline = true })
glob_hl("@comment.error", { fg = "#cf616a", bold = true, italic = true, underline = true })
glob_hl("@markup.heading.1.markdown", { fg = "#ee99a0", bold = true, })
glob_hl("@markup.heading.2.markdown", { fg = "#f5a97f", bold = true, })
glob_hl("@markup.heading.3.markdown", { fg = "#eed49f", bold = true, })
glob_hl("@markup.heading.4.markdown", { fg = "#a6da95", bold = true, })
glob_hl("@markup.heading.5.markdown", { fg = "#7dc4e4", bold = true, })
glob_hl("@markup.heading.6.markdown", { fg = "#b7bdf8", bold = true, })
glob_hl("@markup.strong", { fg = "#ffffff", bold = true })
glob_hl("@markup.italic", { italic = true })
glob_hl("@markup.underline", { underline = true })
glob_hl("@markup.link", { fg = "#8fbebb" })
glob_hl("@markup.link.url", { fg = "#8fbcbb", italic = false, underline = true })
glob_hl("@markup.raw", { fg = "#81a1c1" })
glob_hl("@markup.raw.block", { fg = "#8fbcbb" })
glob_hl("@tag.delimiter", { fg = "#869c98" })
-- custome color
glob_hl("NerdtreeStatus", { fg = "#a3be8c", bold = true })

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
vim.opt.statusline = '%r %f%m%{%v:lua.lspStatusline()%}%=%18(%l/%L%)%18(%{&fileformat}%Y%)%9( %{&fileencoding}%)'

-- todo
-- show lsp progress
