" basic {{{
set nocompatible
set mouse=                      " Reset the mouse setting from defaults
let g:skip_defaults_vim = 1     " Do not source defaults.vim again (after loading this system vimrc)
filetype plugin indent on
syntax on
set encoding=utf-8
let $LANG='en_US'
set hidden
set number
set relativenumber
set backspace=2
set scrolloff=20
set incsearch
set ignorecase
set smartcase
set tabstop=4 shiftwidth=4 expandtab smartindent autoindent shiftround
set softtabstop=4
set cindent
set showcmd
set laststatus=2
set completeopt+=popup
set wildmode=list:longest,full  " Better command line completion
set wildmenu
set wildoptions=pum
set showmatch
set autoread
set autowrite
set confirm
set updatetime=100
set noswapfile
set nobackup
set noundofile
set clipboard=unnamed
set hlsearch
set mouse=n
set mousehide
set cursorline
set cursorlineopt=number
set splitright
set splitbelow
set textwidth=0
set timeoutlen=1000
set ttimeoutlen=5
set shortmess-=S
set textwidth=0
set noshowmode
set novisualbell
set belloff=all
set t_vb=
if has("gui_running")
  set guicursor+=a:blinkon0
  set guifont=UbuntuMono\ NF:h13
  set guioptions -=m 
  set guioptions -=T
  set guioptions -=L
  set guioptions -=r
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  autocmd GUIEnter * simalt ~x
else
  let g:everforest_transparent_background = 2
endif
" use rg in vim
if executable("rg")
    set grepprg=rg\ --vimgrep\ --smart-case\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}
