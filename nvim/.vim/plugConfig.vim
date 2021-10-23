" plugins {{{
execute 'source' plug_file
call plug#begin(fnameescape(plugin_path))
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs'
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-dadbod'
" align text
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
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
Plug 'justinmk/vim-sneak'
Plug 'mattn/webapi-vim'
Plug 'vim-autoformat/vim-autoformat', {'for': ['c', 'cpp', 'java']}
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'euclio/vim-markdown-composer', {'for': 'markdown'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'sotte/presenting.vim', {'for': 'markdown'}
Plug 'jsborjesson/vim-uppercase-sql', {'for': 'sql'}
Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif
" colorscheme & statusline {{{
Plug 'norcalli/nvim-colorizer.lua' " show source code defined colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine' " show indent level
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'frazrepo/vim-rainbow'
Plug 'tribela/vim-transparent' " vim transparent background
" }}}
" filetype icon (always keeps at the bottom of plugin list)
Plug 'ryanoasis/vim-devicons'
call plug#end()
" }}}
" plugins setting {{{
" open NERDTreeToggle {{{
let g:NERDTreeQuitOnOpen=3
let NERDTreeIgnore=[
    \ '\.lock$[[file]]', '\.o$[[file]]', '\.out$[[file]]', '\.class$[[file]]', '\.exe$[[file]]',
    \ '^node_modules$[[dir]]', '^dist$[[dir]]', '^packages$[[dir]]', '^target$[[dir]]', '^lib$[[dir]]'
    \ ]
noremap <silent><M-1> :NERDTreeToggle<CR>
" }}}
" tpope/vim-surround {{{
autocmd FileType typescriptreact,javascriptreact nmap t <Plug>YSsurround
" }}}
" auto-pairs {{{
let g:AutoPairsShortcutBackInsert = '<M-b>'
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
" Yggdroot/indentLine {{{
let g:indentLine_fileTypeExclude = ['text', 'json', 'markdown']
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
let g:airline#extensions#tabline#left_sep = ''
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
nnoremap <leader>ad :Git add %<CR>
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
nnoremap <C-l> :RG<cr>
" }}}
" rust-lang/rust.vim {{{
let g:rustfmt_autosave = 1
" }}}
" fatih/vim-go {{{
let g:go_auto_type_info = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_template_autocreate=0
autocmd FileType go nmap <leader>r <Plug>(go-run-split)
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
" vim-autoformat/vim-autoformat {{{
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
autocmd BufWritePre *.c,*.cpp,*.cc,*.h,*.java :Autoformat
autocmd FileType c,cpp,java nnoremap <C-f> :Autoformat<CR>
"}}}
" norcalli/nvim-colorizer.lua {{{
if has('nvim')
lua <<EOF
require 'colorizer'.setup {
  'css';
  'javascript';
  'html';
  'typescript';
  'typescriptreact';
  'vue';
}
EOF
endif
" }}}
" vim-rainbow {{{
" let g:rainbow_active = 1
autocmd FileType c,cpp,java,go,rust call rainbow#load()
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
  colorscheme dracula
  let g:dracula_italic = 0
  let g:dracula_underline = 1
  let g:dracula_undercurl = 1
  " colorscheme gruvbox
  " let g:airline_theme='base16'
  " let g:gruvbox_contrast_dark='hard'
endif

" highlight works just in certain color name, otherwise color would be normal font color
" set guifg would be enough, but ctermfg would't hurt
augroup color_settings
  autocmd!
  autocmd ColorScheme dracula hi CocUnusedHighlight ctermfg=DarkYellow guifg=DarkYellow
  autocmd ColorScheme dracula hi Comment ctermfg=DarkGray guifg=DarkGray
augroup END
" highlight Comment cterm=italic gui=italic
" }}}
" nvim-treesitter {{{
if has('nvim')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "java", "javascript", "typescript", "tsx", "vue", "css", "python", "bash", "dockerfile", "yaml" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
--  indent = {
--    enable = {"typescriptreact", "c", "cpp", "java", "go", "javascript", "rust", "sh", "python", "vue", "html", "css"}
--  },
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    disable = {},  -- optional, list of language that will be disabled
  }
}
EOF
endif
" }}}
" Plug 'tpope/vim-dadbod' {{{
nnoremap <M-3> :DB mysql://root@localhost<CR>
" }}}
" }}}
