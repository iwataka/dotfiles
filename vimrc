"----------------------------------------------------------------
" Preparations
"----------------------------------------------------------------
" Use Vim settings, rather than Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" define leader key
let mapleader=" "

" alternative key-bind of ,
" This is used when mapleader is ','.
" nnoremap <Leader>, ,

"define local leader key
let maplocalleader="\\"

if filereadable(expand('~/.vimrc.bundles'))
    source ~/.vimrc.bundles
endif

" Enable filetype plugins
filetype plugin on
filetype indent on

"----------------------------------------------------------------
" Language
"----------------------------------------------------------------
"when using Vim, english is better choice than japanese
let $LANG='en'

" set encoding to utf-8
set encoding=utf-8
set fileencodings=utf-8,sjis

" use unix as the standard file type
set fileformats=unix,dos,mac

"----------------------------------------------------------------
" Display
"----------------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors.
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

" If the filetype is diff, enables syntax highlight
" It is useful when syntax highlight is off by default.
" But I always enables syntax highlight, comment out this.
"augroup PatchDiffHighlight
    "autocmd!
    "autocmd FileType diff syntax enable
"augroup END

" highlight cursor line position
set cursorline

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Set below options if gui_running.
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

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" set textwidth
set textwidth=0
"----------------------------------------------------------------
" Indentation
"----------------------------------------------------------------
" use tab as 4 spaces
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" indent settings
set autoindent
set smartindent

"----------------------------------------------------------------
" Notification
"----------------------------------------------------------------
" no error notification
set noerrorbells
set vb t_vb=

" set filename to title bar
if has("title")
    set title
endif

" apply all of the abbreviations
set shortmess+=a
" truncate file message at the start
set shortmess+=t
" Don't show the intro message when starting vim
set shortmess+=I

