
""
" Easier moving of tabs
nnoremap <Leader>N <esc>:+tabmove<CR>
nnoremap <Leader>P <esc>:-tabmove<CR>

noremap <C-S-PageUp> <C-W>:-tabmove<CR>
noremap <C-S-PageDown> <C-W>:+tabmove<CR>

""
" Move tabs within :terminal sessions too
tnoremap <C-S-PageUp> <C-W>:-tabmove<CR>
tnoremap <C-S-PageDown> <C-W>:+tabmove<CR>

