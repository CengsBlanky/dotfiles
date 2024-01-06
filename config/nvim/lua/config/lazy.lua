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
    init = function ()
      vim.g.NERDTreeStatusline=' '
      vim.g.NERDTreeQuitOnOpen = 3
      vim.g.NERDTreeMinimalUI = 1
      vim.g.NERDTreeIgnore = {
        '\\.lock$[[file]]', '\\.o$[[file]]', '\\.out$[[file]]', '\\.class$[[file]]', '\\.exe$[[file]]',
        '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^__pycache__$[[dir]]'
      }
    end,
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
  {
    'leafOfTree/vim-svelte-plugin',
    ft = "svelte",
  },
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'justinmk/vim-sneak',
  {
    'andymass/vim-matchup',
    config = function ()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
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
  {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = {
      {'nvim-lua/plenary.nvim'},
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
      }
    },
    config = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, {})
      vim.keymap.set('n', '<leader>b', builtin.buffers, {})
      vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
      local actions = require("telescope.actions")
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              ["esc"] = actions.close
            },
            n = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
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
    init = function ()
      vim.g.user_emmet_mode='a'
    end
  },
  {
    'ap/vim-buftabline',
    config = function ()
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
    end,
  },
  'junegunn/goyo.vim',
  {
    'christoomey/vim-tmux-navigator',
    init = function ()
      vim.g.tmux_navigator_no_mappings = 1
    end,
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
        ensure_installed = { "dart", "c", "cpp", "diff", "java", "kotlin", "dockerfile", "go", "html", "css", "javascript", "svelte", "json", "lua", "markdown", "markdown_inline", "comment", "python", "rust", "sql", "typescript", "yaml", "toml", "elixir", "vimdoc" },
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
          enable = false, -- mandatory, false will disable the whole extension
          disable = {},  -- optional, list of language that will be disabled
        }
      }
    end
  },
  {
    'neovim/nvim-lspconfig',
    event = "BufReadPost",
    config = function ()
      -- lsp sign icons
      local signs = { Error = " ", Warn = "", Hint = "󰌶", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = false,
      })

      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      local opts = { noremap=true, silent=true }
      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(_, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<F4>', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      local lspconfig = require('lspconfig')

      local ensure_installed_list = {
        'awk_ls', 'bashls', 'clangd', 'rust_analyzer', 'dockerls', 'eslint', 'html', 'jsonls', 'jdtls', 'kotlin_language_server', 'tsserver', 'cssls', 'svelte',
        'lua_ls', 'marksman', 'pyright', 'volar', 'lemminx', 'elixirls'
      }

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed_list
      })

      for _, lserver in pairs(ensure_installed_list) do
        lspconfig[lserver].setup {
          on_attach = on_attach,
          capabilities = cmp_capabilities,
        }
      end
      lspconfig.jdtls.setup{
        cmd = { 'jdtls' },
        on_attach = on_attach,
        capabilities = cmp_capabilities,
      }

      -- flutter setup
      require("flutter-tools").setup {
        lsp = {
          on_attach = on_attach,
          capabilities = cmp_capabilities,
        }
      }
      -- rust tools setup
      local rt = require("rust-tools")
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            local bufopts = { noremap=true, silent=true, buffer=bufnr }

            vim.keymap.set('n', 'K', rt.hover_actions.hover_actions, bufopts)
            vim.keymap.set('n', '<leader>a', rt.code_action_group.code_action_group, bufopts)
            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<F4>', function() vim.lsp.buf.format { async = true } end, bufopts)

          end,
          capabilities = cmp_capabilities,
        }

      })
    end,
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = function ()
          require("mason").setup()
        end
      },
      {
        'williamboman/mason-lspconfig.nvim',
      },
      {
        'simrat39/rust-tools.nvim',
      },
    }
  },
  {
    'elixir-editors/vim-elixir',
    ft = "elixir"
  },
  {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    config = function ()
      -- luasnip setup
      local luasnip = require 'luasnip'

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      }

      -- code snippets source
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      "honza/vim-snippets",
    }
  },
  {
    'williamboman/mason.nvim',
    config = function ()
      require("mason").setup()
    end
  },
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
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require('ibl').setup()
    end,
    main = "ibl",
    opts = {}
  },
  {
    'nvim-lualine/lualine.nvim',
    event ={ "CursorMoved", "CursorMovedI" },
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
                modified = '',
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
                modified = '',
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
    log = { "-10" }, -- show commits from the last 3 days
    timeout = 240, -- kill processes that take more than 2 minutes
    url_format = "git@github.com:%s.git",
    -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
  },
})
