set nocompatible
filetype plugin indent on
syntax on
language en_US.UTF-8
set encoding=utf-8
set hidden
set number
set relativenumber
set backspace=2
set incsearch
set ignorecase
set smartcase
set tabstop=4 shiftwidth=4 expandtab smartindent autoindent shiftround
set softtabstop=4
set showcmd
set wildmenu
set wildoptions=pum,tagfile
set showmatch
set autoread
set autowrite
set confirm
set updatetime=100
set noundofile
set nobackup
set clipboard^=unnamed,unnamedplus
set tags=tags
set shortmess+=c
set hlsearch
set mousehide
set signcolumn=yes
set nowrap
set cmdheight=1

inoremap jk <esc>
" quit
" use <Esc> instead of <M- keybind
nnoremap <Esc>q :x<CR>
" close current or buffer
nnoremap <silent><Esc>b :bd<CR>
" yank whole buffer
nnoremap gy :%y<CR>
" use backspace to scroll up/down
nnoremap <silent><BS> <C-b>
nnoremap <silent><Space> <C-f>
" save
nnoremap <silent><Enter> :w<CR>
" go next buffer
nnoremap <C-n> :bn<CR>
