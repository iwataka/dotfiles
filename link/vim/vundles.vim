" If using Windows Vim, you should manually add .vim directory to runtime path.
if has("win32") || has("win64")
  set runtimepath+=~/.vim/
endif

call plug#begin('~/.vim/plugged')

if g:use_neocomplete
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
endif

if g:use_ycm
  Plug 'Valloric/YouCompleteMe'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
endif

if g:use_supertab
  Plug 'ervandew/supertab'
endif

" cooperation with vimux (in gui only)
if g:use_tmux
  Plug 'benmills/vimux'
  Plug 'christoomey/vim-tmux-navigator'
endif

" This plugin is unstable with nerdtree.
Plug 'tpope/vim-fugitive'

" Save the time to add close brackets.
Plug 'Raimondi/delimitMate'

" ctrlp and fast matcher
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
Plug 'iwataka/ctrlproj.vim'

" useful key-mappings
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'

" motion helper
Plug 'haya14busa/incsearch.vim'

" display useful information
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

" depending on filetypes
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'scrooloose/syntastic', { 'for': ['ruby', 'python'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'vim'] }

" local configuration for plugins
if filereadable(expand('~/.vim/.vundles.local'))
  source ~/.vim/.vundles.local
endif

call plug#end()
