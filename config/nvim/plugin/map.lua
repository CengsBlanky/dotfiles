local setmap = function (mode, key, action)
  local opts = { silent = true, nowait = true }
  vim.keymap.set(mode, key, action, opts)
end

setmap("i", "jk", "<Esc>")
setmap("n", "<Enter>", "<Cmd>w<CR>")
setmap("n", "<leader>q", "<Cmd>xa<CR>")
setmap("n", "<M-w>", "<Cmd>close<CR>")
setmap("n", "<M-o>", "<C-w>o")
setmap("n", "<leader>-", "<Cmd>split<CR>")
setmap("n", "<leader>/", "<Cmd>vsplit<CR>")
setmap("n", "gy", "<Cmd>%y<CR>")
setmap("n", "gl", "^yg_")
setmap({ "n", "v" }, "<C-j>", "<C-f>")
setmap({ "n", "v" }, "<C-k>", "<C-b>")
setmap("n", "<leader>`", "g~iw")
setmap("n", "<C-p>", "<Cmd>b#<CR>")
setmap("n", "<Space>b", "<Cmd>bd<CR>")
setmap("n", "<C-n>", "<Cmd>bn<CR>")
setmap("v", "<leader>`", "g~")
-- trim lines both end
setmap("n", "<leader>t", "<cmd>%s/^\\s\\+\\|\\s\\+$//ge<CR>")
setmap("v", "<leader>t", ":s/^\\s\\+\\|\\s\\+$//ge<CR>")
-- trim and delete empty lines
setmap("n", "<leader>e", "<cmd>%s/^\\s\\+\\|\\s\\+$//ge|:silent! %g/^\\s*$/d<CR>")
setmap("v", "<leader>e", ":s/^\\s\\+\\|\\s\\+$//ge|:silent! '<,'>g/^\\s*$/d<CR>")
-- trim delete and sort
setmap("n", "<leader>u", "<cmd>%s/^\\s\\+\\|\\s\\+$//ge|%sort u|:silent! %g/^\\s*$/d<CR>")
setmap("v", "<leader>u", ":s/^\\s\\+\\|\\s\\+$//ge|'<,'>sort u|:silent! '<,'>g/^\\s*$/d<CR>")
-- go half page to left or right
setmap("n", "<Right>", "zL")
setmap("n", "<Left>", "zH")
-- restart with session
setmap("n", "<leader>R", function ()
  local session = vim.fn.stdpath("state") .. "/restart_session.vim"
  vim.cmd("mksession! " .. vim.fn.fnameescape(session))
  vim.cmd("restart source " .. vim.fn.fnameescape(session))
end)
