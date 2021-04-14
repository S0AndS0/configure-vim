""
" Plug Commands:
"
"   PlugInstall <name>
"   PlugUpdate <name>
"   PlugClean
"   PlugUpgrade
"   PlugDiff
"   PlugSnapshot
"
" https://github.com/junegunn/vim-plug


call plug#begin('~/.vim/plugged')
  let g:plug_timeout = 300

  " Indicate Git Diff while editing
  Plug 'airblade/vim-gitgutter'

  " TypeScript syntax and stuff
  Plug 'leafgarland/typescript-vim'

  " HTML generation
  Plug 'mattn/emmet-vim'

  " Custom Vim theme
  Plug 'morhetz/gruvbox'

  " Make sure that Spell Check shows up
  Plug 'osamuaoki/vim-spell-under'

  " Git commands such as Gblame
  Plug 'tpope/vim-fugitive'

  " Comment and uncomment code
  Plug 'tpope/vim-commentary'

  ""
  " Balance symbol insertion and removal
  Plug 'vim-utilities/balanced-backspace'
  Plug 'vim-utilities/balanced-braces'
  Plug 'vim-utilities/balanced-quotes'

  ""
  " MarkDown specific conveniences
  Plug 'vim-utilities/emoji-syntax'
  Plug 'vim-utilities/markdown-headings'
  Plug 'vim-utilities/markdown-surrounds'

  " Move lines with optional reformatting of indentation
  Plug 'vim-utilities/nudge-lines'

  " Leader commands for accepting first spell correction
  Plug 'vim-utilities/spelling-shortcuts'

  ""
  " Quicker split interaction
  Plug 'vim-utilities/splits-jump'
  Plug 'vim-utilities/splits-resize'

  " Check code syntax mistakes
  Plug 'vim-syntastic/syntastic'

  ""
  " Auto completion engine for Vim
  "   --clang-completer  $> sudo apt-get install g++-8
  "   --cs-completer     $> sudo apt-get install ???
  "   --go-completer     $> sudo apt-get install golang-go
  "   --java-completer   $> sudo apt-get install openjdk-8-jdk
  "   --rust-completer   $> curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  "   --ts-completer     $> cd <npm_project> && npm install --save-dev typescript
  Plug 'ycm-core/YouCompleteMe', { 'do': 'CXX=$(which g++-8) ./install.py --clang-completer --cs-completer --go-completer --java-completer --rust-completer --ts-completer' }

call plug#end()

