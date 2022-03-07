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
      \ 'markdown':        '',
      \ 'dockerfile':      '',
      \ 'sql':             '',
      \ 
      \ 'vim':             '',
      \ 'fish':            '',
      \ 'sh':              '',
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

set statusline=%2{FileTypeSign()}
set statusline+=\ %f
set statusline+=%{&modifiable?'':'\ '}
set statusline+=%{&modified?'\ פֿ':''}
set statusline+=%=
set statusline+=%{SystypeIcon()}
set statusline+=%6.50l/%-6.50L
set statusline+=%-4.10P
