"----------------------------------------------------------------
" Language settings
"----------------------------------------------------------------
let $LANG='ja'
set encoding=utf-8
set fileencodings=utf-8,sjis

" Use Unix as the standard file type
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
" no error notify
set noerrorbells
set novisualbell

" set default title
set title
set notitle

" enable syntax highlight
syntax on

"use relative number for moving cursor.
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
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

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

" Don't show the intro message when starting vim
set shortmess=atI

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

"----------------------------------------------------------------
" Loading Plugins settings
"----------------------------------------------------------------
" Sets neobundle path.
if has('vim_starting')
    set nocompatible
    set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim.local/bundle'))

if has('unix')
    NeoBundle 'Valloric/YouCompleteMe'
endif

NeoBundleLazy 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

call neobundle#end()

call neobundle#begin(expand('~/.vim/bundle'))

if has('neovim')
    NeoBundle 'ervandew/supertab'
    NeoBundle 'vim-scripts/AutoComplPop'
elseif has("win32") || has("win64") || has("win32unix")
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundle 'Shougo/neosnippet.vim'
    NeoBundle 'Shougo/neosnippet-snippets'
elseif has('unix')
    NeoBundle 'SirVer/ultisnips'
    NeoBundle 'honza/vim-snippets'
endif

" Enables to manage neobundle itself.
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'tpope/vim-fugitive', {'rev': '8258025'}

NeoBundle 'tpope/vim-repeat'

NeoBundle 'tpope/vim-surround'

" NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'tpope/vim-eunuch'

NeoBundleLazy 'tpope/vim-fireplace', {
    \ 'autoload' : {
    \  'filetypes' : ['clojure']
    \ }}

NeoBundleLazy 'ctrlpvim/ctrlp.vim', {
    \ 'depends' : ['FelikZ/ctrlp-py-matcher'],
    \ 'autoload' : {
    \  'commands' : ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPLine', 'CtrlPUndo']
    \ }}

" NeoBundleLazy 'tacahiroy/ctrlp-funky', {
"     \ 'depends' : ['ctrlpvim/ctrlp.vim'],
"     \ 'autoload' : {
"     \  'commands' : ['CtrlPFunky']
"     \ }}

NeoBundleLazy 'FelikZ/ctrlp-py-matcher'

"NeoBundleLazy 'Shougo/unite.vim', {
    "\ 'depends' : ['Shougo/neomru.vim', 'Shougo/unite-outline'],
    "\ 'autoload' : {
    "\  'commands' : ['Unite']
    "\ }}
"let bundle = neobundle#get('unite.vim')
"function! bundle.hooks.on_source(bundle)
    "call unite#filters#matcher_default#use(['matcher_fuzzy'])
    "call unite#filters#sorter_default#use(['sorter_rank'])
"endfunction

" NeoBundleLazy 'Shougo/neomru.vim'

" NeoBundleLazy 'Shougo/unite-outline'

NeoBundleLazy 'scrooloose/syntastic'

"NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'tpope/vim-commentary'

NeoBundleLazy 'scrooloose/nerdtree', {
    \ 'autoload' : {
    \  'commands' : ['NERDTreeToggle', 'NERDTreeFind', 'NERDTreeFromBookmark', 'NERDTreeCWD']
    \ }}

if has('gui_running')
    NeoBundle 'Shougo/vimshell.vim'
else
    NeoBundle 'benmills/vimux'
endif

NeoBundle 'Raimondi/delimitMate'

" NeoBundle 'mikewest/vimroom'

" NeoBundle 'Lokaltog/vim-easymotion'

" NeoBundle 'nathanaelkane/vim-indent-guides'

" NeoBundleLazy 'godlygeek/tabular', {
"     \ 'autoload' : {
"     \  'commands' : ['Tabularize']
"     \ }}

NeoBundleLazy 'majutsushi/tagbar', {
    \ 'autoload' : {
        \ 'commands' : ['TagbarToggle']
    \ }}

"NeoBundle 'itchyny/lightline.vim'

NeoBundle 'bling/vim-airline'

NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'airblade/vim-gitgutter'

" NeoBundle 'mhinz/vim-startify'

