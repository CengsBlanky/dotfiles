local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "git@github.com:folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'preservim/nerdtree',
    cmd = "NERDTreeToggle",
    keys = {
      { "<Tab>", "<cmd>NERDTreeToggle<CR>", { silent = true } },
    },
    dependencies = 'ryanoasis/vim-devicons',
  },
  {
    'stevearc/oil.nvim',
    keys = {
      { "<C-f>", "<cmd>Oil .<CR>", { silent = true, nowait = true } },
    },
    config = function() require('oil').setup() end
  },
  'leafOfTree/vim-svelte-plugin',
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'justinmk/vim-sneak',
  {
    'lewis6991/gitsigns.nvim',
    keys = {
      { "]c", '<cmd>Gitsigns next_hunk<CR>', { silent = true, nowait = true } },
      { "[c", '<cmd>Gitsigns prev_hunk<CR>', { silent = true, nowait = true } },
    },
    config = function ()
      require('gitsigns').setup {
        signs = {
          topdelete    = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          changedelete = {hl = 'GitSignsChange', text = '*', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        },
      }
    end
  },
  'junegunn/vim-easy-align',
  'romainl/vim-cool',
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
            n = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          }
        }
      }
      require('telescope').load_extension('fzf')
    end
  },
  {'akinsho/flutter-tools.nvim', dependencies = 'nvim-lua/plenary.nvim'},
  'dart-lang/dart-vim-plugin',
  'dag/vim-fish',
  {
    'mattn/emmet-vim',
    config = function ()
      vim.g.user_emmet_mode='a'
    end
  },
  'ap/vim-buftabline',
  'junegunn/goyo.vim',
  {
    'christoomey/vim-tmux-navigator',
    keys = {
      { "<M-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true } },
      { "<M-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true } },
      { "<M-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true } },
      { "<M-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true } },
      { "<M-\\>", "<cmd>TmuxNavigatePrevious<CR>", { silent = true } },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function ()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "dart", "c", "cpp", "diff", "java", "kotlin", "dockerfile", "go", "html", "css", "javascript", "svelte", "json", "lua", "markdown", "markdown_inline", "comment", "python", "rust", "sql", "typescript", "yaml", "toml", "elixir" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ignore_install = {}, -- List of parsers to ignore installing
        highlight = {
          enable = true,              -- false will disable the whole extension
          disable = {},  -- list of language that will be disabled
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          disable = {},  -- optional, list of language that will be disabled
        }
      }
    end
  },
  'neovim/nvim-lspconfig',
  'simrat39/rust-tools.nvim',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  "honza/vim-snippets",
  {
    'williamboman/mason.nvim',
    config = function ()
      require("mason").setup()
    end
  },
  'williamboman/mason-lspconfig.nvim',
  {
    'sbdchd/neoformat',
    cmd = 'Neoformat',
    keys = {
      { "<Space>f", "<cmd>Neoformat<CR>", { silent = true, nowait = true } },
    },
    config = function ()
      vim.g.neoformat_basic_format_align = 1
      vim.g.neoformat_basic_format_retab = 1
      vim.g.neoformat_basic_format_trim = 1
      vim.g.neoformat_only_msg_on_error = 1
      vim.g.neoformat_try_formatprg = 1
    end
  },
  'jiangmiao/auto-pairs',
  {
    "EdenEast/nightfox.nvim",
    build = ":NightfoxCompile",
    config = function ()
      require("nightfox").setup({
        options = {
          transparent = true,
          dim_inactive = false,
          styles = {
            comments = "italic",
            constants = "bold",
          },
        }
      })
      vim.cmd [[colorscheme nordfox]]
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
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
          lualine_a = {
            {
              'mode',
              fmt = function (modestr)
                return modestr:sub(1,1)
              end,
            }
          },
          lualine_b = {
            {
              'filetype',
              colored = true,
              icon_only = true,
              padding = { left = 1, right = 0 },
            },
            {
              'filename',
              path = 1,
              shorting_target = 10,
              symbols = {
                modified = '●',
                alternate_file = '#',
                directory =  '',
                readonly = '',
                newfile = '󰈔'
              },
              color = { gui='bold'},
            }
          },
          lualine_c = {'diagnostics'},
          lualine_x = {},
          lualine_y = {'fileformat', 'encoding'},
          lualine_z = {'%P', '%l:%v/%L'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {
            {
              'filetype',
              colored = true,
              icon_only = true,
            },
            {
              'filename',
              path = 1,
              shorting_target = 10,
              symbols = {
                modified = '●',
                alternate_file = '#',
                directory =  '',
                readonly = '',
                newfile = '󰈔',
              },
            },
          },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {'%l:%v/%L'}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  },
},
{
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "-8" }, -- show commits from the last 3 days
    timeout = 120, -- kill processes that take more than 2 minutes
    url_format = "git@github.com:%s.git",
    -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
  },
})
