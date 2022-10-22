vim.opt.termguicolors = true
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.winblend = 0
vim.opt.background = 'dark'

vim.api.nvim_set_hl(0, "Comment", { fg = "DarkGray" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#495057" })
vim.api.nvim_set_hl(0, "Search", { bg = "#495057" })
vim.api.nvim_set_hl(0, "Folded", { fg = "DarkGray" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#868e96" })
vim.api.nvim_set_hl(0, "MatchParen", { bold = true, underline = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#bf616a", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#e1bb80", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#88c0d0", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#a3be8c", italic = true })
vim.api.nvim_set_hl(0, "BufTabLineCurrent", { fg = "LightGray", bg = "#4c566a", bold = true })
vim.api.nvim_set_hl(0, "BufTabLineFill", {})
vim.api.nvim_set_hl(0, "BufTabLineHidden", {})
vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = "#74b816", bold = true })
vim.api.nvim_set_hl(0, "GitGutterChange", { fg = "#fdb924", bold = true })
vim.api.nvim_set_hl(0, "GitGutterDelete", { fg = "#c92a2a", bold = true })
