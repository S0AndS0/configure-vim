
""
" Create the `tags` file
"   sudo apt-get install exuberant-ctags
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


""
" Execute visual selection in default shell
command! -range ShellRange execute '!' . join(getline(<line1>, <line2>), ';')
vnoremap <Leader>ex :ShellRange<CR>

