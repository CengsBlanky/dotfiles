---@diagnostic disable: undefined-global
local setnmap = function (key, action, provide_opts)
  local default_opts = { noremap=true, silent=true, nowait=true }
  vim.keymap.set('n', key, action, provide_opts or default_opts)
end
setnmap('<Space>d', vim.diagnostic.open_float, opts)
setnmap('<Space>k', vim.diagnostic.goto_prev, opts)
setnmap('<Space>j', vim.diagnostic.goto_next, opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  setnmap('gD', vim.lsp.buf.declaration, bufopts)
  setnmap('gd', vim.lsp.buf.definition, bufopts)
  setnmap('K', vim.lsp.buf.hover, bufopts)
  setnmap('gi', vim.lsp.buf.implementation, bufopts)
  -- setnmap('<C-k>', vim.lsp.buf.signature_help, bufopts)
  setnmap('<space>t', vim.lsp.buf.type_definition, bufopts)
  setnmap('<leader>r', vim.lsp.buf.rename, bufopts)
  setnmap('<leader>a', vim.lsp.buf.code_action, bufopts)
  setnmap('<leader>s', function() vim.lsp.codelens.run() end, bufopts)
  setnmap('gr', vim.lsp.buf.references, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities()
-- local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

local lserver_list = {
  'awk_ls', 'bashls', 'clangd', 'dockerls', 'html', 'jsonls', 'cssls', 'svelte', 'lua_ls', 'marksman', 'basedpyright', 'volar', 'gopls',
}

for _, lserver in pairs(lserver_list) do
  lspconfig[lserver].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- django-template-lsp
lspconfig.djlsp.setup {
  cmd = { "djlsp" },
  root_dir = lspconfig.util.root_pattern("manage.py"),
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.kotlin_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = true,
}

lspconfig.denols.setup {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  single_file_support = false,
}

lspconfig.htmx.setup {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
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
    capabilities = capabilities,
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
      on_attach = on_attach,
      capabilities = capabilities,
    },
    projectionist = {
      enable = false
    }
  }
end
