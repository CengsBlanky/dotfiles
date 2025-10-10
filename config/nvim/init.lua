---@diagnostic disable: undefined-global
vim.loader.enable({enable = true})
local opt = vim.opt
local g = vim.g
local map_opts = { silent = true, nowait = true }
opt.shadafile = "NONE"
opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    "--branch=stable",
    lazypath,
  })
end
opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'preservim/nerdtree',
    cmd = {"NERDTreeToggle", "NERDTreeFind"},
    init = function ()
      g.NERDTreeStatusline='  NERDTree'
      g.NERDTreeWinSize = 40
      g.NERDTreeQuitOnOpen = 3
      g.NERDTreeMinimalUI = 1
      g.NERDTreeHighlightCursorline = 1
      g.NERDTreeMinimalMenu = 1
      g.NERDTreeAutoDeleteBuffer = 1
      g.NERDTreeCaseSensitiveFS = 1
      g.NERDTreeHighlightCursorline = 1
      g.NERDTreeShowLineNumbers = 1
      g.NERDTreeIgnore = {
        '\\.o$[[file]]', '\\.out$[[file]]', '\\.class$[[file]]', '\\.exe$[[file]]', '\\.jar$[[file]]', '\\.tar$[[file]]', '\\.gz$[[file]]', '\\.7z$[[file]]',
        '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^__pycache__$[[dir]]'
      }
    end,
    keys = {
      { "<Tab>", "<cmd>NERDTreeToggle<CR>", map_opts },
      { "<C-s>", "<cmd>NERDTreeFind<CR>", map_opts },
    },
  },
  {
    'stevearc/oil.nvim',
    keys = {
      -- open oil at current file dir
      { "<C-f>", "<cmd>Oil %:p:h<CR>", map_opts },
    },
    opts = {
      skip_confirm_for_simple_edits = true,
      cleanup_delay_ms = 1000,
      view_options = {
        show_hidden = true,
      },
      watch_for_changes = true,
    },
  },
  {
    'leafOfTree/vim-svelte-plugin',
    ft = "svelte",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    keys = { { "ys" }, { "S", mode = "v" }, { "cs" }, { "ds" } },
    opts = {}
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    event = "VeryLazy",
  },
  {
    'justinmk/vim-sneak',
    event = "VeryLazy",
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufWritePost" },
    keys = {
      { "[c", function ()
        require("gitsigns").nav_hunk(
        "prev",
        {
          navigation_message = true,
        })
      end, map_opts },
      { "]c", function ()
        require("gitsigns").nav_hunk(
        "next",
        {
          navigation_message = true,
        })
      end, { silent = true, nowait = true } },
      { "]b", '<cmd>Gitsigns toggle_current_line_blame<CR>', map_opts },
    },
    opts = {
      -- gitsigns.nav_hunk()
      signs = {
        delete = { text = '-' },
      },
      current_line_blame_opts = {
        delay = 200,
      },
    },
  },
  {
    'romainl/vim-cool',
    event = "VeryLazy",
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader>f", function ()
          require('fzf-lua').files({
            previewer = false,
          })
        end, map_opts
      },
      {
        "<leader>g", function ()
          require("fzf-lua").grep()
        end, map_opts
      },
      {
        "<leader>l", function ()
          require("fzf-lua").live_grep()
        end, map_opts
      },
      {
        "<leader>b", function ()
          require("fzf-lua").buffers()
        end, map_opts
      },
    },
    config = function ()
      require('fzf-lua').setup({
        'max-perf',
        fzf_colors = true,
        fzf_opts = {
          ["--layout"] = false,
          ["--ansi"] = true,
          ["--info"] = "inline-right",
          ["--height"] = "100%",
          ["--border"] = "none",
          ["--highlight-line"] = true,
        },
        previewers = {
          bat = {
            cmd = "bat",
            args = "--color=always --theme=Nord --style=numbers,changes",
          },
        },
      })
    end,
    opts = {}
  },
  {
    'mattn/emmet-vim',
    -- avoid treesitter related error
    commit = '3fb2f63799e1922f7647ed9ff3b32154031a76ee',
    event = "VeryLazy",
    init = function ()
      g.user_emmet_mode='iv'
      -- g.user_emmet_expandabbr_key='<M-e>'
      -- g.user_emmet_expandword_key='<M-m>'
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    event = "VeryLazy",
    keys = {
      { '<Space>1', '<Cmd>lua require("bufferline").go_to(1, true)<CR>', map_opts },
      { '<Space>2', '<Cmd>lua require("bufferline").go_to(2, true)<CR>', map_opts },
      { '<Space>3', '<Cmd>lua require("bufferline").go_to(3, true)<CR>', map_opts },
      { '<Space>4', '<Cmd>lua require("bufferline").go_to(4, true)<CR>', map_opts },
      { '<Space>5', '<Cmd>lua require("bufferline").go_to(5, true)<CR>', map_opts },
      { '<Space>6', '<Cmd>lua require("bufferline").go_to(6, true)<CR>', map_opts },
      { '<Space>7', '<Cmd>lua require("bufferline").go_to(7, true)<CR>', map_opts },
      { '<Space>8', '<Cmd>lua require("bufferline").go_to(8, true)<CR>', map_opts },
      { '<Space>9', '<Cmd>lua require("bufferline").go_to(9, true)<CR>', map_opts },
      { '<Space>0', '<Cmd>lua require("bufferline").go_to(-1, true)<CR>', map_opts },
      { '<Space>p', '<Cmd>BufferLineTogglePin<CR>', map_opts },
      { '<Space>h', '<Cmd>BufferLineCloseLeft<CR>', map_opts },
      { '<Space>l', '<Cmd>BufferLineCloseRight<CR>', map_opts },
      { '<Space>o', '<Cmd>BufferLineCloseOthers<CR>', map_opts },
      { '<Space>p', '<Cmd>BufferLinePick<CR>', map_opts },
      { '<Space>D', '<Cmd>BufferLinePickClose<CR>', map_opts },
      { '<C-n>', '<Cmd>BufferLineCycleNext<CR>', map_opts },
    },
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
          max_name_length = 128,
          indicator = {
            style = 'underline',
          },
          diagnostics = false,
          separator_style = { '', '' },
          hover = {
            enable = false,
          },
          custom_filter = function(buf_number, _)
            local ignore_suffix = "kulala_ui"
            if vim.bo[buf_number].filetype:sub(-#ignore_suffix) == ignore_suffix then
              return false
            end
            return true
          end,
        }
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = "main",
    build = function()
      local parser_installed = { "c", "cpp", "diff", "java", "javadoc", "kotlin", "groovy", "dockerfile", "zig", "go", "gomod", "gosum", "html", "html_tags", "htmldjango", "css", "svelte", "lua", "markdown", "markdown_inline", "comment", "python", "rust", "sql", "javascript", "jsx", "typescript", "tsx", "yaml", "toml", "elixir", "bash", "http", "tmux", "xml", "fish", "awk", "jq", "json", "jsonc", "json5", "printf", "vim", "vimdoc", "query", "cmake", "csv", "dot", "func", "gotmpl", "graphql", "ini", "jsdoc", "luadoc", "make", "nginx", "regex", "requirements", "ssh_config", "strace", "styled", "templ", "todotxt", "vue", "xresources", "asm", "mermaid", }
      require("nvim-treesitter").install(parser_installed)
      require("nvim-treesitter").update()
    end,
    opts = function ()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local indent_excluded = {
            asm = true,
            awk = true,
            bash = true,
            comment = true,
            csb = true,
            diff = true,
            dockerfile = true,
            dtd = true,
            func = true,
            gomod = true,
            gosum = true,
            gotmpl = true,
            http = true,
            ini = true,
            jq = true,
            jsdoc = true,
            json5 = true,
            kotlin = true,
            luadoc = true,
            make = true,
            markdown_inline = true,
            nginx = true,
            printf = true,
            regex = true,
            requirements = true,
            strace = true,
            templ = true,
            tmux = true,
            todotxt = true,
            tsv = true,
            vim = true,
            vimdoc = true,
            xresources = true,
          }
          local lang = vim.treesitter.language.get_lang(args.match)
          if vim.treesitter.language.add(lang) then
            vim.treesitter.start()
            if not indent_excluded[lang] then
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
            vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            local map = function(key, func)
              vim.keymap.set({ 'x', 'o' }, key, func, { nowait = true, silent = true })
            end
            local ts_select = function (obj)
              require("nvim-treesitter-textobjects.select").select_textobject(obj, "textobjects")
            end
            map("af", function() ts_select("@function.outer") end)
            map("if", function() ts_select("@function.inner") end)
            map("ac", function() ts_select("@class.outer") end)
            map("ic", function() ts_select("@class.inner") end)
            map("ab", function() ts_select("@block.outer") end)
            map("ib", function() ts_select("@block.inner") end)
          end
        end
      })
    end,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        opts = {},
      },
    },
  },
  {
    'windwp/nvim-ts-autotag',
    branch = "main",
    opts = {},
  },
  {
    'stevearc/aerial.nvim',
    keys = {
      { "<Space>a", "<cmd>AerialToggle!<CR>", map_opts},
      { "{", "<cmd>AerialPrev<CR>", map_opts},
      { "}", "<cmd>AerialNext<CR>", map_opts},
    },
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts= {
      automatic_enable = false,
      -- TODO kotlin_lsp too much slower
      ensure_installed = { 'awk_ls', 'bashls', 'clangd', 'dockerls', 'lua_ls', 'marksman', 'ruff', 'basedpyright', 'zls', 'gopls', 'jdtls', 'html', 'cssls', 'vtsls', 'jsonls', 'svelte', 'emmet_language_server', },
    },
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {},
      },
      {
        'neovim/nvim-lspconfig',
        config = function () end,
      },
    }
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { "BufRead Cargo.toml" },
    opts = {},
  },
  {
    "elixir-tools/elixir-tools.nvim",
    ft = { "elixir" },
    version = "*",
  },
  {
    'elixir-editors/vim-elixir',
    ft = "elixir"
  },
  {
    'rust-lang/rust.vim',
    ft = 'rust',
    init = function ()
      g.rustfmt_autosave=  1
    end
  },
  {
    'saghen/blink.cmp',
    lazy = true, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
      { 'rafamadriz/friendly-snippets' },
    },
    -- use a release tag to download pre-built binaries
    version = '*',
    opts = {
      sources = {
        providers = {
          buffer = {
            opts = {
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr)
                  return vim.bo[bufnr].buftype == ''
                end, vim.api.nvim_list_bufs())
              end,
            },
          },
        },
        default = { 'buffer', 'lsp', 'snippets', 'path', },
      },
      cmdline = {
        enabled = false,
      },
      signature = { enabled = true },
      keymap = {
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<C-j>'] = { 'snippet_forward', 'fallback' },
        ['<C-k>'] = { 'snippet_backward', 'fallback' },
        ['<C-]>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-[>'] = { 'scroll_documentation_down', 'fallback' },
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        list = {
          selection = {
            preselect = false,
          },
        },
        ghost_text = {
          enabled = false,
        },
        trigger = {
          show_on_insert_on_trigger_character = false,
        },
        accept = {
          auto_brackets = {
            enabled = false,
          },
        },
      },
    }
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
        desc = "conform done",
      },
    },
    opts = {
      formatters_by_ft = {
        python = { "py_sort", "py_format" },
        htmldjango = { "djhtml_format" },
        c = { "c_format" },
        cpp = { "c_format" },
        go = { "gofmt", "goimports" },
        kotlin = { "ktfmt" },
        xml = { "xq_format" },
        html = { "prettier" },
        java = { "java_format" },
        javascript = { "biome-check" },
        javascriptreact = { "biome-check" },
        json = { "jq" },
        typescript = { "biome-check" },
        typescriptreact = { "biome-check" },
        yaml = { "prettier" },
        sql = { "sqlfluff" },
        sh = {"shfmt"},
        ["*"] = { "trim_whitespace" },
      },
      formatters = {
        ["c_format"] = {
          command = "clang-format",
          args = "-style=file:$HOME/.config/formatter/clang-format.yaml",
        },
        ["java_format"] = {
          command = "clang-format",
          args = {
            "-style=file:" .. vim.fn.expand("$HOME/.config/formatter/java-format.yaml"),
            "$FILENAME",
          },
        },
        ["py_format"] = {
          command = "ruff",
          args = {
            "format",
            "--stdin-filename",
            "$FILENAME",
          },
        },
        ["py_sort"] = {
          command = "ruff",
          args = {
            "check",
            "--select",
            "I",
            "--fix",
            "--stdin-filename",
            "$FILENAME",
          },
        },
        ["djhtml_format"] = {
          command = "djlint",
          args = {
            "--reformat",
            "--profile=django",
            "--indent=2",
            "-",
          },
        },
        ["ktfmt"] = {
          command = "ktfmt",
          append_args = {
            "--kotlinlang-style",
          }
        },
        ["xq_format"] = {
          command = "xq",
        },
      },
      default_format_opts = {
        lsp_format = "fallback",
        stop_after_first = false,
      },
      -- format_on_save = {
        --   lsp_format = "fallback",
        --   timeout_ms = 300,
        -- },
        log_level = vim.log.levels.DEBUG,
      },
    init = function ()
      opt.formatexpr = "v:lua.require'conform'.formatexpr()"
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

      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' }, { '%', '%' }, }
      -- for spaces between brackets
      npairs.add_rules {
        -- Pair will only occur if the conditional function returns true
        Rule(' ', ' ')
          :with_pair(function(opts)
            -- We are checking if we are inserting a space in (), [], {}, %%
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({
              brackets[1][1] .. brackets[1][2],
              brackets[2][1] .. brackets[2][2],
              brackets[3][1] .. brackets[3][2],
              brackets[4][1] .. brackets[4][2],
            }, pair)
          end)
          :with_move(cond.none())
          :with_cr(cond.none())
          -- We only want to delete the pair of spaces when the cursor is as such: ( | )
          :with_del(function(opts)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local context = opts.line:sub(col - 1, col + 2)
            return vim.tbl_contains({
              brackets[1][1] .. '  ' .. brackets[1][2],
              brackets[2][1] .. '  ' .. brackets[2][2],
              brackets[3][1] .. '  ' .. brackets[3][2],
              brackets[4][1] .. '  ' .. brackets[4][2],
            }, context)
          end),
        Rule('<', '>')
          :with_pair(cond.before_regex("[a-zA-Z'\"]"))
          :with_move(cond.done()),
        -- allow " in go json annotation
        Rule('"', '"', { 'go' })
          :with_pair(function (opts)
            if string.find(opts.line, '`') or cond.after_text(":") then
              return true
            end
            return false
          end)
          :with_move(cond.none())
          :with_del(cond.none()),
        Rule('|', '|', "rust"):with_move(cond.done()),
        Rule('%', '%', "htmldjango"):with_pair(function ()
          if cond.after_text("{") then
            return true
          end
          return false
        end),
      }
      -- For each pair of brackets we will add another rule
      for _, bracket in pairs(brackets) do
        npairs.add_rules {
          -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
          Rule(bracket[1] .. ' ', ' ' .. bracket[2])
          :with_pair(cond.none())
          :with_move(function(opts) return opts.char == bracket[2] end)
          :with_del(cond.none())
          :use_key(bracket[2])
          -- Removes the trailing whitespace that can occur without this
          :replace_map_cr(function(_) return '<C-c>2xi<CR><C-c>O' end)
        }
      end
    end,
  },
  {
    'mistweaverco/kulala.nvim',
    ft = { "http", "rest" },
    opts = {
      additional_curl_options = { "--insecure" },
      disable_script_print_output = true,
      -- 15 seconds timeout
      request_timeout = 15000,
      urlencode = "skipencoded",
      default_env = "dev",
      ui = {
        default_winbar_panes = { "body", "headers", "headers_body", "script_output" },
      },
      global_keymaps = {
        ["Send request"] = { "<Space>r", function() require("kulala").run() end, mode = { "n" }, ft = { "http", "rest" } },
        ["Select environment"] = { "<Space>e", function() require("kulala").set_selected_env() end, mode = { "n" }, ft = { "http", "rest" } },
        ["Copy as cURL"] = { "<Space>c", function() require("kulala").copy() end, mode = { "n" }, ft = { "http", "rest" } },
        ["Paste from curl"] = { "<Space>p", function() require("kulala").from_curl() end, mode = { "n" }, ft = { "http", "rest" }, },
        ["Jump to next request"] = { "<Space>j", function() require("kulala").jump_next() end, mode = { "n" }, ft = { "http", "rest" }, },
        ["Jump to previous request"] = { "<Space>k", function() require("kulala").jump_prev() end, mode = { "n" }, ft = { "http", "rest" }, },
        ["Open scratchpad"] = false,
        ["Open kulala"] = false,
        ["Toggle headers/body"] = false,
        ["Show stats"] = false,
        ["Close window"] = false,
        ["Send request <cr>"] = false,
        ["Send all requests"] = false,
        ["Inspect current request"] = false,
        ["Replay the last request"] = false,
        ["Find request"] = false,
        ["Download GraphQL schema"] = false,
        ["Clear globals"] = false,
        ["Clear cached files"] = false,
      },
      kulala_keymaps = {
        ["Show headers"] = { "H", function() require("kulala.ui").show_headers() end, },
        ["Show body"] = { "B", function() require("kulala.ui").show_body() end, },
        ["Show headers and body"] = { "A", function() require("kulala.ui").show_headers_body() end, },
        ["Show verbose"] = { "P", function() require("kulala.ui").show_verbose() end, },
        ["Show script output"] = { "O", function() require("kulala.ui").show_script_output() end, },
        ["Show stats"] = { "L", function() require("kulala.ui").show_stats() end, },
        ["Show report"] = { "R", function() require("kulala.ui").show_report() end, },
        ["Next response"] = { "<leader>]", function() require("kulala.ui").show_next() end, },
        ["Previous response"] = { "<leader>[", function() require("kulala.ui").show_previous() end, },
        ["Jump to response"] = { "<CR>", function() require("kulala.ui").jump_to_response() end, },
        ["Clear responses history"] = { "X", function() require("kulala.ui").clear_responses_history() end, },
        ["Show help"] = { "?", function() require("kulala.ui").show_help() end, },
        ["Close"] = { "q", function() require("kulala.ui").close_kulala_buffer() end, },
      },
    }
  },
  {
    "toppair/peek.nvim",
    ft = "markdown",
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    'numToStr/Navigator.nvim',
    config = true,
    keys = {
      { '<A-h>', '<cmd>NavigatorLeft<CR>', map_opts },
      { '<A-j>', '<cmd>NavigatorDown<CR>', map_opts },
      { '<A-k>', '<cmd>NavigatorUp<CR>', map_opts },
      { '<A-l>', '<cmd>NavigatorRight<CR>', map_opts },
      { '<A-\\>', '<cmd>NavigatorPrevious<CR>', map_opts },
    }
  },
  {
    "rebelot/kanagawa.nvim",
    event = "VeryLazy",
    opts = {
      colors = {
        palette = {
          waveRed = "#d08770",
          peachRed = "#bf616a",
        },
        theme = {
          all = {
            ui = {
              float = {
                bg = "none",
              },
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function()
        return {
          Boolean = { bold = false, },
          Todo = { fg = "#ebcb8b", italic = false, bold = true, },
          Visual = { bg = "#495359", bold = true, },
          Folded = { fg = "DarkGray", bg = "none", },
          WinSeparator = { fg = "#4c566a", bg = "none", },
          StatusLine = { fg = "#587284", bg = "none", bold = true, },
          DiagnosticError = { fg = "#ef616a", bg = "none", },
          DiagnosticSignError = { fg = "#ef616a", bg = "none", bold = true },
          DiagnosticVirtualTextError = { fg = "#ef616a", bg = "none", bold = false },
          DiagnosticFloatingError = { fg = "#ef616a", bg = "none", bold = false },
          TabLineFill = { bg = "none" },
          ["@comment.note"] = { fg = "#a3be8c", bg = "none", bold = true, italic = false, underline = false, },
          ["@comment.todo"] = { fg = "#ebcb8b", bg = "none", bold = true, italic = true, underline = true, },
          ["@comment.warning"] = { fg = "#000000", bg = "#ffb300", bold = true, italic = true, underline = true, },
          ["@comment.error"] = { fg = "#cf616a", bg = "black", bold = true, italic = true, underline = true, },
          ["@markup.heading.1.markdown"] = { fg = "#ee99a0", bg = "none", bold = true, },
          ["@markup.heading.2.markdown"] = { fg = "#f5a97f", bg = "none", bold = true, },
          ["@markup.heading.3.markdown"] = { fg = "#eed49f", bg = "none", bold = true, },
          ["@markup.heading.4.markdown"] = { fg = "#a6da95", bg = "none", bold = true, },
          ["@markup.heading.5.markdown"] = { fg = "#7dc4e4", bg = "none", bold = true, },
          ["@markup.heading.6.markdown"] = { fg = "#b7bdf8", bg = "none", bold = true, },
          ["@markup.link"] = { fg = "#8fb0ff", bg = "none" },
          ["@markup.link.url"] = { fg = "#79c0e0", bg = "none", italic = false, underline = true },
          ["@string.special.url"] = { fg = "#8fbcb9", underdotted = true, },
          ["@variable.builtin"] = { italic = false },
          ["@function.builtin"] = { fg = "#5e81ac" },
        }
      end,
      compile = true,
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { italic = false, bold = false },
      typeStyle = { italic = false, bold = false },
      transparent = true,
      theme = "wave",
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup(
        { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "tmux", "lua", "vim", "toml", "cpp", "conf", "zathurarc" },
        { mode = "background" }
      )
    end,
  },
  {
    "kndndrj/nvim-dbee",
    cmd = "Dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install("go")
    end,
    config = function()
      require("dbee").setup({
        sources = {
          require("dbee.sources").FileSource:new("$HOME/.config/dbee/connections.json")
        },
        editor = {
          mappings = {
            { key = "<space>r", mode = "v", action = "run_selection" },
            { key = "<space>r", mode = "n", action = "run_under_cursor" },
          },
        },
      })
    end,
  },
},
{
  git = {
    log = { "-10" }, -- show commits from the last 10 days
    timeout = 240, -- kill processes that take more than 4 minutes
    filter = true,
  },
  rocks = {
    enabled = false,
  },
  checker = { enabled = false },
  change_detection = { enabled = false, },
  performance = {
    rtp = {
      disabled_plugins = {
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
        "tohtml",
        "2html_plugin",
        "logipat",
        "rrhelper",
        "spellfile_plugin",
        "tutor",
      },
    },
  },
})
opt.shadafile = ""
