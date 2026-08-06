vim.pack.add({
  {
    src = "https://github.com/kylechui/nvim-surround",
  },
  {
    src = "https://github.com/numToStr/Comment.nvim",
  },
},
{
  load = true,
})

local configs = {
    "nvim-surround",
    "Comment.nvim",
}

for _, plugin in ipairs(configs) do
    local ok, module = pcall(require, plugin)

    if ok and module.setup then
        module.setup({})
    end
end
