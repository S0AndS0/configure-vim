#!/usr/bin/env vim

function! s:Register_Settings__Ruby()
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_classes_in_global = 1
  let g:rubycomplete_rails = 1
endfunction

autocmd FileType ruby,eruby call s:Register_Settings__Ruby()

