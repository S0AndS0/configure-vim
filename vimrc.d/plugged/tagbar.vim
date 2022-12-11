noremap <F6> :TagbarToggle<CR>

""
" See: `help tagbar-configuration`
let g:tagbar_autofocus = 1              " Move cursor to split when tag bar is opened
let g:tagbar_sort = 0                   " Delectation order instead of alphabetical
let g:tagbar_compact = 2                " Hide help but show blank lines between sections
let g:tagbar_show_data_type = 1         " Show type to right of tag
let g:tagbar_show_linenumbers = -1      " Use global line number settings in split
let g:tagbar_show_tag_linenumbers = 2   " Show tag line number to left of tag
let g:tagbar_autoshowtag = 1            " Expand folds to reveal selected tag
let g:tagbar_use_cache = 0              " Generate tags from saved file instead of temp-file
let g:tagbar_scrolloff = &scrolloff     " Use global scrolloff setting
let g:tagbar_jump_lazy_scroll = 1       " Do not scroll if tag is already visible

""
" https://gist.github.com/shuangjj/ae816cacffce3a27e256de7c21312c50
let g:tagbar_type_solidity = {
      \   'ctagstype': 'solidity',
      \   'kinds': [
      \     'E:enums',
      \     'M:modifiers',
      \     'S:structs',
      \     'c:contracts',
      \     'e:events',
      \     'f:functions',
      \     'm:mappings',
      \     'v:variables',
      \   ]
      \ }
