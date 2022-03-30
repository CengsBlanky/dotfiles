let s:filetypes = {
      \ 'c':               '',
      \ 'cpp':             '',
      \ 'rust':            '',
      \ 'java':            '',
      \ 'go':              '',
      \ 'lua':             '',
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
      \ 'xml':             '',
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

function! FileformatIcon()
  return get(s:fileformats, &fileformat, '')
endfunction

function! FiletypeIcon()
  return get(s:filetypes, &filetype, '')
endfunction

function! SystypeIcon()
  return get(s:systypes, g:os, '')
endfunction

set statusline=%2{FiletypeIcon()}
set statusline+=\ %f
set statusline+=%{&readonly?'\ ':''}
set statusline+=%{&modified?'\ פֿ':''}
set statusline+=%=
set statusline+=%{FileformatIcon()}
set statusline+=%6.50l/%-6.50L
set statusline+=%-4.10P
