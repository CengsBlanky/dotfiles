local autocmd = vim.api.nvim_create_autocmd
local setnmap = function (action, cmd) vim.keymap.set("n", action, cmd, { nowait = true, silent = true, buffer = true }) end

autocmd({ "FileType" }, {
  callback = function ()
    vim.opt.formatoptions:remove({ "o" })
    vim.opt.formatoptions:append({ "M" })
    -- set readonly map
    if not vim.bo.modifiable or vim.bo.readonly then
      setnmap("q", "<Cmd>Quit<CR>")
      setnmap("u", "<C-b>")
      setnmap("<space>", "<C-f>")
    end
  end,
})

autocmd({ "FileType" }, {
  pattern = { "qf" },
  callback = function ()
    setnmap("q", "<Cmd>Quit<CR>")
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function ()
    -- Return to last edit position when opening files
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

autocmd({ "FileType" }, {
  pattern = { "markdown", "text", "log", "http", "rest" },
  callback = function ()
    setnmap("j", "gj")
    setnmap("k", "gk")
    setnmap("0", "g0")
    setnmap("$", "g$")
  end,
})
-- for markdown readibility
autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function ()
    vim.opt_local.formatoptions:remove({ "l" })
    vim.opt_local.formatoptions:append({ "]" })
  end,
})

autocmd({ "FileType" }, {
  pattern = { "nerdtree" },
  callback = function ()
    vim.opt_local.cursorline = true
    vim.opt_local.cursorlineopt = "number,line"
    vim.opt_local.wrap = true
    setnmap("<C-j>", "<C-f>")
    setnmap("<C-k>", "<C-b>")
  end,
})

autocmd({ "BufEnter" }, {
  pattern = { "*.log" },
  callback = function ()
    vim.opt_local.wrap = true
    vim.opt_local.tabstop = 1
  end,
})

autocmd({ "BufRead" }, {
  pattern = { "*.hex", "*.xxd" },
  callback = function () vim.opt_local.filetype = "xxd" end,
})

autocmd({ "BufRead" }, {
  pattern = { "*.s", ".S" },
  callback = function () vim.opt_local.filetype = "asm" end,
})

autocmd({ "FileType" }, {
  pattern = {
    "html",
    "xhtml",
    "htmldjango",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "yaml",
    "sql",
    "json",
    "jsonc",
    "vim",
    "lua",
    "dart",
    "svelte",
    "http",
    "xml",
    "go",
    "conf",
  },
  callback = function ()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

autocmd({ "FileType" }, {
  pattern = { "go", "gomod" },
  callback = function ()
    -- golang use tab instead of spaces
    vim.opt_local.expandtab = false
    vim.opt_local.listchars = {
      tab = "  ",
    }
  end,
})

autocmd({ "BufReadPost" }, {
  pattern = { "quickfix" },
  callback = function () setnmap("<Enter>", "<Enter>") end,
})

autocmd({ "FileType" }, {
  pattern = { "help" },
  command = "wincmd =",
})

autocmd({ "VimResized" }, {
  command = "wincmd =",
})

autocmd({ "CursorMoved" }, {
  desc = "highlight current word by lsp",
  callback = function ()
    if vim.fn.mode() == "n" then
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      local support_hl = false
      for _, client in ipairs(clients) do
        if client.server_capabilities.documentHighlightProvider then
          support_hl = true
          break
        end
      end

      if support_hl then
        vim.lsp.buf.clear_references()
        vim.lsp.buf.document_highlight()
      end
    end
  end,
})

autocmd({ "CursorMovedI" }, {
  desc = "clear highlight after insert",
  callback = function () vim.lsp.buf.clear_references() end,
})

autocmd({ "BufEnter" }, {
  desc = "disable auto completion for certain filetypes",
  pattern = "*.typr",
  callback = function () vim.b.completion = false end,
})

autocmd("BufLeave", {
  desc = "auto save buffer before leaving",
  callback = function ()
    if vim.bo.modified then
      vim.cmd("write")
    end
  end,
})
