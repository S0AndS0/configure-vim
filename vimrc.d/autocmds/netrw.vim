
" ------
" Netrw customization

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view

" Show all files
let g:netrw_hide = 1
let g:netrw_list_hide = '.*\.swp$'


function! s:NetRW__Project_Drawer__Open() abort
  if $PWD == $HOME
    return
  endif

  if expand('%') == '.git/COMMIT_EDITMSG'
    return
  endif

  let l:text_width = &textwidth ? &textwidth : 80
  if &columns < (g:netrw_winsize + l:text_width)
    return
  endif

  :Lexplore $PWD
  :wincmd l
endfunction


""
" https://shapeshed.com/vim-netrw/
let g:netrw_winsize = 15
augroup NetRW__Project_Drawer__Open
  autocmd!
  autocmd VimEnter * :call <SID>NetRW__Project_Drawer__Open()
augroup END

""
"
" https://www.reddit.com/r/vim/comments/b00bcq/how_to_automatically_close_netrw_when_exiting_a/
function! s:NetRW__Project_Drawer__Close() abort
  if winnr("$") == 1 && getbufvar(winbufnr(winnr()), "&filetype") == 'netrw'
    q
  endif
endfunction

augroup NetRW__Project_Drawer__Close
  autocmd!
  autocmd WinEnter * :call <SID>NetRW__Project_Drawer__Close()
augroup END


" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
" - open/close a file and have NetRW automaticly open/close