"syntax highlight
NeoBundleLazy 'plasticboy/vim-markdown', {
    \ 'autoload' : {
    \  'filetypes' : ['mkd']
    \ }}

NeoBundleLazy 'derekwyatt/vim-scala', {
    \ 'autoload' : {
    \  'filetypes' : ['scala'],
    \  'commands' : ['SortScalaImports']
    \ }}

NeoBundleLazy 'derekwyatt/vim-sbt', {
    \ 'depends' : ['derekwyatt/vim-scala'],
    \ 'autoload' : {
    \  'filetypes' : ['sbt']
    \ }}

NeoBundleLazy 'dag/vim2hs', {
    \ 'autoload' : {
    \  'filetypes' : ['haskell']
    \ }}

"colorschemes
"NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()

call neobundle#local(expand('~/.vim.local/bundle'))

filetype plugin indent on

" Check if there are any plugins left not installed.
NeoBundleCheck

"----------------------------------------------------------------
" fugitive settings
"----------------------------------------------------------------
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gc :Gcommit -m ''<Left>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gl :Glog<CR>

"----------------------------------------------------------------
" ctrlp settings
"----------------------------------------------------------------
if has('python')
    let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
endif
let g:ctrlp_cmd = 'CtrlP .'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_by_filename = 1
if executable('ag')
    let g:ctrlp_user_command = 'ag --follow --nocolor -g "" %s'
elseif executable('git')
    let g:ctrlp_user_command = 'git ls-files . --cached --exclude-standard --others'
else
    let g:ctrlp_custom_ignore = {
        \ 'dir': 'assets$\|action_log$\|\.gradle$\|build$\|project$\|target$\|out$\|libs$\|\.git$',
        \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
    \ }
endif
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
nnoremap <silent> [Leader]p :CtrlP .<CR>
nnoremap <silent> [Leader]b :CtrlPBuffer<CR>
nnoremap <silent> [Leader]m :CtrlPMRU<CR>
nnoremap <silent> [Leader]l :CtrlPLine %<CR>
nnoremap <silent> [Leader]u :CtrlPUndo<CR>
" nnoremap <silent> [Leader]r :CtrlPFunky<CR>

"----------------------------------------------------------------
" unite settings
"----------------------------------------------------------------
"let g:unite_enable_start_insert = 1
"let g:unite_source_history_yank_enable = 1
"let g:unite_source_file_mru_limit = 200
"if executable('ag')
    "let g:unite_source_rec_async_command =
    "\ 'ag --follow --nocolor --nogroup --hidden -g ""'
"elseif executable('git')
    "let g:unite_source_rec_async_command =
    "\ 'git ls-files . --cached --exclude-standard --others'
"endif
"nnoremap <Space>p :Unite file_rec/git:--cached:--others:--exclude-standard<CR>
""nnoremap <Space>p :Unite file_rec/async<CR>
"nnoremap <Space>b :Unite buffer<CR>
"nnoremap <Space>c :Unite command<CR>
"nnoremap <Space>s :Unite source<CR>
"nnoremap <Space>f :Unite function<CR>
"nnoremap <Space>m :Unite file_mru<CR>
"nnoremap <Space>l :Unite line<CR>
"nnoremap <Space>y :Unite history/yank<CR>
"nnoremap <Space>h :Unite change<CR>
"nnoremap <Space>n :Unite neobundle<CR>
"nnoremap <Space>r :Unite outline<CR>
"nnoremap <Space>j :Unite jump<CR>
"nnoremap <Space>k :Unite mapping<CR>

"----------------------------------------------------------------
" syntastic settings
"----------------------------------------------------------------
let g:syntastic_mode_map = { "mode": "passive",
                        \ "active_filetypes": [],
                        \ "passive_filetypes": [] }
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
nnoremap <silent> <Leader>si :SyntasticInfo<CR>
nnoremap <silent> <Leader>sc :SyntasticCheck<CR>

"----------------------------------------------------------------
" nerdtree settings
"----------------------------------------------------------------
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>
nnoremap <silent> <Leader>nm :NERDTreeMirror<CR>
nnoremap <silent> <Leader>nb :NERDTreeFromBookmark<CR>
nnoremap <silent> <Leader>nc :NERDTreeCWD<CR>

