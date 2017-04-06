function! SurroundSelection(before_str, after_str) range
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    cal cursor(lnum2, col2)
    exe 'normal! a'.a:after_str
    cal cursor(lnum1, col1)
    exe 'normal! i'.a:before_str
endfunction

function! SurroundWord(before_str, after_str)
    let s:cursorpos = getcurpos()[1:2]
    if s:cursorpos[1] == 1
        if len(expand('<cword>')) == 1
            exe 'normal! a'.a:after_str
        else
            exe 'normal! ea'.a:after_str
        endif
    else
        exe 'normal! hea'.a:after_str
    endif
    cal cursor(s:cursorpos)
    exe 'normal! lbi'.a:before_str
endfunction

com! -nargs=+ -range -complete=command SurroundSelection
            \ call SurroundSelection(<f-args>)

com! -nargs=+ -complete=command SurroundWord
            \ call SurroundWord(<f-args>)
