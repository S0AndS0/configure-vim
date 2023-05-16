
""
" Syntastic recommended configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_loc_list_height = 5

""
" Do not compete with file-type powered syntax highlighting
let g:syntastic_enable_highlighting = 0

""
" Syntastic checker configurations
" Thanks be to -> https://github.com/vim-syntastic/syntastic/issues/1957
" To use `shellcheck` install it via distribution package manager
"   sudo apt-get install shellcheck
let g:syntastic_bash_checkers = [ 'shellcheck' ]
let g:syntastic_bash_shellcheck_args = '-x -f gcc'
let g:syntastic_sh_shellcheck_args = '-x -f gcc'


""
" To use `checkbashisms` install the `devscripts` package, eg...
"   sudo apt-get install devscripts
" let g:syntastic_sh_checkers = [ 'checkbashisms', 'shellcheck' ]


""
" Check Wiki for adding new languages
" https://github.com/vim-syntastic/syntastic/wiki/Syntax-Checker-Guide

