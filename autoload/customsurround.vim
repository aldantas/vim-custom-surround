function! customsurround#map(lhs, before_str, after_str)
    exe 'nnoremap <silent> '.a:lhs.' :SurroundWord '.
                \ a:before_str.' '.a:after_str.'<CR>'
    exe 'vnoremap <silent> '.a:lhs.' :SurroundSelection '.
                \ a:before_str.' '.a:after_str.'<CR>'
endfunction
