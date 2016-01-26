function! SmartGQ(type)
    let tmp_filename = 'smartgq_tmp'

    if a:type ==# 'v' || a:type ==# 'V' || a:type ==# ''
        silent normal! `<0v`>$y
    elseif a:type ==# 'char' || a:type ==# 'line' || a:type ==# 'block'
        silent normal! `[0v`]$y
    else
        silent normal! 0v$y
    endif

    echo 'Processing...'

    call writefile(split(@@, '\n'), tmp_filename)
    let result = system(b:smart_gq_program . ' ' . tmp_filename)

    silent normal! gvd
    silent put! = result
    redraw!

    silent echo delete(tmp_filename)
    echo 'Cleaned ' . len(split(@@, '\n')) . ' lines'

    if exists("b:pos")
        call winrestview(b:pos)
        unlet b:pos
    endif
endfunction

function! Preserve(command)
    let last_search=@/
    let save_cursor = getpos('.')
    normal H
    let save_window = getpos('.')
    call setpos('.', save_cursor)

    execute a:command

    let @/=last_search
    call setpos('.', save_window)
    normal zt
    call setpos('.', save_cursor)
endfunction
