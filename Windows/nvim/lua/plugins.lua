vim.pack.add({
  {
    src = "https://github.com/kylechui/nvim-surround",
  },
  {
    src = "https://github.com/numToStr/Comment.nvim",
  },
  {
    src = "https://github.com/preservim/nerdtree",
  },
},
{
  load = true,
})

require("nvim-surround").setup({})
-- nerdtree config
vim.g.NERDTreeStatusline='  '
vim.g.NERDTreeWinSize = 40
vim.g.NERDTreeQuitOnOpen = 3
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeHighlightCursorline = 1
vim.g.NERDTreeMinimalMenu = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeCaseSensitiveFS = 1
vim.g.NERDTreeHighlightCursorline = 1
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeIgnore = {
  '\\.o$[[file]]', '\\.out$[[file]]', '\\.class$[[file]]', '\\.exe$[[file]]', '\\.jar$[[file]]', '\\.tar$[[file]]', '\\.gz$[[file]]', '\\.7z$[[file]]',
  '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^__pycache__$[[dir]]'
}
local map_opts = { noremap = true, silent = true, }
vim.keymap.set("n", "<Tab>",  "<cmd>NERDTreeToggle<CR>", map_opts)
vim.keymap.set("n", "<C-s>",  "<cmd>NERDTreeFind<CR>",  map_opts)
-- nerdtree config end
