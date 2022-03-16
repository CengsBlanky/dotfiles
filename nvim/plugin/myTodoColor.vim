autocmd FileType * highlight Todo guibg=none guifg=#ffb90f gui=bold cterm=bold
autocmd FileType * syntax keyword myTodo contained NOTE[:] DONE[:] WARN[ING:]
autocmd FileType * syntax cluster vimCommentGroup add=myTodo
autocmd FileType * hi link myTodo Todo
