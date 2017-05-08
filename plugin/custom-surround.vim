function! SurroundSelection(before_str, ...) range
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    cal cursor(lnum2, col2)
    try
        exe 'normal! a'.a:1
    catch
        exe 'normal! a'.a:before_str
    endtry
    cal cursor(lnum1, col1)
    exe 'normal! i'.a:before_str
endfunction

function! SurroundWord(before_str, ...)
    let s:cursorpos = getcurpos()[1:2]
    let s:formatoptions = &formatoptions
    set formatoptions=
    if s:cursorpos[1] == 1
        if len(expand('<cword>')) == 1
            let l:insert_after = 'normal! a'
        else
            let l:insert_after = 'normal! ea'
        endif
    else
        let l:insert_after = 'normal! hea'
    endif
    try
        exe l:insert_after.a:1
    catch
        exe l:insert_after.a:before_str
    endtry
    cal cursor(s:cursorpos)
    exe 'normal! lbi'.a:before_str
    let &formatoptions=s:formatoptions
    if match(tolower(synIDattr(synID(line('.'),col('.')-1,1),'name')), 'comment') != -1
        if match(s:formatoptions, 'c') != -1
            exe 'normal! gqq'
        endif
    elseif match(s:formatoptions, 't') != -1
        exe 'normal! gqq'
    endif
endfunction

com! -nargs=+ -range -complete=command SurroundSelection
            \ call SurroundSelection(<f-args>)

com! -nargs=+ -complete=command SurroundWord
            \ call SurroundWord(<f-args>)
