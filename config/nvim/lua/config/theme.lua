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
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ebcb8b", bold = true })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#88c0d0" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#bf616a", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#e1bb80", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#88c0d0", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#a3be8c", italic = true })
-- custome color
vim.api.nvim_set_hl(0, "NerdtreeStatus", { fg = "#a3be8c", bold = true })
