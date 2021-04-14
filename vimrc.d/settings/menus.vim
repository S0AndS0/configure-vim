
""
" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu
" Thanks be to: how do I make vim do normal bash like tab completion for file names
"   https://stackoverflow.com/questions/526858/
set wildmode=longest,list,full

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" ------
"  Thanks be to: Using Vim's Built in Complete Menu for Autocompleting Words
"   https://www.youtube.com/watch?v=2f8h45YR494
set complete+=kspell
set completeopt=menuone,longest


setlocal spell spelllang=en_us
" ]s  Next miss-spelled word
" [s  Previous misspelled word
" z=  List spelling suggestions

set thesaurus+=$HOME/.vim/thesaurus/english.txt

" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^x^s for spelling suggestions
" - ^x^t for thesaurus suggestions
" - ^n for anything specified by the 'complete' option

