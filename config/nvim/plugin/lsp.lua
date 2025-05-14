---@diagnostic disable: undefined-global
local setnmap = function (key, action, provide_opts)
  vim.keymap.set('n', key, action, provide_opts)
end
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.WARN
    },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '󰌶',
    },
  },
})
-- Use an LspAttach event to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local bufopts = { noremap = true, silent = true, nowait = true, buffer = bufnr }
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    setnmap('gD', vim.lsp.buf.declaration, bufopts)
    setnmap('gd', vim.lsp.buf.definition, bufopts)
    setnmap('gi', vim.lsp.buf.implementation, bufopts)
    setnmap('gr', vim.lsp.buf.references, bufopts)
    setnmap('K', vim.lsp.buf.hover, bufopts)
    setnmap('<leader>t', vim.lsp.buf.type_definition, bufopts)
    setnmap('<leader>r', vim.lsp.buf.rename, bufopts)
    setnmap('<leader>a', vim.lsp.buf.code_action, bufopts)
    setnmap('<leader>c', function() vim.lsp.codelens.run() end, bufopts)
    setnmap('<Space>d', vim.diagnostic.open_float, opts)
    setnmap('<Space>k', vim.diagnostic.goto_prev, opts)
    setnmap('<Space>j', vim.diagnostic.goto_next, opts)
  end,
})

-- set blink.cmp capabilities
local capabilities = require('blink.cmp').get_lsp_capabilities()
local lspconfig = require('lspconfig')

vim.lsp.config('*', {
  capabilities = capabilities,
})

lspconfig.emmet_language_server.setup {
  filetypes = { "html", "htmx", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
}

-- django-template-lsp
lspconfig.djlsp.setup {
  cmd = { "djlsp" },
  root_dir = lspconfig.util.root_pattern("manage.py"),
}

lspconfig.kotlin_language_server.setup {
  settings = {
    kotlin = {
      compiler = {
        jvm = {
          target = "21"
        }
      }
    }
  }
}

-- nodejs bun deno
lspconfig.ts_ls.setup {
  autostart = true,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = true,
}

lspconfig.denols.setup {
  autostart = false,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  single_file_support = false,
}

lspconfig.htmx.setup {
  autostart = false,
  single_file_support = false,
}

-- rust
vim.g.rustaceanvim = {
  server = {
    on_attach = function (_, bufnr)
      local bufopts = { silent=true, buffer=bufnr }
      setnmap('K', function() vim.cmd.RustLsp { 'hover', 'actions' } end, bufopts)
      setnmap('<leader>a', function() vim.cmd.RustLsp('codeAction') end, bufopts)
      setnmap('gD', vim.lsp.buf.declaration, bufopts)
      setnmap('gd', vim.lsp.buf.definition, bufopts)
      setnmap('gi', vim.lsp.buf.implementation, bufopts)
      setnmap('<space>D', vim.lsp.buf.type_definition, bufopts)
      setnmap('<leader>r', vim.lsp.buf.rename, bufopts)
      setnmap('gr', vim.lsp.buf.references, bufopts)
    end,
    default_settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  },
}

-- elixir
if vim.bo.filetype == "elixir" then
  local elixir = require("elixir")
  local elixirls = require("elixir.elixirls")

  elixir.setup {
    nextls = { enable = false },
    elixirls = {
      cmd = "elixir-ls",
      enable = true,
      settings = elixirls.settings {
        dialyzerEnabled = false,
        enableTestLenses = true,
      },
    },
    projectionist = {
      enable = false
    }
  }
end