"----------------------------------------------------------------
" vimux settings
"----------------------------------------------------------------
nnoremap <silent> <Leader>vp :wa<CR>:VimuxPromptCommand<CR>
nnoremap <silent> <Leader>vl :wa<CR>:VimuxRunLastCommand<CR>
nnoremap <silent> <Leader>vi :VimuxInspectRunner<CR>
nnoremap <silent> <Leader>vq :VimuxCloseRunner<CR>
nnoremap <silent> <Leader>vs :VimuxInterruptRunner<CR>
nnoremap <silent> <Leader>vz :VimuxZoomRunner<CR>
nnoremap <silent> <Leader>vo :call VimuxOpenRunnerAtCWD()<CR>
nnoremap <silent> <Leader>vh :silent !tmux resize-pane -Z<CR>
function! VimuxOpenRunnerAtCWD()
    let cwd = getcwd()
    exe "normal! :VimuxRunCommand(\"" . cwd . "\")\<CR>"
endfunction

" aliases for sbt commands
nnoremap <silent> <Leader>vc :wa<CR>:VimuxRunCommand("compile")<CR>
nnoremap <silent> <Leader>vr :wa<CR>:VimuxRunCommand("run")<CR>
nnoremap <silent> <Leader>vt :call VimuxRunTest()<CR>

let g:lasttest = ""

function! VimuxRunTest()
    exe "normal! :wa\<CR>"
    let l:name = expand("%:t:r")
    let l:command = ""
    if l:name =~# "\.\*Test"
        let g:lasttest = l:name
        let l:command = "test:testOnly *" . l:name
    else
        let l:command = "test:testOnly *" . g:lasttest
    endif
    exe "normal! :call VimuxRunCommand(\"" . l:command . "\")\<CR>"
endfunction

"----------------------------------------------------------------
" easymotion settings
"----------------------------------------------------------------
" map s <Plug>(easymotion-prefix)
" let g:EasyMotion_smartcase = 1

"----------------------------------------------------------------
" indent-guides settings
"----------------------------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

"----------------------------------------------------------------
" tagbar settings
"----------------------------------------------------------------
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }
nnoremap <F9> :TagbarToggle<CR>

"----------------------------------------------------------------
" lightline settings
"----------------------------------------------------------------
"let g:lightline = {
      "\ 'colorscheme': 'solarized',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      "\   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      "\ },
      "\ 'component_function': {
      "\   'fugitive': 'MyFugitive',
      "\   'filename': 'MyFilename',
      "\   'fileformat': 'MyFileformat',
      "\   'filetype': 'MyFiletype',
      "\   'fileencoding': 'MyFileencoding',
      "\   'mode': 'MyMode',
      "\   'ctrlpmark': 'CtrlPMark',
      "\ },
      "\ 'component_expand': {
      "\   'syntastic': 'SyntasticStatuslineFlag',
      "\ },
      "\ 'component_type': {
      "\   'syntastic': 'error',
      "\ },
      "\ 'subseparator': { 'left': '|', 'right': '|' }
      "\ }

"function! MyModified()
  "return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
"endfunction

"function! MyReadonly()
  "return &ft !~? 'help' && &readonly ? 'RO' : ''
"endfunction

"function! MyFilename()
  "let fname = expand('%:t')
  "return fname == 'ControlP' ? g:lightline.ctrlp_item :
        "\ fname == '__Tagbar__' ? g:lightline.fname :
        "\ fname =~ '__Gundo\|NERD_tree' ? '' :
        "\ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        "\ &ft == 'unite' ? unite#get_status_string() :
        "\ &ft == 'vimshell' ? vimshell#get_status_string() :
        "\ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        "\ ('' != fname ? fname : '[No Name]') .
        "\ ('' != MyModified() ? ' ' . MyModified() : '')
"endfunction

"function! MyFugitive()
  "try
    "if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      "let mark = ''  " edit here for cool mark
      "let _ = fugitive#head()
      "return strlen(_) ? mark._ : ''
    "endif
  "catch
  "endtry
  "return ''
"endfunction

