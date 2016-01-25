function! SmartGQ(type)
    let tmp_filename = 'smartgq_tmp'

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

    call writefile(split(@@, '\n'), tmp_filename)
    let result = system(b:smart_gq_program . ' ' . tmp_filename)


    silent normal! gvdk
    silent put = result
    redraw!
    echo "Cleaned " . len(split(@@, "\n")) . " lines"

endfunction
