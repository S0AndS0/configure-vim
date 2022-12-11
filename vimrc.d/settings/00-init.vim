
""
" Fix escape code injection from Git Gutter and other plugins
" Thanks be to: What's t_TE and t_TI added by vim8?
"   https://vi.stackexchange.com/questions/27399/whats-t-te-and-t-ti-added-by-vim-8
set t_TI=
set t_TE=


" enter the current millennium
set nocompatible


" Disallow `:autocmd` and write commands within '.vimrc'
set secure


" Ignore case when completing directory/file names
set wildignorecase


" Ignore certain directories for path expansion
" set wildignore+=*/.git/*,*/tmp/*
set wildignore+=*/.git/*

