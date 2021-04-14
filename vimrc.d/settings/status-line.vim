
""
" Status Line:
set statusline=             " Clear statusline
set statusline+=%m          " Modified [+], not modifiable [-]
set statusline+=\ %f        " File path open within buffer
set statusline+=%=          " Left justify following items
set statusline+=%-.5l       " `%-.5` Allows 0 to 5 characters for item
set statusline+=,%-.5v      " `l` line number, and `v` vertical position
set statusline+=\ \ \ %P    " Percentage into file

