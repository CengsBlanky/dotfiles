" predefined variables {{{
let vim_config_file="~/.config/nvim/init.vim"
let plugin_path="~/.config/nvim/plugins/"
let plug_file="~/.config/nvim/plug.vim"
let g:python_host_skip_check=1
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/local/bin/python3.9'
" Configure the directory which will be used to for coc data
let g:coc_data_home="~/.config/nvim/coc_data/"
let g:coc_config_home="~/.config/nvim"
let g:markdown_folding = 1
" }}}
" plugins {{{
execute 'source' plug_file
call plug#begin(fnameescape(plugin_path))
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:tpope/vim-commentary.git'
Plug 'git@github.com:justinmk/vim-sneak.git'
Plug 'git@github.com:tpope/vim-fugitive.git'
Plug 'git@github.com:airblade/vim-gitgutter.git'
Plug 'git@github.com:junegunn/vim-easy-align.git' " align text
Plug 'git@github.com:terryma/vim-multiple-cursors.git'
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
Plug 'git@github.com:dag/vim-fish.git'
Plug 'git@github.com:dart-lang/dart-vim-plugin.git'
Plug 'git@github.com:mattn/emmet-vim.git'
Plug 'git@github.com:honza/vim-snippets.git'
Plug 'git@github.com:ap/vim-buftabline.git'
Plug 'git@github.com:christoomey/vim-tmux-navigator.git'
Plug 'git@github.com:norcalli/nvim-colorizer.lua.git'
Plug 'git@github.com:sainnhe/gruvbox-material.git'
Plug 'git@github.com:nvim-treesitter/nvim-treesitter.git', {'do': ':TSUpdate'}
Plug 'git@github.com:ryanoasis/vim-devicons.git'
call plug#end()
" }}}
" plugins setting {{{
" open NERDTreeToggle {{{
let g:NERDTreeStatusline=' '
let g:NERDTreeQuitOnOpen=3
let NERDTreeMinimalUI=1
let NERDTreeIgnore=[
      \ '\.lock$[[file]]', '\.o$[[file]]', '\.out$[[file]]', '\.class$[[file]]', '\.exe$[[file]]',
      \ '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^lib$[[dir]]'
      \ ]
nnoremap <silent><Tab> :NERDTreeToggle<CR>
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
" terryma/vim-multiple-cursors {{{
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<M-n>'
let g:multi_cursor_select_all_word_key = '<M-a>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<M-a>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=1
" }}}
" aperezdc/vim-template {{{
let g:templates_no_autocmd=1
let g:templates_directory=["~/.config/nvim/templates/"]
let g:username='zengshuai'
let g:email='zengs1994@gmail.com'
" }}}
" tpope/vim-commentary {{{
augroup commentary_vim
  autocmd!
  autocmd FileType c setlocal commentstring=//\ %s
  autocmd FileType cpp setlocal commentstring=//\ %s
