" ===============================================================
" VIM-PLUG BLOCK {{{
" ===============================================================
" Use Vim settings, rather than Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" If using Windows Vim, you should manually add .vim directory to runtime path.
if has("win32") || has("win64")
  set runtimepath+=~/.vim/
endif

silent! if plug#begin('~/.vim/plugged')

" Auto Completion
if (has('unix') || has('mac')) && has('python')
  Plug 'Valloric/YouCompleteMe'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
else
  Plug 'ervandew/supertab'
endif

" Tmux
if !has('gui_running')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-dispatch'
endif

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'iwataka/ctrlproj.vim'
Plug 'JazzCore/ctrlp-cmatcher'

" Other useful goodies
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'

" For specific filetypes
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'scrooloose/syntastic', { 'for': ['ruby', 'python'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'vim'] }

call plug#end()
endif

" Enable filetype plugins
filetype plugin on
filetype indent on

" }}}
" ===============================================================
" BASIC SETTINGS {{{
" ===============================================================

let mapleader      = " "
let maplocalleader = "\\"

let $LANG='en'
set encoding=utf-8
set fileencodings=utf-8,sjis
set fileformats=unix,dos,mac
set imdisable
set timeout
set timeoutlen=1000
set ttimeoutlen=100
set cursorline
set lazyredraw
set showmatch
set matchtime=1
set textwidth=0
set pumheight=10
set splitright
set splitbelow
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set noerrorbells
set vb t_vb=
set shortmess+=atI
set scrolloff=3
set showcmd
set cmdheight=2
set ruler
set showmode
set laststatus=2
set history=100
set wildmenu
set wildignorecase
set wildmode=list:full
set wildignore+=*.exe,*.zip,*.swp,*.dll
set autowrite
set autoread
set backspace=indent,eol,start
set hidden
set nostartofline
set ignorecase
set smartcase
set magic
set incsearch
set hlsearch
set gdefault
set ttyfast

set clipboard=unnamed
if has('unnamedplus')
  set clipboard+=unnamedplus
endif

set number
if exists('&relativenumber')
  set relativenumber
endif

if has('title')
  set title
endif

if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
endif

if has('gui_running')
  set guioptions-=mTLr
  set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 11
endif

if has('mouse')
    set mouse=a
    set mousehide
endif

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undolevels=100
    set undofile
endif

if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
elseif executable('ack')
    set grepprg=ack\ -H\ --nocolor\ --nogroup
else
    set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
endif

" }}}
" ===============================================================
" MAPPINGS {{{
" ===============================================================

nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

nnoremap x "_x

