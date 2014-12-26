" Use Vim settings, rather than Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Switch syntax highlighting on, when the terminal has colors.
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

"----------------------------------------------------------------
" Language settings
"----------------------------------------------------------------
"when using Vim, english is better choice than japanese
let $LANG='en'

set encoding=utf-8
set fileencodings=utf-8,sjis

" Use Unix as the standard file type
set fileformats=unix,dos,mac

"----------------------------------------------------------------
" Indentation settings
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
" no error notify
set noerrorbells
set novisualbell

" set default title
set title
set notitle

" use relative number for moving cursor.
" set number is not necessary because of goto line function.
" set number
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif

" cmd settings
set showcmd
set cmdheight=2

" show the line and column number of the cursor position
set ruler

" enable to show mode
set showmode

" Always show the status line
set laststatus=2

" default status line
if has("fugitive#statusline")
    set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

"highlight matches when jumping to next
"nnoremap <silent>n n:call HLNext(0.4)<CR>
"nnoremap <silent>N N:call HLNext(0.4)<CR>
"function! HLNext(blinktime)
    "set invcursorline
    "redraw
    "exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    "set invcursorline
    "redraw
"endfunction

" detects filetype
filetype on

" if the filetype is diff, enables syntax highlight
" it is useful when syntax highlight is off by default
"augroup PatchDiffHighlight
    "autocmd!
    "autocmd FileType diff syntax enable
"augroup END

" highlight cursor line position
set cursorline

" Don't redraw while executing macros (good performance config)
set lazyredraw

" linebreak on 500 characters
set lbr
set tw=500

if has("gui_running")
    "hide menubar and toolbar when running gui
    set guioptions-=m
    set guioptions-=T

    "hide scrollbars
    set guioptions-=L
    set guioptions-=r

    "default font for gui
    set guifont=Inconsolata\ Medium\ 12
endif

" apply all of the abbreviations
set shortmess+=a
" truncate file message at the start
set shortmess+=t
" Don't show the intro message when starting vim
set shortmess+=I

"----------------------------------------------------------------
" Edit settings
"----------------------------------------------------------------
" Enables to share clipboard.
set clipboard+=unnamed

" delete a character without adding it to default register
nnoremap x "_x

"make 'O' the default when trying to edit the file simultaneously
" augroup NoSimultaneousEdits
"     autocmd!
"     autocmd SwapExists * let v:swapchoice = 'o'
"     autocmd SwapExists * echomsg ErrorMsg
"     autocmd SwapExists * echo 'Duplicate edit session (readonly)'
"     autocmd SwapExists * echohl None
" augroup END

augroup VimHelpKeybinds
    autocmd!
    autocmd FileType help nnoremap q :q<CR>
augroup END

"Automatically save before commands like :next and :make
set autowrite
"Automatically read when a file is modified from outside
set autoread

"writes comments easily
autocmd BufRead,BufNewFile * set formatoptions+=ro

" Don't add empty newlines at the end of files
" set binary
" set noeol

