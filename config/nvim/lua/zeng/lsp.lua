---@diagnostic disable: undefined-global
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
  vim.keymap.set('n', '<leader>s', function() vim.lsp.codelens.run() end, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

local lserver_list = {
  'awk_ls', 'bashls', 'clangd', 'dockerls', 'html', 'jsonls', 'jdtls', 'kotlin_language_server', 'cssls', 'svelte', 'lua_ls', 'marksman', 'pyright', 'volar', 'gopls',
}

for _, lserver in pairs(lserver_list) do
  lspconfig[lserver].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- nodejs bun deno
lspconfig.ts_ls.setup {
  autostart = false,
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = true,
}

lspconfig.denols.setup {
  autostart = true,
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

-- flutter
require("flutter-tools").setup {
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
}

-- rust
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
