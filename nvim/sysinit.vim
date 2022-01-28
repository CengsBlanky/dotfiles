" default {{{
set nocompatible
filetype plugin indent on
syntax on
set fileformat=unix
set fileformats+=unix,dos
language en_US.UTF-8
" unicode characters in the file autoload/float.vim
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
" let mapleader=","
" let maplocalleader=","
inoremap jk <esc>
" TextEdit might fail if hidden is not set.
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
set showmatch
" when file has been chaged outside of vim buffer, autoload it
set autoread
" when switch between buffers or execute specific command save current buffer
set autowrite
set confirm
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
" set nobackup set nowritebackup set noswapfile set noundofile
set noundofile
set nobackup
set noswapfile
set clipboard=unnamed
set clipboard+=unnamedplus
" display
set hlsearch
set mousehide
set mouse=nv " enable mouse scroll etc...
set nowrap
set cmdheight=1
set splitbelow
" }}}
" keymappings {{{
nnoremap Q :x<CR>

" close current window or buffer
noremap <silent><M-w> :close<CR>
noremap <silent><M-b> :bd<CR>
" screen scroll add <nowait> to execute immediately
" see autocmd keymap_force to set scroll down
" use backspace to scroll up
nnoremap <silent><BS> <C-b>
" go next buffer
nnoremap <silent><TAB> :bn<CR>
" cd to current file directory
nnoremap <leader>cd :lcd %:p:h<CR>
" map <esc> to quit terminal mode
tnoremap <Esc> <C-\><C-n>
" save
nnoremap <silent><Enter> :w<CR>
" quickfix list operations
nnoremap <leader>o :copen<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>

" buffer jump
nnoremap <silent><leader>1 :b1<CR>
nnoremap <silent><leader>2 :b2<CR>
nnoremap <silent><leader>3 :b3<CR>
nnoremap <silent><leader>4 :b4<CR>
nnoremap <silent><leader>5 :b5<CR>
nnoremap <silent><leader>6 :b6<CR>
nnoremap <silent><leader>7 :b7<CR>
nnoremap <silent><leader>8 :b8<CR>
nnoremap <silent><leader>9 :b9<CR>
" }}}
" autocmd {{{
" set filetypes as typescriptreact
augroup filetype_specific
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_edit_behavior
  autocmd!
  autocmd FileType * setlocal textwidth=0
  " do not auto add comment when add new comment line in normal mode
  autocmd FileType * setlocal formatoptions-=o
  " auto remove all trailing empty lines before saving
  autocmd BufWritePre *.c,*.cpp,*.h,*.js,*.html,*.sh,*.py,*.yml,*.yaml,*.java
        \ call TrimEndLinesAndTrailingSpaces()
augroup END

augroup keymap_force
  autocmd!
  autocmd BufEnter * nnoremap <nowait><silent> <Space> <C-f>
  " unremap <CR> key when in quickfix list
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" }}}
