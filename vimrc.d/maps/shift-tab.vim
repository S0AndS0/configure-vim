#!/usr/bin/env vim

""
" https://stackoverflow.com/questions/16622566/how-to-solve-the-collision-of-tab-key-mapping-of-ultisnips-plugin-in-the-vim
""

nnoremap > v>
nnoremap < v<

nnoremap > >gv
nnoremap < <gv

""
" Thanks be to:
"   Map shift-tab in vim to inverse tab in Vim
"   https://stackoverflow.com/questions/4766230/
"
"   Cycle through autocomplete menu using tab
"   https://vi.stackexchange.com/questions/19675/

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-d>"

nnoremap <Tab> >>
nnoremap <S-Tab> <<

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

