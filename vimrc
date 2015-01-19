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

" Fix the input language to english.
set imdisable

"----------------------------------------------------------------
" Display
"----------------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors.
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
    syntax on
endif

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
" Set the time to show matches to 0.1s.
set matchtime=1

" set textwidth
set textwidth=0

" limit the height of popup menu when completing
set pumheight=10

" more natural way to split
set splitright
set splitbelow

" folding
let g:vim_markdown_folding_disabled=1

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
" Absolute number is somtimes useful.
set number
if exists("&relativenumber")
    set relativenumber
    autocmd BufReadPost * set relativenumber
endif

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
    set mousehide
endif

" set three lines
set scrolloff=3

" =======================EasyMotion===========================
" Not use default mappings, so this is not needed.
" map s <Plug>(easymotion-prefix)

" Disable default mappings
" If you are true vimmer, you should explicitly map keys by yourself.
" Do not rely on default bidings.
" let g:EasyMotion_do_mapping = 0

" Jump to anywhere you want by just `4` or `3` key strokes without thinking!
" `s{char}{char}{target}`
" nmap s <Plug>(easymotion-s2)
" xmap s <Plug>(easymotion-s2)
" omap z <Plug>(easymotion-s2)

" Turn on case sensitive feature
" let g:EasyMotion_smartcase = 1

" `JK` Motions: Extend line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" keep cursor column with `JK` motions
" let g:EasyMotion_startofline = 0

" let g:EasyMotion_keys = ';HKLYUIOPNM,QWERTASDGZXCVBJF'
" Show target key with upper case to improve readability
" let g:EasyMotion_use_upper = 1
" Jump to first match with enter & space
" let g:EasyMotion_enter_jump_first = 1
" let g:EasyMotion_space_jump_first = 1

" Extend search motions with vital-over command line interface
" Incremental highlight of all the matches
" Now, you don't need to repetitively press `n` or `N` with EasyMotion feature
" `<Tab>` & `<S-Tab>` to scroll up/down a page with next match
" :h easymotion-command-line
" These functions are not useful because of the lack of versatility.
" nmap g/ <Plug>(easymotion-sn)
" xmap g/ <Plug>(easymotion-sn)
" omap g/ <Plug>(easymotion-tn)

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
set wildmode=list:full

" The patterns which is ignored when expanding wildcards.
set wildignore+=*.exe,*.zip,*.swp,*.dll

"----------------------------------------------------------------
" Editting files
"----------------------------------------------------------------
" Enable to share clipboard.
set clipboard=unnamed
if has('unnamedplus')
    set clipboard+=unnamedplus
endif

" Automatically save before commands like :next and :make
set autowrite
" Automatically read when a file is modified from outside
set autoread

" Backup files don't annoy you if they are aggregated in certain single directory.
" set nobackup
" set nowritebackup
set backupdir=~/.vim/backups

" Swap files are useful to prevent from conflicting multiple edit.
" set noswapfile
set directory=~/.vim/swaps

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

" external commands for search
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    let g:ctrlp_user_command = 'ag --follow --nocolor -g "" %s'
    " if &grepformat !~# '%c'
    "     set grepformat^=%f:%l:%c:%m
    " endif
elseif executable('ack')
    set grepprg=ack\ -H\ --nocolor\ --nogroup
    let g:ctrlp_user_command = 'ack --follow --nocolor -g "" %s'
else
    if executable('git') && !has('win32') && !has('win64')
        let g:ctrlp_user_command = 'git ls-files %s --cached --exclude-standard --others'
    endif
    set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
endif

" Add the g flag to search/replace by default
set gdefault

" ctrlp
" default ignored directories
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.gradle$\|build$\|project$\|target$\|out$\|libs$\|\.git$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
" use pymatcher
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
let g:ctrlp_quickref_paths = [
    \ expand('$HOME/lib/go/src'),
    \ expand('$HOME/lib/jdk/src/'),
    \ ]

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

" Very tired to use the little finger frequently.
" escape from insert mode more easier
inoremap jk <Esc>

" edit .vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>

" source .vimrc file
nnoremap <leader>sv :wa<CR>:source $MYVIMRC<CR>

" edit .vimrc.bundles file
nnoremap <Leader>eb :e ~/.vimrc.bundles<CR>

" source .vimrc.bundles file
nnoremap <Leader>sb :wa<CR>:source ~/.vimrc.bundles<CR>

" edit snippets file
nnoremap <leader>es :UltiSnipsEdit<cr>

" for consistency with operators 'c' and 'd'.
nnoremap Y y$

" Fast redrawing and switching off highlight search.
" This mapping key is used to move between windows.
" nnoremap <silent> <c-l> :redraw!<cr>:nohlsearch<cr>

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

" aliases for git
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gl :Glog<CR>
" 'h' is the abbreviation of 'history'
nnoremap <Leader>gh :!git log<cr>

