" basic {{{
let g:markdown_folding = 1
set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8
let $LANG='en_US'
set hidden
set number
set relativenumber
set backspace=2
set incsearch
set smartcase
set tabstop=4 shiftwidth=4 expandtab smartindent autoindent shiftround
set softtabstop=4
set showcmd
set laststatus=2
set wildmenu
set wildoptions+=tagfile
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
set mousehide
set nocursorline
set splitright
set splitbelow
set textwidth=0
" }}}
" keymaps {{{
nnoremap <Enter>  :w<CR>
nnoremap <silent><M-b> :bd<CR>
nnoremap <silent><C-n> :bn<CR>
nnoremap <Space> <C-f>
nnoremap <Backspace> <C-b>
nnoremap <M-q> :x<CR>
nnoremap <Esc>q :x<CR>
nnoremap <silent><Tab> :Lexplore<CR>
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <leader>- :sp<CR>
nnoremap <leader>/ :vs<CR>
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <silent><leader>s :set hlsearch!<CR>
nnoremap gy :%y<CR>

inoremap jk <ESC>
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap {<Space> {<Space><Space>}<Esc>hi
inoremap [<Space> [<Space><Space>]<Esc>hi
" }}}
" command {{{
command! Editrc execute 'edit $MYVIMRC'
command! Reloadrc execute 'source $MYVIMRC'
command! -nargs=+ Grep execute 'silent grep! <args>' | copen
" insert current datetime
command! Curtime :put = strftime('%Y-%m-%d %H:%M:%S')
command! Curdate :put = strftime('%Y-%m-%d')
" }}}
" wsl share clipboard {{{
" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
" }}}
" autocmd {{{
" disable beep and screen flash both in terminal vim and gvim
autocmd VimEnter * set vb t_vb=
autocmd FileType javascript,html,vim set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal foldlevel=6
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType * set formatoptions-=o
" code run
autocmd FileType python nnoremap <leader>r :!python %<CR>
autocmd FileType go nnoremap <leader>r :!go run %<CR>
autocmd FileType java inoremap ; <Esc>A;
" code formatter
autocmd FileType go nnoremap <leader>f :silent !gofmt -w %<CR>
autocmd FileType java nnoremap <leader>r :!javac %:t && java %:t:r<CR>
autocmd FileType json nnoremap <silent><leader>f :%!jq<CR>
autocmd FileType xml nnoremap <silent><leader>f :%!xmllint --format -<CR>
" }}}
" netrw setting {{{
let g:netrw_winsize=40
let g:netrw_usetab=1
let g:netrw_keepdir=0
" }}}
" plugins {{{
let plugin_path="~/.config/nvim/plugins"
let plugin_manager="~/.config/nvim/autoload/plug.vim"
execute 'source' plugin_manager
call plug#begin(fnameescape(plugin_path))
Plug 'tpope/vim-surround.git'
Plug 'tpope/vim-commentary.git'
Plug 'justinmk/vim-sneak.git'
Plug 'tpope/vim-fugitive.git'
Plug 'junegunn/vim-easy-align.git' " align text easily
Plug 'preservim/nerdtree.git', { 'on': 'NERDTreeToggle'}
Plug 'romainl/vim-cool.git' " better hlsearch
Plug 'pangloss/vim-javascript.git'
Plug 'rust-lang/rust.vim.git'
Plug 'mattn/emmet-vim.git' " powerful assert tags
Plug 'honza/vim-snippets.git'
Plug 'ap/vim-buftabline.git'
call plug#end()

" NERDTreeToggle {{{
let NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=3
let g:NERDTreeStatusline=' 飭?
let NERDTreeIgnore=[
      \ '\.lock$[[file]]', '\.o$[[file]]', '\.out$[[file]]', '\.class$[[file]]', '\.exe$[[file]]', '\.bin$[[file]]', '\.svg$[[file]]', '\.png$[[file]]', '\.jpg$[[file]]',
      \ '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^lib$[[dir]]'
      \ ]
nnoremap <silent><Tab> :NERDTreeToggle<CR>
" }}}
" tpope/vim-surround {{{
autocmd FileType typescriptreact,javascriptreact nmap t <Plug>YSsurround
" }}}
" tpope/vim-commentary {{{
augroup commentary_vim
  autocmd!
  autocmd FileType c setlocal commentstring=//\ %s
  autocmd FileType cpp setlocal commentstring=//\ %s
augroup END
" }}}
" figutive {{{
nnoremap <leader>g :G<CR>
" }}}
" buftabline {{{
let g:buftabline_show=1
let g:buftabline_indicators=1
let g:buftabline_numbers=2
nnoremap <leader>1 <Plug>BufTabLine.Go(1)
nnoremap <leader>2 <Plug>BufTabLine.Go(2)
nnoremap <leader>3 <Plug>BufTabLine.Go(3)
nnoremap <leader>4 <Plug>BufTabLine.Go(4)
nnoremap <leader>5 <Plug>BufTabLine.Go(5)
nnoremap <leader>6 <Plug>BufTabLine.Go(6)
nnoremap <leader>7 <Plug>BufTabLine.Go(7)
nnoremap <leader>8 <Plug>BufTabLine.Go(8)
nnoremap <leader>9 <Plug>BufTabLine.Go(9)
nnoremap <leader>0 <Plug>BufTabLine.Go(10)

" }}}
" colorscheme {{{
colorscheme ron
" }}}
" }}}
" highlight groups {{{
hi Comment      guifg=DarkGreen guibg=NONE
hi Search       guifg=NONE      guibg=LightGray
hi Visual       guifg=NONE      guibg=LightGray
hi String       guifg=DarkBlue
hi SignColumn   guibg=NONE
hi NonText      guifg=White
hi Pmenu        guifg=DarkGray  guibg=LightGray
hi PmenuSel     guifg=Black
hi PmenuSbar    guifg=Gray      guibg=LightGray
hi PmenuThumb   guifg=Gray      guibg=Gray
hi VertSplit    guifg=White     guibg=DarkGray
hi MatchParen   guifg=NONE      guibg=NONE      gui=bold,underline
hi Folded       guifg=Gray      guibg=NONE      gui=NONE ctermbg=NONE
hi CursorLine   ctermfg=NONE    ctermbg=DarkGray cterm=NONE

hi BufTabLineCurrent guifg=Black    guibg=Grey      gui=NONE ctermfg=Black ctermbg=DarkGray  cterm=NONE
hi BufTabLineHidden  guifg=DarkGrey guibg=LightGrey gui=NONE ctermfg=Gray ctermbg=NONE cterm=NONE
hi BufTabLineFill    guifg=White    guibg=NONE      gui=NONE ctermfg=NONE ctermbg=NONE  cterm=NONE
" }}}
"{{{ simple status line
let s:filetypes = {
      \ 'asm':             '顦?,
      \ 'c':               '顦?,
      \ 'cpp':             '顦?,
      \ 'rust':            '顬?,
      \ 'java':            '顗?,
      \ 'go':              '顦?,
      \ 'lua':             '顦?,
      \ 'python':          '顪?,
      \ 'dart':            '顬?,
      \ 'sql':             '飸?,
      \
      \ 'javascript':      '顫?,
      \ 'typescript':      '顦?,
      \ 'html':            '顪?,
      \ 'css':             '顦?,
      \ 'vue':             '锏?,
      \ 'tsx':             '顬?,
      \ 'typescriptreact': '顬?,
      \
      \ 'json':            '顦?,
      \ 'xml':             '铯?,
      \ 'yaml':            '顦?,
      \ 'toml':            '顦?,
      \
      \ 'markdown':        '顦?,
      \ 'dockerfile':      '飳?,
      \
      \ 'sh':              '顬?,
      \ 'awk':             '顬?,
      \ 'vim':             '顭?,
      \ 'fish':            '餃?,
      \ 'crontab':         '飾?,
      \ 'fstab':           '顦?,
      \ 'conf':            '顦?,
      \ 'sshconfig':       '顦?,
      \ 'log':             '餄?,
      \ 'text':            '顦?,
      \
      \ 'lock':            '飥?,
      \ 'help':            '飸?,
      \ '':                '飪?
\ }

let s:fileformats = {
      \ 'dos':  '顪?,
      \ 'unix': '顪?,
      \ 'mac':  '顪?,
\ }

let s:systypes = {
      \ 'Linux':   '顪?,
      \ 'Darwin':  '顪?,
      \ 'Windows': '顪?,
\ }

" detect OS
if !exists("g:os")
  if has("unix")
    let g:os = substitute(system('uname'), '\n', '', '')
  else
    let g:os = "Windows"
  endif
endif

function! FileformatIcon()
  return get(s:fileformats, &fileformat, '')
endfunction

function! FiletypeIcon()
  return get(s:filetypes, &filetype, '')
endfunction

function! SystypeIcon()
  return get(s:systypes, g:os, '')
endfunction

hi StatusLine   ctermfg=DarkGray ctermbg=Black
hi StatusLineNC ctermfg=DarkGray ctermbg=Gray
hi User1 ctermbg=none
hi User2 ctermfg=DarkGray ctermbg=none
hi User3 ctermfg=Gray ctermbg=White

set statusline=\ %{FiletypeIcon()}%*
set statusline+=\ %f
set statusline+=%{&readonly?'\ 飥?:''}
set statusline+=%{&modified?'\ 锃?:''}
set statusline+=\ %2*顐?1*
set statusline+=%=
set statusline+=%2*
set statusline+=顐?set statusline+=%*
set statusline+=%2{FileformatIcon()}
set statusline+=%8.50l/%-8.50L
set statusline+=%-4.10P
"}}}
