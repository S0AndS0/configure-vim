#!/usr/bin/env vim


autocmd FileType solidity call s:Register_Settings()


function! s:Register_Settings()
  setlocal shiftwidth=4
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal expandtab
endfunction

