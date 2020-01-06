if exists("g:loaded_cdroot_plugin") || &cpo
    finish
endif

let g:loaded_cdroot_plugin = 1
let s:keepcpo=&cpo
set cpo&vim

if !exists("g:cdroot_markers")
    let g:cdroot_markers = ['.projectroot', '.git', '.hg', '.bzr', '.svn']
endif

augroup cdroot
    autocmd!
    autocmd VimEnter,BufEnter * call cdroot#change_root()
augroup END

let &cpo=s:keepcpo
unlet s:keepcpo
