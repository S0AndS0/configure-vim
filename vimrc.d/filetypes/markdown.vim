
""
" Thanks be to:
"   https://gist.github.com/jackkinsella/aa7374a6832cca8a09eadc3434a33c24#file-vimrc-L544
"   https://github.com/tpope/vim-markdown
let g:markdown_minlines = 50

let g:markdown_fenced_languages = [
      \   'awk',
      \   'asm',
      \   'astro',
      \   'bash=sh',
      \   'bat=dosbatch',
      \   'batch=dosbatch',
      \   'c',
      \   'cpp',
      \   'conf',
      \   'css',
      \   'diff',
      \   'dnsmasq',
      \   'dockerfile',
      \   'dts',
      \   'erlang',
      \   'forth',
      \   'fstab',
      \   'gdb',
      \   'gitconfig',
      \   'gitignore',
      \   'go',
      \   'html',
      \   'help',
      \   'java',
      \   'javascript',
      \   'javascriptreact',
      \   'jsx=javascriptreact',
      \   'json',
      \   'latex=tex',
      \   'kivy',
      \   'less',
      \   'libao',
      \   'liquid',
      \   'lisp',
      \   'netrw',
      \   'nginx',
      \   'mermaid',
      \   'make',
      \   'man',
      \   'modconf',
      \   'mustache',
      \   'perl',
      \   'pest',
      \   'php',
      \   'python',
      \   'qf',
      \   'readline',
      \   'reg=registry',
      \   'robots',
      \   'ruby',
      \   'rust',
      \   'typescript',
      \   'typescriptreact',
      \   'tsx=typescriptreact',
      \   'sass',
      \   'scss',
      \   'sed',
      \   'sh',
      \   'solidity',
      \   'sshconfig',
      \   'sshdconfig',
      \   'sql',
      \   'sysctl',
      \   'systemd',
      \   'terraform',
      \   'toml',
      \   'tex',
      \   'yaml',
      \   'xmodmap',
      \   'xkb',
      \   'xml',
      \ ]

""
" Broken as of version:
" VIM - Vi IMproved 9.1 (2024 Jan 02, compiled Dec 22 2024 21:57:53)
" Included patches: 1-954
      " \   'vim',
      " \   'viminfo',

let g:markdown_yaml_head = 1

" @TODO: figure out how to make it play nice with `markdown.liquid` filetype
let g:markdown_folding = 1

function! s:Register_Settings__MarkDown() abort
  setlocal expandtab
  setlocal shiftwidth=2
  setlocal softtabstop=2
  setlocal tabstop=2

  ""
  " Do not to break long words when line-wrapping
  " https://www.youtube.com/watch?v=eX9m3g5J-XA
  setlocal linebreak
  setlocal wrap

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

