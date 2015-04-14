"----------------------------------------------------------------
" Preparations
"----------------------------------------------------------------
" Use Vim settings, rather than Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Set flags for OS type and plug-in
let g:is_win = has('win32') || has('win64') || has('win32unix')
let g:is_mac = has('mac')
let g:is_unix = has('unix')
let g:use_neocomplete = g:is_win && has('lua')
let g:use_ycm = !g:use_neocomplete && g:is_unix && has('python')
let g:use_supertab = !g:use_neocomplete && !g:use_ycm
let g:use_tmux = !has('gui_running')
let g:use_unite = 0
let g:use_ctrlp = !g:use_unite
let g:use_ctrlp_cmatcher = g:use_ctrlp && 0
let g:use_ctrlproj = g:use_ctrlp && 1

if filereadable(expand('~/.vim/vundles.vim'))
    source ~/.vim/vundles.vim
endif

" Enable filetype plugins
filetype plugin on
filetype indent on

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


"----------------------------------------------------------------
" Key mappings
"----------------------------------------------------------------
" delete a character without adding it to default register
nnoremap x "_x

" Very tired to use the little finger frequently.
" escape from insert mode more easier
inoremap jk <Esc>
cnoremap jk <C-c>

nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" for consistency with operators 'c' and 'd'.
nnoremap Y y$

" Fast saving
nnoremap <Leader>w :w<CR>

" Fast Quitting
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :qa!<cr>

nnoremap <leader>o :only<cr>

" Fast executing macros
nnoremap Q @q
vnoremap Q :norm @q<cr>

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

" Fast redrawing and erasing highlight
nnoremap <silent> gr :redraw!<cr>:nohlsearch<cr>

" Fast scroll vertically
nnoremap <c-y> 3<c-y>
nnoremap <c-e> 3<c-e>

" Fast tab navigation
nnoremap <s-l> gt
nnoremap <s-h> gT

nnoremap gb :bnext<cr>
nnoremap gB :bprevious<cr>

" move between splitted panes more easier
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

vnoremap > >gv
vnoremap < <gv

" save the file with root previledge
cnoremap w!! w !sudo tee % >/dev/null

nnoremap cp yap<s-}>p

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
    autocmd BufRead,BufNew * highlight FullWidthSpace cterm=underline ctermbg=red guibg=#666666
    autocmd BufRead,BufNew * match FullWidthSpace /　/

    " Automatically open the quickfix window after :Ggrep of fugitive.
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

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
" solarized
"----------------------------------------------------------------
let g:solarized_termcolors=256
let g:solarized_visibility='high'
let g:solarized_hitrail=1
let g:solarized_termtrans=1
set background=dark
silent! colo solarized

" ================ Custom Settings ========================
if filereadable(expand('~/.vim/settings.vim'))
  source ~/.vim/settings.vim
endif
