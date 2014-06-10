let $LANG='ja'
set encoding=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set title
syntax on
set smartindent
set ignorecase
set showmatch
set number
set smarttab
set backspace=indent,eol,start
set clipboard+=unnamed

set nocompatible
filetype off

set rtp+=~/dotfiles/vimfiles/vundle.git/        "vundleのディレクトリ
call vundle#rc()
Bundle 'derekwyatt/vim-scala'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/javacomplete'
Bundle 'Shougo/unite.vim'
filetype plugin indent on     " required!

autocmd vimenter * if !argc() | NERDTree | endif

autocmd Filetype java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
