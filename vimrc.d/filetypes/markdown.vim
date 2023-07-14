
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
      \   'terraform',
      \   'toml',
      \   'vim',
      \   'viminfo',
      \   'yaml',
      \   'xml',
      \ ]

let g:markdown_yaml_head = 1

function! s:Register_Settings__MarkDown() abort
  setlocal expandtab
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2

  " Enable semi-support of UltiSnips for Liquid
  setlocal filetype=markdown.liquid
endfunction

""
" Thanks be to:
"   - https://www.maero.dk/markdown-frontmatter-syntax-highlighting/
"   - https://mastodon.social/@AndrewRadev@hachyderm.io/110711400838578501
function! s:Register_Syntax__MarkDown() abort
  let l:current_syntax = b:current_syntax
  unlet b:current_syntax

  syntax include @Yaml syntax/yaml.vim
  syntax include @Toml syntax/toml.vim

  syntax region yamlFrontmatter start=/\%^---/ end=/^---/ keepend contains=@Yaml
  syntax region tomlFrontmatter start=/\%^+++/ end=/^+++/ keepend contains=@Toml

  let b:current_syntax = l:current_syntax
endfunction

autocmd FileType markdown call s:Register_Settings__MarkDown()
autocmd FileType markdown call s:Register_Syntax__MarkDown()

