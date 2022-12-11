set encoding=utf-8

""
" You Complete Me Configurations:
let g:ycm_always_populate_location_list = 1

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_use_clangd = 0
let g:ycm_clangd_binary_path = '/usr/bin/gcc'

" let g:ycm_filetype_blacklist = {
"       \   'markdown': 1
"       \ }


""
" Mappings:
" Jump to definition
nnoremap <Leader>jd :YcmCompleter GoTo<CR>

