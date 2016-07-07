" VIM-PLUG BLOCK {{{1
" ===============================================================
" Use Vim settings, rather than Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Use ~/.vim as a runtime path even in Windows
if has('win32') && !has('nvim')
  set runtimepath+=~/.vim/
endif

silent! if plug#begin('~/.vim/plugged')

" My Plugins
" Windows can't access automatically via ssh
" Vim in Git for Windows is detected as win32unix
if !(has('win32') || has('win32unix')) && filereadable(expand('~/.ssh/config'))
  " Require my .ssh/config file.
  let g:plug_url_format = 'github:%s.git'
endif
Plug 'iwataka/minidown.vim', { 'for': ['markdown', 'rst'] }
Plug 'iwataka/airnote.vim', { 'on': ['Note', 'NoteDelete'] }
Plug 'iwataka/vim-markdown-ex', { 'for': 'markdown', 'on': ['OpenLinkHistory'] }
Plug 'iwataka/gitignore.vim'
Plug 'iwataka/hello-world.vim'
Plug 'iwataka/ctrlp-bookmarkdir-ex.vim'
unlet! g:plug_url_format

" Git
if executable('git')
  if v:version >= 703
    Plug 'mhinz/vim-signify'
  endif
  Plug 'tpope/vim-fugitive'
  Plug 'shumphrey/fugitive-gitlab.vim'
  Plug 'junegunn/gv.vim', { 'on': ['GV'] }
  Plug 'junegunn/vim-github-dashboard', { 'on': ['GHActivity', 'GHDashboard'] }
endif

" Navigation
Plug 'justinmk/vim-dirvish'
Plug 'ctrlpvim/ctrlp.vim'
if has('python')
  if has('unix') || has('mac') || has('macunix')
    Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
  else
    Plug 'FelikZ/ctrlp-py-matcher'
  endif
endif

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/unicode.vim',
      \ { 'on': ['SearchUnicode', 'UnicodeName', 'UnicodeTable', 'Digraphs'] }
" Vim's folding feature slows down inserting characters, especially cjk.
" This plug-in prevents it and enableds to fold without any effects to the
" performance. Really nice!
Plug 'Konfekt/FastFold'
Plug 'jeetsukumaran/vim-indentwise'

" Colorscheme
Plug 'morhetz/gruvbox'

