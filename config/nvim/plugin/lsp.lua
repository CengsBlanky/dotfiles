---@diagnostic disable: undefined-global
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = {
    severity = {
      min = vim.diagnostic.severity.ERROR
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
local setnmap = function (key, action, provide_opts)
  vim.keymap.set('n', key, action, provide_opts)
end
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
    setnmap('<leader>d', vim.lsp.buf.type_definition, bufopts)
    setnmap('<leader>r', vim.lsp.buf.rename, bufopts)
    setnmap('<leader>a', vim.lsp.buf.code_action, bufopts)
    setnmap('<leader>c', function() vim.lsp.codelens.run() end, bufopts)
    setnmap('<Space>d', vim.diagnostic.open_float, bufopts)
    setnmap('<Space>k', vim.diagnostic.goto_prev, bufopts)
    setnmap('<Space>j', vim.diagnostic.goto_next, bufopts)
  end,
})

local capabilities = require('blink.cmp').get_lsp_capabilities()
-- local lspconfig = require('lspconfig')
local lspconfig = vim.lsp.config
local installed_servers = require('mason-lspconfig').get_installed_servers()
lspconfig('*', {
  capabilities = capabilities,
})
vim.lsp.enable(installed_servers)

lspconfig('basedpyright', {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
      }
    }
  }
})

-- django-template-lsp
lspconfig('djlsp', {
  cmd = { "djlsp" },
  filetypes = { 'htmldjango' },
  root_markers = { 'manage.py' },
  capabilities = capabilities,
})
vim.lsp.enable('djlsp')

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
