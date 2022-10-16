local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
end

--- nerdtree
vim.keymap.set('n', '<Tab>', ':NERDTreeToggle<CR>', { silent = true })
vim.g.NERDTreeStatusline=' '
vim.g.NERDTreeQuitOnOpen = 3
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeIgnore = {
    '\\.lock$[[file]]', '\\.o$[[file]]', '\\.out$[[file]]', '\\.class$[[file]]', '\\.exe$[[file]]',
    '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]'
}
--- gitgutter
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '┃', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '┃', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '┃', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
vim.g.gitgutter_sign_priority = 0
vim.g.gitgutter_sign_allow_clobber = 0
vim.g.gitgutter_sign_added = '┃'
vim.g.gitgutter_sign_modified = '┃'
vim.g.gitgutter_sign_removed = '┃'
vim.g.gitgutter_sign_modified_removed = '┃'
--- buftabline
vim.g.buftabline_show = 1
vim.g.buftabline_indicators = 1
vim.g.buftabline_numbers = 2
vim.keymap.set('n', '<Space>1', '<Plug>BufTabLine.Go(1)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>2', '<Plug>BufTabLine.Go(2)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>3', '<Plug>BufTabLine.Go(3)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>4', '<Plug>BufTabLine.Go(4)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>5', '<Plug>BufTabLine.Go(5)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>6', '<Plug>BufTabLine.Go(6)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>7', '<Plug>BufTabLine.Go(7)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>8', '<Plug>BufTabLine.Go(8)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>9', '<Plug>BufTabLine.Go(9)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>0', '<Plug>BufTabLine.Go(10)', { silent = true, nowait = true })
--- emmet
vim.g.user_emmet_mode='a'
--- tmux navigator
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set('n', '<M-h>', ':TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('n', '<M-j>', ':TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('n', '<M-k>', ':TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('n', '<M-l>', ':TmuxNavigateRight<CR>', { silent = true })
vim.keymap.set('n', '<M-\\>', ':TmuxNavigatePrevious<CR>', { silent = true })
--- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>l', builtin.live_grep, {})
-- neoformat
vim.g.neoformat_only_msg_on_error = 1
vim.keymap.set('n', '<Space>f', ':Neoformat<CR>', { silent = true, nowait = true })
--- colorscheme
vim.g.gruvbox_material_enable_bold=1
vim.g.gruvbox_material_transparent_background=1
vim.g.gruvbox_material_better_performance=1
vim.cmd [[colorscheme gruvbox-material]]
--- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "java", "dart", "go", "javascript", "typescript", "css", "python", "lua", "bash", "html", "toml" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = {},  -- optional, list of language that will be disabled
  }
}
