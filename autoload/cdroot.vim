function! cdroot#find_root(markers)
    let l:path = fnamemodify(expand('%'), ':p')

    if empty(l:path)
        let l:path = getcwd()
    endif

    if l:path[0] != '/'
        return ''
    endif

    while 1
        let l:path = fnamemodify(l:path, ':h')

        " stop if in home dir ('~')
        " stop if in root dir ('/')
        if l:path == expand('$HOME') || l:path == '/'
            break
        endif

        for marker in a:markers
            let l:fn = l:path . '/' . marker
            if filereadable(fn) || isdirectory(fn)
                return l:path
            endif
        endfor
    endwhile

    return ''
endfunction

function! cdroot#change_root()
    try
        if !exists('b:root_dir')
            let b:root_dir = cdroot#find_root(g:cdroot_markers)
            if strlen(b:root_dir) && b:root_dir !=# getcwd()
                echo '[cdroot] ' . b:root_dir
                execute ':cd' fnameescape(b:root_dir)
            endif
        endif
    catch
    endtry
endfunction
