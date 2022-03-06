let s:filetypes = {
      \ 'c':               '',
      \ 'lua':             '',
      \ 'cpp':             '',
      \ 'rust':            '',
      \ 'java':            '',
      \ 'go':              '',
      \ 'python':          '',
      \ 'php':             '',
      \ 
      \ 'javascript':      '',
      \ 'typescript':      '',
      \ 'html':            '',
      \ 'css':             '',
      \ 'scss':            '',
      \ 'vue':             '﵂',
      \ 'tsx':             '',
      \ 'typescriptreact': '',
      \ 'json':            '',
      \ 'dart':            '',
      \ 
      \ 'dockerfile':      '',
      \ 'sql':             '',
      \ 
      \ 'vim':             '',
      \ 'fish':            '',
      \ 'sh':              '',
      \ 'crontab':         '',
      \ 'fstab':           '',
      \ 'conf':            '',
      \ 'text':            '',
      \
      \ 'lock':            '',
      \ 'help':            '',
\ }

let s:fileformats = {
      \ 'dos':  '',
      \ 'unix': '',
      \ 'mac':  '',
\ }

function! FileFormatSign()
  return get(s:fileformats, &fileformat, '')
endfunction

function! FileTypeSign()
  return get(s:filetypes, &filetype, '')
endfunction

set statusline=%2{FileTypeSign()}
set statusline+=\ %f
set statusline+=%{&modifiable?'':'\ '}
set statusline+=%{&modified?'\ ':''}
set statusline+=%=
set statusline+=%{FileFormatSign()}
set statusline+=%6.50l/%-6.50L
set statusline+=%-4.10P
