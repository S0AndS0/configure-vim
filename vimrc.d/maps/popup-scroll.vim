#!/usr/bin/env vim
" popup-scroll.vim - Make popups scrollable
" Maintainer: S0AndS0 <https://github.com/S0AndS0>
" URL: https://github.com/S0AndS0/configure-vim
" Attributions:
" - https://vi.stackexchange.com/questions/37717/is-it-possible-to-scroll-a-popup-via-keyboard

function! s:ScrollPopup(amount) abort
  let l:winid = popup_list()[0]
  if !len(l:winid)
    echoe 'No popup'
    return
  endif

  let l:popup_pos = popup_getpos(l:winid)
  if !l:popup_pos.scrollbar
    return
  endif

  if a:amount == 0
    return
  endif

  let l:firstline = l:popup_pos.firstline + a:amount
  if l:firstline < 1
    let l:firstline = 1
  else
    let l:bufnr = winbufnr(l:winid)
    let l:linecount = getbufinfo(l:bufnr)[0].linecount
    if l:popup_pos.lastline + a:amount > l:linecount
      let l:firstline = l:linecount + l:popup_pos.firstline - l:popup_pos.lastline
    endif
  endif

  call popup_setoptions(l:winid, { 'firstline': l:firstline })
endfunction

nnoremap <S-PageUp> :call <SID>ScrollPopup(-3)<CR>
nnoremap <S-PageDown> :call <SID>ScrollPopup(3)<CR>

" vim: expandtab
