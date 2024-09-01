---@diagnostic disable: undefined-global
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    -- "git@github.com:folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'preservim/nerdtree',
    init = function ()
      vim.g.NERDTreeStatusline='%#NerdtreeStatus#  NERDTree'
      vim.g.NERDTreeWinSize =  50
      vim.g.NERDTreeQuitOnOpen = 3
      vim.g.NERDTreeMinimalUI = 1
      vim.g.NERDTreeHighlightCursorline = 1
      vim.g.NERDTreeMinimalMenu = 1
      vim.g.NERDTreeAutoDeleteBuffer = 1
      vim.g.NERDTreeCaseSensitiveFS = 1
      vim.g.NERDTreeHighlightCursorline = 1
      vim.g.NERDTreeShowLineNumbers = 1
      vim.g.NERDTreeNodeDelimiter="😀"
      vim.g.NERDTreeDirArrowExpandable=""
      vim.g.NERDTreeDirArrowCollapsible="~"
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
      { "<M-f>", "<cmd>Oil .<CR>", { silent = true, nowait = true } },
    },
    config = function()
      require('oil').setup({
        skip_confirm_for_simple_edits = true,
        cleanup_delay_ms = 1000,
        view_options = {
          show_hidden = true,
        }
      })
    end
  },
  {
    'leafOfTree/vim-svelte-plugin',
    ft = "svelte",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    'numToStr/Comment.nvim',
    config = true,
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  'justinmk/vim-sneak',
  {
    'lewis6991/gitsigns.nvim',
    keys = {
      { "<M-[>", function ()
        require("gitsigns").nav_hunk(
        "prev",
        {
          navigation_message = true,
        })
      end, { silent = true, nowait = true } },
      { "<M-]>", function ()
        require("gitsigns").nav_hunk(
        "next",
        {
          navigation_message = true,
        })
      end, { silent = true, nowait = true } },
      { "<leader>b", '<cmd>Gitsigns toggle_current_line_blame<CR>', { silent = true, nowait = true } },
    },
    config = function ()
      require('gitsigns').setup {
        -- gitsigns.nav_hunk()
        signs = {
          delete = { text = '-' },
        },
        current_line_blame_opts = {
          delay = 200,
        },
      }
    end
  },
  'junegunn/vim-easy-align',
  'romainl/vim-cool',
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
          path_display = {
            "filename_first"
          },
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
          preview = false,
        }
      }
      require('telescope').load_extension('fzf')
    end
  },
  {
    'akinsho/flutter-tools.nvim',
    ft = 'dart',
    dependencies = 'nvim-lua/plenary.nvim'
  },
  {
    'dart-lang/dart-vim-plugin',
    ft = 'dart',
  },
  'dag/vim-fish',
  {
    'mattn/emmet-vim',
    init = function ()
      vim.g.user_emmet_mode='i'
      vim.g.user_emmet_expandabbr_key='<C-j>'
      vim.g.user_emmet_expandword_key='<C-k>'
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    event = "VeryLazy",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
      local bufferline = require('bufferline')
      bufferline.setup {
        options = {
          mode = "buffers",
          themable = true,
          style_preset = bufferline.style_preset.no_italic,
          modified_icon = '',
          buffer_close_icon = '',
          always_show_bufferline = false;
          show_close_icon = false,
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_tab_indicators = false,
          numbers = "ordinal",
          tab_size = 0,
          indicator = {
            style = 'underline',
          },
          diagnostics = false,
          separator_style = { '', '' },
          hover = {
            enable = false,
          },
        }
      }
      -- keymaps
      local map = vim.api.nvim_set_keymap
      local map_opts = { noremap = true, silent = true }
      map('n', '<Space>1', '<Cmd>BufferLineGoToBuffer 1<CR>', map_opts)
      map('n', '<Space>2', '<Cmd>BufferLineGoToBuffer 2<CR>', map_opts)
      map('n', '<Space>3', '<Cmd>BufferLineGoToBuffer 3<CR>', map_opts)
      map('n', '<Space>4', '<Cmd>BufferLineGoToBuffer 4<CR>', map_opts)
      map('n', '<Space>5', '<Cmd>BufferLineGoToBuffer 5<CR>', map_opts)
      map('n', '<Space>6', '<Cmd>BufferLineGoToBuffer 6<CR>', map_opts)
      map('n', '<Space>7', '<Cmd>BufferLineGoToBuffer 7<CR>', map_opts)
      map('n', '<Space>8', '<Cmd>BufferLineGoToBuffer 8<CR>', map_opts)
      map('n', '<Space>9', '<Cmd>BufferLineGoToBuffer 9<CR>', map_opts)
      map('n', '<Space>0', '<Cmd>BufferLineGoToBuffer -1<CR>', map_opts)
      map('n', '<Space>p', '<Cmd>BufferLineTogglePin<CR>', map_opts)
      map('n', '<Space>h', '<Cmd>BufferLineCloseLeft<CR>', map_opts)
      map('n', '<Space>l', '<Cmd>BufferLineCloseRight<CR>', map_opts)
      map('n', '<Space>o', '<Cmd>BufferLineCloseOthers<CR>', map_opts)
      map('n', '<Space>p', '<Cmd>BufferLinePick<CR>', map_opts)
      map('n', '<Space>D', '<Cmd>BufferLinePickClose<CR>', map_opts)
      map('n', '<C-n>', '<Cmd>BufferLineCycleNext<CR>', map_opts)
    end,
  },
  {
    'stevearc/aerial.nvim',
    keys = {
      { "<Space>a", "<cmd>AerialToggle!<CR>", { silent = true, nowait = true } },
      { "{", "<cmd>AerialPrev<CR>", { silent = true, nowait = true } },
      { "}", "<cmd>AerialNext<CR>", { silent = true, nowait = true } },
    },
    config = true,
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
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
        ensure_installed = { "dart", "c", "cpp", "diff", "java", "kotlin", "groovy", "dockerfile", "go", "html", "css", "javascript", "svelte", "json", "lua", "markdown", "markdown_inline", "comment", "python", "rust", "sql", "typescript", "yaml", "toml", "elixir", "vimdoc", "bash", "http" },
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
        },
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = false,
          },
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
  },
  {
    'neovim/nvim-lspconfig',
    config = function ()
      -- lsp sign icons
      local signs = { Error = " ", Warn = "", Hint = "󰌶", Info = "" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
      })

      -- Mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      local opts = { noremap=true, silent=true, nowait=true }
      vim.keymap.set('n', '<Space>d', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '<Space>k', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', '<Space>j', vim.diagnostic.goto_next, opts)
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
        vim.keymap.set('n', '<space>t', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      end

      -- Add additional capabilities supported by nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      local lspconfig = require('lspconfig')

      local ensure_installed_list = {
        'awk_ls', 'bashls', 'clangd', 'dockerls', 'eslint', 'html', 'jsonls', 'jdtls', 'kotlin_language_server', 'groovyls','tsserver', 'cssls', 'svelte', 'lua_ls', 'marksman', 'pyright', 'volar', 'elixirls', 'rust_analyzer', 'gopls'
      }
      local lspconfig_list = {
        'awk_ls', 'bashls', 'clangd', 'dockerls', 'eslint', 'html', 'jsonls', 'jdtls', 'kotlin_language_server', 'groovyls','tsserver', 'cssls', 'svelte', 'lua_ls', 'marksman', 'pyright', 'volar', 'elixirls', 'gopls'
      }
      -- TODO add https://github.com/mfussenegger/nvim-jdtls/tree/master

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed_list
      })

      for _, lserver in pairs(lspconfig_list) do
        lspconfig[lserver].setup {
          on_attach = on_attach,
          capabilities = cmp_capabilities,
        }
      end

      -- flutter setup
      require("flutter-tools").setup {
        lsp = {
          on_attach = on_attach,
          capabilities = cmp_capabilities,
        }
      }
      -- rust tools setup
      vim.g.rustaceanvim = {
        server = {
          on_attach = function (_, bufnr)
            local bufopts = { silent=true, buffer=bufnr }
            vim.keymap.set('n', 'K', function() vim.cmd.RustLsp { 'hover', 'actions' } end, bufopts)
            vim.keymap.set('n', '<leader>a', function() vim.cmd.RustLsp('codeAction') end, bufopts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
            vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
          end,
          capabilities = cmp_capabilities,
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
              },
            },
          },
        },
      }
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
        'mrcjkb/rustaceanvim',
        version = '^5', -- Recommended
        lazy = false, -- This plugin is already lazy
      },
    }
  },
  {
    'saecki/crates.nvim',
    config = function()
      require('crates').setup({
        completion = {
          cmp = {
            enabled = true,
          },
        },
      })
    end,
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
        completion = {
          keyword_length = 3,
        },
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
            select = true,
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
          { name = 'crates' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'ctags' },
        },
      }

      cmp.setup.filetype ({ "markdown" }, {
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        }
      })

      cmp.setup.filetype ({ "sql", "mysql", "plsql" }, {
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'vim-dadbod-completion' },
        }
      })

      -- code snippets source
      require("luasnip.loaders.from_snipmate").lazy_load()

      -- nvim-autopairs integrate
      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      {
        'L3MON4D3/LuaSnip',
        dependencies = {
          "rafamadriz/friendly-snippets"
        },
      },
      'honza/vim-snippets',
      'delphinus/cmp-ctags',
    }
  },
  {
    'williamboman/mason.nvim',
    config = true,
  },
  {
    'stevearc/conform.nvim',
    cmd = { "ConformInfo" },
    keys = {
      {
        "<Space>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "conform format buffer",
      },
    },
    opts = {
      formatters = {
        clang_format = {
          command = "clang-format",
          append_args = { "--style", "Microsoft" },
        },
      },
      format_by_ft = {
        python = { "ruff" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        ["*"] = { "trim_whitespace" },
      },
    },
    init = function ()
      vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    init = function ()
      local npairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')
      npairs.add_rules {
        -- add spaces between parentheses
        Rule(' ', ' ')
          :with_pair(function (opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({'()', '[]', '{}'}, pair)
          end)
          :with_move(cond.none()),
        Rule('|', '|', "rust"):with_move(cond.done()),
        Rule('<', '>')
          :with_pair(cond.before_regex("[a-zA-Z]"))
          :with_move(cond.done()),
      }
    end,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.dbs = {
        {
          name = "lite",
          url = "sqlite:~/tmp/sqlite.db",
        },
      }
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority= 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        transparent_background = true,
        no_italic = true,
        styles = {
          comments = { "italic" },
          conditionals = {},
        },
        integrations = {
          aerial = true,
          mason = true,
          vim_sneak = true,
        }
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
},
{
  git = {
    -- defaults for the `Lazy log` command
    log = { "-10" }, -- show commits from the last 3 days
    timeout = 240, -- kill processes that take more than 2 minutes
    -- url_format = "git@github.com:%s.git",
    -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
  },
})
