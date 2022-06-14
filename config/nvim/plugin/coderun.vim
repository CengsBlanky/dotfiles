function! TermWrapper(command) abort
  if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
  if g:split_term_style ==# 'vertical'
    let buffercmd = 'vnew'
  elseif g:split_term_style ==# 'horizontal'
    let buffercmd = 'new'
  else
    echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
    throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
  endif
  exec buffercmd
  if exists('g:split_term_resize_cmd')
    exec g:split_term_resize_cmd
  endif
  exec 'term ' . a:command
  exec 'setlocal norelativenumber nonumber'
  exec 'startinsert'
  autocmd BufEnter <buffer> startinsert
endfunction

function! CodeRun() abort
  exec 'wa'
  if filereadable('Makefile')
    nnoremap <C-c> :make clean<CR>
    call TermWrapper(printf('make && make run'))
    return
  endif
  if &filetype == "c"
    call TermWrapper(printf('gcc -Wall -std=c11 *.c && ./a.out'))
  elseif &filetype == "cpp"
    call TermWrapper(printf('g++ -Wall -std=c++11 *.cpp && ./a.out'))
  elseif &filetype == "python"
    call TermWrapper(printf('python %s', expand('%')))
  elseif &filetype == "java"
    call TermWrapper(printf('javac %s && java %s', expand('%'), expand('%:r')))
  elseif &filetype == "javascript"
    call TermWrapper(printf('node %s', expand('%')))
  elseif &filetype == "go"
    call TermWrapper(printf('go run %s', expand('%')))
  elseif &filetype == "typescript"
    call TermWrapper(printf('tsc %s && node %s', expand('%'), expand('%:r')))
  elseif &filetype == "rust"
    call TermWrapper(printf('cargo run'))
  elseif &filetype == "sh"
    call TermWrapper(printf("bash %s", expand('%')))
  elseif &filetype == "lua"
    call TermWrapper(printf("lua %s", expand('%')))
  elseif &filetype == "lisp"
    call TermWrapper(printf("sbcl --script %s", expand('%')))
  else
    echo "Unsupported yet..."
  endif
endfunction

function! CodeTest() abort
  exec 'wa'
  if &filetype == "rust"
    call TermWrapper(printf('cargo test'))
  elseif &filetype == "go"
    exec 'GoBuild'
  endif
endfunction

autocmd FileType c,cpp,java,python,javascript,typescript,go,rust,sh,lua,lisp nnoremap <leader>r :call CodeRun()<CR>
autocmd FileType rust,go nnoremap <leader>t :call CodeTest()<CR>

command! -nargs=1 -complete=file CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++11 %s && ./a.out < %s', expand('%'), <q-args>))
