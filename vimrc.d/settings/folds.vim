" See `:help fold` and `:help foldmethod`
" Thanks be to: how to set the default to unfolded when you open a file
"  https://stackoverflow.com/questions/8316139/
set foldmethod=indent
" set foldmethod=syntax
autocmd BufWinEnter * silent! :%foldopen!

