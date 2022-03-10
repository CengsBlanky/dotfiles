" predefined variables {{{
let vim_config_file="~/.config/nvim/init.vim"
let plugin_path="~/.vim/plugins/"
let plug_file="~/.vim/plug.vim"
let g:python_host_skip_check=1
let g:python3_host_skip_check=1
let g:markdown_folding = 1
let g:python3_host_prog = '/usr/bin/python'
if &shell =~# 'fish$'
  set shell=sh
endif
" }}}
" plugins {{{
execute 'source' plug_file
call plug#begin(fnameescape(plugin_path))
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:tpope/vim-commentary.git'
Plug 'git@github.com:andymass/vim-matchup.git'
Plug 'git@github.com:justinmk/vim-sneak.git'
Plug 'git@github.com:jiangmiao/auto-pairs.git'
Plug 'git@github.com:tpope/vim-fugitive.git'
Plug 'git@github.com:airblade/vim-gitgutter.git'
Plug 'git@github.com:lambdalisue/suda.vim.git' " write as root
Plug 'git@github.com:junegunn/vim-easy-align.git' " align text easily
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
Plug 'git@github.com:dart-lang/dart-vim-plugin.git'
Plug 'git@github.com:mattn/emmet-vim.git' " powerful assert tags
Plug 'git@github.com:dag/vim-fish.git'
Plug 'git@github.com:honza/vim-snippets.git'
Plug 'git@github.com:ap/vim-buftabline.git'
Plug 'git@github.com:arcticicestudio/nord-vim.git'
Plug 'git@github.com:sainnhe/gruvbox-material.git'
Plug 'git@github.com:ayu-theme/ayu-vim.git'
Plug 'git@github.com:norcalli/nvim-colorizer.lua.git'
Plug 'git@github.com:nvim-treesitter/nvim-treesitter.git', {'do': ':TSUpdate'}
Plug 'git@github.com:ryanoasis/vim-devicons.git'
call plug#end()
" }}}
" plugins setting {{{
" open NERDTreeToggle {{{
let g:NERDTreeQuitOnOpen=3
let NERDTreeIgnore=[
      \ '\.lock$[[file]]', '\.o$[[file]]', '\.out$[[file]]', '\.class$[[file]]', '\.exe$[[file]]',
      \ '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^lib$[[dir]]'
      \ ]
noremap <silent><M-t> :NERDTreeToggle<CR>
" }}}
" tpope/vim-surround {{{
autocmd FileType typescriptreact,javascriptreact nmap t <Plug>YSsurround
" }}}
" andymass/vim-matchup {{{
let g:matchup_matchparen_offscreen = {}
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
" terryma/vim-multiple-cursors {{{
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
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
let g:templates_directory=["~/.vim/templates/"]
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
let g:coc_config_home="~/.vim/"
" Global extension names to install when they aren't installed.
let g:coc_global_extensions=[
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-clangd',
      \ 'coc-rls',
      \ 'coc-go',
      \ 'coc-tsserver',
      \ 'coc-pyright',
      \ '@yaegassy/coc-volar',
      \ 'coc-flutter',
      \ 'coc-sh',
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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
nmap <silent> gy <Plug>(coc-type-definition)
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

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

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

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Format whole buffer use Format
" nnoremap <C-f> :Format<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Auto format before buffer write
if filereadable('.clang-format')
  autocmd BufWritePre *.c,*.h,*.cpp :call CocAction('format')
endif
" python autoformat
autocmd BufWritePre *.py :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}
" rust.vim {{{
let g:rustfmt_autosave = 1
" }}}
" emmet vim {{{
" emmet default leader key: <C-y>
let g:user_emmet_mode='a'    "enable emmet in all mode
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue,javacript,typescript EmmetInstall
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
" goyo and limelight {{{
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
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
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
lua <<EOF
require'colorizer'.setup({
  'html';
  css = {
    css = true;
    css_fn = true;
    }
  }, { mode = 'background' })
