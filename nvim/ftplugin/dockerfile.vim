function! s:UppercaseKeyword(keyword)
    " Do not uppercase word if within a comment or string
    if synIDattr(synIDtrans(synID(line("."), col(".") - 1, 0)), "name") =~# 'Comment\|String'
        return a:keyword
    else
        return toupper(a:keyword)
    endif
endfunction

iabbrev <expr> <buffer> from <SID>UppercaseKeyword('from')
iabbrev <expr> <buffer> label <SID>UppercaseKeyword('label')
iabbrev <expr> <buffer> run <SID>UppercaseKeyword('run')
iabbrev <expr> <buffer> cmd <SID>UppercaseKeyword('cmd')
iabbrev <expr> <buffer> add <SID>UppercaseKeyword('add')
iabbrev <expr> <buffer> copy <SID>UppercaseKeyword('copy')
iabbrev <expr> <buffer> arg <SID>UppercaseKeyword('arg')
iabbrev <expr> <buffer> expose <SID>UppercaseKeyword('expose')
iabbrev <expr> <buffer> env <SID>UppercaseKeyword('env')
iabbrev <expr> <buffer> entrypoint <SID>UppercaseKeyword('entrypoint')
iabbrev <expr> <buffer> volume <SID>UppercaseKeyword('volume')
iabbrev <expr> <buffer> user <SID>UppercaseKeyword('user')
iabbrev <expr> <buffer> workdir <SID>UppercaseKeyword('workdir')
iabbrev <expr> <buffer> onbuild <SID>UppercaseKeyword('onbuild')
iabbrev <expr> <buffer> stopsignal <SID>UppercaseKeyword('stopsignal')
iabbrev <expr> <buffer> healthcheck <SID>UppercaseKeyword('healthcheck')
iabbrev <expr> <buffer> shell <SID>UppercaseKeyword('shell')
