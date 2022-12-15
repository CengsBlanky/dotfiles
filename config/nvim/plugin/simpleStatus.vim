let s:filetypes = {
      \ 'c':               '',
      \ 'lua':             '',
      \ 'cpp':             '',
      \ 'rust':            '',
      \ 'java':            '',
      \ 'go':              '',
      \ 'python':          '',
      \ 
      \ 'javascript':      '',
      \ 'typescript':      '',
      \ 'html':            '',
      \ 'css':             '',
      \ 'vue':             '﵂',
      \ 'tsx':             '',
      \ 'typescriptreact': '',
      \ 'json':            '',
      \ 'dart':            '',
      \ 
      \ 'markdown':        '',
      \ 'dockerfile':      '',
      \ 'sql':             '',
      \ 
      \ 'yaml':            '',
      \ 'toml':            '',
      \ 'vim':             '',
      \ 'fish':            '',
      \ 'sh':              '',
      \ 'crontab':         '',
      \ 'fstab':           '',
      \ 'conf':            '',
      \ 'log':             '',
      \ 'text':            '',
      \
      \ 'lock':            '',
      \ 'help':            '',
\ }

let s:fileformats = {
      \ 'dos':  '',
      \ 'unix': '',
      \ 'mac':  '',
\ }

let s:systypes = {
      \ 'Linux':   '',
      \ 'Darwin':  '',
      \ 'Windows': '',
\ }

" detect OS
if !exists("g:os")
  if has("unix")
    let g:os = substitute(system('uname'), '\n', '', '')
  else
    let g:os = "Windows"
  endif
endif

function! FileFormatSign()
  return get(s:fileformats, &fileformat, '')
endfunction

function! FileTypeSign()
  return get(s:filetypes, &filetype, '')
endfunction

function! SystypeIcon()
  return get(s:systypes, g:os, '')
endfunction

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('codeboy.lsp-status').status()")
  endif
  return ''
endfunction

function! ErrStatus() abort
  return luaeval("require('codeboy.lsp-status').get_err_status()")
endfunction

function! WarnStatus() abort
  return luaeval("require('codeboy.lsp-status').get_warn_status()")
endfunction

function! InfoStatus() abort
  return luaeval("require('codeboy.lsp-status').get_info_status()")
endfunction

function! HintStatus() abort
  return luaeval("require('codeboy.lsp-status').get_hint_status()")
endfunction

hi StatusLine   guifg=#adb5bd guibg=#343a40 gui=bold
hi StatusLineNC guibg=#343a40 guifg=DarkGray
hi User1        guibg=none
hi User2        guifg=#343a40
hi User3        guifg=#8fbcbb guibg=#343a40
hi User4        guifg=#bf616a guibg=#343a40 " error
hi User5        guifg=#e1bb80 guibg=#343a40 " warn
hi User6        guifg=#88c0d0 guibg=#343a40 " info
hi User7        guifg=#a3be8c guibg=#343a40 " hint

set statusline=%3*%2{FileTypeSign()}%*
set statusline+=\ %f
set statusline+=%{&readonly?'\ ':''}
set statusline+=%{&modified?'\ ':''}
set statusline+=\ %2*%1*
set statusline+=%=
set statusline+=%2*%*
set statusline+=%4*%{ErrStatus()}%*
set statusline+=%5*%{WarnStatus()}%*
set statusline+=%6*%{InfoStatus()}%*
set statusline+=%7*%{HintStatus()}%*
set statusline+=%2{FileFormatSign()}
set statusline+=%7.50l/%-7.50L
set statusline+=%-4.10P
