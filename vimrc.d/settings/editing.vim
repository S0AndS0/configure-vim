set spell

""
" Thanks
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-m
set backspace=indent,eol,start


" -----
"  Allow cursor while in Normal mode to be placed after last character
" set virtualedit=onemore
set virtualedit=block


""
" C-A / C-X within Normal and Visual modes in/de-crement alphabetical lists
" See: `help nrformats`
set nrformats+=alpha

""
" https://stackoverflow.com/questions/69780160/open-many-files-over-10-in-separate-tabs-at-once-in-vim
set tabpagemax=99
