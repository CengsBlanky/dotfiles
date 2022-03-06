let s:filetypes = {
      \ "c": "",
      \ "lua": "",
      \ "cpp": "",
      \ "rust": "",
      \ "java": "",
      \ "go": "",
      \ "python": "",
      \ 
      \ "javascript": "",
      \ "typescript": "",
      \ "html": "",
      \ "css": "",
      \ "vue": "﵂",
      \ 
      \ "docker": "",
      \ "sql": "",
      \ 
      \ "vim": "",
      \ "fish": "",
      \ "sh": "",
      \ "crontab": "",
      \ "text": "",
      \
      \ "lock": "",
      \ "help": "",
\ }

let s:fileformats = {
      \ "dos": "",
      \ "unix": "",
      \ "mac": "",
\ }

function! FileFormatSign(ff)
  return get(s:fileformats, a:ff, a:ff)
endfunction

function! FileTypeSign(ft)
  return get(s:filetypes, a:ft, a:ft)
endfunction

set statusline=%{&modifiable?'':''}
set statusline+=\ %f
set statusline+=%{&modified?'\ פֿ':''}
set statusline+=\ %{FileFormatSign(&fileformat)}
set statusline+=%=
set statusline+=%{FileTypeSign(&filetype)}
set statusline+=%6.50l/%-6.50L
set statusline+=%P
set statusline+=\ \ 