" Filetype
if v:version >= 703
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'davidhalter/jedi-vim', { 'for': 'python' }
endif
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'docker' }
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'solarnz/thrift.vim', { 'for': 'thrift' }
Plug 'junegunn/vader.vim', { 'on': 'Vader', 'for': 'vader' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'asciidoc/vim-asciidoc', { 'for': 'asciidoc' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': 'typescript' }
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
if has('python')
  Plug 'justmao945/vim-clang', { 'for': ['c', 'cpp'] }
endif
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'PProvost/vim-ps1', { 'for': 'ps1' }

" Text Object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-line'
Plug 'rbonvall/vim-textobj-latex', { 'for': 'tex' }

" Utility
Plug 'itchyny/calendar.vim', { 'on': ['Calendar'] }
Plug 'mattn/webapi-vim'
Plug 'Shougo/vimproc.vim', {
      \ 'do': has('win32') ? 'tools\\update-dll-mingw' : 'make'
      \ }

call plug#end()
endif

filetype plugin on
filetype indent on

if findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim  " Move between if and else
endif
" Enable Man command by default
runtime ftplugin/man.vim

" ===============================================================
" BASIC SETTINGS {{{1
" ===============================================================

" The mapleader is used as a prefix for all user mappings.
let mapleader      = " "  " Space can be typed by both of hands.
let maplocalleader = "\\"  " The local mapleader is hardly used.

let $LANG='en'                            " Vim should be in English
if !has('win32')
  language time en_US.UTF8
endif
if has('vim_starting')
  set encoding=utf-8
endif
set fileencoding=utf-8
set fileencodings=utf-8,sjis              " UTF8 is first, SJIS is second
set termencoding=utf-8
set fileformats=unix,dos,mac              " Unix format has highest priority
set timeout                               " Enable timeout settings
set timeoutlen=1000                       " Time out on mapping after 1 second
set ttimeoutlen=100                       " Time out on key codes after 0.1 second
set lazyredraw                            " Not be redrawn while executing macros and so on
set showmatch                             " Show pairs of brackets
set matchtime=1                           " Tenths of a second to show the mathing paren
set textwidth=0                           " No limit for text width
set pumheight=10                          " Limit the height of popup menu
set splitright                            " More natural way to split a window vertically
set splitbelow                            " More natural way to split a window horizontally
set expandtab                             " Use spaces for indenting
set smarttab                              " Use spaces for inserting <Tab>
set autoindent                            " Same as the above indent
set smartindent                           " Smart autoindenting
set noerrorbells                          " No beep or screen flash for error messages
set visualbell t_vb=                      " No beeping, use visual bell
set shortmess+=atI                        " Some visual settings
set scrolloff=3                           " Keep some lines
set showcmd                               " Show command in the last line
set cmdheight=2                           " The height of command line
set ruler                                 " Show the cursor position in status line
set showmode                              " Show mode in the last line
set laststatus=2                          " last window will have a status line
set history=1000                          " A history in command line
set autowrite                             " Write contents of modified files automatically
set autoread                              " Detect changes from outside automatically
set backspace=indent,eol,start            " Enable backspace to delete more than characters
set hidden                                " A bufffer becomes hidden when it is abandoned
set nostartofline                         " Jump to certain positions, not starts of line
set ignorecase                            " Case insensitive by default
set smartcase                             " Case sensitive when containing capitals
set magic                                 " Make using regex more easier
set incsearch                             " Enable incremental search
set wrapscan                              " Enable wrap scan
set hlsearch                              " Highlight search results
nohlsearch                                " Prevent highlight when reloading .vimrc
set ttyfast                               " Enable fast connection
set conceallevel=0                        " Disable conceal feature
set allowrevins                           " Allow to use CTRL-_
set list lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show invisible characters
set nojoinspaces                          " No spaces when joining two lines
set colorcolumn=81
set completeopt-=preview
if v:version > 704 || v:version == 704 && has('patch092')
  set spelllang=en,cjk
else
  set spelllang=en
endif
if has('nvim')
  set shada='1000
else
  set viminfo='1000,<1000,s100,:100
endif
if v:version > 704 || v:version == 704 && has('patch338')
  set breakindent
endif
if has('folding')
  set foldenable                          " Enable to fold
  set foldlevel=0                         " Start folding at the second depth
  set foldmethod=marker                   " Use specified markers to fold sentences
endif

set wildmenu
set wildignorecase
set wildmode=list:longest,full
" set wildignore+=.git,.hg,.svn,.bzr,_darcs        " VCS
" set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
" set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
" set wildignore+=*.spl                            " compiled spelling word lists
" set wildignore+=*.sw?                            " Vim swap files
" set wildignore+=*.DS_Store                       " OSX
" set wildignore+=*.luac                           " Lua
" set wildignore+=*.pyc                            " Python
" set wildignore+=*.rbc                            " Ruby
" set wildignore+=*.class                          " JVM

if has('win32')
  set noimdisable
  set iminsert=1
  set imsearch=-1
endif

set clipboard=unnamed
if has('unnamedplus') || has('nvim')
  set clipboard+=unnamedplus
endif

" Some features are disabled to improve scrolling performance
let g:loaded_matchparen = 1
" set number
" This contains a performance issue
" if exists('&relativenumber')
"   set relativenumber
" endif

if has('title')
  set title
endif

if (&t_Co > 2 || has('gui_running')) && !exists('syntax_on')
  syntax on
endif

if has('gui_running')
  set guioptions=
  if has('win32')
    " See https://github.com/powerline/fonts
    " Hack font can't show powerline glyphs on my Windows.
    silent! set guifont=Hack:h9:cANSI
  else
    " Hack is maintained separately, which results less space occupied.
    " I use dual boot of Ubuntu and Windows and this causes a little space for
    " Ubuntu.
    silent! set guifont=Hack\ 11
  endif
endif

if has('mouse')
  set mouse=a
  set mousehide
endif

set formatoptions+=ro
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j  " Delete comment character when joining commented line
endif

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undolevels=100
  set undofile
endif

" pt is easy to use even on Windows and as fast as ag
if executable('pt')
  set grepprg=pt\ --nogroup\ --nocolor\ --column
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
elseif executable('ack')
  set grepprg=ack\ -H\ --nocolor\ --nogroup
elseif has('unix')
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
endif

if has('win32') && executable('mingw32-make')
  set makeprg=mingw32-make
endif

" ==============================================================
" AUTOCMD {{{1
" ===============================================================

if has('autocmd')
  augroup vimrcEx
    autocmd!

    " Disable IME when leaving insert mode.
    " This feature is available only on my Windows, so I've decided not to use.
    " autocmd InsertEnter * set iminsert=1
    " autocmd InsertLeave * set iminsert=0

    " Use cursorline only in the focused window.
    " This doesn't work with NERDTree.
    " Currently disabled because of performance issue.
    " autocmd WinEnter * set cursorline
    " autocmd WinLeave * set nocursorline

    " When editing a file, always jump to the last known cursor position.
    " do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    " filetype-specific
    autocmd FileType gitcommit
          \ setlocal textwidth=72 |
          \ setlocal spell
    autocmd FileType markdown
          \ setlocal spell |
          \ setlocal commentstring=<!--%s--> |
          \ setlocal foldlevel=1
    autocmd FileType calendar,git,gitv setlocal nolist
    autocmd FileType dosbatch setlocal commentstring=::%s
    autocmd FileType dot setlocal commentstring=//%s
    autocmd FileType c setlocal commentstring=//%s
    " Close buffers of specified types by just typing q.
    autocmd FileType help,qf,godoc nnoremap <buffer> q :q<cr>
    autocmd FileType java,c,cpp
          \ if executable('astyle') |
          \   setlocal formatprg=astyle |
          \ endif
    autocmd FileType python
          \ if executable('yapf') |
          \   setlocal formatprg='yapf' |
          \ endif
    autocmd FileType java compiler javac
    autocmd FileType ruby compiler ruby
    autocmd FileType rust compiler rustc

    " Set filetype
    autocmd BufRead,BufNewFile *spacemacs* set filetype=lisp
    autocmd BufRead,BufNewFile *.gradle set filetype=groovy
    autocmd BufRead,BufNewFile *editorconfig* set filetype=jproperties
    autocmd BufRead,BufNewFile *.gpg set filetype=gnupg
    autocmd BufRead,BufNewFile *.json set filetype=javascript
    autocmd BufRead,BufNewFile *gitconfig* set filetype=sh

    " prevent from conflicting multiple edit
    autocmd SwapExists * let v:swapchoice = 'o'

    " Fullwidth spaces, merge conflicts and ...
    autocmd BufRead * call matchadd('Visual', '　')
    autocmd BufRead * call matchadd('Visual', '\v^\s*\zs\<{7}[^\<]+$\ze')
    autocmd BufRead * call matchadd('Visual', '\v^\s*\zs\={7}$\ze')
    autocmd BufRead * call matchadd('Visual', '\v^\s*\zs\>{7}[^\>]+$\ze')

    " Automatically open the quickfix window
    " autocmd QuickFixCmdPost grep,Ggrep cwindow
    " autocmd QuickFixCmdPost lgrep,Glgrep lwindow

    " Automatically remove trailing spaces when saving
    " NOTE: This feature has bad effects for undo function.
    " autocmd BufWritePre * call s:preserve('%s/\s*$//')
  augroup END
endif

" ===============================================================
" STATUSLINE & TABLINE {{{1
" ==============================================================
fu! S_fugitive()
  if exists('*fugitive#head')
    let h = fugitive#head()
    return empty(h) ? '' : '[Git('.h.')]'
  endif
  return ''
endfu

fu! S_signify()
  if exists('b:sy') && get(b:sy, 'active', 0) && exists('b:sy.stats')
    let [add, ch, del] = b:sy.stats
    let sign_add = get(g:, 'signify_sign_add', '+')
    let sign_ch = get(g:, 'signify_sign_change', '~')
    let sign_del = get(g:, 'signify_sign_delete', '-')
    return '['.sign_add.add.' '.sign_ch.ch.' '.sign_del.del.']'
  else
    return ''
  endif
endfu

fu! S_readonly()
  return &readonly ? '[RO]' : ''
endfu

fu! MyStatusLine()
  let fname = ' %n:%f'
  let mod = '%m'
  let ro = '%{S_readonly()}'
  let sig = '%{S_signify()}'
  let fug = '%{S_fugitive()}'
  let ft = '%{&ft}'
  let ff = '[%{&ff}]'
  let fenc = '[%{&fenc}]'
  let pos = '[%l,%c%V]'
  let pct = '[%p%%]'
  let left = fname.mod.ro.'%<'.' '.sig.fug
  let right = ft.ff.fenc.' '.pos.pct
  return left.'%='.right
endfu

set statusline=%!MyStatusLine()

fu! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'
    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999Xclick here to close'
  endif
  return s
endfu

fu! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfu

set tabline=%!MyTabLine()

" ===============================================================
" MAPPINGS {{{1
" ===============================================================

" More reasonable cursor moving
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap gj j
nnoremap gk k
inoremap <silent> <Down> <c-o>:normal! gj<cr>
inoremap <silent> <Up> <c-o>:normal! gk<cr>

" Prevent to override registers by one character
nnoremap x "_x

" " Visual block is better than ordinary visual mode
" nnoremap v <c-v>
" nnoremap <c-v> v

" Better jumping to marks
nnoremap ' `
nnoremap ` '

" Better jumping to tags
nnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>

" jk | Escaping!
inoremap jk <Esc>
cnoremap jk <C-c>
" These lines cause motion delay in Visual mode.
" vnoremap jk <Esc>
" xnoremap jk <Esc>
if has('nvim')
  tnoremap jk <C-\><C-n>
  tnoremap <ESC> <C-\><C-n>
endif

" " Edit vimrc
" nnoremap <leader>ev :vsplit ~/.vim/init.vim<cr>
" " Source vimrc
" nnoremap <leader>sv :source $MYVIMRC<cr>
" " Source the current buffer
" nnoremap <leader>sc :source %<cr>

" qq to record, Q to replay
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Make Y behave like other capitals
nnoremap Y y$

" Save
inoremap <C-s> <C-O>:<c-u>w<cr>
nnoremap <C-s> :<c-u>w<cr>
nnoremap <Leader>w :<c-u>w<CR>
cnoremap w!! w !sudo tee % >/dev/null

" Quit
nnoremap <leader>q :<c-u>q<cr>

" Hide other visibie buffers
nnoremap <leader>o :<c-u>only<cr>

" Command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
" This annoys me a little
" cnoremap <expr> %% expand("%")

" Scroll horizontally
nnoremap zl zL
nnoremap zh zH
nnoremap zL zl
nnoremap zH zh

" Scroll vertically
" nnoremap <c-y> 3<c-y>
" nnoremap <c-e> 3<c-e>

" Circular window navigation
nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

" Clear the highlighting of :set hlsearch.
nnoremap <silent> <C-l> :<c-u>nohlsearch<cr><C-l>
nnoremap <silent> <Esc><Esc> :<c-u>nohlsearch<cr><C-l>

" Increment and decrement numbers by + and - keys.
" Tmux uses <c-a> key as a prefix, so Vim can't use it.
nnoremap + <c-a>
nnoremap - <c-x>

" Select all.
nnoremap <c-a> gg^vG$

" Make <C-u> behave like being on command line
inoremap <C-u> <C-g>u<C-u>

" Search by */# in visual mode
xnoremap <silent> g* :<c-u>let @/ = '\V'.<sid>get_visual_selection()[0]<cr>:normal n<cr>
xnoremap <silent> g# :<C-u>let @/ = '\V'.<sid>get_visual_selection()[0]<cr>:normal N<cr>
xnoremap <silent> * :<C-u>let @/ = '\<'.<sid>get_visual_selection()[0].'\>'<cr>:normal n<cr>
xnoremap <silent> # :<C-u>let @/ = '\<'.<sid>get_visual_selection()[0].'\>'<cr>:normal N<cr>

" Double <BS> to remove trailing spaces
" This doesn't work as you wish.
" nnoremap <silent> <BS><BS> :<c-u>call <sid>preserve('%s/[　\s]*$//')<cr>
nnoremap <silent> <BS><BS> :<c-u>call <sid>preserve('%s/\s*$//')<cr>

" :checktime is frequently used
nnoremap <leader>ct :<c-u>checktime<cr>

" Some mappings for user-defined commands
nnoremap <silent> <leader>rt :<c-u>Root<cr>
if !maparg('<tab>', 'i') | inoremap <expr> <tab> <sid>super_duper_tab("\<c-n>", "\<tab>") | endif
if !maparg('<tab>', 'i') | inoremap <expr> <S-tab> <sid>super_duper_tab("\<c-p>", "\<tab>") | endif

" grep by K
nnoremap K :<c-u>call :<c-u>grep <c-r>=shellescape(expand('<cword>'))<cr><cr>
xnoremap K :<c-u>call :<c-u>grep <c-r>=shellescape(<sid>get_visual_selection()[0])<cr><cr>

" unimpared extension
nnoremap cof :<c-u>setlocal <c-r>=&fen ? 'nofoldenable' : 'foldenable'<cr><cr>

" ===============================================================
" FUNCTIONS & COMMANDS {{{1
" ===============================================================

" Clear all buffers by bdelete command.
" If unsaved buffers exist, this command fails.
com! -bang -complete=file -nargs=? BufClear call s:bufclear(<bang>0, <q-args>)
fu! s:bufclear(bang, path)
  let lastnr = bufnr('$')
  let dpath = a:path == '' ? '' : fnamemodify(expand(a:path), ':p')
  " buffer number starts from 1
  let i = 1
  wh i <= lastnr
    let fpath = fnamemodify(bufname(i), ':p')
    " Terminal buffers can't be deleted automatically.
    if getbufvar(i, "&buftype") != "terminal"
      if bufexists(i) &&
            \ (dpath == '' || (filereadable(fpath) && s:is_under(dpath, fpath)))
        silent exe 'bwipeout '.i
      elseif a:bang && bufloaded(i)
        silent exe 'bdelete '.i
      endif
    endif
    let i = i + 1
  endwh
endfu

com! -nargs=* SwapList echo join(s:swap_list(<q-args>), ' ')
fu! s:swap_list(pat)
  let result = []
  let files = split(globpath(&directory, '*'), '\n')
  for file in files
    let tail = fnamemodify(file, ':t')
    if tail =~ a:pat
      call add(result, tail)
    endif
  endfor
  return result
endfu
com! -nargs=* -bang -complete=customlist,SwapDeleteComplete SwapDelete call s:swap_delete(<bang>0, <f-args>)
fu! s:swap_delete(bang, ...)
  redir => fname
  silent swapname
  redir END
  if executable('ps') && executable('grep') && !a:bang
    let procs = system('ps -ef |grep -P "\d+?:\d+?:\d+?\s+?vim"')
    let proc_list = split(substitute(procs, '\v\s+$|^\s+|\n', '', 'g'), '\n')
    if len(proc_list) > 1
      if input('Other Vim process may exist. Continue (y/n)? ') !~ '\v\cy|yes'
        return
      endif
    endif
  endif
  if a:0
    let dirs = split(&directory, ',')
    for fname in a:000
      for dir in dirs
        if filereadable(dir.'/'.fname)
          if delete(dir.'/'.fname)
            echo 'Failed to delete'.fname
          endif
        endif
      endfor
    endfor
  else
    let fname = substitute(fname, '\v\s+$|^\s+|\n', '', 'g')
    bdelete
    call delete(fname)
  endif
endfu
fu! SwapDeleteComplete(A, L, P)
  return s:swap_list('\V\^'.a:A)
endfu

" Check if a:fpath is under a:dpath
" a:dpath and a:fpath must be expanded path.
fu! s:is_under(dpath, fpath)
  if has('win32')
    return a:fpath =~? '^'.a:dpath.'.*'
  else
    return a:fpath =~# '^'.a:dpath.'.*'
  endif
endfu

" Changes the current directory to the project root
cabbrev r Root
com! Root call s:move_to_root('cd', expand('%:p:h'))
com! LRoot call s:move_to_root('lcd', expand('%:p:h'))
fu! s:move_to_root(cmd, path)
  let root = s:root(a:path)
  if empty(root)
    silent exe a:cmd.' '.a:path
    echom 'Not in a project'
  else
    silent exe a:cmd.' '.root
    echom 'Changes the current directory to: '.root
  endif
endfu
fu! s:root(cwd)
  let rmarkers = ['.git', '.hg', '.svn', '.bzr', '_darcs']
  for mark in rmarkers
    let rdir = finddir(mark, a:cwd.';')
    if !empty(rdir)
      return fnamemodify(rdir, ':h')
    endif
  endfor
  return ''
endfu

fu! s:warn(msg)
  echohl WarningMsg
  echo a:msg
  echohl Normal
endfu

com! Tab2Spaces call s:tab_to_spaces()
fu! s:tab_to_spaces()
  if search('\t', 'n')
    let num = &tabstop
    let spaces = ''
    for i in range(num)
      let spaces = spaces.' '
    endfor
    silent exe '%s/\t/'.spaces.'/'
  endif
endfu

" Execute a given command with the cursor position and the search register
" preserved.
fu! s:preserve(cmd)
  let _s = @/
  let l = line(".")
  let c = col(".")
  exe a:cmd
  let @/ = _s
  call cursor(l, c)
endfu

" Returns the text in the current visual selection.
" http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
fu! s:get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1 :]
  return lines
endfu

" from Junegunn's vimrc
" https://github.com/junegunn/dotfiles/blob/master/vimrc#L453-L493
fu! s:super_duper_tab(k, o)
  if pumvisible()
    return a:k
  endif
  let line = getline('.')
  let col = col('.') - 2
  if empty(line) || line[col] !~ '\k\|[/~.]' || line[col + 1] =~ '\k'
    return a:o
  endif
  let prefix = expand(matchstr(line[0:col], '\S*$'))
  if !empty(&omnifunc)
    return "\<c-x>\<c-o>"
  endif
  if !empty(&completefunc)
    return "\<c-x>\<c-u>"
  endif
  if prefix =~ '^[~/.]'
    return "\<c-x>\<c-f>"
  endif
  return a:k
endfu
" This function can't precisely judge the given function can complete or not
" (issue with tsuquyomi)
" fu! s:can_complete(func, prefix)
"   if empty(a:func) || call(a:func, [1, '']) < 0
"     return 0
"   endif
"   let result = call(a:func, [0, matchstr(a:prefix, '\k\+$')])
"   return !empty(type(result) == type([]) ? result : result.words)
" endfu

" " Settings about japanese and english input sources
" if has('unix')
"   let s:default_input_source = "mozc-jp"
"   let s:ibus = !empty(system('ibus engine 2> /dev/null'))
"   aug vimrc-jp
"     au!
"     au InsertLeave * call s:on_insert_leave()
"   aug END
" endif

" " Execute this when leaving from insert mode.
" fu! s:on_insert_leave()
"   silent call s:switch_input_source_to_default()
" endfu

" " Switch current input source to the default
" fu! s:switch_input_source_to_default()
"   if s:current_input_source() != s:default_input_source
"     if s:ibus
"       silent call system('ibus engine '.s:default_input_source)
"     endif
"   endif
" endfu

" " Returns current input source
" fu! s:current_input_source()
"   if s:ibus
"     return substitute(system('ibus engine'), '\(\n\|\r\)', '', '')
"   else
"     return ''
"   endif
" endfu

" com! InputRestart call s:input_restart()
" fu! s:input_restart()
"   if s:ibus
"     silent call system('ibus restart')
"   endif
"   sleep 300m
"   silent call s:switch_input_source_to_default()
" endfu

cabbrev o Open
com! -nargs=* -complete=file Open call s:open(<f-args>)
fu! s:open(...)
  let args = join(map(copy(a:000), 's:quote_path_or_url(v:val)'), ' ')
  let args = empty(args) ? '"'.expand('%:p').'"' : args
  " Vim in Git for Windows has win32unix and doesn't have cygstart
  if has('win32unix') && executable('cygstart')
    call system('cygstart '.args)
  elseif has('win32') || has('win32unix')
    if filereadable(args[1:-2]) || isdirectory(args[1:-2])
      let cwd = getcwd()
      call s:cd_or_lcd(fnamemodify(args[1:-2], ':h'))
      let args = fnamemodify(args[1:-2], ':t')
      call s:open_win(args)
      call s:cd_or_lcd(cwd)
    else
      call s:open_win(args)
    endif
  elseif has('unix')
    " This line does not work at all and I don't know the reason.
    " silent exec '!xdg-open '.args
    call system('xdg-open '.args)
  elseif has('mac')
    silent exec '!open '.args
  endif
  redraw!
endfu
fu! s:open_win(args)
  silent! exe '!start '.a:args
  if v:shell_error
    silent exec '!rundll32 url.dll,FileProtocolHandler '.a:args
  endif
endfu
fu! s:quote_path_or_url(str)
  let path = expand(a:str)
  if filereadable(path) || isdirectory(path)
    return '"'.fnamemodify(resolve(path), ':p').'"'
  elseif a:str =~ '\vhttp[s]?://'
    return '"'.a:str.'"'
  else
    return a:str
  endif
endfu

fu! s:cd_or_lcd(path)
  if haslocaldir()
    exe 'lcd '.a:path
  else
    exe 'cd '.a:path
  endif
endfu

com! -nargs=* -complete=customlist,s:UrlComplete Browse call s:open(<q-args>)
let s:browse_url_list = [
  \ 'http://youtube.com',
  \ 'http://www.iijima.ae.keio.ac.jp/studio/',
  \ 'http://google.com'
  \ ]
fu! s:UrlComplete(A, L, P)
  let bookmark_list = filter(s:chrome_bookmark_list(), 'v:val =~ "'.a:A.'"')
  let url_list = filter(copy(s:browse_url_list), 'v:val =~ "'.a:A.'"')
  let result = []
  call extend(result, bookmark_list)
  call extend(result, url_list)
  return result
endfu
fu! s:chrome_bookmark_list()
  let bookmark_fname = ''
  if has('win32')
    let bookmark_fname = $LOCALAPPDATA.'/Google/Chrome/User Data/Default/Bookmarks'
  elseif has('unix')
    let bookmark_fname = expand('~/.config/google-chrome/Default/Bookmarks')
  else
    return []
  endif
  try
    let bookmark = s:json_decode(join(readfile(bookmark_fname), ''))
  catch /^/
    return []
  endtry
  let children = bookmark.roots.bookmark_bar.children
  return map(copy(children), 'v:val.url')
endfu

fu! s:json_decode(str)
  if exists('*json_decode')
    return json_decode(a:str)
  elseif exists('*jsondecode')
    return jsondecode(a:str)
  else
    return webapi#json#decode(a:str)
  endif
  return {}
endfu

com! -nargs=* Google call s:google_search(<f-args>)
fu! s:google_search(...)
  let keywords = join(a:000, '+')
  let url = ""
  if keywords == ""
    let url = "https://www.google.com"
  else
    let url = "https://www.google.com/search?q=".keywords
  endif
  call s:open(url)
endfu

com! -nargs=* YouTube call s:youtube_search(<q-args>)
fu! s:youtube_search(keywords)
  let url = ""
  if a:keywords == ""
    let url = "https://www.youtube.com"
  else
    let url = "https://www.youtube.com/results?search_query=".a:keywords
  endif
  call s:open(url)
endfu

com! -nargs=? JavaDoc call s:javadoc(8, <q-args>)
fu! s:javadoc(version, class)
  let class = ''
  if a:class != ''
    let class = substitute(a:class, '\.', '/', 'g').'.html'
  endif
  let url = 'http://docs.oracle.com/javase/'.a:version.'/docs/api/'.class
  call s:open(url)
endfu

com! Todo call s:todo()
fu! s:todo()
  silent! grep TODO
  silent! grepadd FIXME
  silent! grepadd OPTIMIZE
  silent! grepadd HACK
  silent! grepadd REVIEW
  silent! grepadd CHANGED
  silent! grepadd XXX
  silent! grepadd IDEA
  silent! grepadd NOTE
endfu

" This has the same name as Make command in vim-dispatch and it causes
" some annoyances.
" com! Make call <sid>make_current_project()
" fu! s:make_current_project()
"   let files = split(system('ls'), '\n')
"   for file in files
"     if file == "Makefile"
"       !make
"       return
"     elseif file == "Rakefile"
"       !rake
"       return
"     endif
"   endfor
"   make
" endfu

com! -nargs=* Run call <sid>run_this_script(<q-args>)
fu! s:run_this_script(args)
  let fname = expand('%')
  if &filetype == 'python'
    exe '!python '.fname.' '.a:args
  elseif &filetype == 'ruby'
    exe '!ruby '.fname.' '.a:args
  " Use `so %` instead of this
  " elseif &filetype == 'vim'
    " Put 'silent!' at the head because sourcing .vimrc must cause an error.
    " silent! exe 'source '.fname
  elseif &filetype == 'ps1'
    exe '!powershell -f '.fname.' '.a:args
  else
    exe '!'.fname.' '.a:args
  endif
endfu

com! A call s:alternate(expand('%'), 'edit')
com! AV call s:alternate(expand('%'), 'vsplit')
com! AS call s:alternate(expand('%'), 'split')
com! AT call s:alternate(expand('%'), 'tabedit')
" Test files are detected by the suffixes `Test` or `Spec`.
fu! s:alternate(fname, cmd)
  let root_name = fnamemodify(a:fname, ':p:r')
  let extension = fnamemodify(a:fname, ':e')

  " C language source and header files
  if extension == 'c'
    silent exe a:cmd.' '.root_name.'.h'
    return
  elseif extension == 'h'
    silent exe a:cmd.' '.root_name.'.c'
    return
  endif

  " File separator depends on OS
  let separator = expand('/')

  " General source and test files
  let is_test = (root_name =~ '.*\(Test\|Spec\|_test\|_spec\)')
  if is_test
    let root_name = substitute(root_name, 'test'.separator, 'main'.separator, '')
    let root_name = substitute(root_name, '\(Test\|Spec\|_test\|_spec\)$', '', '')
    call s:open_file(root_name.'.'.extension, a:cmd)
  else
    let root_name = substitute(root_name, 'main'.separator, 'test'.separator, '')
    " Possible test patterns
    let camel_test = root_name.'Test.'.extension
    let camel_spec = root_name.'Spec.'.extension
    let snake_test = root_name.'_test.'.extension
    let snake_spec = root_name.'_spec.'.extension
    " Determine the most reasonable pattern by the current file type
    if &ft == 'java' || &ft == 'scala'
      let finally_created = camel_test
    elseif &ft == 'go'
      let finally_created = snake_test
    endif
    if filereadable(camel_test)
      call s:open_file(camel_test, a:cmd)
    elseif filereadable(camel_spec)
      call s:open_file(camel_spec, a:cmd)
    elseif filereadable(snake_test)
      call s:open_file(snake_test, a:cmd)
    elseif filereadable(snake_spec)
      call s:open_file(snake_spec, a:cmd)
    elseif exists('finally_created')
      call s:open_file(finally_created, a:cmd)
    endif
  endif
endfu

" Opens the specified file with its parent directory created.
fu! s:open_file(fname, cmd)
  let parent_dir = fnamemodify(expand(a:fname), ':p:h')
  if !isdirectory(parent_dir)
    call mkdir(parent_dir, 'p')
  endif
  silent exe a:cmd.' '.a:fname
endfu

com! -nargs=* -complete=customlist,s:TempEditComplete Tedit call s:open_file(s:tempname(<q-args>), 'edit')
com! -nargs=* -complete=customlist,s:TempEditComplete Tsplit call s:open_file(s:tempname(<q-args>), 'split')
com! -nargs=* -complete=customlist,s:TempEditComplete Tvsplit call s:open_file(s:tempname(<q-args>), 'vsplit')
com! -nargs=* -complete=customlist,s:TempEditComplete Ttabedit call s:open_file(s:tempname(<q-args>), 'tabedit')
fu! s:tempdir()
  let dirname = 'myvim_tmp'
  return fnamemodify(tempname(), ':h').'/'.dirname
endfu
fu! s:tempname(fname)
  return s:tempdir().'/'.a:fname
endfu
fu! s:TempEditComplete(A, L, P)
  let files = split(glob(s:tempdir().'/*'), '\n')
  let files = map(files, 'fnamemodify(v:val, ":t")')
  return filter(files, 'v:val =~ a:A')
endfu

com! XmlFormat call s:xml_format()
fu! s:xml_format()
  %s/></>\r</g
  normal! gg=G
endfu

com! -range Average call s:register_avg(getline(<line1>, <line2>))
com! -range Var call s:register_var(getline(<line1>, <line2>))
com! -range Stddev call s:register_stddev(getline(<line1>, <line2>))
fu! s:register_avg(lines)
  let avg = string(s:avg(s:nums(a:lines)))
  let @+ = avg
  echo 'The average is ['.avg.']'
endfu
fu! s:register_var(lines)
  let var = string(s:var(s:nums(a:lines)))
  let @+ = var
  echo 'The variance is ['.var.']'
endfu
fu! s:register_stddev(lines)
  let stddev = string(s:stddev(s:nums(a:lines)))
  let @+ = stddev
  echo 'The standard deviation is ['.stddev.']'
endfu
fu! s:nums(lines)
  if type(a:lines) == type('')
    let line = a:lines
  elseif type(a:lines) == type([])
    let line = ''
    for l in a:lines
      let line .= l.','
    endfor
  endif
  return map(filter(split(line, ','), 'v:val != ""'), 'str2float(v:val)')
endfu
fu! s:avg(nums)
  return s:sum(a:nums) / len(a:nums)
endfu
fu! s:var(nums)
  let avg = s:avg(a:nums)
  let devs = map(a:nums, 'pow(v:val - avg, 2)')
  return s:sum(devs) / (len(a:nums) - 1)
endfu
fu! s:stddev(nums)
  return pow(s:var(a:nums), 0.5)
endfu
fu! s:sum(nums)
  let sum = 0
  for n in a:nums
    let sum += n
  endfor
  return sum
endfu

" Japanese-specific commands
com! -range=% -nargs=? Punct call s:substitute_punct(<line1>, <line2>, <f-args>)
fu! s:substitute_punct(line1, line2, ...)
  let map = {
        \ '、': '，',
        \ '。': '．'
        \ }
  let flag = a:0 ? a:1 : 'g'
  call s:substitute_map(a:line1, a:line2, map, flag)
endfu
com! -range=% -nargs=? Number call s:substitute_number(<line1>, <line2>, <f-args>)
fu! s:substitute_number(line1, line2, ...)
  let map = {
        \ '１': '1',
        \ '２': '2',
        \ '３': '3',
        \ '４': '4',
        \ '５': '5',
        \ '６': '6',
        \ '７': '7',
        \ '８': '8',
        \ '９': '9'
        \ }
  let flag = a:0 ? a:1 : 'g'
  call s:substitute_map(a:line1, a:line2, map, flag)
endfu
fu! s:substitute_map(line1, line2, map, flag)
  for [key, value] in items(a:map)
    silent! exe a:line1.','.a:line2.'s/'.key.'/'.value.'/'.a:flag
  endfor
endfu

if v:version > 704 || v:version == 704 && has('patch1128')
  com! -nargs=+ -complete=dir Rmdir call s:rmdir(<f-args>)
  fu! s:rmdir(...)
    for path in a:000
      let path = expand(path)
      if isdirectory(path)
        if delete(path, 'd')
          echo 'Really delete '.path.'? (y/n)'
          let rep = nr2char(getchar())
          if rep =~# '[yY]'
            if delete(path, 'rf')
              echoe 'Fail to delete '.path
            endif
          endif
        endif
      else
        echoe path.' is not a directory'
      endif
    endfor
  endfu
endif

com! -nargs=+ -complete=dir DiffDir call s:diffdir(<f-args>)
fu! s:diffdir(dir1, dir2)
  let files1 = filter(split(globpath(a:dir1, '*'), '\n'), 'filereadable(v:val)')
  let files1 = map(files1, 'fnamemodify(v:val, ":t")')
  let files2 = filter(split(globpath(a:dir2, '*'), '\n'), 'filereadable(v:val)')
  let files2 = map(files2, 'fnamemodify(v:val, ":t")')
  for file in files1
    tabnew
    exe 'edit '.a:dir1.'/'.file
    let i = index(files2, file)
    if i >= 0
      exe 'vsplit '.a:dir2.'/'.file
      windo diffthis
      call remove(files2, i)
    else
      vnew
    endif
    nnoremap <buffer> q :<c-u>tabclose<cr>
    wincmd h
    nnoremap <buffer> q :<c-u>tabclose<cr>
  endfor
  for file in files2
    tabnew
    nnoremap <buffer> q :<c-u>tabclose<cr>
    exe 'vsplit '.a:dir2.'/'.file
    nnoremap <buffer> q :<c-u>tabclose<cr>
  endfor
endfu

com! -nargs=+ -complete=file SubstitueByJson call s:substitute_by_json(<f-args>)
fu! s:substitute_by_json(...)
  let fname = a:1
  let flag = a:0 > 1 ? a:2 : 'g'
  try
    let dict = s:json_decode(join(readfile(fname), ''))
  catch /^/
    return
  endtry
  call s:substitute_by_dict(dict, flag)
endfu
fu! s:substitute_by_dict(...)
  let dict = a:1
  let flag = a:0 > 1 ? a:2 : 'g'
  for [key, val] in items(dict)
    if type(val) == type('')
      exe '%s/'.key.'/'.val.'/'.flag
    elseif type(val) == type({})
      call s:substitute_by_dict(val, flag)
    endif
  endfor
endfu

" ===============================================================
" ABBREVIATIONS {{{1
" ===============================================================

" Insert the current date and time.
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" Spelling
abbrev factroy factory
abbrev reutrn return
abbrev netowrk network
abbrev SpaitalNetwork SpatialNetwork
abbrev nwe new

" Shortcut
if has('autocmd')
  au vimrcEx FileType java call s:abbrev_java()
  au vimrcEx FileType scala call s:abbrev_scala()
endif

fu! s:abbrev_java()
  iab <buffer> ijm jp.ac.keio.ae.iijima
  iab <buffer> ijmb jp.ac.keio.ae.iijima.besim
  iab <buffer> cvj com.vividsolutions.jts
  iab <buffer> cvjg com.vividsolutions.jts.geom
  iab <buffer> cvja com.vividsolutions.jts.algorithm
  iab <buffer> cvjm com.vividsolutions.jts.math
  iab <buffer> cvjgu com.vividsolutions.jts.geom.util
  iab <buffer> sfn sim.field.network
  iab <buffer> sfg sim.field.grid
  iab <buffer> sfc sim.field.continuous
  iab <buffer> oij openifctools.com.openifcjavatoolbox
  iab <buffer> jvec javax.vecmath
endfu

fu! s:abbrev_scala()
  call s:abbrev_java()
  iab <buffer> jconv scala.collection.JavaConversions._
endfu

" ===============================================================
" PLUGINS {{{1
" ===============================================================

" --------------------------------------------------------------
" Plug {{{2
" --------------------------------------------------------------

if has('autocmd')
  autocmd vimrcEx FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
endif

fu! s:plug_gx()
  let line = getline('.')
  let sha  = matchstr(line, '^  \zs[0-9a-f]\{7}\ze ')
  let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
                      \ : getline(search('^- .*:$', 'bn'))[2:-2]
  let uri  = get(get(g:plugs, name, {}), 'uri', '')
  if uri !~ 'github.com'
    return
  endif
  let repo = matchstr(uri, '[^:/]*/'.name)
  let url  = empty(sha) ? 'https://github.com/'.repo
                      \ : printf('https://github.com/%s/commit/%s', repo, sha)
  call netrw#NetrwBrowseX(url, 0)
endfu

com! -nargs=+ -complete=customlist,s:plug_load_complete
      \ PlugLoad call s:plug_load(<f-args>)
fu! s:plug_load(...)
  for plug in a:000
    call plug#load(plug)
  endfor
endfu
fu! s:plug_load_complete(A, L, P)
  let cands = filter(copy(keys(g:plugs)), 'v:val =~ "\\v^'.a:A.'"')
  return filter(cands, '&rtp !~ v:val')
endfu

com! -nargs=+ -complete=customlist,s:plug_open_complete
      \ PlugOpen call s:plug_open(<f-args>)
" The below substitution is for my own use
let s:plug_open_dict = {
      \ '\v^github:': 'https://github.com/'
      \ }
fu! s:plug_open(...)
  for plug in a:000
    let uri = g:plugs[plug]['uri']
    if uri =~ '\v^git\@github.com:'
      let uri = substitute(uri, '\v^git\@github.com:', 'https://github.com/', '')
    endif
    for [pat, val] in items(s:plug_open_dict)
      if uri =~ pat
        let uri = substitute(uri, pat, val, 'g')
      endif
    endfor
    " GitHub redirects https://github.com/foo/bar.git to
    " https://github.com/foo/bar, but it reduces the performance
    if uri =~ '\v\.git$'
      let uri = substitute(uri, '\v\.git$', '', '')
    endif
    call s:open(uri)
  endfor
endfu
fu! s:plug_open_complete(A, L, P)
  return filter(copy(keys(g:plugs)), 'v:val =~ "\\v^'.a:A.'"')
endfu

" --------------------------------------------------------------
" ColorScheme {{{2
" --------------------------------------------------------------
let s:colors_name = 'gruvbox'
" Italic style on Windows has low-visibility and disable it.
let s:italic = 1
if has('win32') || !(has('gui_running') || has('nvim'))
  let s:italic = 0
endif
let g:gruvbox_improved_warnings = 1
let g:gruvbox_italic = s:italic

nnoremap <silent> <F11> :call <sid>toggle_fullscreen()<cr>
fu! s:toggle_fullscreen()
  if has('gui_macvim')
    exe 'set '.(&fullscreen ? 'nofullscreen' ? 'fullscreen')
  elseif executable('wmctrl')
    call system('wmctrl -ir '.v:windowid.' -b toggle,fullscreen')
  elseif exists(':WToggleFullscreen')
    WToggleFullscreen
  endif
endfu

nnoremap <F5> :set background=<c-r>=&bg == 'dark' ? 'light' : 'dark'<cr><cr>
" This mappings may not work on terminal, but not used on it.
nnoremap <C-F5> :call <sid>toggle_contrast(1)<cr>
nnoremap <C-S-F5> :call <sid>toggle_contrast(0)<cr>
com! -nargs=1 -complete=customlist,s:ToggleContrastComplete
      \ ToggleContrast call s:set_contrast(<q-args>)
fu! s:toggle_contrast(incr)
  " In some cases, g:colors_name is unlet
  if exists('g:colors_name')
    if g:colors_name == 'gruvbox'
      exe 'let cont = g:gruvbox_contrast_'.&bg
      let contlist = ['soft', 'medium', 'hard']
      let nextindex = (index(contlist, cont) + (a:incr ? 1 : -1)) % len(contlist)
      call s:set_contrast(contlist[nextindex])
    elseif g:colors_name == 'solarized'
      let cont = g:solarized_contrast
      let contlist = ['low', 'normal', 'high']
      let nextindex = (index(contlist, cont) + (a:incr ? 1 : -1)) % len(contlist)
      call s:set_contrast(contlist[nextindex])
    else
      call s:warn(g:colors_name.' is not supported.')
    endif
  endif
endfu
fu! s:set_contrast(cont)
  if exists('g:colors_name')
    if g:colors_name == 'gruvbox'
      exe 'let g:gruvbox_contrast_'.&bg.' = "'.a:cont.'"'
      colorscheme gruvbox
      redraw | exe 'echo "Current contrast: ".g:gruvbox_contrast_'.&bg
    elseif g:colors_name == 'solarized'
      let g:solarized_contrast = a:cont
      colorscheme solarized
      redraw | echo 'Current contrast: '.g:solarized_contrast
    endif
  endif
endfu
fu! s:ToggleContrastComplete(A, L, P)
  if g:colors_name == 'gruvbox'
    return filter(['soft', 'medium', 'hard'], 'v:val =~ "'.a:A.'"')
  elseif g:colors_name == 'solarized'
    return filter(['low', 'normal', 'high'], 'v:val =~ "'.a:A.'"')
  endif
endfu

if !has('gui_running')
  autocmd vimrcEx ColorScheme *
        \ hi Normal ctermbg=NONE |
        \ hi NonText ctermbg=NONE
endif

if !exists('g:colors_name')
  try
    exe 'colorscheme '.s:colors_name
    if has('gui_running')
      set background=light
    else
      set background=dark
    endif
  catch /^/
    " Default colorscheme
    colorscheme desert
    set background=dark
  endtry
endif

" --------------------------------------------------------------
" CtrlP {{{2
" --------------------------------------------------------------
if executable('pt')
  let s:ctrlp_user_command = 'pt -l --follow --nocolor "" %s'
elseif executable('ag')
  let s:ctrlp_user_command = 'ag --follow --nocolor -g "" %s'
elseif executable('ack')
  let s:ctrlp_user_command = 'ack --follow --nocolor -g "" %s'
endif
let s:ctrlp_vcs_user_commands = {
  \ 1: ['.git', 'cd %s && git ls-files'],
  \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ }
if exists('s:ctrlp_user_command')
  let g:ctrlp_user_command = {
    \ 'types': s:ctrlp_vcs_user_commands,
    \ 'fallback': s:ctrlp_user_command
    \ }
else
  let g:ctrlp_user_command = {
    \ 'types': s:ctrlp_vcs_user_commands
    \ }
endif

" default ignored directories
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.gradle$\|build$\|project$\|target$\|out$\|libs$\|\.git$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_mruf_max = 1000
let g:ctrlp_mruf_exclude=
      \ '\v^fugitive:'.repeat(expand('/'), 2).'|'
      \ .expand('/').'\.git'.expand('/')
" Disable switching to existing buffers, which has bad effects on Goyo.
let g:ctrlp_switch_buffer = 0

nnoremap <silent> <Leader>p :<c-u>CtrlP<CR>
" This immitates atom, sublimeText and so on.
" Conflict with vim-multiple-cursors
" nnoremap <silent> <C-p> :CtrlP<cr>
nnoremap <silent> <Leader>b :<c-u>CtrlPBuffer<CR>
nnoremap <silent> <Leader>m :<c-u>CtrlPMRU<CR>
nnoremap <silent> <Leader>d :<c-u>CtrlPBookmarkDir<CR>
nnoremap <silent> <F3> :<c-u>CtrlPBookmarkDirReload!<CR>

let g:ctrlp_bookmarkdir_ex_paths = [
      \ '~/projects/*',
      \ '~/lib/*',
      \ '~/dotfiles',
      \ '~/gdrive',
      \ '$JAVA_HOME/src',
      \ ]
if has('unix')
  call extend(g:ctrlp_bookmarkdir_ex_paths, [
        \ '/usr/lib/ruby/[1-9]\+\(\.[1-9]\+\)*',
        \ '/usr/lib/python[1-9]\+\(\.[1-9]\+\)*',
        \ '/usr/lib/perl/[1-9]\+\(\.[1-9]\+\)*',
        \ '/usr/lib/jvm/java-[1-9]\+-oracle'
        \ ])
elseif has('win32')
  call extend(g:ctrlp_bookmarkdir_ex_paths, [
        \ 'C:\lib\*'
        \ ])
endif
let g:ctrlp_bookmarkdir_ex_force = 1

if has('python')
  if has('unix') || has('mac') || has('macunix')
    let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
  else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  endif
endif

" --------------------------------------------------------------
" Git {{{2
" --------------------------------------------------------------
nnoremap gs :<c-u>Gstatus<CR>
nnoremap <leader>gd :<c-u>Gdiff<CR>
nnoremap <leader>gD :<c-u>Gsplit! diff<cr>
nnoremap <leader>gg :<c-u>Ggrep<space>
nnoremap <Leader>gc :<c-u>Gcommit<CR>
nnoremap <Leader>gr :<c-u>Gread<CR>
nnoremap <leader>gR :<c-u>Gremove<cr>
nnoremap <Leader>gw :<c-u>Gwrite<CR>
nnoremap <Leader>gl :<c-u>Glog<CR>
nnoremap <leader>gL :<c-u>Gpedit! log -n 10 --stat<cr><c-w>p
nnoremap <leader>ga :<c-u>Gcommit --amend<cr>
nnoremap <leader>gA :<c-u>Git add --all<cr>

nnoremap <leader>gv :<c-u>GV<cr>
xnoremap <leader>gv :GV<cr>

if has('autocmd')
  autocmd vimrcEx BufEnter * if exists(':SignifyRefresh') | SignifyRefresh | endif
endif
let g:signify_skip_filetype = { 'help': 1, 'gitcommit': 1 }
let g:signify_sign_add = '+'
let g:signify_sign_delete = '-'
let g:signify_sign_change = '~'
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" --------------------------------------------------------------
" repeat {{{2
" --------------------------------------------------------------
silent! call repeat#set("\<Plug>(EasyAlign)", v:count)

" --------------------------------------------------------------
" scala {{{2
" --------------------------------------------------------------
let g:scala_sort_across_groups = 1

" --------------------------------------------------------------
" calendar {{{2
" --------------------------------------------------------------
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" --------------------------------------------------------------
" easy-align {{{2
" --------------------------------------------------------------
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '\': { 'pattern': '\\' },
\ '/': { 'pattern': '//\+\|/\*\|\*/', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] },
\ ']': {
\     'pattern':       '\]\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       ')\zs',
\     'left_margin':   0,
\     'right_margin':  1,
\     'stick_to_left': 0
\   },
\ 'f': {
\     'pattern': ' \(\S\+(\)\@=',
\     'left_margin': 0,
\     'right_margin': 0
\   },
\ 'd': {
\     'pattern': ' \ze\S\+\s*[;=]',
\     'left_margin': 0,
\     'right_margin': 0
\   }
\ }
" Start interactive EasyAlign in visual mode
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap ga <Plug>(EasyAlign)
nmap gaa ga_

" --------------------------------------------------------------
" dirvish {{{2
" --------------------------------------------------------------
" If you set 1 to this, / and ? mappings don't work correctly.
let g:dirvish_relative_paths = 0
if has('autocmd')
  " Map t to "open in new tab".
  autocmd vimrcEx FileType dirvish nnoremap <buffer> t
      \ :tabnew <C-R>=fnameescape(getline('.'))<CR><CR>

  " Map CTRL-R to reload the Dirvish buffer.
  autocmd vimrcEx FileType dirvish nnoremap <buffer> <C-R> :<C-U>Dirvish %<CR>

  " Map gh to hide "hidden" files.
  autocmd vimrcEx FileType dirvish nnoremap <buffer> gh
      \ :set ma<bar>g@\v/\.[^\/]+/?$@d<cr>:set noma<cr>
endif

" --------------------------------------------------------------
" airnote {{{2
" --------------------------------------------------------------
fu! s:airnote_set_path()
  if executable('ghq')
    let ghq_list = split(system('ghq list -p |grep mynote'), '\n')
    for path in ghq_list
      if path =~ '\vmynote/?$'
        let g:airnote_path = path
        break
      endif
    endfor
  endif
  if !exists('g:airnote_path')
    let g:airnote_path = expand('~/projects/mynote')
  endif
endfu
call s:airnote_set_path()
let g:airnote_enable_cache = 1
let g:airnote_suffix = 'note.md'
let g:airnote_mappings_enabled = 1
let g:airnote_date_format = ''
let s:airnote_date_format = '%c'
nnoremap <leader>nn :Note<cr>
nnoremap <leader>nd :NoteDelete<cr>
fu! s:airnote_bufnewfile()
  let time1 = strftime('Created: '.s:airnote_date_format)
  let time2 = strftime('Last modified: '.s:airnote_date_format)
  call setline(1, printf(&cms, time1))
  call setline(2, printf(&cms, time2))
endfu
fu! s:airnote_bufwrite()
  if &modified
    let time = strftime('Last modified: '.s:airnote_date_format)
    call setline(2, printf(&cms, time))
  endif
endfu
augroup vimrc-airnote
  autocmd!
  autocmd BufNewFile *.note.md call s:airnote_bufnewfile()
  autocmd BufWrite *.note.md call s:airnote_bufwrite()
  autocmd QuickFixCmdPost airnote cwindow
augroup END

" --------------------------------------------------------------
" auto-pairs {{{2
" --------------------------------------------------------------
" CJK-language causes errors with mappings from <BS>
let g:AutoPairsMapBS = 0

" --------------------------------------------------------------
" jedi {{{2
" --------------------------------------------------------------
let g:jedi#goto_command = 'gd'
let g:jedi#goto_assignments_command = ''
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = ''
let g:jedi#usages_command = ''
let g:jedi#completions_command = ''
let g:jedi#rename_command = 'gr'

" --------------------------------------------------------------
" FastFold {{{2
" --------------------------------------------------------------
let g:fastfold_savehook = 0
let g:fastfold_fold_command_suffixes = []
let g:fastfold_fold_movement_commands = []
let g:tex_fold_enabled = 1

" --------------------------------------------------------------
" tsuquyomi {{{2
" --------------------------------------------------------------
let g:tsuquyomi_disable_default_mappings = 1
augroup vimrc-tsuquyomi
  autocmd!
  autocmd Filetype typescript nmap <buffer> gd <Plug>(TsuquyomiDefinition)
augroup END

" --------------------------------------------------------------
" minidown {{{2
" --------------------------------------------------------------
let g:minidown_enable_toc = 0

" --------------------------------------------------------------
" javacomplete2 {{{2
" --------------------------------------------------------------
if has('autocmd')
  augroup vimrc-javacomplete
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  augroup END
endif

" --------------------------------------------------------------
" markdown {{{2
" --------------------------------------------------------------
let g:markdown_folding = 1
nnoremap <silent> gX :OpenLinkHistory<cr>
