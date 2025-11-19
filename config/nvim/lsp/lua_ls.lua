return {
  settings = {
    Lua = {
      workspace = {
        library = vim.tbl_filter(
          function (d) return not d:match(vim.fn.stdpath("config") .. "/?a?f?t?e?r?") end,
          vim.api.nvim_get_runtime_file("", true)
        ),
      },
    },
  },
}
