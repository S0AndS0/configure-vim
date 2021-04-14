
""
" Thanks be to: vim how to turn off search highlight after timeout x seconds
"   https://stackoverflow.com/questions/22798473/
autocmd CursorHold,CursorHoldI,CursorMovedI * :nohlsearch | let v:hlsearch = 0 | redraw

