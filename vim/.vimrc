" default {{{
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
set laststatus=2
set wildmenu
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
set showtabline=2
set splitbelow
set splitright
set grepprg=rg\ -p\ --vimgrep\ --ignore-file\ ~/.vim/ignorefile
set grepformat=%f:%l:%c:%m
" }}}
" keymappings {{{
inoremap jk <esc>
" quit
" use <Esc> instead of <M- keybind
nnoremap <Esc>q :x<CR>
" close current or buffer
nnoremap <silent><Esc>b :bd<CR>
" yank whole buffer
nnoremap gy :%y<CR>
" use command to open/reload my vimrc
command! Editrc execute 'edit' vim_config_file
command! Reloadrc execute 'source' vim_config_file
" screen scroll add <nowait> to execute immediately
" see autocmd keymap_force to set scroll down
" use backspace to scroll up
nnoremap <silent><BS> <C-b>
nnoremap <silent><Space> <C-f>
" cd to current file directory
nnoremap <leader>cd :lcd %:p:h<CR>
" save
nnoremap <silent><Enter> :w<CR>
" split current window
nnoremap <silent><leader>- :split<CR>
nnoremap <silent><leader>/ :vsplit<CR>
" quickfix list operations
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>
" switch between buffers
nnoremap <silent><nowait><RIGHT> :bn<CR>
nnoremap <silent><nowait><LEFT> :bp<CR>
" go next buffer
nnoremap <C-n> :bn<CR>
" write as root
cmap w!! w !sudo tee > /dev/null %
" add new line between parenthesis
inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap {<Space> {<Space><Space>}<Esc>hi
inoremap [<Space> [<Space><Space>]<Esc>hi

" window navigation
nnoremap <Esc>h <C-w>h
nnoremap <Esc>j <C-w>j
nnoremap <Esc>k <C-w>k
nnoremap <Esc>l <C-w>l
" }}}
" autocmd {{{
augroup filetype_specific
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd BufRead,BufNewFile *.asm set filetype=asm
  autocmd BufRead *.log set filetype=text
  autocmd BufWinEnter * if line("$") > 3000 | syntax clear | endif
  autocmd BufRead,BufNewFile * if expand('%:t') =~ '^sql*' | set filetype=sql | endif
augroup END

function! TrimEndLinesAndTrailingSpaces()
  let save_cursor = getpos(".")
  silent! %s#\($\n\s*\)\+\%$##
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction
augroup filetype_edit_behavior
  autocmd!
  autocmd FileType * setlocal textwidth=0
  " do not auto add comment when add new comment line in normal mode
  autocmd FileType * setlocal formatoptions-=o
  " auto remove all trailing empty lines before saving
  autocmd BufWritePre *.c,*.cpp,*.h,*.js,*.html,*.sh,*.py,*.md,*.yml,*.yaml
        \ call TrimEndLinesAndTrailingSpaces()
augroup END

augroup keymap_force
  autocmd!
  " unremap <CR> key when in quickfix list
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" }}}
" statueline {{{
set statusline=\ %f
set statusline+=\ %r
set statusline+=%2m
set statusline+=%=
set statusline+=%y
set statusline+=%6.50l/%-6.50L
set statusline+=%P
set statusline+=\ 
" }}}
" environment {{{
let vim_config_file="~/.vimrc"
let plugin_path="~/.vim/plugins/"
" reset vim seperator
set fillchars+=vert:│

" }}}
" plugins {{{
call plug#begin(fnameescape(plugin_path))
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:tpope/vim-fugitive.git'
Plug 'git@github.com:justinmk/vim-sneak.git'
Plug 'git@github.com:preservim/nerdtree.git', { 'on': 'NERDTreeToggle'}
Plug 'git@github.com:mattn/emmet-vim.git'
Plug 'git@github.com:romainl/vim-cool.git'
Plug 'git@github.com:ap/vim-buftabline.git'
Plug 'git@github.com:christoomey/vim-tmux-navigator.git'
Plug 'git@github.com:jsborjesson/vim-uppercase-sql.git', {'for': 'sql'}
Plug 'git@github.com:sainnhe/gruvbox-material.git'
Plug 'git@github.com:sheerun/vim-polyglot.git'
call plug#end()
packadd! matchit
" }}}
" plugins setting {{{
" NERDTree
let NERDTreeMinimalUI=1
let g:NERDTreeStatusline=' פּ'
let g:NERDTreeQuitOnOpen=3
let NERDTreeIgnore=[
      \ '\.lock$[[file]]', '\.o$[[file]]', '\.out$[[file]]', '\.class$[[file]]', '\.exe$[[file]]',
      \ '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^lib$[[dir]]'
      \ ]
nnoremap <silent><Tab> :NERDTreeToggle<CR>

" buftabline 
let g:buftabline_show=1
let g:buftabline_indicators=1
let g:buftabline_numbers=2
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" tmux-vim-navigation
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> <Esc>h :TmuxNavigateLeft<cr>
nnoremap <silent> <Esc>j :TmuxNavigateDown<cr>
nnoremap <silent> <Esc>k :TmuxNavigateUp<cr>
nnoremap <silent> <Esc>l :TmuxNavigateRight<cr>
nnoremap <silent> <Esc>\ :TmuxNavigatePrevious<cr>
" }}}
" colors {{{
let g:gruvbox_material_better_performance=1
let g:gruvbox_material_disable_italic_comment=1
let g:gruvbox_material_transparent_background=1
set background=dark
colorscheme gruvbox-material
highlight Normal ctermfg=LightGray
highlight Comment ctermfg=Gray ctermbg=NONE
highlight Visual ctermfg=NONE ctermbg=DarkGray
highlight Search ctermfg=NONE ctermbg=DarkGray
highlight Folded ctermfg=DarkGrey ctermbg=NONE
highlight SignColumn ctermbg=NONE
highlight LineNr ctermfg=Gray
highlight MatchParen ctermbg=NONE cterm=underline,bold
" highlight StatusLine ctermfg=LightGray ctermbg=NONE cterm=bold 
" highlight StatusLineNC ctermfg=DarkGray ctermbg=NONE cterm=NONE
highlight NonText ctermfg=Black ctermbg=NONE

highlight TabLine ctermfg=White ctermbg=NONE cterm=NONE
highlight TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
highlight TabLineSel ctermfg=Black ctermbg=Gray

highlight Sneak ctermfg=NONE ctermbg=DarkGray
" }}}
