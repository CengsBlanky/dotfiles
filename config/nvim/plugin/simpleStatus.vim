let s:filetypes = {
      \ 'asm':             '',
      \ 'c':               '',
      \ 'cpp':             '',
      \ 'rust':            '',
      \ 'java':            '',
      \ 'go':              '',
      \ 'lua':             '',
      \ 'python':          '',
      \ 'dart':            '',
      \ 'sql':             '',
      \
      \ 'javascript':      '',
      \ 'typescript':      '',
      \ 'html':            '',
      \ 'css':             '',
      \ 'vue':             '﵂',
      \ 'tsx':             '',
      \ 'typescriptreact': '',
      \
      \ 'json':            '',
      \ 'xml':             '鸞',
      \ 'yaml':            '',
      \ 'toml':            '',
      \
      \ 'markdown':        '',
      \ 'dockerfile':      '',
      \
      \ 'sh':              '',
      \ 'awk':             '',
      \ 'vim':             '',
      \ 'fish':            '',
      \ 'crontab':         '',
      \ 'fstab':           '',
      \ 'conf':            '',
      \ 'sshconfig':       '',
      \ 'log':             '',
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

hi User1 guibg=none
hi User2 guifg=#343a40
hi User3 guifg=#5e81ac guibg=#343a40

set statusline=%3*%1{FiletypeIcon()}%*
set statusline+=\ %f
set statusline+=%{&readonly?'\ ':''}
set statusline+=%{&modified?'\ פֿ':''}
set statusline+=\ %2*%1*
set statusline+=%=
set statusline+=%2*
set statusline+=\ 
set statusline+=%*
set statusline+=%2{FileformatIcon()}
set statusline+=%6.50l/%-6.50L
set statusline+=%-4.10P
