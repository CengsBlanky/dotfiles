---@diagnostic disable: undefined-global
vim.opt.termguicolors = true
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.winblend = 0
vim.opt.background = 'dark'

local set_hl = vim.api.nvim_set_hl

set_hl(0, "Normal", { fg = "#ced4da" })
set_hl(0, "Comment", { fg = "DarkGray", italic = false })
set_hl(0, "Todo", { fg = "#ebcb8b", italic = false, bold = true })
set_hl(0, "Visual", { bg = "#495057" })
set_hl(0, "Search", { bg = "#495057" })
set_hl(0, "Folded", { fg = "DarkGray" })
set_hl(0, "LineNr", { fg = "#868e96" })
set_hl(0, "CursorLineNr", { fg = "#ebcb8b" })
set_hl(0, "WinSeparator", { fg = "#88c0d0" })
set_hl(0, "StatusLine", { fg = "#587284", bold = true })
set_hl(0, "DiagnosticVirtualTextError", { fg = "#bf616a" })
set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#e1bb80" })
set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#88c0d0" })
set_hl(0, "DiagnosticVirtualTextHint", { fg = "#a3be8c" })
-- treesitter
set_hl(0, "@comment.note", { fg = "#a3be8c", bold = true, italic = true, underline = true })
set_hl(0, "@comment.todo", { fg = "#ebcb8b", bold = true, italic = true, underline = true })
set_hl(0, "@comment.warning", { fg = "#000000", bg = "#ffb300", bold = true, italic = true, underline = true })
set_hl(0, "@comment.error", { fg = "#cf616a", bold = true, italic = true, underline = true })
set_hl(0, "@markup.heading.1.markdown", { fg = "#ee99a0", bold = true })
set_hl(0, "@markup.heading.2.markdown", { fg = "#f5a97f", bold = true })
set_hl(0, "@markup.heading.3.markdown", { fg = "#eed49f", bold = true })
set_hl(0, "@markup.heading.4.markdown", { fg = "#a6da95", bold = true })
set_hl(0, "@markup.heading.5.markdown", { fg = "#7dc4e4", bold = true })
set_hl(0, "@markup.heading.6.markdown", { fg = "#b7bdf8", bold = true })
set_hl(0, "@markup.strong", { fg = "#ffffff", bold = true })
set_hl(0, "@markup.italic", { italic = true })
set_hl(0, "@markup.underline", { underline = true })
set_hl(0, "@markup.link", { fg = "#8fbebb" })
set_hl(0, "@markup.link.url", { fg = "#8fbcbb", italic = true, underline = true })
set_hl(0, "@markup.raw", { fg = "#81a1c1" })
set_hl(0, "@markup.raw.block", { fg = "#8fbcbb" })
set_hl(0, "@tag.delimiter", { fg = "#869c98" })
-- custome color
set_hl(0, "NerdtreeStatus", { fg = "#a3be8c", bold = true })