" fast aliases for ctrlp
nnoremap <silent> <Leader>p :CtrlP .<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>m :CtrlPMRU<CR>
" below three mappings is less frequently used
" nnoremap <silent> <Leader>l :CtrlPLine %<CR>
" nnoremap <silent> <Leader>u :CtrlPUndo<CR>
" nnoremap <silent> <Leader>r :CtrlPFunky<CR>

" Fast redrawing and erasing highlight
nnoremap <silent> <leader>r :redraw!<cr>:nohlsearch<cr>

" Fast scroll vertically
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

" move between splitted panes more easier
" If in GVim, tmux navigator is not loaded.
if has('gui_running')
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
endif

" Fast scroll horizontally
nnoremap zl zL
nnoremap zh zH
nnoremap zL zl
nnoremap zH zh

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f', '')<CR>
" vnoremap <silent> # :call VisualSelection('b', '')<CR>

" typing backspace twice to normalize spaces
" Typing twice prevents from calling accidentally.
nnoremap <silent> <BS><BS> :call NormalizeSpaces()<CR>

" Show tree view of your project via terminal.
command! TreeView exe "normal! :!tree src | less\<cr>"

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

" escape from command line mode more easier
" cnoremap jk <C-C>

" Fast hide other windows
" nnoremap <Leader>o :only<CR>

" define special leader
" nnoremap [Leader] <Nop>
" nmap <Space> [Leader]

" clears search highlight and redraw display
" nnoremap <silent> <Esc> :nohlsearch<CR>:redraw!<CR>

" more useful command prefix
" nnoremap ; :
" nnoremap : ;
" vnoremap ; :
" vnoremap : ;

" quickly executing macros
" nnoremap Q @q

" Fast replace command
" nnoremap S :%s//g<Left><Left>

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

    " prevent from conflicting multiple edit
    autocmd SwapExists * let v:swapchoice = 'o'

    "make the 81st column stand out
    autocmd BufRead,BufNew * highlight ColorColumn ctermbg=red guibg=#666666
    autocmd BufRead,BufNew * call matchadd('ColorColumn', '\%101v')

    " Visualizes full-size space
    autocmd BufRead,BufNew * highlight FullWidthSpace cterm=underline ctermbg=red guibg=#666666
    autocmd BufRead,BufNew * match FullWidthSpace /　/

    " Automatically open the quickfix window after :Ggrep of fugitive.
    autocmd QuickFixCmdPost *grep* cwindow
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

" If the filetype is diff, enables syntax highlight
" It is useful when syntax highlight is off by default.
" But I always enables syntax highlight, so this is meaningless.
"augroup PatchDiffHighlight
    "autocmd!
    "autocmd FileType diff syntax enable
"augroup END

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

" display markdown preview fast
if executable('pandoc') && executable('xdg-open')
    command! MarkdownPreview :call MarkdownPreview()
    function! MarkdownPreview()
        let l:name = expand("%:p")
        let l:name_without_extension = expand("%:p:r")
        silent execute '!pandoc ' . l:name . ' -o ' . l:name_without_extension . '.html'
        silent execute '!xdg-open ' . l:name_without_extension . '.html'
        redraw!
    endfunction
endif

" clear buffers except for current one
command! BufClear :call BufClear()
function! BufClear()
    let l:current_bufnr = bufnr("%")
    let l:last_bufnr = bufnr("$")
    silent! exe "normal! :0," . (l:current_bufnr - 1) . "bdelete\<cr>"
    silent! exe "normal! :" . (l:current_bufnr + 1) . "," . l:last_bufnr . "bdelete\<cr>"
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
" Abbreviations for Type
"----------------------------------------------------------------
abbrev factroy factory
abbrev reutrn return
abbrev netowrk network

"----------------------------------------------------------------
" colorscheme
"----------------------------------------------------------------
" solarized configuration
let g:solarized_termcolors=256
let g:solarized_visibility='high'
" highlight trailing spaces
let g:solarized_hitrail=1
let g:solarized_termtrans=1
" if solarized is not loaded, the exception is thrown
try
    call togglebg#map("<F5>")
catch
endtry

if has("gui_running")
    try
        set background=dark
        colorscheme solarized
    catch
        colorscheme desert
    endtry
else
    " Select colorscheme and background color depending on terminal type.
    if $COLORTERM == 'gnome-terminal'
        set t_Co=256
        let g:default_colorscheme = "solarized"
        let g:default_background = "dark"
    else
        let g:default_colorscheme = "desert"
        let g:default_background = "dark"
    endif
    silent exe 'normal! :colorscheme ' . g:default_colorscheme . "\<cr>"
    silent exe 'normal! :set background=' . g:default_background . "\<cr>"
endif

"----------------------------------------------------------------
" Loading local configurations
"----------------------------------------------------------------
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