" keymaps {{{
nnoremap <Enter> :w<CR>
nnoremap <silent><C-s> :wa<CR>
nnoremap <leader>q :xa<CR>
nnoremap <leader>` g~iw
vnoremap <leader>` g~
nnoremap <silent><C-n> :bn<CR>
nnoremap <silent><leader>- :sp<CR>
nnoremap <silent><leader>/ :vs<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent><leader>s :set hlsearch!<CR>
nnoremap <nowait><Space>b :bd<CR>
nnoremap <nowait><C-p> :b#<CR>
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
nnoremap gy :%y<CR>
nnoremap gl ^yg_
inoremap jk <ESC>
nnoremap <silent><M-h> <C-w>h
nnoremap <silent><M-j> <C-w>j
nnoremap <silent><M-k> <C-w>k
nnoremap <silent><M-l> <C-w>l
nnoremap <silent><M-w> <C-w>c
nnoremap <silent><M-o> <C-w>o
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap ]Q :clast<CR>
nnoremap [Q :cfirst<CR>

" }}}
" command {{{
command! Reloadrc source D:/DevTools/gvim/Vim/_vimrc
" insert current datetime
function! OpenExplorer() abort
  " let path = expand("%:p:h")
  silent exe '!Explorer /select,.'
endfunction
nnoremap <silent><C-e> :call OpenExplorer()<CR>
" bufonly script
nnoremap <leader>o :Bonly<CR>
command! -nargs=? -complete=buffer -bang Bonly :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
  if a:buffer == ''
    " No buffer provided, use the current buffer.
    let buffer = bufnr('%')
  elseif (a:buffer + 0) > 0
    " A buffer number was provided.
    let buffer = bufnr(a:buffer + 0)
  else
    " A buffer name was provided.
    let buffer = bufnr(a:buffer)
  endif

  if buffer == -1
    echohl ErrorMsg
    echomsg "No matching buffer for" a:buffer
    echohl None
    return
  endif

  let last_buffer = bufnr('$')

  let delete_count = 0
  let n = 1
  while n <= last_buffer
    if n != buffer && buflisted(n)
      if a:bang == '' && getbufvar(n, '&modified')
        echohl ErrorMsg
        echomsg 'No write since last change for buffer'
              \ n '(add ! to override)'
        echohl None
      else
        silent exe 'bdel' . a:bang . ' ' . n
        if ! buflisted(n)
          let delete_count = delete_count+1
        endif
      endif
    endif
    let n = n+1
  endwhile

  echomsg delete_count "buffer(s) deleted"

endfunction
" }}}
" plugins {{{
let plugin_path="D:/vimconf/plugins"
let plugin_manager="D:/vimconf/plug.vim"
execute 'source' plugin_manager
call plug#begin(fnameescape(plugin_path))
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align' " align text easily
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'junegunn/fzf',
Plug 'junegunn/fzf.vim',
Plug 'ludovicchabant/vim-gutentags'
Plug 'romainl/vim-cool' " better hlsearch
Plug 'Eliot00/auto-pairs'
Plug 'ap/vim-buftabline'
Plug 'sainnhe/everforest'
call plug#end()

" NERDTreeToggle {{{
let NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=3
let g:NERDTreeStatusline=' [NERDTree]'
let g:NERDTreeCaseSensitiveFS = 1
let NERDTreeShowLineNumbers=1
let NERDTreeIgnore=[
      \ '\.lock$[[file]]', '\.o$[[file]]', '\.out$[[file]]', '\.class$[[file]]', '\.exe$[[file]]', '\.bin$[[file]]', '\.svg$[[file]]', '\.png$[[file]]', '\.jpg$[[file]]',
      \ '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^lib$[[dir]]'
      \ ]
nnoremap <silent><Tab> :NERDTreeToggle<CR>
" }}}
" buftabline {{{
let g:buftabline_show=1
let g:buftabline_indicators=1
let g:buftabline_numbers=2
nmap <nowait><Space>1 <Plug>BufTabLine.Go(1)
nmap <nowait><Space>2 <Plug>BufTabLine.Go(2)
nmap <nowait><Space>3 <Plug>BufTabLine.Go(3)
nmap <nowait><Space>4 <Plug>BufTabLine.Go(4)
nmap <nowait><Space>5 <Plug>BufTabLine.Go(5)
nmap <nowait><Space>6 <Plug>BufTabLine.Go(6)
nmap <nowait><Space>7 <Plug>BufTabLine.Go(7)
nmap <nowait><Space>8 <Plug>BufTabLine.Go(8)
nmap <nowait><Space>9 <Plug>BufTabLine.Go(9)
nmap <nowait><Space>0 <Plug>BufTabLine.Go(10)
" }}}
" auto-pair {{{
let g:AutoPairsCenterLine=0
"}}}
" fzf {{{
let g:fzf_preview_window = []
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>g :RG<CR>
nnoremap <Leader>b :Buffers<CR>
" }}}
" theme&statusline {{{
set termguicolors
set background=dark

let g:everforest_better_performance=1
colorscheme everforest
set statusline=\ %w%f\ %h%m%r%=%-y%8P%16(%l,%c/%L%)
" }}}
" }}}
" autocmd {{{
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
autocmd VimEnter * set textwidth=0
autocmd FileType * set formatoptions-=o
autocmd FileType javascript,html,vim,json,text,typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal foldlevel=6
autocmd FileType xml setlocal nowrap
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType json,javascript setlocal nowrap
autocmd FileType tags,qf nnoremap <buffer> <Enter> <Enter>
autocmd BufRead *.log setlocal filetype=log
autocmd BufRead *.painless setlocal filetype=java
" formatter
set formatprg=jq
autocmd FileType json setlocal formatprg=jq
autocmd FileType xml setlocal formatprg="xmllint --format -"

" Set UTF-8 as the default encoding for commit messages
autocmd BufReadPre COMMIT_EDITMSG,MERGE_MSG,git-rebase-todo setlocal fileencodings=utf-8

" Remember the positions in files with some git-specific exceptions"
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$")
  \           && &filetype !~# 'commit\|gitrebase'
  \           && expand("%") !~ "ADD_EDIT.patch"
  \           && expand("%") !~ "addp-hunk-edit.diff" |
  \   exe "normal g`\"" |
  \ endif

  autocmd BufNewFile,BufRead *.patch set filetype=diff

  autocmd Filetype diff
  \ highlight WhiteSpaceEOL ctermbg=red |
  \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/
" }}}
" formatter {{{
vnoremap <silent><Space>f gq
nnoremap <silent><Space>f gggqG
" }}}
" highlight {{{
hi link markdownError Normal
hi Folded ctermbg=NONE ctermfg=DarkGray
hi Comment ctermfg=DarkGray
hi CursorLineNr guifg=#ebcb8b
" }}}