"function! MyFileformat()
  "return winwidth(0) > 70 ? &fileformat : ''
"endfunction

"function! MyFiletype()
  "return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
"endfunction

"function! MyFileencoding()
  "return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
"endfunction

"function! MyMode()
  "let fname = expand('%:t')
  "return fname == '__Tagbar__' ? 'Tagbar' :
        "\ fname == 'ControlP' ? 'CtrlP' :
        "\ fname == '__Gundo__' ? 'Gundo' :
        "\ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        "\ fname =~ 'NERD_tree' ? 'NERDTree' :
        "\ &ft == 'unite' ? 'Unite' :
        "\ &ft == 'vimfiler' ? 'VimFiler' :
        "\ &ft == 'vimshell' ? 'VimShell' :
        "\ winwidth(0) > 60 ? lightline#mode() : ''
"endfunction

"function! CtrlPMark()
  "if expand('%:t') =~ 'ControlP'
    "call lightline#link('iR'[g:lightline.ctrlp_regex])
    "return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          "\ , g:lightline.ctrlp_next], 0)
  "else
    "return ''
  "endif
"endfunction

"let g:ctrlp_status_func = {
  "\ 'main': 'CtrlPStatusFunc_1',
  "\ 'prog': 'CtrlPStatusFunc_2',
  "\ }

"function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  "let g:lightline.ctrlp_regex = a:regex
  "let g:lightline.ctrlp_prev = a:prev
  "let g:lightline.ctrlp_item = a:item
  "let g:lightline.ctrlp_next = a:next
  "return lightline#statusline(0)
"endfunction

"function! CtrlPStatusFunc_2(str)
  "return lightline#statusline(0)
"endfunction

"let g:tagbar_status_func = 'TagbarStatusFunc'

"function! TagbarStatusFunc(current, sort, fname, ...) abort
    "let g:lightline.fname = a:fname
  "return lightline#statusline(0)
"endfunction

"augroup AutoSyntastic
  "autocmd!
  "autocmd BufWritePost *.c,*.cpp call s:syntastic()
"augroup END
"function! s:syntastic()
  "SyntasticCheck
  "call lightline#update()
"endfunction

"let g:unite_force_overwrite_statusline = 0
"let g:vimfiler_force_overwrite_statusline = 0
"let g:vimshell_force_overwrite_statusline = 0

"----------------------------------------------------------------
" airline settings
"----------------------------------------------------------------
let g:airline_theme = "solarized"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"----------------------------------------------------------------
" multiple-cursors settings
"----------------------------------------------------------------
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock')==2
        exe 'NeoCompleteLock'
    endif
endfunction
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock')==2
        exe 'NeoCompleteUnlock'
    endif
endfunction

"----------------------------------------------------------------
" solarized settings
"----------------------------------------------------------------
let g:solarized_termcolors=256
let g:solarized_visibility='high'
let g:solarized_hitrail=1
let g:solarized_termtrans=1

"----------------------------------------------------------------
" scala settings
"----------------------------------------------------------------
nnoremap <silent> <Leader>ss :SortScalaImports<CR>
let g:scala_sort_across_groups=0

"----------------------------------------------------------------
" neocomplete settings
"----------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_delimiter = 0
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#auto_completion_start_length = 2
if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif
let g:neocomplete#sources._ = ['buffer', 'neosnippet']
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"----------------------------------------------------------------
" neosnippet settings
"----------------------------------------------------------------
imap <c-k> <Plug>(neosnippet_expand_or_jump)
smap <c-k> <Plug>(neosnippet_expand_or_jump)
xmap <c-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = '~/.vim/bundle/neosnippet-snippets/neosnippets'
"imap <expr><tab> neosnippet#expandable_or_jumpable() ?
            "\ "\<Plug>(neosnippet_expand_or_jump)"
            "\: pumvisible() ? "\<c-n>" : "\<tab>"
"smap <expr><tab> neosnippet#expandable_or_jumpable() ?
            "\ "\<Plug>(neosnippet_expand_or_jump)"
            "\: "\<tab>"

"----------------------------------------------------------------
" ultisnips settings
"----------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<c-cr>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim.local/bundle/vim-snippets/UltiSnips"

