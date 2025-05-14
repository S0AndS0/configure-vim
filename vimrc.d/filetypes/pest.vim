function! s:Register_Settings__Pest() abort
  setlocal expandtab
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2

  " Enable semi-support of UltiSnips for Liquid
  setlocal filetype=pest
endfunction

autocmd FileType pest call s:Register_Settings__Pest()

