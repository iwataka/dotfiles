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

if g:use_ctrlp_extensions
  Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
  Plug 'iwataka/ctrlproj.vim'
endif

" ctrlp and fast matcher
Plug 'ctrlpvim/ctrlp.vim'

" useful goodies
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'

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
