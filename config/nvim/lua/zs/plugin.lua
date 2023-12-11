-- nerdtree
vim.g.NERDTreeStatusline=' '
vim.g.NERDTreeQuitOnOpen = 3
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeIgnore = {
    '\\.lock$[[file]]', '\\.o$[[file]]', '\\.out$[[file]]', '\\.class$[[file]]', '\\.exe$[[file]]',
    '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^__pycache__$[[dir]]'
}
-- buftabline
vim.g.buftabline_show = 1
vim.g.buftabline_indicators = 1
vim.g.buftabline_numbers = 2
vim.keymap.set('n', '<Space>1', '<Plug>BufTabLine.Go(1)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>2', '<Plug>BufTabLine.Go(2)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>3', '<Plug>BufTabLine.Go(3)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>4', '<Plug>BufTabLine.Go(4)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>5', '<Plug>BufTabLine.Go(5)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>6', '<Plug>BufTabLine.Go(6)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>7', '<Plug>BufTabLine.Go(7)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>8', '<Plug>BufTabLine.Go(8)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>9', '<Plug>BufTabLine.Go(9)', { silent = true, nowait = true })
vim.keymap.set('n', '<Space>0', '<Plug>BufTabLine.Go(10)', { silent = true, nowait = true })
-- tmux navigator
vim.g.tmux_navigator_no_mappings = 1
