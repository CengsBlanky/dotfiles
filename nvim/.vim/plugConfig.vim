" plugins {{{
execute 'source' plug_file
call plug#begin(fnameescape(plugin_path))
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
" auto close parenthese
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" vim multi languages debug tool
Plug 'puremourning/vimspector'
" better hlsearch
Plug 'haya14busa/incsearch.vim'
Plug 'aperezdc/vim-template'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/webapi-vim'
Plug 'vim-autoformat/vim-autoformat', {'for': ['c', 'cpp', 'java']}
Plug 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'vue', 'html', 'css'],
  \ 'do': 'yarn install'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'euclio/vim-markdown-composer', {'for': 'markdown'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'sotte/presenting.vim', {'for': 'markdown'}
Plug 'jsborjesson/vim-uppercase-sql', {'for': 'sql'}
Plug 'honza/vim-snippets'
if has('nvim') && !has('win32')
    Plug 'preservim/vimux' " run command in tmux pane without leave vim window
endif
if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
endif
" colorscheme & statusline {{{
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase', 'for': ['css', 'vue', 'javascript', 'html', 'less', 'scss']}
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tribela/vim-transparent'
" }}}
" filetype icon (always keeps at the bottom of plugin list)
Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}
" plugins setting {{{
" open NERDTreeToggle {{{
let g:NERDTreeQuitOnOpen=3
let NERDTreeIgnore=[
    \ '\.lock$[[file]]', '\.o$[[file]]', '\.out$[[file]]', '\.class$[[file]]',
    \ '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]'
    \ ]
noremap <silent><M-`> :NERDTreeToggle<CR>
" }}}
" haya14busa/incsearch.vim {{{
" automatically turn off hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" }}}
" aperezdc/vim-template {{{
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
execute 'source' coc_config_file
" }}}
" haya14busa/incsearch.vim {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}
" vim-airline/vim-airline {{{
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline#extensions#tabline#left_sep = '▐'
let g:airline_left_alt_sep = ''
" enable fugitive show git info
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_symbols.dirty=' '
" let g:airline_left_sep = ''
let g:airline_right_sep = ''
" use shorter mode name
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }

" }}}
" airblade/vim-gitgutter {{{
" coc-git has sign conflict, just don't use it
let g:gitgutter_sign_priority = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '*'
let g:gitgutter_sign_removed = '-'
" }}}
" tpope/vim-fugitive {{{
nnoremap <M-s> :Git status<CR>
" add guioptions '!' and make terminal output colored in mac
nnoremap <M-d> :!git diff<CR>
nnoremap <leader>ca :wall <bar> Git add * <bar> Git commit -am "
nnoremap <leader>cm :Git commit -am "
" git push
nnoremap <leader>ps :Git push<CR>
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
nnoremap <C-o> :RG<cr>
" }}}
" rust-lang/rust.vim {{{
let g:rustfmt_autosave = 1
" }}}
" puremourning/vimspector {{{
let g:vimspector_enable_mappings = 'HUMAN'
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
" }}}
" easymotion/vim-easymotion {{{
" use <leader>w to invoke easymotion, so do not add use <leader>w keybinding again
map <leader> <Plug>(easymotion-prefix)
" }}}
" plasticboy/vim-markdown {{{
" keybinding
let g:vim_markdown_folding_disabled = 1
augroup markdown_keybinding
    autocmd!
    autocmd FileType markdown nnoremap <silent><leader>t :TableFormat<CR>
augroup END
" }}}
" euclio/vim-markdown-composer {{{
autocmd BufWritePost *.md :ComposerUpdate
let g:markdown_composer_open_browser = 0
" }}}
" fatih/vim-go {{{
" autocmd FileType go nmap <leader>r <Plug>(go-run-split)
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_template_autocreate=0
" }}}
" vim-autoformat/vim-autoformat {{{
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
" c/c++ and javascript autoformat config
autocmd BufWritePre *.c,*.cpp,*.h,*.java :Format
"}}}
" prettier/vim-prettier {{{
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.svelte,*.yaml,*.html PrettierAsync
autocmd BufEnter .prettierrc setlocal filetype=json
nnoremap <F5> :Prettier<CR>
"}}}
" RRethy/vim-hexokinase {{{
if has('nvim')
    let g:Hexokinase_highlighters = ['virtual']
endif
" }}}
" kyazdani42/nvim-tree.lua {{{
if has('nvim')
    let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
    let g:nvim_tree_update_cwd = 1
    let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
    let g:nvim_tree_gitignore = 1 "0 by default
    let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
    let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
    let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
    let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
    let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
    let g:nvim_tree_update_cwd = 1 "0 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
    let g:nvim_tree_ignore = ['*.class', '*.out', '*.exe'] "empty by default
    nnoremap <M-f> :NvimTreeToggle<CR>
endif
" }}}
" colorscheme plugins {{{

set t_Co=256
set termguicolors
if has("gui_running") && has("win32")
    set background=light
    colorscheme ayu
    let ayucolor="light"
    let g:airline_theme='onehalflight'
else
    colorscheme gruvbox
    let g:airline_theme='base16'
    let g:gruvbox_contrast_dark='hard'
endif
" autocmd FileType markdown colorscheme Tomorrow
" autocmd FileType markdown let g:airline_theme='tomorrow'
" let g:airline_theme='apprentice'
" colorscheme OceanicNext
" colorscheme ayu
" let ayucolor="mirage"
" colorscheme gruvbox
" colorscheme onedark
" colorscheme onehalflight
" colorscheme onehalfdark
" let g:airline_theme='papercolor'
" let g:airline_theme='onehalfdark'
" enable Comment italic
" highlight Comment cterm=italic gui=italic

if has('nvim')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "java", "javascript", "vue", "css", "python" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
endif

" }}}
" }}}
