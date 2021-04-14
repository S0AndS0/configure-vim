#!/usr/bin/env vim
"  - 
" Version: 0.0.1
" Maintainer: S0AndS0 <https://github.com/S0AndS0>
" License: AGPL-3.0


if exists('g:loaded__vimrc_directories') || v:version < 700
  finish
endif
let g:loaded__vimrc_directories = 1


""
" Source ~/.vimrc.d/ files
function! Load_Vimrc_Directories() abort
  let l:script_directory = fnamemodify(expand('<sfile>'), ':p:h')
  let l:glob_pattern = l:script_directory . '/.vimrc.d/**/*.vim'

  let l:globs_list = glob(l:glob_pattern, 1, 1)
  for l:f in l:globs_list
    execute 'source' l:f
  endfor
endfunction

call Load_Vimrc_Directories()