augroup END
" }}}
" neoclide/coc.nvim {{{
" Global extension names to install when they aren't installed.
let g:coc_global_extensions=[
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-clangd',
      \ 'coc-rls',
      \ 'coc-go',
      \ 'coc-java',
      \ 'coc-tsserver',
      \ 'coc-pyright',
      \ 'coc-vetur',
      \ 'coc-flutter',
      \ '@yaegassy/coc-intelephense',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <CR> to confirm completion, use:
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

" Use <C-n>, <C-p>, <up> and <down> to navigate completion list:
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"

" Use <tab> and <S-tab> to navigate completion list:
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

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
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

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
let g:user_emmet_mode='a'
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
" tmux-vim navigator {{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>
" }}}
" colorscheme plugins {{{
let &t_ut=''
set t_Co=256
set termguicolors
let g:gruvbox_material_enable_bold=1
let g:gruvbox_material_transparent_background=1
let g:gruvbox_material_better_performance=1
colorscheme gruvbox-material
" nvim-colorizer {{{
lua <<EOF
require 'colorizer'.setup {
  'css';
  'vue';
  'javascript';
  'html';
}
EOF
" }}}

" }}}
" nvim-treesitter {{{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "java", "go", "javascript", "typescript", "css", "python", "bash", "html", "toml" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
" }}}
" editor {{{
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
" set nobackup set nowritebackup set noswapfile set noundofile
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set clipboard=unnamed
set clipboard+=unnamedplus
" set tag file names
set tags=tags
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" display
set hlsearch
set mousehide
set mouse=nv " enable mouse scroll etc...
set signcolumn=yes
set nowrap
set cmdheight=1
set splitright
set splitbelow
" set default grep cmd
set grepprg=rg\ -p\ --vimgrep\ --ignore-file\ ~/.config/nvim/rg_ignore
set grepformat=%f:%l:%c:%m
" add current directories
set path+=**
" }}}
" keymappings {{{
inoremap jk <esc>
nnoremap <M-q> :x<CR>
nnoremap gy :%y<CR>

" close current window or buffer
noremap <silent><M-w> :close<CR>
noremap <silent><M-b> :bd<CR>
" screen scroll add <nowait> to execute immediately
" see autocmd keymap_force to set scroll down
" use backspace to scroll up
nnoremap <silent><BS> <C-b>
nnoremap <silent><Space> <C-f>
" switch between buffers
nnoremap <silent><nowait><RIGHT> :bn<CR>
nnoremap <silent><nowait><LEFT> :bp<CR>
nnoremap <silent><C-n> :bn<CR>
" cd to current file directory
nnoremap <leader>cd :lcd %:p:h<CR>
" map <esc> to quit terminal mode
tnoremap <Esc> <C-\><C-n>
" use <UP> and <DOWN> to scroll screen
nnoremap <silent><UP> 1<C-U><DOWN>
nnoremap <silent><DOWN> 1<C-D><UP>
" save
nnoremap <silent><Enter> :w<CR>
" quickfix list operations
" nnoremap <leader>o :copen<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>
" split current window
nnoremap <silent><leader>- :split<CR>
nnoremap <silent><leader>/ :vsplit<CR>

inoremap {<CR> {<CR>}<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoremap {<Space> {<Space><Space>}<Esc>hi
inoremap [<Space> [<Space><Space>]<Esc>hi
" }}}
" commands {{{
command! Editrc execute 'edit' vim_config_file
command! Reloadrc execute 'source' vim_config_file
command IndentCurBuf call IndentBuf()
" }}}
" autocmd {{{

augroup filetype_specific
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  " disable syntax for large file
  autocmd BufWinEnter * if line("$") > 10000 | syntax clear | endif
augroup END

augroup filetype_indent_size
  autocmd!
  autocmd FileType html,css,javascript,typescript,typescriptreact,vue,yaml,sql,json,vim
        \ setlocal tabstop=2 shiftwidth=2
augroup END

function TrimEndLinesAndTrailingSpaces()
  let save_cursor = getpos(".")
  silent! %s#\($\n\s*\)\+\%$##
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction

function IndentBuf()
  let save_cursor = getpos(".")
  norm gg=G
  call setpos(".", save_cursor)
endfunction

augroup filetype_edit_behavior
  autocmd!
  autocmd FileType * setlocal textwidth=0
  " do not auto add comment when add new comment line in normal mode
  autocmd FileType * setlocal formatoptions-=o
  " auto remove all trailing empty lines before saving
  autocmd BufWritePre *.c,*.cpp,*.h,*.js,*.html,*.sh,*.py,*.yml,*.yaml
        \ call TrimEndLinesAndTrailingSpaces()
augroup END

augroup keymap_force
  autocmd!
  " unremap <CR> key when in quickfix list
  autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
augroup END

" insert current datetime
command! Curtime :put = strftime('%Y-%m-%d %H:%M:%S')

" }}}
" default colors {{{
highlight Normal guifg=LightGray
highlight Comment guifg=DarkGray gui=none
highlight Visual guibg=#495057 guifg=none
highlight Search guibg=#495057 guifg=none
highlight SignColumn gui=bold guibg=none
highlight Folded guifg=DarkGrey guibg=none
highlight LineNr guifg=#868e96
highlight StatusLine gui=bold guibg=#343a40
highlight StatusLineNC guibg=#343a40
highlight MatchParen gui=bold,underline
" self defined plugins colorscheme
highlight CocUnusedHighlight guifg=DarkYellow gui=underline
highlight BufTabLineCurrent guibg=#4c566a guifg=Black gui=none
highlight BufTabLineFill guibg=none guifg=none gui=none
highlight BufTabLineHidden guibg=none guifg=none gui=none
highlight GitGutterAdd guibg=none guifg=#74b816 gui=bold
highlight GitGutterChange guibg=none guifg=#fdb924 gui=bold
highlight GitGutterDelete guibg=none guifg=#c92a2a gui=bold
" }}}
" }}}
