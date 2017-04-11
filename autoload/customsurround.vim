function! customsurround#map(lhs, before_str, ...)
    try
        let l:after_str = a:1
    catch
        let l:after_str = a:before_str
    endtry
    exe 'nnoremap <silent> '.a:lhs.' :SurroundWord '.
                \ a:before_str.' '.l:after_str.'<CR>'
    exe 'vnoremap <silent> '.a:lhs.' :SurroundSelection '.
                \ a:before_str.' '.l:after_str.'<CR>'
endfunction