EOF
" }}}
" }}}
" editor {{{
" default {{{
set nocompatible
filetype plugin indent on
syntax on
set fileformat=unix
language en_US.UTF-8
" unicode characters in the file autoload/float.vim
set encoding=utf-8
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
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set clipboard+=unnamedplus
" add ctags support
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
set showtabline=2
set splitbelow
set splitright
" set default grep cmd
set grepprg=rg\ -p\ --vimgrep\ --ignore-file\ ~/.vim/ignorefile
set grepformat=%f:%l:%c:%m
" }}}
" keymappings {{{
inoremap jk <esc>
nnoremap <nowait><leader>q :x<CR>
" close current buffer
noremap <silent><M-b> :bd<CR>
" close other buffers see line: 590
nnoremap <leader>o :Bonly<CR>
" use command to open my vimrc
command! Editrc execute 'edit' vim_config_file
" screen scroll add <nowait> to execute immediately
" see autocmd keymap_force to set scroll down
" use backspace to scroll up
nnoremap <silent><BS> <C-b>
" <leader> <Enter> to create new line in normal mode
nnoremap <silent><nowait><leader><Enter> :set paste<CR>m`o<ESC>``:set nopaste<CR>
" switch between buffers
nnoremap <silent><nowait><RIGHT> :bn<CR>
nnoremap <silent><nowait><LEFT> :bp<CR>
" go next buffer
nnoremap <silent><TAB> :bn<CR>
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
" quickfix list operations
nnoremap <leader>f :copen<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>

" buffer jump
if !exists("g:buftabline_numbers")
  nnoremap <silent><leader>1 :b1<CR>
  nnoremap <silent><leader>2 :b2<CR>
  nnoremap <silent><leader>3 :b3<CR>
  nnoremap <silent><leader>4 :b4<CR>
  nnoremap <silent><leader>5 :b5<CR>
  nnoremap <silent><leader>6 :b6<CR>
  nnoremap <silent><leader>7 :b7<CR>
  nnoremap <silent><leader>8 :b8<CR>
  nnoremap <silent><leader>9 :b9<CR>
endif
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

function TrimEndLinesAndTrailingSpaces()
  let save_cursor = getpos(".")
  silent! %s#\($\n\s*\)\+\%$##
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  " echom "trailing spaces and empty lines done!"
endfunction

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

" augroup windows_display
"   autocmd!
"   autocmd WinLeave * if &filetype!='help' && &filetype!='nerdtree' | setlocal norelativenumber number
"   autocmd WinEnter * if &filetype!='help' && &filetype!='nerdtree' | setlocal relativenumber
" augroup END

" }}}
" default colors {{{
highlight Comment guifg=DarkGray gui=none
highlight Visual guibg=#8fbcbb guifg=#000000
highlight SignColumn gui=bold guibg=none
" for nord colorscheme
" highlight StatusLine gui=bold guifg=#2e3440 guibg=#5e81ac
" highlight StatusLineNC gui=none guifg=#d8dee9 guibg=#495057
highlight StatusLine gui=bold guifg=#adb5bd guibg=#3b4252
highlight StatusLineNC gui=none guifg=DarkGray guibg=#4c566a
highlight Folded ctermfg=DarkGrey ctermbg=none guifg=DarkGrey guibg=none
highlight LineNr guifg=#868e96 gui=none
highlight Search guifg=#a3be8c guibg=#495057 gui=bold
" highlight Normal guibg=none ctermbg=none " transparent background
highlight MatchParen gui=bold,underline
highlight CursorLineNr gui=bold guibg=none
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

syn match MyTodo contained "\<\(TODO\|DONE\|FIXME\|NOTE\):{0,}"
hi def link MyTodo Todo
highlight Todo ctermfg=DarkYellow ctermbg=NONE cterm=bold,underline guifg=DarkYellow guibg=NONE gui=bold,underline

" }}}
" }}}
