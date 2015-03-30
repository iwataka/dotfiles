" If using Windows Vim, you should manually add .vim directory to runtime path.
if has("win32") || has("win64")
  set runtimepath+=~/.vim/
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" auto completion (depending on OS type)
if g:use_neocomplete
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'Shougo/neosnippet.vim'
  Plugin 'Shougo/neosnippet-snippets'
endif

if g:use_ycm
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'SirVer/ultisnips'
  Plugin 'honza/vim-snippets'
endif

if g:use_supertab
  Plugin 'ervandew/supertab'
endif

" cooperation with vimux (in gui only)
if g:use_tmux
  Plugin 'benmills/vimux'
  Plugin 'christoomey/vim-tmux-navigator'
endif

" This plugin is unstable with nerdtree.
Plugin 'tpope/vim-fugitive'

" Save the time to add close brackets.
Plugin 'Raimondi/delimitMate'

" ctrlp and fast matcher
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'JazzCore/ctrlp-cmatcher'
Plugin 'iwataka/ctrlproj.vim'

" useful key-mappings
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'

" motion helper
Plugin 'haya14busa/incsearch.vim'

" display useful information
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'

" depending on filetypes
Plugin 'plasticboy/vim-markdown'
Plugin 'derekwyatt/vim-scala'
Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'

" local configuration for plugins
if filereadable(expand('~/.vim/.vundles.local'))
  source ~/.vim/.vundles.local
endif

call vundle#end()
filetype plugin indent on
