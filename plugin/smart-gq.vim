function! SmartGQ(type)
    if a:type ==# 'v'
        silent normal! `<0v`>$y
    elseif a:type ==# 'V'
        silent normal! gvy
    elseif a:type ==# ''
        silent normal! `<0v`>$y
    elseif a:type ==# 'char'
        silent normal! `[0v`]$y
    elseif a:type ==# 'line'
        silent normal! `[v`]y
    else
        silent normal! 0v$y
    endif

    echo "Processing..."

    call writefile(split(@@, '\n'), 'smartgq_tmp')
    let result = system('autopep8 -a smartgq_tmp')

    silent normal! gvdk
    silent put = result
    redraw!
    echo "Cleaned " . len(split(@@, "\n")) . " lines"

endfunction