nnoremap ' `
nnoremap ` '

inoremap jk <Esc>
cnoremap jk <C-c>

nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" qq to record, Q to replay
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Make Y behave like other capitals
nnoremap Y y$

" Save
nnoremap <Leader>w :w<CR>
cnoremap w!! w !sudo tee % >/dev/null

" Quit
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>

" Hide other visibie buffers
nnoremap <leader>o :only<cr>

" Source the current file
nnoremap <leader>S :source %<cr>
" Source a visual range
vnoremap <leader>S y:@"<cr>

" Redraw
nnoremap <silent> gr :redraw!<cr>:nohlsearch<cr>

" Command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
cnoremap <expr> %% expand("%")

" Scroll horizontally
nnoremap zl zL
nnoremap zh zH
nnoremap zL zl
nnoremap zH zh

" Scroll vertically
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

" Move between splitted panes
if maparg('<c-j>', 'n') == ''
  nnoremap <c-j> <c-w>j
endif
if maparg('<c-k>', 'n') == ''
  nnoremap <c-k> <c-w>k
endif
if maparg('<c-h>', 'n') == ''
  nnoremap <c-h> <c-w>h
endif
if maparg('<c-l>', 'n') == ''
  nnoremap <c-l> <c-w>l
endif

" Highlight matches when jumping to next.
" Disabled because of incsearch plug-in.
" nnoremap <silent>n n:call HLNext(0.4)<CR>
" nnoremap <silent>N N:call HLNext(0.4)<CR>
" function! HLNext(blinktime)
    " set invcursorline
    " redraw
    " exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    " set invcursorline
    " redraw
" endfunction

" }}}
" ===============================================================
" AUTOCMD {{{
" ===============================================================

augroup vimrcEx
    autocmd!

    " Set markdown filetype.
    autocmd BufRead,BufNewFile *.md setlocal filetype=markdown

    " Enable spellchecking and word wrapping for Markdown
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal textwidth=80

    " Automatically wrap at 72 characters and spell check git commit messages
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal spell

    autocmd FileType help
      \ if &readonly | nnoremap <buffer> q :q<cr> | endif

    autocmd FileType java,make,sh,zsh,markdown
      \ setlocal tabstop=4 |
      \ setlocal softtabstop=4 |
      \ setlocal shiftwidth=4

    " set filetype according to each file
    autocmd BufRead,BufNewFile *.gradle set filetype=groovy
    autocmd BufRead,BufNewFile *.sbt set filetype=scala
    autocmd BufRead,BufNewFile *gitignore set filetype=conf

    " automatically align html files
    " autocmd BufWritePre,BufRead *.html :normal gg=G

    " write comments easily for any files
    autocmd BufRead,BufNewFile * set formatoptions+=ro

    " emphasize comments
    autocmd BufRead,BufNew * highlight Comment term=bold

    " prevent from conflicting multiple edit
    autocmd SwapExists * let v:swapchoice = 'o'

    "make the 81st column stand out
    autocmd BufRead,BufNew * highlight ColorColumn ctermbg=red guibg=#666666
    autocmd BufRead,BufNew * call matchadd('ColorColumn', '\%101v')

    " Visualizes full-size space
    autocmd BufRead,BufNew *
      \ highlight FullWidthSpace cterm=underline ctermbg=red guibg=#666666
    autocmd BufRead,BufNew * match FullWidthSpace /　/

    " Automatically open the quickfix window after :Ggrep of fugitive.
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

" }}}
" ===============================================================
" FUNCTIONS & COMMANDS {{{
" ===============================================================

" clear buffers except for current one
command! BufClear :call BufClear()
function! BufClear()
    let l:current_bufnr = bufnr("%")
    let l:last_bufnr = bufnr("$")
    silent! exe "normal! :0," . (l:current_bufnr - 1) . "bdelete\<cr>"
    silent! exe "normal! :" . (l:current_bufnr + 1) . "," . l:last_bufnr . "bdelete\<cr>"
endfunction

" }}}
" ===============================================================
" ABBREVIATIONS {{{
" ===============================================================
abbrev factroy factory
abbrev reutrn return
abbrev netowrk network

" }}}
" ===============================================================
" PLUGINS {{{
" ===============================================================

" --------------------------------------------------------------
" dispatch
" --------------------------------------------------------------
augroup dispatchEx
  autocmd!
  autocmd FileType scala let b:start = 'sbt'
augroup END

nnoremap <F9> :call <sid>StartOrDispatch()<cr>
fu! s:StartOrDispatch()
  if exists('b:start') && b:start != ''
    exe 'Start'
  else
    exe 'Dispatch'
  endif
endfu

" --------------------------------------------------------------
" solarized
" --------------------------------------------------------------
let g:solarized_termcolors=256
let g:solarized_visibility='high'
let g:solarized_hitrail=1
let g:solarized_termtrans=1
set background=dark
silent! colo solarized

" --------------------------------------------------------------
" gist
" --------------------------------------------------------------
if has('mac')
  let g:gist_clip_command = 'pbcopy'
elseif has('unix')
  let g:gist_clip_command = 'xclip -selection clipboard'
else
  let g:gist_clip_command = 'putclip'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 0
let g:gist_show_privates = 1
let g:gist_post_private = 1

if filereadable(expand('~/.vim/settings.vim'))
  source ~/.vim/settings.vim
endif

" }}}
