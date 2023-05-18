local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'git@github.com:wbthomason/packer.nvim.git', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packerStartup = require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'
  use 'preservim/nerdtree'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'justinmk/vim-sneak'
  use 'lewis6991/gitsigns.nvim'
  use 'junegunn/vim-easy-align'
  use 'romainl/vim-cool'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  use 'dart-lang/dart-vim-plugin'
  use 'dag/vim-fish'
  use 'mattn/emmet-vim'
  use 'ap/vim-buftabline'
  use 'junegunn/goyo.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'nvim-treesitter/nvim-treesitter'
  use 'ryanoasis/vim-devicons'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use "honza/vim-snippets"
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'sbdchd/neoformat'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {"EdenEast/nightfox.nvim", run = ":NightfoxCompile",}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  git = {
    default_url_format = 'git@github.com:%s.git'
  }
}
})

-- plugin settings --

-- nerdtree
vim.keymap.set('n', '<Tab>', ':NERDTreeToggle<CR>', { silent = true })
vim.g.NERDTreeStatusline=' '
vim.g.NERDTreeQuitOnOpen = 3
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeIgnore = {
    '\\.lock$[[file]]', '\\.o$[[file]]', '\\.out$[[file]]', '\\.class$[[file]]', '\\.exe$[[file]]',
    '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]'
}
-- gitsigns
require('gitsigns').setup {
  signs = {
    topdelete    = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '*', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
}
vim.keymap.set('n', ']c', ':Gitsigns next_hunk<CR>', { silent = true, nowait = true })
vim.keymap.set('n', '[c', ':Gitsigns prev_hunk<CR>', { silent = true, nowait = true })
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
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
require('telescope').load_extension('fzf')
-- neoformat
vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_retab = 1
vim.g.neoformat_basic_format_trim = 1
vim.g.neoformat_only_msg_on_error = 1
vim.g.neoformat_try_formatprg = 1

vim.keymap.set('n', '<Space>f', ':Neoformat<CR>', { silent = true, nowait = true })

--- colorscheme
require("nightfox").setup({
  options = {
    transparent = true,
    dim_inactive = true,
    styles = {
      comments = "italic",
      constants = "bold",
    },
  }
})
vim.cmd [[colorscheme nordfox]]
--- treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "dart", "c", "diff", "java", "dockerfile", "go", "html", "javascript", "json", "lua", "markdown", "markdown_inline", "comment", "python", "rust", "sql", "typescript", "yaml", "toml" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
--- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'filename',
        symbols = {
          modified = '●',      -- Text to show when the buffer is modified
          alternate_file = '#', -- Text to show to identify the alternate file
          directory =  '',     -- Text to show when the buffer is a directory
        },

      }
    },
    lualine_c = {'diagnostics'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'%P'},
    lualine_z = {'%l/%L'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'%l/%L'}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- last line
return packerStartup
