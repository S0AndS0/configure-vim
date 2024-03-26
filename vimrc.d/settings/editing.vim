set spell

""
" Thanks
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-m
set backspace=indent,eol,start


" -----
"  Allow cursor while in Normal mode to be placed after last character
" set virtualedit=onemore
set virtualedit=block


""
" C-A / C-X within Normal and Visual modes in/de-crement alphabetical lists
" See: `help nrformats`
set nrformats+=alpha

""
" https://stackoverflow.com/questions/69780160/open-many-files-over-10-in-separate-tabs-at-once-in-vim
set tabpagemax=99

""
" Enable thesaurus support
"
" See: help i_CTRL-X_CTRL-T
"
" https://github.com/Konfekt/vim-thesauri
" https://github.com/vim/vim/issues/629#issuecomment-443293282
" https://github.com/Ron89/thesaurus_query.vim#description-for-backends-and-their-setup
"
" ```bash
" mkdir -vp ~/.vimrc.d/thesaurus
"
" curl -L https://www.gutenberg.org/files/3202/files/mthesaur.txt -o ~/.vimrc.d/thesaurus/mthesaur.txt
"
" curl -L https://github.com/vim/vim/files/2634525/thesaurus_pkg.zip -o /tmp/thesathesaurus.zip
" cd /tmp
" unzip thesathesaurus.zip
" mv ./thesaurus_pkg/thesaurus.txt ~/.vimrc.d/thesaurus/
" ```

" let s:thesaurus_paths = [
"       \   $HOME . '/.vimrc.d/thesaurus/thesaurus.txt',
"       \   $HOME . '/.vimrc.d/thesaurus/mthesaur.txt',
"       \ ]

let s:thesaurus_paths = [
      \   $HOME . '/.vimrc.d/thesaurus/thesaurus.txt',
      \ ]

execute 'set thesaurus+=' . join(s:thesaurus_paths, ',')