"----------------------------------------------------------------
" Cursor Moving
"----------------------------------------------------------------
"more intuitive movement
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" move to marks efficiently
nnoremap ' `
nnoremap ` '

" use relative number for moving cursor
" Set number is not necessary because of Vim's goto line function.
" set number
if exists("&relativenumber")
    set relativenumber
    autocmd BufReadPost * set relativenumber
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" set three lines
set scrolloff=3

"----------------------------------------------------------------
" Command Line and something around it
"----------------------------------------------------------------
" command line itself
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

" set the amount of the command-line history
set history=100

" Command-line completion operates in an enhanced mode.
set wildmenu

" List all matches without completing, then each full match.
set wildmode=list,full

" The patterns which is ignored when expanding wildcards.
set wildignore+=*.exe,*.zip,*.swp,*.dll

"----------------------------------------------------------------
" Editting files
"----------------------------------------------------------------
" Enable to share clipboard.
set clipboard+=unnamed

" Automatically save before commands like :next and :make
set autowrite
" Automatically read when a file is modified from outside
set autoread

" Make no backup before overwriting a file.
set nobackup
set nowritebackup
" Make no swap file.
set noswapfile

" Enable backspace to delete indent, eol and start.
set backspace=indent,eol,start

" Enable to edit multiple files.
set hidden

" enable persistent undo
if has('persistent_undo')
    " Save all undo files in a single location (less messy, more risky)...
    set undodir=~/.vim/undo
    " Save a lot of back-history...
    set undolevels=100
    " Actually switch on persistent undo
    set undofile
endif

"----------------------------------------------------------------
" Search
"----------------------------------------------------------------
" The case of normal letters is ignored.
set ignorecase
" Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase

" When preceded with a backslash, some characters get a special meanings in search mode.
set magic

" Enable incremental search
set incsearch

" highlight all matches
set hlsearch

" use ag for grep
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    if &grepformat !~# '%c'
        set grepformat^=%f:%l:%c:%m
    endif
else
    set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
endif

" Add the g flag to search/replace by default
set gdefault

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

"----------------------------------------------------------------
" Connection
"----------------------------------------------------------------
" Optimize for fast terminal connections
set ttyfast

"----------------------------------------------------------------
" Key mappings
"----------------------------------------------------------------
" delete a character without adding it to default register
nnoremap x "_x

" edit .vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>

" source .vimrc file
nnoremap <leader>sv :wa<CR>:source $MYVIMRC<CR>

" edit .vimrc.bundles file
nnoremap <Leader>eb :e ~/.vimrc.bundles<CR>

" source .vimrc.bundles file
nnoremap <Leader>sb :wa<CR>:source ~/.vimrc.bundles<CR>

" Fast redrawing and switching off highlight search.
nnoremap <silent> <c-l> :redraw!<cr>:nohlsearch<cr>

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

" aliases for fold operations
" If the space key is mapleader, this mapping is useful
" to be alternative way to fold and unfold.
nnoremap <Leader>fo :foldopen<CR>
nnoremap <Leader>fO :%foldopen!<CR>
nnoremap <Leader>fc :foldclose<CR>
nnoremap <Leader>fC :%foldclose!<CR>

" Fast scroll vertically
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

" Fast scroll horizontally
nnoremap zl zL
nnoremap zh zH
nnoremap zL zl
nnoremap zH zh

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f', '')<CR>
" vnoremap <silent> # :call VisualSelection('b', '')<CR>

" typing backspace once to normalize spaces
nnoremap <silent> <BS> :call NormalizeSpaces()<CR>

" ======================deprecated because they have same function as unimpaired===========================
" insert blank line more easily
" This mapping is the imitation of the plugin 'unimpaired'.
" nnoremap ]<Space> o<Esc>k
" nnoremap [<Space> O<Esc>j

" exchange two lines more easily
" This mapping is the imitation of the plugin 'unimpaired'.
" nnoremap ]e ddp
" nnoremap [e ddkP

" Switch CWD to the directory of the open buffer
" This mapping is same prefix as quickfix operation mappings.
" noremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" alias for ctags operations
" This mapping is same prefix as quickfix operation mappings.
" nnoremap <Leader>ct :!ctags -R .<CR>

" aliases for quickfix operations
" nnoremap <Leader>cc :cclose<CR>
" nnoremap <Leader>cn :cnext<CR>
" nnoremap <Leader>cp :cprevious<CR>

" aliases for buffeer operations
" nnoremap <Leader>bd :bdelete
" nnoremap <Leader>bn :bnext<CR>
" nnoremap <Leader>bp :bprevious<CR>

" move last open buffer easily
" let g:lastbuffer = 1
" nnoremap <Leader>bl :exe "buffer " . lastbuffer<CR>
" au BufLeave * let g:lastbuffer = bufnr('%')

" aliases for tab operations
" nnoremap <Leader>to :tabonly<CR>
" nnoremap <Leader>tn :tabnext<CR>
" nnoremap <Leader>tp :tabprevious<CR>
" nnoremap <Leader>tc :tabclose<CR>
" nnoremap <Leader>tm :tabmove

" move last open tab easily
" let g:lasttab = 1
" nnoremap <Leader>tl :exe "tabn " . g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()

" ======================deprecated because of the compatibility with Vi===========================
" Fast saving
" nnoremap <Leader>w :w!<CR>

" Fast quitting
" nnoremap <Leader>q :q<CR>

" Fast hide other windows
" nnoremap <Leader>o :only<CR>

" define special leader
" nnoremap [Leader] <Nop>
" nmap <Space> [Leader]

" clears search highlight and redraw display
" nnoremap <silent> <Esc> :nohlsearch<CR>:redraw!<CR>

" escape from insert mode more easier
" inoremap jk <Esc>

" escape from command line mode more easier
" cnoremap jk <C-C>

" more useful command prefix
" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

" quickly executing macros
" nnoremap Q @q

" Fast replace command
" nnoremap S :%s//g<Left><Left>

" move between splitted panes more easier
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l

" Fast redrawing and switching off highlight search.
" nnoremap <silent> <c-h> :redraw!<cr>:nohlsearch<cr>

"----------------------------------------------------------------
" Auto commands
"----------------------------------------------------------------
" This group includes non-named auto commands.
augroup vimrcEx
    autocmd!

    " Enable spellchecking for Markdown
    autocmd FileType markdown setlocal spell

    " Automatically wrap at 80 characters for Markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80

    " Automatically wrap at 72 characters and spell check git commit messages
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal spell

    " set groovy filetype to gradle file
    autocmd BufRead,BufNewFile *.gradle set filetype=groovy
    " set scala filetype to sbt file
    autocmd BufRead,BufNewFile *.sbt set filetype=scala

    " automatically align html files
    " autocmd BufWritePre,BufRead *.html :normal gg=G

    " write comments easily for any files
    autocmd BufRead,BufNewFile * set formatoptions+=ro

    " emphasize comments
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

" make naughty characters stand out
" exec "set lcs=tab:\uBB\uBB,trail:\uB7,nbsp:~"
" augroup VisibleNaughtiness
"     autocmd!
"     autocmd BufEnter * set list
"     autocmd BufEnter *.txt set nolist
"     autocmd BufEnter *.vp* set nolist
"     autocmd BufEnter * if !&modifiable
"     autocmd BufEnter * set nolist
"     autocmd BufEnter * endif
" augroup END

" make 'O' the default when trying to edit the file simultaneously
" This paragraph is introduced by Demian Conway.
" augroup NoSimultaneousEdits
"     autocmd!
"     autocmd SwapExists * let v:swapchoice = 'o'
"     autocmd SwapExists * echomsg ErrorMsg
"     autocmd SwapExists * echo 'Duplicate edit session (readonly)'
"     autocmd SwapExists * echohl None
" augroup END

" For the compatibility with Vi, it is deprecated.
" augroup VimHelpKeybinds
"     autocmd!
"     autocmd FileType help nnoremap q :q<CR>
" augroup END

"----------------------------------------------------------------
" Helper function settings
"----------------------------------------------------------------
" Trim trailing white spaces and expand tab to some spaces.
function! NormalizeSpaces()
    let l:save_cursor = getpos(".")
    if search("\\t")
        let l:count = 0
        let l:spaces = ""
        while l:count < &tabstop
            let l:spaces = l:spaces . " "
            let l:count = l:count + 1
        endwhile
        exe "normal! :%s/\\t/" . l:spaces . "/g\<CR>"
    endif
    if search('\s\+$')
        :%s/\s\+$//g
    endif
    call setpos(".", l:save_cursor)
endfunction

" Change the number of spaces.
function! ChangeSpaceNum(m, n)
    let l:save_cursor = getpos(".")
    let l:before = ""
    let l:count = 0
    while l:count < a:m
        let l:before = l:before . " "
        let l:count = l:count + 1
    endwhile
    if search(l:before)
        let l:after = ""
        let l:count = 0
        while l:count < a:n
            let l:after = l:after . " "
            let l:count = l:count + 1
        endwhile
        exe "normal! :%s/" . l:before . "/" . l:after . "/g\<CR>"
    endif
    call setpos(".", l:save_cursor)
endfunction

"a function to convert java code into scala one
function! ConvertJavaIntoScala()
    let l:save_cursor = getpos(".")
    if search(";\\n")
        :%s/;\n/\r/g
    endif
    if search("()")
        :%s/()//g
    endif
    if search("public ")
        :%s/public //g
    endif
    call ChangeSpaceNum(4, 2)
    call setpos(".", l:save_cursor)
endfunction

" func! DeleteTillSlash()
"     let g:cmd = getcmdline()
"     if has("win16") || has("win32")
"         let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
"     else
"         let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
"     endif
"     if g:cmd == g:cmd_edited
"         if has("win16") || has("win32")
"             let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
"         else
"             let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
"         endif
"     endif
"     return g:cmd_edited
" endfunc

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

"----------------------------------------------------------------
" Loading local configurations
"----------------------------------------------------------------
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif