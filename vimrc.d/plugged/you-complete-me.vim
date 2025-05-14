set encoding=utf-8

""
" You Complete Me Configurations:
let g:ycm_always_populate_location_list = 1

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_use_clangd = 0
let g:ycm_clangd_binary_path = '/usr/bin/gcc'

""
" https://github.com/ycm-core/ycmd/issues/314#issuecomment-508899470
" https://github.com/ycm-core/lsp-examples/tree/master/ruby
" https://github.com/rbenv/rbenv
" https://github.com/rbenv/ruby-build
"
" ```bash
" pamac install rbenv-git
" pamac install ruby-build-git
"
" tee -a ~/.bashrc <<<'eval "$(rbenv init -)"'
" eval "$(rbenv init -)"
" rbenv install 2.3.8
"
" mkdir -vp ~/git/hub/ycm-core
" pushd "${_}"
"
" git clone git@github.com:ycm-core/lsp-examples.git
"
" pushd "lsp-examples/ruby"
" rbenv shell 2.3.8
" ./install
" vim test/test.rb
" ```
"
" ```bash
" cargo install pest-language-server
" ```
let g:ycm_lsp_dir_examples = $HOME . '/git/hub/ycm-core/lsp-examples'
let g:ycm_lsp_dir_third_party = $HOME . '/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party'
let g:ycm_lsp_dir_npm = $HOME . '/.npm/bin'
let g:ycm_language_server = [
      \   {
      \     'name': 'ruby',
      \     'filetypes': [ 'ruby' ],
      \     'cmdline': [ expand( g:ycm_lsp_dir . '/ruby/bin/solargraph' ), 'stdio' ],
      \   },
      \ ]
      " \   {
      " \     'name': 'rust',
      " \     'cmdline': [ 'rust-analyzer' ],
      " \     'filetypes': [ 'rust' ],
      " \     'project_root_files': [ 'Cargo.toml' ]
      " \   },

" let g:ycm_filetype_blacklist = {
"       \   'markdown': 1
"       \ }

""
" https://github.com/ycm-core/YouCompleteMe/wiki/FAQ#im-using-rust-with-ycm-and-this-causes-breaks-incremental-builds-of-my-project
" https://madskjeldgaard.dk/posts/rust-ycm/
" TLDR: YouCompleteMe and Rust otherwise will battle for build cache access
"       which causes unnecessary re-builds of dependencies and such
"
" ```bash
" rustup component add rust-analyzer
" rustup component add rust-src
" ```
"
" ```bash
" tee -a ~/.vimrc.d/plugged/00-init.vim <<'EOF'
" call plug#begin('~/.vim/plugged')
"   Plug 'rust-lang/rust.vim'
" call plug#end()
" EOF
" ```
"
" ```vim
" PlugInstall rust.vim
" ```
" let g:ycm_rust_toolchain_root = expand('~/.cargo')

""
" Mappings:
" Jump to definition
nnoremap <Leader>jd :YcmCompleter GoTo<CR>