"----------------------------------------------------------------
" startify settings
"----------------------------------------------------------------
" let g:startify_enable_special         = 0
" let g:startify_files_number           = 8
" let g:startify_relative_path          = 1
" let g:startify_change_to_dir          = 0
" let g:startify_session_autoload       = 1
" let g:startify_session_persistence    = 1
" let g:startify_session_delete_buffers = 1

" let g:startify_list_order = [
"   \ ['   LRU within this dir:'],
"   \ 'dir',
"   \ ['   LRU:'],
"   \ 'files',
"   \ ['   Sessions:'],
"   \ 'sessions',
"   \ ['   Bookmarks:'],
"   \ 'bookmarks',
"   \ ]

" let g:startify_skiplist = [
"             \ 'COMMIT_EDITMSG',
"             \ $VIMRUNTIME .'/doc',
"             \ 'bundle/.*/doc',
"             \ '\.vimgolf',
"             \ ]

" let g:startify_bookmarks = [
"             \ '~/.vimrc',
"             \ ]

" " let g:startify_custom_footer =
" "       \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

" let g:startify_custom_header =
"       \ map(split(system('tips | cowsay -f apt'), '\n'), '"   ". v:val') + ['']

" hi StartifyBracket ctermfg=240
" hi StartifyFile    ctermfg=147
" hi StartifyFooter  ctermfg=240
" hi StartifyHeader  ctermfg=114
" hi StartifyNumber  ctermfg=215
" hi StartifyPath    ctermfg=245
" hi StartifySlash   ctermfg=240
" hi StartifySpecial ctermfg=240

" nnoremap [Leader]s :Startify<CR>

"----------------------------------------------------------------
" autoEdit settings
"----------------------------------------------------------------
"double-delete to remove trailing whitespace
nnoremap <silent> <BS><BS> :call TrimTrailingWS()<CR>
function! TrimTrailingWS()
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


"----------------------------------------------------------------
" foldElse settings
"----------------------------------------------------------------
" let s:pattern = ""
" "useful unfolding mapping
" nnoremap <Leader>fu zE

" nnoremap <Leader>fl :call FoldElseLastPattern()<CR>
" function! FoldElseLastPattern()
"     exe ":normal! :call FoldElse(\"" . s:pattern . "\")\<CR>"
" endfunction

" nnoremap <Leader>fc :call FoldElseClass()<CR>
" function! FoldElseClass()
"     let l:pattern = "\\\\sclass\\\\s"
"     let s:pattern = l:pattern
"     exe ":normal! :call FoldElse(\"" . l:pattern . "\")\<CR>"
" endfunction

" nnoremap <Leader>ff :call FoldElseFunc()<CR>
" function! FoldElseFunc()
"     let l:pattern = "\\\\sdef\\\\s"
"     let s:pattern = l:pattern
"     exe ":normal! :call FoldElse(\"" .l:pattern . "\")\<CR>"
" endfunction

" nnoremap <Leader>fp :call FoldElsePrompt()<CR>
" function! FoldElsePrompt()
"     let l:pattern = input("Pattern? ")
"     let s:pattern = l:pattern
"     exe "normal! :call FoldElse(\"" . l:pattern . "\")\<CR>"
" endfunction

" function! FoldElse(pattern)
"     set foldopen-=search
"     if search(a:pattern)
"         exe "normal! zEgg"
"         let l:flag = 0
"         let l:start_line_number = 0
"         while 1
"             let l:line_number = search(a:pattern, 'W')
"             if l:line_number == 0
"                 let l:line_number = line('$') + 1
"                 let l:flag = 1
"             endif
"             let l:end_line_number = l:line_number - 1
"             exe "normal! :" . l:start_line_number . "," . l:end_line_number . "fold\<CR>"
"             let l:start_line_number = l:line_number + 1
"             exe "normal! j"
"             if l:flag
"                 break
"             endif
"         endwhile
"         exe "normal! /" . a:pattern . "\<CR>"
"     endif
" endfunction

"----------------------------------------------------------------
" colorscheme settings
"----------------------------------------------------------------
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
if has("gui_running")
    set background=dark
else
    set background=dark
endif
colorscheme solarized
