---@diagnostic disable: undefined-global
vim.opt.termguicolors = true
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.winblend = 0
vim.opt.background = 'dark'

vim.api.nvim_set_hl(0, "Normal", { fg = "#ced4da" })
vim.api.nvim_set_hl(0, "Comment", { fg = "DarkGray", italic = false })
vim.api.nvim_set_hl(0, "Todo", { fg = "#ebcb8b", italic = false, bold = true })
vim.api.nvim_set_hl(0, "Visual", { bg = "#495057" })
vim.api.nvim_set_hl(0, "Search", { bg = "#495057" })
vim.api.nvim_set_hl(0, "Folded", { fg = "DarkGray" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#868e96" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ebcb8b" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#88c0d0" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#587284", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#bf616a" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#e1bb80" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#88c0d0" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#a3be8c" })
vim.api.nvim_set_hl(0, "@comment.note", { fg = "#a3be8c", bold = true, italic = true, underline = true })
vim.api.nvim_set_hl(0, "@comment.todo", { fg = "#ebcb8b", bold = true, italic = true, underline = true })
vim.api.nvim_set_hl(0, "@comment.warning", { fg = "#000000", bg = "#ffb300", bold = true, italic = true, underline = true })
vim.api.nvim_set_hl(0, "@comment.error", { fg = "#cf616a", bold = true, italic = true, underline = true })
vim.api.nvim_set_hl(0, "@markup.strong", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "@markup.italic", { italic = true })
vim.api.nvim_set_hl(0, "@markup.underline", { underline = true })
vim.api.nvim_set_hl(0, "@markup.link.url", { fg = "#8fbcbb", italic = true, underline = true })
vim.api.nvim_set_hl(0, "@markup.heading.1", { fg = "#bf616a", bold = true, underline = true })
vim.api.nvim_set_hl(0, "@markup.heading.2", { fg = "#ebcb8b", bold = true, underline = true })
vim.api.nvim_set_hl(0, "@markup.heading.3", { fg = "#b48ead", bold = true, underline = true })
vim.api.nvim_set_hl(0, "@markup.heading.4", { fg = "#5e81ac", bold = true, underline = true })
vim.api.nvim_set_hl(0, "@markup.heading.5", { fg = "#8fbcbb", bold = true, underline = true })
vim.api.nvim_set_hl(0, "@markup.heading.6", { fg = "#a3be8c", bold = true, underline = true })
vim.api.nvim_set_hl(0, "@markup.raw", { fg = "#81a1c1" })
vim.api.nvim_set_hl(0, "@markup.raw.block", { fg = "#8fbcbb" })
vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = "#869c98" })
-- custome color
vim.api.nvim_set_hl(0, "NerdtreeStatus", { fg = "#a3be8c", bold = true })

