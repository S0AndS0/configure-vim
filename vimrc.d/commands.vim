
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

""
"
function! s:Mkdir(...) abort
	if len(a:000)
		let l:path = a:000[0]
	else
		let l:path = expand('%:h')
	endif

	if !len(l:path)
		throw 'No directory path to make'
	endif

	return mkdir(l:path, 'p')
endfunction

command! -complete=dir -nargs=? MakeDirectory call <SID>Mkdir(<f-args>)

