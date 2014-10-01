"----------------------------------------------------------------
" Language settings
"----------------------------------------------------------------
let $LANG='ja'
set encoding=utf-8
set fileencodings=utf-8,sjis
set fileformats=unix,dos,mac

"----------------------------------------------------------------
" Arrangement settings
"----------------------------------------------------------------
" tab settings
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" indent settings
set autoindent
set smartindent

"----------------------------------------------------------------
" Visual settings
"----------------------------------------------------------------
" Visualizes TAB space at the head of a rank.
"highlight TabString ctermbg=red guibg=red
"au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
"au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

" Visualizes full-size space
"highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
"au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
"au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

set title
" Disables to display 'Thanks to using vim!'
set notitle
syntax on
set number
set showcmd
set cmdheight=2
set ruler
set showmode
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"make the 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
"emphasize comments
highlight Comment term=bold ctermfg=white
"highligh matches when jumping to next
"nnoremap <silent>n n:call HLNext(0.4)<CR>
"nnoremap <silent>N N:call HLNext(0.4)<CR>
"function! HLNext(blinktime)
    "set invcursorline
    "redraw
    "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    "set invcursorline
    "redraw
"endfunction
"set listchars=tab:>~,nbsp:_,trail:.
"make naughty characters stand out
exec "set lcs=tab:\uBB\uBB,trail:\uB7,nbsp:~"
augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter * set list
    autocmd BufEnter *.txt set nolist
    autocmd BufEnter *.vp* set nolist
    autocmd BufEnter * if !&modifiable
    autocmd BufEnter * set nolist
    autocmd BufEnter * endif
augroup END
"enable syntax highlight when open diff files
"augroup PatchDiffHighlight
    "autocmd!
    "autocmd bufEnter *.pacht,*.rej,*.diff syntax enable
"augroup END
filetype on
augroup PatchDiffHighlight
    autocmd!
    autocmd FileType diff syntax enable
augroup END

"----------------------------------------------------------------
" Edit settings
"----------------------------------------------------------------
" Enables to share clipboard.
set clipboard+=unnamed
" delete a character without adding it to default register
nnoremap x "_x
"make 'O' the default when trying to edit the file simultaneously
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
    autocmd SwapExists * echomsg ErrorMsg
    autocmd SwapExists * echo 'Duplicate edit session (readonly)'
    autocmd SwapExists * echohl None
augroup END

"----------------------------------------------------------------
" Move settings
"----------------------------------------------------------------
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up> gk
" Enables to use mouse on Vim.
"set mouse=a
"set guioptions+=a
"set ttymouse=xterm2

"----------------------------------------------------------------
" Search settings
"----------------------------------------------------------------
set smartcase
set history=100
set hlsearch
set incsearch
set ignorecase
set infercase
set showmatch
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*/.git/*,*/out/*,*/libs/*,*/.gradle/*,*/build/*,*.exe,*.zip,*.swp,*/tmp/*,*.dll,*/project/*,*/target/*
set wildignore+=*/assets/*,*/action_log/*

"----------------------------------------------------------------
" Other settings
"----------------------------------------------------------------
set textwidth=0
" Disables beeping and flashing.
set noeb vb t_vb=
set browsedir=buffer
set scrolloff=3
set hidden
set autoread
set nobackup
set noswapfile
set backspace=indent,eol,start

"----------------------------------------------------------------
" key mappings
"----------------------------------------------------------------
"define leader key
let mapleader=","
"define local leader key
let maplocalleader="\\"
"edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"source .vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>
"escape from insert mode more easier
inoremap jk <esc>
"remove search highlight more easier
nnoremap <Leader>hs :nohlsearch<CR>
"move between splitted panes more easier
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
"move cursor even in isert mode
"but don't perform properly
"inoremap <c-j> <Down>
"inoremap <c-k> <Up>
"inoremap <c-h> <Left>
"inoremap <c-l> <Right>
nnoremap ; :
nnoremap : ;

"----------------------------------------------------------------
" User difined
"----------------------------------------------------------------
"treat gradle file as a groovy one
autocmd BufRead,BufNewFile *.gradle set filetype=groovy
"automatically align html files
autocmd BufWritePre,BufRead *.html :normal gg=G


"enable persistent undo
if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
    set undodir=$HOME/tmp/.VIM_UNDO_FILES
    " Save a lot of back-history...
    set undolevels=5000
    " Actually switch on persistent undo
    set undofile
endif

"double-delete toremove trailing whitespace
nnoremap <silent> <BS><BS> :call TrimTrailingWS()<CR>
function! TrimTrailingWS ()
    if search('\s\+$', 'cnw')
        :%s/\s\+$//g
    endif
endfunction

"----------------------------------------------------------------
" NeoBundle settings
"----------------------------------------------------------------
" Sets neobundle path.
if has('vim_starting')
    set nocompatible
    set rtp+=~/dotfiles/vimfiles/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Enables to manage neobundle itself.
NeoBundleFetch 'Shougo/neobundle.vim'

" Enumerates several plugins.
NeoBundle 'sjl/gundo.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'elzr/vim-json'
NeoBundle 'godlygeek/tabular'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-abolish'

call neobundle#end()

filetype plugin indent on

" Check if there are any plugins left not installed.
NeoBundleCheck

"----------------------------------------------------------------
" colorscheme settings
"----------------------------------------------------------------
"set background=dark
colorscheme pablo

"----------------------------------------------------------------
" nerdtree settings
"----------------------------------------------------------------
nnoremap <Leader>nt :NERDTreeToggle<CR>

"----------------------------------------------------------------
" gundo settings
"----------------------------------------------------------------
nnoremap <Leader>gu :GundoToggle<CR>

"----------------------------------------------------------------
" ctrlp settings
"----------------------------------------------------------------
"nnoremap <Leader>cp :CtrlP
nnoremap <Leader>cb :CtrlPBuffer<CR>

"----------------------------------------------------------------
" indent-guides settings
"----------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2

"----------------------------------------------------------------
" easymotion settings
"----------------------------------------------------------------
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_startofline = 0

"----------------------------------------------------------------
" vim-scala settings
"----------------------------------------------------------------
let g:scala_sort_across_groups=0

"----------------------------------------------------------------
" vimfiler settings
"----------------------------------------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0

"----------------------------------------------------------------
" neosnippet settings
"----------------------------------------------------------------
imap <c-k> <Plug>(neosnippet_expand_or_jump)
smap <c-k> <Plug>(neosnippet_expand_or_jump)
xmap <c-k> <Plug>(neosnippet_expand_target)

imap <expr><tab> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<c-n>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<tab>"

"----------------------------------------------------------------
" neocomplete settings
"----------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_delimiter = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"----------------------------------------------------------------
" fugitive settings
"----------------------------------------------------------------
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <leader>gg :Ggrep<Space>

