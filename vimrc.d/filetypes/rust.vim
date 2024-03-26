#!/usr/bin/env vim

function! s:Register_Settings__Rust()
  setlocal shiftwidth=4
  setlocal tabstop=4
  setlocal softtabstop=4
  setlocal noexpandtab
endfunction

autocmd FileType rust call s:Register_Settings__Rust()
