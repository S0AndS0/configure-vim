#!/usr/bin/env vim


autocmd FileType javascript call s:Register_Settings()


function! s:Register_Settings()
  setlocal filetype=typescript
  set makeprg=node\ inspect\ %
endfunction

""
" Attribution:
" https://stackoverflow.com/questions/68093410/how-can-i-open-a-node-js-inspect-mode-from-inside-vim

