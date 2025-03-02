---@diagnostic disable: undefined-global
vim.loader.enable()
vim.opt.shadafile = "NONE"
-- disable built-in plugins
local disable_plugins = {
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
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, displugin in pairs(disable_plugins) do
  vim.g["loaded_" .. displugin] = 1
end
require('zeng.base')
require('zeng.map')
require('zeng.cmd')
require('zeng.autocmd')
require('zeng.plugin')
require('zeng.lsp')
require('zeng.theme')
require('zeng.statusline')
vim.opt.shadafile = ""
