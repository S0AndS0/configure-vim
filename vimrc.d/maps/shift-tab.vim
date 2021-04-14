
""
" Thanks be to:
"   Map shift-tab in vim to inverse tab in Vim
"   https://stackoverflow.com/questions/4766230/
"
"   Cycle through autocomplete menu using tab
"   https://vi.stackexchange.com/questions/19675/

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-d>"

nnoremap <Tab> >>
nnoremap <S-Tab> <<

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

