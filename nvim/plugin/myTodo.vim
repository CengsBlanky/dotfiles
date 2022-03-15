highlight Todo guibg=none guifg=#ffb90f gui=bold cterm=bold
syntax keyword zsTodo contained NOTE[:] DONE[:] WARN[ING:]
syntax cluster vimCommentGroup add=zsTodo
hi link zsTodo Todo
