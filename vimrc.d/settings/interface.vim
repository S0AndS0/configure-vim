
""
" Interface Options:
set cursorline      " Highlight line cursor is on
set laststatus=2    " Always show status line
set title           " Show file in window title
set number          " Show line numbers
set relativenumber  " Show relative line numbers
set nowrap          " Don't auto-wrap on load
set linebreak       " When lines break do so at word boundary
set background=dark
set colorcolumn=80


set formatoptions-=t          " Don't auto-wrap when typing


" Keep number of lines/columns in view while scrolling
set scrolloff=4
set sidescrolloff=5


" -----
"  Thanks be to: Advanced Vim Workflows
"   https://www.youtube.com/watch?v=futay9NjOac
set hlsearch
set incsearch


" ------
"  Thanks be to: Damian Conway, 'More Instantly Better Vim' - OSCON 2013
"   https://www.youtube.com/watch?v=aHm36-na4-4
" Unicode for listchars
execute "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