"----------------------------------------------------------------
" Move settings
"----------------------------------------------------------------
"more intuitive movement
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" move to marks efficiently
nnoremap ' `
nnoremap ` '

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

"----------------------------------------------------------------
" Search settings
"----------------------------------------------------------------
set smartcase
set history=100
set incsearch
set hlsearch
set ignorecase
set infercase
set showmatch
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.exe,*.zip,*.swp,*.dll
set magic
set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
" use ag for grep
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    if &grepformat !~# '%c'
        set grepformat^=%f:%l:%c:%m
    endif
endif

" Add the g flag to search/replace by default
set gdefault

"----------------------------------------------------------------
" Other settings
"----------------------------------------------------------------
set textwidth=0
" Disables beeping and flashing.
set noeb vb t_vb=
set browsedir=buffer
set scrolloff=3
set hidden
set nobackup
set noswapfile
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

"----------------------------------------------------------------
" key mappings
"----------------------------------------------------------------
"define leader key
let mapleader=","

"alternative key-bind of ,
nnoremap <Leader>, ,

"define local leader key
let maplocalleader="\\"

" define special leader
nnoremap [Leader] <Nop>
nmap <Space> [Leader]

" edit .vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>

" source .vimrc file
nnoremap <leader>sv :wa<CR>:source $MYVIMRC<CR>

" edit build file
nnoremap <Leader>eb :find build*<CR>

" Fast saving
nnoremap <Leader>w :w!<CR>

" Fast quitting
nnoremap <Leader>q :q<CR>

" Fast hide other windows
nnoremap <Leader>o :only<CR>

" insert blank line more easily
nnoremap ]<Space> o<Esc>k
nnoremap [<Space> O<Esc>j

" exchange two lines more easily
nnoremap ]e ddp
nnoremap [e ddkP

" Fast replace command
nnoremap S :%s//g<Left><Left>

" clears search highlight and redraw display
nnoremap <silent> <Esc> :nohlsearch<CR>:redraw!<CR>

" escape from insert mode more easier
inoremap jk <Esc>

" escape from command line mode more easier
cnoremap jk <C-C>

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" Scrolls in command line
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" alias for current buffer path
cnoremap <expr> %% expand("%")

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
" cnoremap $q <C-\>eDeleteTillSlash()<CR>

nnoremap <Leader>bd :bdelete
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>

let g:lastbuffer = 1
nnoremap <Leader>bl :exe "buffer " . lastbuffer<CR>
" au BufLeave * if &ft != "help" let g:lastbuffer = bufnr('%') endif
au BufLeave * let g:lastbuffer = bufnr('%')

" Switch CWD to the directory of the open buffer
noremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" aliases for quickfix operations
nnoremap <Leader>cc :cclose<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprevious<CR>

" an alias for a ctags operation
nnoremap <Leader>ct :!ctags -R .<CR>

" aliases for fold operations
nnoremap <Leader>fo :foldopen<CR>
nnoremap <Leader>fO :%foldopen!<CR>
nnoremap <Leader>fc :foldclose<CR>
nnoremap <Leader>fC :%foldclose!<CR>

" quickly executing macros
nnoremap Q @q

" aliases for tab operations
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tm :tabmove

" Fast scroll vertically
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

" Fast scroll horizontally
nnoremap zl zL
nnoremap zh zH
nnoremap zL zl
nnoremap zH zh

let g:lasttab = 1
nnoremap <Leader>tl :exe "tabn " . g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" move between splitted panes more easier
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"more useful command prefix
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f', '')<CR>
" vnoremap <silent> # :call VisualSelection('b', '')<CR>

"----------------------------------------------------------------
" autocmd settings
"----------------------------------------------------------------
"treat gradle file as a groovy one
autocmd BufRead,BufNewFile *.gradle set filetype=groovy
"set sbt filetype
autocmd BufRead,BufNewFile *.sbt set filetype=sbt

"automatically align html files
" autocmd BufWritePre,BufRead *.html :normal gg=G

"emphasize comments
augroup EmphasizedComments
    autocmd!
    autocmd BufRead,BufNew * highlight Comment term=bold
augroup END

"make the 81st column stand out
augroup VisibleLongLines
    autocmd!
    autocmd BufRead,BufNew * highlight ColorColumn ctermbg=red guibg=#666666
    autocmd BufRead,BufNew * call matchadd('ColorColumn', '\%101v')
augroup END

" Visualizes full-size space
augroup VisibleFullWidthSpaces
    autocmd!
    autocmd BufRead,BufNew * highlight FullWidthSpace cterm=underline ctermbg=red guibg=#666666
    autocmd BufRead,BufNew * match FullWidthSpace /　/
augroup END

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

"----------------------------------------------------------------
" Helper function settings
"----------------------------------------------------------------
func! DeleteTillSlash()
    let g:cmd = getcmdline()
    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif
    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif
    return g:cmd_edited
endfunc

" function! CmdLine(str)
"     exe "menu Foo.Bar :" . a:str
"     emenu Foo.Bar
"     unmenu Foo
" endfunction

" function! VisualSelection(direction, extra_filter) range
"     let l:saved_reg = @"
"     execute "normal! vgvy"
"     let l:pattern = escape(@", '\\/.*$^~[]')
"     let l:pattern = substitute(l:pattern, "\n$", "", "")
"     if a:direction == 'b'
"         execute "normal ?" . l:pattern . "^M"
"     elseif a:direction == 'gv'
"         call CmdLine("Ack \"" . l:pattern . "\" " )
"     elseif a:direction == 'replace'
"         call CmdLine("%s" . '/'. l:pattern . '/')
"     elseif a:direction == 'f'
"         execute "normal /" . l:pattern . "^M"
"     endif
"     let @/ = l:pattern
"     let @" = l:saved_reg
" endfunction

"----------------------------------------------------------------
" User defined
"----------------------------------------------------------------

"enable persistent undo
if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
    set undodir=$HOME/tmp/.VIM_UNDO_FILES
    " Save a lot of back-history...
    set undolevels=5000
    " Actually switch on persistent undo
    set undofile
endif

function! OpenURL(url)
    if has("win32unix")
        exe "normal! :!cygstart " . a:url . "\<CR>"
    elseif has("win32")
        exe "normal! :!start " . a:url . "\<CR>"
    endif
    redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)
"open URL under cursor in browser
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><CR>

"----------------------------------------------------------------
" Abbreviations
"----------------------------------------------------------------
abbrev ijm jp.ac.keio.ae.iijima
abbrev ijmb jp.ac.keio.ae.iijima.bes
abbrev cvj com.vividsolutions.jts
abbrev cvjg com.vividsolutions.jts.geom
abbrev cvja com.vividsolutions.jts.algorithm
abbrev cvjm com.vividsolutions.jts.math
abbrev cvjgu com.vividsolutions.jts.geom.util
abbrev sfn sim.field.network
abbrev oij openifctools.com.openifcjavatoolbox
abbrev jvec javax.vecmath
abbrev jcon scala.collection.JavaConversions._
abbrev factroy factory
abbrev reutrn return

if filereadable(expand('~/.vimrc.bundles'))
    source ~/.vimrc.bundles
endif

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
