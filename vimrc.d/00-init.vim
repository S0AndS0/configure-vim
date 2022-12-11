
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on


""
" Built-in package that expands what `%` will _bounce_ to
" Customize via `b:match_words` variable
packadd! matchit

""
" Filter quickfix or location list with patterns
" See: {docs} - cfilter-plugin
" Example: - Cfliter[!] /{pat}/
" Example: - Lfliter[!] /{pat}/
packadd! cfilter


" Rebind <Leader> key
let g:mapleader = "\<Space>"


highlight ColorColumn ctermbg=233

