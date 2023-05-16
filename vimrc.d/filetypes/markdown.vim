
""
" Thanks be to:
"   https://gist.github.com/jackkinsella/aa7374a6832cca8a09eadc3434a33c24#file-vimrc-L544
"   https://github.com/tpope/vim-markdown
let g:markdown_minlines = 50

let g:markdown_fenced_languages = [
      \   'awk',
      \   'asm',
      \   'bash=sh',
      \   'bat=dosbatch',
      \   'c',
      \   'conf',
      \   'css',
      \   'diff',
      \   'fstab',
      \   'gdb',
      \   'gitconfig',
      \   'go',
      \   'html',
      \   'help',
      \   'java',
      \   'javascript',
      \   'json',
      \   'kivy',
      \   'less',
      \   'liquid',
      \   'lisp',
      \   'netrw',
      \   'make',
      \   'man',
      \   'mustache',
      \   'perl',
      \   'php',
      \   'python',
      \   'reg=registry',
      \   'ruby',
      \   'rust',
      \   'typescript',
      \   'typescriptreact',
      \   'sass',
      \   'scss',
      \   'sed',
      \   'sh',
      \   'solidity',
      \   'sshconfig',
      \   'sshdconfig',
      \   'systemd',
      \   'sql',
      \   'toml',
      \   'vim',
      \   'viminfo',
      \   'yaml',
      \   'xml',
      \ ]

function! s:Register_Settings__MarkDown()
  setlocal expandtab
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2
endfunction
autocmd FileType markdown call s:Register_Settings__MarkDown()

