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
" https://github.com/ycm-core/YouCompleteMe/wiki/FAQ#im-using-rust-with-ycm-and-this-causes-breaks-incremental-builds-of-my-project
" TLDR: YouCompleteMe and Rust otherwise will battle for build cache access
"       which causes unnecessary re-builds of dependencies and such
let g:ycm_rust_toolchain_root = $HOME . '/.local'

""
" Mappings:
" Jump to definition
nnoremap <Leader>jd :YcmCompleter GoTo<CR>

