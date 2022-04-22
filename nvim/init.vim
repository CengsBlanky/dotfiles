" predefined variables {{{
let vim_config_file="~/.config/nvim/init.vim"
let plugin_path="~/.vim/plugins/"
let plug_manager="~/.vim/plug.vim"
let g:python_host_skip_check=1
let g:python3_host_skip_check=1
let g:markdown_folding = 1
let g:python3_host_prog = '/usr/bin/python'
if &shell =~# 'fish$'
  set shell=sh
endif
" }}}
" plugins {{{
execute 'source' plug_manager
call plug#begin(fnameescape(plugin_path))
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:tpope/vim-commentary.git'
Plug 'git@github.com:justinmk/vim-sneak.git'
Plug 'git@github.com:jiangmiao/auto-pairs.git'
Plug 'git@github.com:tpope/vim-fugitive.git'
Plug 'git@github.com:airblade/vim-gitgutter.git'
Plug 'git@github.com:junegunn/vim-easy-align.git' " align text easily
Plug 'git@github.com:preservim/nerdtree.git', { 'on': 'NERDTreeToggle'}
Plug 'git@github.com:neoclide/coc.nvim.git', {'branch': 'release'}
Plug 'git@github.com:romainl/vim-cool.git' " better hlsearch
Plug 'git@github.com:aperezdc/vim-template.git'
Plug 'git@github.com:junegunn/fzf.git', { 'do': { -> fzf#install() } }
Plug 'git@github.com:junegunn/fzf.vim.git'
Plug 'git@github.com:jsborjesson/vim-uppercase-sql.git', {'for': 'sql'}
Plug 'git@github.com:pangloss/vim-javascript.git'
Plug 'git@github.com:rust-lang/rust.vim.git'
Plug 'git@github.com:fatih/vim-go.git', {'do': ':GoUpdateBinaries'}
Plug 'git@github.com:mattn/emmet-vim.git' " powerful assert tags
Plug 'git@github.com:dag/vim-fish.git'
Plug 'git@github.com:honza/vim-snippets.git'
Plug 'git@github.com:ap/vim-buftabline.git'
Plug 'git@github.com:christoomey/vim-tmux-navigator.git'
Plug 'git@github.com:sainnhe/gruvbox-material.git'
Plug 'git@github.com:nvim-treesitter/nvim-treesitter.git', {'do': ':TSUpdate'}
Plug 'git@github.com:ryanoasis/vim-devicons.git'
call plug#end()
" }}}
" plugins setting {{{
" NERDTreeToggle {{{
let NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=3
let g:NERDTreeStatusline=' פּ'
let NERDTreeIgnore=[
      \ '\.lock$[[file]]', '\.o$[[file]]', '\.out$[[file]]', '\.class$[[file]]', '\.exe$[[file]]',
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
" auto-pair {{{
augroup AutoPair_Custom
  autocmd!
  autocmd FileType html,php,jsp let b:AutoPairs = AutoPairsDefine({'<!--':'-->', '<?':'?>', '<?php':'?>', '<%':'%>'})
augroup END
let g:AutoPairsMapCR = 0
" }}}
" airblade/vim-gitgutter {{{
let g:gitgutter_sign_priority = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
" }}}
" junegunn/vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" aperezdc/vim-template {{{
let g:templates_no_autocmd=1
let g:templates_directory=["~/.vim/templates/"]
let g:username='zengshuai'
let g:email='zengs1994@gmail.com'
" }}}
" neoclide/coc.nvim {{{
let g:coc_config_home="~/.vim/"
" Global extension names to install when they aren't installed.
let g:coc_global_extensions=[
      \ 'coc-clangd',
      \ 'coc-rls',
      \ 'coc-go',
      \ 'coc-pyright',
      \
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-tsserver',
      \ '@yaegassy/coc-volar',
      \ 'coc-flutter',
      \
      \ 'coc-sh',
      \
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ ]
" Configure the directory which will be used to for coc data
" files(extensions...)
let g:coc_data_home="~/.vim/coc_data/"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g] <Plug>(coc-diagnostic-prev)
nmap <silent> g[ <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Format whole buffer use Format
nnoremap <leader>f :Format<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Auto format before buffer write
if filereadable('.clang-format')
  autocmd BufWritePre *.c,*.h,*.cpp :call CocAction('format')
endif
" autoformat
autocmd BufWritePre *.py :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }}}
" rust.vim {{{
let g:rustfmt_autosave = 1
" }}}
" emmet vim {{{
" emmet default leader key: <C-y>
let g:user_emmet_mode='a'    "enable emmet in all mode
let g:user_emmet_install_global = 1
" }}}
" junegunn/fzf {{{
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading  --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <C-p> :Files<cr>
nnoremap <C-l> :RG<cr>
" }}}
" buftabline {{{
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
" }}}
" vim-tmux-navigator {{{
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>
" }}}
" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "java", "javascript", "typescript", "css", "python", "bash", "toml", "yaml"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = {},  -- optional, list of language that will be disabled
  }
}
EOF
" }}}
" colorscheme {{{
let &t_ut=''
set t_Co=256
set termguicolors

let g:gruvbox_material_enable_bold=1
let g:gruvbox_material_transparent_background=1
let g:gruvbox_material_better_performance=1
colorscheme gruvbox-material
" }}}
" }}}
" editor {{{
" default {{{
set nocompatible
filetype plugin indent on
syntax on
language en_US.UTF-8
" unicode characters in the file autoload/float.vim
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
" set shorter updatetime for better user experience
set updatetime=100
" set nobackup set nowritebackup set noswapfile set noundofile
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set clipboard+=unnamedplus
" add ctags support
set tags=tags
set shortmess+=c
set hlsearch
set mousehide
set mouse=nv
set signcolumn=yes
set nowrap
set cmdheight=1
set showtabline=2
set splitbelow
set splitright
" set default grep cmd
set grepprg=rg\ -p\ --vimgrep\ --ignore-file\ ~/.vim/ignorefile
set grepformat=%f:%l:%c:%m
" }}}
" keymappings {{{
inoremap jk <esc>
nnoremap <M-q> :x<CR>
" close current buffer
noremap <silent><M-b> :bd<CR>
" yank whole buffer
nnoremap gy :%y<CR>
" close other buffers see line: 590
nnoremap <leader>o :Bonly<CR>
" use command to open my vimrc
command! Editrc execute 'edit' vim_config_file
command! Reloadrc execute 'edit' vim_config_file
" use backspace to scroll up and Space to scroll down
nnoremap <silent><BS> <C-b>
nnoremap <silent><Space> <C-f>
" switch between buffers
nnoremap <silent><nowait><RIGHT> :bn<CR>
nnoremap <silent><nowait><LEFT> :bp<CR>
" go next buffer
nnoremap <C-n> :bn<CR>
" cd to current file directory
nnoremap <leader>cd :lcd %:p:h<CR>
" map <esc> to quit terminal mode
tnoremap <Esc> <C-\><C-n>
" save
nnoremap <silent><Enter> :w<CR>
" resize window
nnoremap <silent><leader><UP> :resize +1<CR>
nnoremap <silent><leader><DOWN> :resize -1<CR>
nnoremap <silent><leader><RIGHT> :vertical resize +1<CR>
nnoremap <silent><leader><LEFT> :vertical resize -1<CR>
" split current window
nnoremap <silent><leader>- :split<CR>
nnoremap <silent><leader>/ :vsplit<CR>
" navigate windows
" nnoremap <M-j> <C-w>j
" nnoremap <M-k> <C-w>k
" nnoremap <M-h> <C-w>h
" nnoremap <M-l> <C-w>l

" buffer jump
if !exists("g:buftabline_numbers")
  nnoremap <leader>1 :b1<CR>
  nnoremap <leader>2 :b2<CR>
  nnoremap <leader>3 :b3<CR>
  nnoremap <leader>4 :b4<CR>
  nnoremap <leader>5 :b5<CR>
  nnoremap <leader>6 :b6<CR>
  nnoremap <leader>7 :b7<CR>
  nnoremap <leader>8 :b8<CR>
  nnoremap <leader>9 :b9<CR>
  nnoremap <leader>0 :b10<CR>
endif

" quickfix list operations
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>

" }}}
" customize command {{{
" better grep
command! -nargs=+ Grep execute 'silent grep! <args>' | copen
" indent whole buffer
command! IndentBuf normal gg=G

" }}}
" autocmd {{{

" set filetypes as typescriptreact
augroup filetype_specific
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
  autocmd BufNewFile,BufRead *.log set filetype=log
augroup END

augroup filetype_indent_size
  autocmd!
  autocmd FileType html,css,javascript,typescript,typescriptreact,vue,yaml,sql,json,vim
        \ setlocal tabstop=2 shiftwidth=2
augroup END

function! TrimEndLinesAndTrailingSpaces() abort
  let save_cursor = getpos(".")
  silent! %s#\($\n\s*\)\+\%$##
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

function! IndentAll() abort
  let save_cursor = getpos(".")
  silent! IndentBuf
  call setpos('.', save_cursor)
endfunction

augroup filetype_edit_behavior
  autocmd!
  autocmd FileType * setlocal textwidth=0
  " do not auto add comment when add new comment line in normal mode
  autocmd FileType * setlocal formatoptions-=o
  " auto remove all trailing empty lines before saving
  autocmd BufWritePre *.c,*.cpp,*.h,*.js,*.html,*.sh,*.py,*.yml,*.yaml,*.java
        \ call TrimEndLinesAndTrailingSpaces()
  autocmd BufWritePre *.java,*.lua,*.sh
        \ call IndentAll()
  " disable syntax for large file
  autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif
augroup END

augroup keymap_force
  autocmd!
  " autocmd BufEnter * nnoremap <nowait><silent> <Space> <C-f>
  " unremap <CR> key when in quickfix list
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" }}}
" default colors {{{
highlight Comment guifg=DarkGray gui=none
highlight Visual guibg=Gray guifg=Black
highlight SignColumn gui=bold guibg=none
highlight Folded ctermfg=DarkGrey ctermbg=none guifg=DarkGrey guibg=none
highlight Search guifg=Black guibg=Gray gui=bold
highlight MatchParen gui=bold,underline
highlight StatusLine gui=bold
highlight LineNr gui=bold guibg=none guifg=none
highlight LineNrAbove gui=none guibg=none guifg=gray
highlight LineNrBelow gui=none guibg=none guifg=gray
" plugins color
highlight CocUnusedHighlight guifg=DarkYellow gui=underline
highlight BufTabLineCurrent guibg=#4c566a guifg=#eceff4 gui=bold
highlight BufTabLineFill guibg=none guifg=none ctermfg=none ctermbg=none gui=none
highlight BufTabLineHidden guibg=none guifg=none ctermfg=none ctermbg=none gui=none
highlight GitGutterAdd    guibg=none guifg=#74b816 ctermfg=2 gui=bold
highlight GitGutterChange guibg=none guifg=#fdb924 ctermfg=3 gui=bold
highlight GitGutterDelete guibg=none guifg=#c92a2a ctermfg=1 gui=bold

" }}}
" }}}
