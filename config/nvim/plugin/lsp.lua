-- lsp sign icons
local signs = { Error = " ", Warn = "", Hint = "ﯧ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
})

local ensure_installed_list = {
  'awk_ls', 'bashls', 'clangd', 'rust_analyzer', 'dockerls', 'eslint', 'html', 'jsonls', 'jdtls', 'kotlin_language_server', 'tsserver',
  'lua_ls', 'marksman', 'pyright', 'volar', 'lemminx'
}

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = ensure_installed_list
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>a', vim.diagnostic.open_float, opts)
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
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<F4>', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local lspconfig = require('lspconfig')

for _, lserver in pairs(ensure_installed_list) do
  lspconfig[lserver].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
  }
end
lspconfig.jdtls.setup{
  cmd = { 'jdtls' },
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = cmp_capabilities,
}

-- flutter setup
require("flutter-tools").setup {
  lsp = {
    on_attach = on_attach,
    capabilities = cmp_capabilities,
  }
}
