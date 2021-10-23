" plugins {{{
execute 'source' plug_file
call plug#begin(fnameescape(plugin_path))
Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:tpope/vim-commentary.git'
Plug 'git@github.com:jiangmiao/auto-pairs.git'
Plug 'git@github.com:andymass/vim-matchup.git'
Plug 'git@github.com:justinmk/vim-sneak.git'
" align text
Plug 'git@github.com:junegunn/vim-easy-align.git'
Plug 'git@github.com:terryma/vim-multiple-cursors.git'
Plug 'git@github.com:preservim/nerdtree.git', { 'on': 'NERDTreeToggle'}
Plug 'git@github.com:neoclide/coc.nvim.git', {'branch': 'release'}
" better hlsearch
Plug 'git@github.com:haya14busa/incsearch.vim.git'
Plug 'git@github.com:aperezdc/vim-template.git'
Plug 'git@github.com:junegunn/fzf.git', { 'do': { -> fzf#install() } }
Plug 'git@github.com:junegunn/fzf.vim.git'
Plug 'git@github.com:mattn/webapi-vim.git'
Plug 'git@github.com:jsborjesson/vim-uppercase-sql.git', {'for': 'sql'}
Plug 'git@github.com:honza/vim-snippets.git'
" colorscheme & statusline {{{
Plug 'git@github.com:itchyny/lightline.vim.git'
Plug 'git@github.com:Yggdroot/indentLine.git' " show indent level
Plug 'git@github.com:dracula/vim.git', { 'as': 'dracula' }
Plug 'git@github.com:frazrepo/vim-rainbow.git'
" }}}
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
" vim-rainbow {{{
" let g:rainbow_active = 1
autocmd FileType c,cpp,java,go,rust call rainbow#load()
" }}}
" colorscheme plugins {{{
set t_Co=256
set termguicolors
colorscheme dracula
let g:dracula_italic = 0
let g:dracula_underline = 1
let g:dracula_undercurl = 1

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \}

" highlight works just in certain color name, otherwise color would be normal font color
" set guifg would be enough, but ctermfg would't hurt
augroup color_settings
  autocmd!
  autocmd ColorScheme dracula hi CocUnusedHighlight ctermfg=DarkYellow guifg=DarkYellow
  autocmd ColorScheme dracula hi Comment ctermfg=DarkGray guifg=DarkGray
augroup END
" highlight Comment cterm=italic gui=italic
" }}}
" }}}
