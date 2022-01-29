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
Plug 'iwataka/minidown.vim'
Plug 'iwataka/airnote.vim', { 'on': ['Note', 'NoteDelete'] }
Plug 'iwataka/vim-markdown-ex', { 'for': 'markdown', 'on': ['OpenLinkHistory'] }
Plug 'iwataka/gitignore.vim', { 'on': ['Gitignore', 'GitignoreUpdatea'] }
Plug 'iwataka/hello-world.vim', { 'on': ['HelloWorld', 'HelloWorldUpdate'] }
Plug 'iwataka/colorex.vim'
Plug 'iwataka/awesome.vim', { 'on': ['Awesome', 'AwesomeUpdate'] }
Plug 'iwataka/github.vim', { 'on': ['GHOpen', 'GHReleases', 'GHSearch'] }
Plug 'iwataka/vim-replace'
Plug 'iwataka/termex.vim', { 'on': ['Terminal'] }
unlet! g:plug_url_format

" Git
if executable('git')
  if v:version >= 703
    Plug 'mhinz/vim-signify'
  endif
  Plug 'tpope/vim-fugitive'
  Plug 'shumphrey/fugitive-gitlab.vim'
  Plug 'mattn/gist-vim', { 'on': ['Gist'] }
endif

" Navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/unicode.vim'
" Vim's folding feature slows down inserting characters, especially cjk.
" This plug-in prevents it and enableds to fold without any effects to the
" performance. Really nice!
Plug 'Konfekt/FastFold'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'vim-test/vim-test'
Plug 'editorconfig/editorconfig-vim'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'

" Statusine & icon
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Filetype syntax
if 0  " temporarily disabled
  Plug 'nvim-treesitter/nvim-treesitter'
else
  Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile', 'docker-compose'] }
  Plug 'ap/vim-css-color', { 'for': 'css' }
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
  Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
  Plug 'pboettch/vim-cmake-syntax', { 'for': 'cmake' }
  Plug 'dag/vim-fish', { 'for': 'fish' }
  Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
  Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
endif

" Filetypes not supported by treesitter
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'jceb/vim-orgmode', { 'for': 'org' }
Plug 'dmix/elvish.vim', { 'for': 'elvish' }
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'MaxMEllon/vim-jsx-pretty', { 'for': 'javascriptreact' }
Plug 'asciidoc/vim-asciidoc', { 'for': 'asciidoc' }
Plug 'solarnz/thrift.vim', { 'for': 'thrift' }
Plug 'PProvost/vim-ps1', { 'for': 'ps1' }
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }

" Filetype utility
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascriptreact', 'typescriptreact'] }
Plug 'lambdalisue/vim-pyenv', { 'for': 'python' }
Plug 'tpope/vim-endwise'
Plug 'junegunn/vader.vim', { 'on': 'Vader', 'for': 'vader' }

" Text Object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-line'
Plug 'rbonvall/vim-textobj-latex', { 'for': 'tex' }

" Utility
Plug 'junegunn/vim-emoji', { 'on': ['EmojiList'] }
Plug 'mattn/webapi-vim'

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

if exists(':language')
  language en_US.UTF-8
endif
set fileencodings=utf-8,sjis                     " UTF8 is first, SJIS is second
set termencoding=utf-8
set fileformats=unix,dos,mac                     " Unix format has highest priority
set timeout                                      " Enable timeout settings
set timeoutlen=1000                              " Time out on mapping after 1 second
set ttimeoutlen=100                              " Time out on key codes after 0.1 second
set lazyredraw                                   " Not be redrawn while executing macros and so on
set showmatch                                    " Show pairs of brackets
set matchtime=1                                  " Tenths of a second to show the mathing paren
set textwidth=0                                  " No limit for text width
set pumheight=10                                 " Limit the height of popup menu
set splitright                                   " More natural way to split a window vertically
set splitbelow                                   " More natural way to split a window horizontally
set expandtab                                    " Use spaces for indenting
set smarttab                                     " Use spaces for inserting <Tab>
set autoindent                                   " Same as the above indent
set smartindent                                  " Smart autoindenting
set noerrorbells                                 " No beep or screen flash for error messages
set visualbell t_vb=                             " No beeping, use visual bell
set shortmess+=atI                               " Some visual settings
set scrolloff=3                                  " Keep some lines
set showcmd                                      " Show command in the last line
set cmdheight=2                                  " The height of command line
set ruler                                        " Show the cursor position in status line
set showmode                                     " Show mode in the last line
set laststatus=2                                 " last window will have a status line
set history=1000                                 " A history in command line
set autowrite                                    " Write contents of modified files automatically
set autoread                                     " Detect changes from outside automatically
set backspace=indent,eol,start                   " Enable backspace to delete more than characters
set hidden                                       " A bufffer becomes hidden when it is abandoned
set nostartofline                                " Jump to certain positions, not starts of line
set ignorecase                                   " Case insensitive by default
set smartcase                                    " Case sensitive when containing capitals
set magic                                        " Make using regex more easier
set incsearch                                    " Enable incremental search
set wrapscan                                     " Enable wrap scan
set hlsearch                                     " Highlight search results
set nohlsearch                                   " Prevent highlight when reloading .vimrc
set ttyfast                                      " Enable fast connection
set conceallevel=0                               " Disable conceal feature
set allowrevins                                  " Allow to use CTRL-_
set list lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,lead:· " Show invisible characters
set nojoinspaces                                 " No spaces when joining two lines
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

set guioptions=
silent! set guifont=Hack\ Nerd\ Font\ Mono:h11

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
if executable('rg')
  set grepprg=rg\ --color\ never\ --no-heading\ --column
elseif executable('pt')
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
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    " filetype-specific
    autocmd FileType gitcommit
          \ setlocal textwidth=72 |
          \ setlocal spell
    autocmd FileType markdown
          \ setlocal spell |
          \ setlocal commentstring=<!--%s--> |
          \ setlocal foldlevel=1 |
          \ setlocal comments=b:-,b:+,b:* |
          \ setlocal formatoptions+=ro |
          \ inoremap <buffer> <expr> <cr> <sid>enter_on_markdown() |
          \ let b:AutoPairs = {}
    autocmd FileType calendar,git,gitv setlocal nolist
    autocmd FileType dosbatch setlocal commentstring=::%s
    autocmd FileType dot setlocal commentstring=//%s
    autocmd FileType c setlocal commentstring=//%s
    " Close buffers of specified types by just typing q.
    autocmd FileType help,qf,godoc nnoremap <buffer> q :q<cr>
    autocmd BufEnter fugitive://* nnoremap <buffer> q :q<cr>
    autocmd BufWinEnter * if &buftype == 'terminal' | nnoremap <buffer> q :q<cr> | endif
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
    autocmd FileType go
          \ compiler go |
          \ com! -buffer -nargs=+ IFaceMaker call s:ifacemaker(<f-args>)

    " Set filetype
    autocmd BufRead,BufNewFile *spacemacs* set filetype=lisp
    autocmd BufRead,BufNewFile *.gradle set filetype=groovy
    autocmd BufRead,BufNewFile *editorconfig* set filetype=jproperties
    autocmd BufRead,BufNewFile *.gpg set filetype=gnupg
    autocmd BufRead,BufNewFile *.json set filetype=javascript
    autocmd BufRead,BufNewFile *gitconfig* set filetype=sh
    autocmd BufRead,BufNewFile *.tmpl set filetype=html
    autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact

    " prevent from conflicting multiple edit
    autocmd SwapExists * let v:swapchoice = 'o'

    " Fullwidth spaces, merge conflicts and ...
    autocmd BufRead * call matchadd('Visual', '　')
    autocmd BufRead * call matchadd('Visual', '\v^\s*\zs\<{7}[^\<]+$\ze')
    autocmd BufRead * call matchadd('Visual', '\v^\s*\zs\={7}$\ze')
    autocmd BufRead * call matchadd('Visual', '\v^\s*\zs\>{7}[^\>]+$\ze')

    " Automatically open the quickfix window
    autocmd QuickFixCmdPost grep,Ggrep cwindow
    autocmd QuickFixCmdPost lgrep,Glgrep lwindow

    autocmd VimEnter * silent! source .vimrc.local
    if exists('#DirChanged')
        autocmd DirChanged * silent! source .vimrc.local
    endif

    autocmd BufReadCmd *.pdf,*.mp3,*.mp4,*.xls,*.xlsx,*.xlsm,*.doc,*.docx,*.docm,*.ppt,*.pptx,*.pptm
          \ silent call <sid>open(expand('<afile>')) |
          \ bdelete

    " Automatically remove trailing spaces when saving
    " NOTE: This feature has bad effects for undo function.
    " autocmd BufWritePre * call s:preserve('%s/\s*$//')
  augroup END
endif

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

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" vnoremap > >gv
" vnoremap < <gv
" vnoremap <tab> >gv
" vnoremap <s-tab> <gv

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
if has('terminal') || has('nvim')
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
cnoremap w!! w !sudo tee % >/dev/null

" Hide other visibie buffers
nnoremap <leader>o :<c-u>only<cr>

" Command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

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

" Change the current directory to where the active file exists
nnoremap <leader>cd :<c-u>cd %:h<cr>

" Some mappings for user-defined commands
nnoremap <silent> <leader>rt :<c-u>Root<cr>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" create insert_enter function due to vim-endwise plugin
inoremap <expr> <cr>    <sid>insert_enter()

fu! s:insert_enter()
  if pumvisible()
    return asyncomplete#close_popup()
  else
    return "\<cr>"
  endif
endfu

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
    " terminal buffers can't be deleted automatically.
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
let s:root_marker_files = ['.editorconfig', 'package.json', 'pom.xml', 'build.gradle']
let s:root_marker_dirs = ['.git', '.hg', '.svn', '.bzr', '_darcs']
fu! s:root(cwd)
  let f_roots = s:root_marker_files[:]
  let d_roots = s:root_marker_dirs[:]
  let f_roots = map(f_roots, "findfile(v:val, a:cwd.';')")
  let d_roots = map(d_roots, "finddir(v:val, a:cwd.';')")
  let f_roots = filter(f_roots, '!empty(v:val)')
  let d_roots = filter(d_roots, '!empty(v:val)')
  let f_roots = map(f_roots, "fnamemodify(v:val, ':p:h')")
  let d_roots = map(d_roots, "fnamemodify(v:val, ':p:h:h')")
  let [root, max_len] = ['', 0]
  for r in f_roots + d_roots
    if len(r) > max_len
      let [root, max_len] = [r, len(r)]
    endif
  endfor
  return root
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

" Returns:
" A key sequence to indent/unindent a bullet on the current line
" Empty string if the cursor is NOT on a bullet
fu! s:indent_bullet(forward)
  let on_bullet = s:on_bullet()
  if on_bullet
    if on_bullet == 1 && !a:forward
      return " \<bs>"
    endif
    let key = a:forward ? "\<tab>" : "\<bs>"
    return "a\<c-o>^".key."\<c-o>w\<c-o>x"
  endif
  return ""
endfu

" Returns:
" 2 if the cursor is on a bullet with leading spaces
" 1 if the cursor is on a bullet without any leading spaces
" 0 if the cursor is NOT on a bullet
fu! s:on_bullet()
  let line = getline('.')[0:getpos('.')[2]-2]
  if line =~ '^\s\+[-+*]\s*$'
    return 2
  elseif line =~ '^[-+*]\s*$'
    return 1
  else
    return 0
  endif
endfu

fu! s:enter_on_markdown()
  if s:on_bullet()
    return "\<esc>0C"
  else
    return "\<cr>"
  endif
endfu

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
  elseif has('mac')
    silent exec '!open '.args
  elseif has('unix')
    " This line does not work at all and I don't know the reason.
    " silent exec '!xdg-open '.args
    call system('xdg-open '.args)
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
  if executable('googler')
    silent execute '!googler '.join(a:000, ' ')
  else
    let keywords = join(a:000, '+')
    let url = ""
    if keywords == ""
      let url = "https://www.google.com"
    else
      let url = "https://www.google.com/search?q=".keywords
    endif
    call s:open(url)
  endif
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

com! -nargs=* Todo call s:todo(<q-args>)
fu! s:todo(args)
  let keywords = [
        \ 'TODO',
        \ 'FIXME',
        \ 'OPTIMIZE',
        \ 'HACK',
        \ 'REVIEW',
        \ 'CHANGED',
        \ 'XXX',
        \ 'IDEA',
        \ 'NOTE'
        \ ]
  let first = 1
  for kw in keywords
    let grep_cmd = first ? 'grep' : 'grepadd'
    let first = 0
    silent! exe printf('%s %s %s', grep_cmd, kw, a:args)
  endfor
endfu

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

com! -nargs=* -complete=dir Tree call s:show_tree(<f-args>)
fu! s:show_tree(...)
  if executable('tree')
    let out = system('tree '.join(a:000, ' '))
    let lines = split(out, "\n")
    leftabove 50vnew
    setlocal modifiable
    setlocal noreadonly
    call setline(1, lines)
    setlocal nomodifiable
    setlocal readonly
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal nobuflisted
    nnoremap <buffer> q :quit<cr>
  endif
endfu

com! -nargs=* -complete=customlist,s:jekyll_title_complete JekyllPost call s:jekyll_post(<f-args>)
fu! s:jekyll_post(...)
  if isdirectory('_posts')
    let title = a:0 ? a:1 : input('Title: ')
    if empty(title)
      return
    endif
    let posts = split(globpath('_posts', '**/*'), "\n")
    for post in posts
      let fname = fnamemodify(post, ':t:r')
      if fname =~ '\d\+-\d\+-\d\+-'.title
        silent exe 'edit '.post
        return
      endif
    endfor
    let category = a:0 > 1 ? a:2 : input('Category: ', '', 'customlist,JekyllCategoryComplete')
    let categoryName = s:to_title(category, '-')
    if !empty(category)
      let category .= '/'
    endif
    let year = strftime('%Y')
    let month = strftime('%m')
    let date = strftime('%d')
    let fname = '_posts/'.category.year.'-'.month.'-'.date.'-'.title
    let fname = fname =~ '.md$' ? fname : fname.'.md'
    silent exe 'edit '.fname
    silent call setline(1, ['---', 'category: '.categoryName, '---'])
  else
    echoe "_posts directory doesn't exist"
  endif
endfu
fu! s:jekyll_title_complete(A, L, P)
  let posts = split(globpath('_posts', '**/*'), "\n")
  let posts = map(posts, 'substitute(v:val, "_posts/\\d\\+-\\d\\+-\\d\\+-", "", "g")')
  let posts = map(posts, 'fnamemodify(v:val, ":r")')
  let posts = filter(posts, 'v:val =~ "\\v^'.a:A.'"')
  return posts
endfu
fu! JekyllCategoryComplete(A, L, P)
  let categories = split(globpath('_posts', '*'), "\n")
  let categories = filter(categories, 'isdirectory(v:val)')
  let categories = map(categories, 'fnamemodify(v:val, ":t")')
  return categories
endfu
fu! s:to_title(str, sep)
  let list = split(a:str, a:sep)
  let list = map(list, 'toupper(v:val[0]).strpart(v:val, 1)')
  return join(list, ' ')
endfu

com! ToggleColorcolumn call s:toggle_colorcolumn()
fu! s:toggle_colorcolumn()
  if exists('s:colorcolumn') && &colorcolumn == ''
    let &colorcolumn = s:colorcolumn
    unlet s:colorcolumn
  else
    let s:colorcolumn = &colorcolumn
    set colorcolumn=
  endif
endfu

fu! s:ifacemaker(struct, iface)
  let pkg = ''
  for i in range(1, line('$'))
    let line = getline(i)
    if line =~ '^package'
      let pkg = substitute(line, '^package\s\+', '', 'g')
      break
    endif
  endfor
  if pkg == ''
    return
  endif
  let file = expand('%:p')
  new
  let cmd = printf('ifacemaker -s %s -f %s -i %s -p %s', a:struct, file, a:iface, pkg)
  exe printf('read ! %s', cmd)
  setlocal filetype=go
endfu

com! PWD call s:pwd()
fu! s:pwd()
  let cwd = getcwd()
  let @* = cwd
  echo printf("%s (-> clipboard)", cwd)
endfu

" ===============================================================
" ABBREVIATIONS {{{1
" ===============================================================

" Insert the current date and time.
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" ///+ to search non-1byte characters (not <space>-~)
cab // \v[^\x01-\x7e]

" Spelling
abbrev factroy factory
abbrev reutrn return
abbrev netowrk network
abbrev SpaitalNetwork SpatialNetwork
abbrev nwe new

" Shortcut
if has('autocmd')
  autocmd vimrcEx FileType java call s:abbrev_java()
  autocmd vimrcEx FileType scala call s:abbrev_scala()
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
fu! s:plug_open(...)
  for plug in a:000
    let uri = g:plugs[plug]['uri']
    call s:open(uri)
  endfor
endfu
fu! s:plug_open_complete(A, L, P)
  return filter(copy(keys(g:plugs)), 'v:val =~ "\\v^'.a:A.'"')
endfu

" --------------------------------------------------------------
" ColorScheme {{{2
" --------------------------------------------------------------
" Gruvbox
" Italic style on Windows has low-visibility and disable it.
let s:italic = 1
if has('win32') || !(has('gui_running') || has('nvim'))
  let s:italic = 0
endif
let g:gruvbox_improved_warnings = 1
let g:gruvbox_italic = s:italic

" Solarized
let g:solarized_termcolors = 256
let g:solarized_menu = 0
let g:solarized_visibility = 'high'

nnoremap <F5> :ColorexToggleBackground<cr>
nnoremap <C-F5> :ColorexSwitchContrast<cr>
nnoremap <C-S-F5> :ColorexSwitchContrast!<cr>

if has('gui_running')
  let g:colorex_cache_file_path = expand('~/.vim/.colorscheme.gui.vim')
endif

if !has('gui_running')
  autocmd vimrcEx ColorScheme *
        \ hi Normal ctermbg=NONE |
        \ hi NonText ctermbg=NONE
endif

if has('gui_macvim')
  set transparency=20
endif

nnoremap <silent> <F11> :call <sid>toggle_fullscreen()<cr>
fu! s:toggle_fullscreen()
  if has('gui_macvim')
    exe 'set '.(&fullscreen ? 'nofullscreen' : 'fullscreen')
  elseif executable('wmctrl')
    call system('wmctrl -ir '.v:windowid.' -b toggle,fullscreen')
  elseif exists(':WToggleFullscreen')
    WToggleFullscreen
  endif
endfu

if has("termguicolors")
  set termguicolors
endif

" --------------------------------------------------------------
" fzf.vim {{{2
" --------------------------------------------------------------
nnoremap <silent> <Leader>p :<c-u>Files<CR>
nnoremap <silent> <Leader>b :<c-u>Buffers<CR>
nnoremap <silent> <Leader>m :<c-u>History<CR>
nnoremap <silent> <Leader>: :<c-u>History:<CR>
nnoremap <silent> <Leader>/ :<c-u>History/<CR>
nnoremap <silent> <Leader>d :<c-u>Dirs<CR>
com! Dirs call <sid>fzf_list_dirs()
let g:fzf_dirs = [
      \ '~/projects/*',
      \ '~/.vim/plugged/*',
      \ ]
fu! s:fzf_list_dirs()
  let dirs = []
  if executable('ghq')
    call extend(dirs, split(system('ghq list -p'), '\n'))
  endif
  for d in g:fzf_dirs
    call extend(dirs, split(expand(d), '\n'))
  endfor
  call fzf#run(fzf#wrap({'sink': 'Files', 'source': dirs}))
endfu

" --------------------------------------------------------------
" LSP {{{2
" --------------------------------------------------------------
nnoremap <silent> gd :<c-u>LspDefinition<CR>
nnoremap <silent> gi :<c-u>LspImplementation<CR>
nnoremap <silent> [d :<c-u>LspPreviousDiagnostic<CR>
nnoremap <silent> ]d :<c-u>LspNextDiagnostic<CR>

" --------------------------------------------------------------
" Git {{{2
" --------------------------------------------------------------
nnoremap gs :<c-u>Git<CR>
nnoremap <leader>gd :<c-u>Gdiff<CR>
nnoremap <leader>gD :<c-u>Gsplit! diff<cr>
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

let g:signify_skip_filetype = { 'help': 1, 'gitcommit': 1 }

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
" airnote {{{2
" --------------------------------------------------------------
let g:airnote_path = expand('~/Dropbox/memo')
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
" let g:AutoPairsMapBS = 0

" --------------------------------------------------------------
" FastFold {{{2
" --------------------------------------------------------------
let g:fastfold_savehook = 0
let g:fastfold_fold_command_suffixes = []
let g:fastfold_fold_movement_commands = []
let g:tex_fold_enabled = 1

" --------------------------------------------------------------
" minidown {{{2
" --------------------------------------------------------------
let g:minidown_pandoc_enable_toc = 0

" --------------------------------------------------------------
" markdown {{{2
" --------------------------------------------------------------
nnoremap <silent> gX :OpenLinkHistory<cr>

" --------------------------------------------------------------
" emoji {{{2
" --------------------------------------------------------------
com! -bang EmojiList call s:show_emoji_list()
fu! s:show_emoji_list()
  40vnew
  nnoremap <buffer> q :quit<cr>
  setlocal modifiable
  setlocal noreadonly
  for e in emoji#list()
    call append(line('$'), printf('%s (%s)', emoji#for(e), e))
  endfor
  setlocal nomodifiable
  setlocal readonly
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal nobuflisted
endfu

" --------------------------------------------------------------
" airline {{{2
" --------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

" --------------------------------------------------------------
" nerdtree {{{2
" --------------------------------------------------------------
nnoremap <leader>nt :<c-u>NERDTreeToggle<cr>
nnoremap <leader>nf :<c-u>NERDTreeFind<cr>
nnoremap <leader>nm :<c-u>NERDTreeMirror<cr>
nnoremap <leader>nc :<c-u>NERDTreeCWD<cr>
nnoremap <leader>nx :<c-u>NERDTreeClose<cr>
nnoremap <leader>nb :<c-u>NERDTreeFromBookmark
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 40

augroup vimrc-nerdtree
  autocmd!
  autocmd FileType nerdtree com! -buffer NERDTreePromote call s:nerdtree_promote()
  autocmd FileType nerdtree com! -buffer NERDTreeDemote call s:nerdtree_demote()
  autocmd FileType nerdtree nnoremap <silent> <buffer> << :<c-u>NERDTreePromote<cr>
  autocmd Filetype nerdtree nnoremap <silent> <buffer> >> :<c-u>NERDTreeDemote<cr>
augroup END

fu! s:nerdtree_promote()
  let curNode = g:NERDTreeFileNode.GetSelected()
  let newNodeDir = fnamemodify(curNode.path.str(), ':h:h')
  let newNodeName = fnamemodify(curNode.path.str(), ':t')
  let newNodePath = ''
  if has('win32') || ('win64')
    let newNodePath = join([newNodeDir, newNodeName], '\')
  else
    let newNodePath = join([newNodeDir, newNodeName], '/')
  endif
  try
    call curNode.rename(newNodePath)
    call NERDTreeRender()
    call curNode.putCursorHere(1, 0)
    redraw
  catch /^NERDTree/
    echoe 'Node Not Promoted'
  endtry
endfu

fu! s:nerdtree_demote()
  let curNode = g:NERDTreeFileNode.GetSelected()
  let newNodeDir = fnamemodify(curNode.path.str(), ':h')
  let newNodeDest = input('New Directory? ')
  let newNodeName = fnamemodify(curNode.path.str(), ':t')
  if has('win32') || ('win64')
    let newNodePath = join([newNodeDir, newNodeDest, newNodeName], '\')
  else
    let newNodePath = join([newNodeDir, newNodeDest, newNodeName], '/')
  endif
  try
    call curNode.rename(newNodePath)
    call NERDTreeRender()
    call curNode.putCursorHere(1, 0)
    redraw
  catch /^NERDTree/
    echoe 'Node Not Promoted'
  endtry
endfu

" --------------------------------------------------------------
" pyenv {{{2
" --------------------------------------------------------------
function! s:jedi_auto_force_py_version() abort
  let major_version = pyenv#python#get_internal_major_version()
  call jedi#force_py_version(major_version)
endfunction
augroup vim-pyenv-custom-augroup
  autocmd! *
  autocmd User vim-pyenv-activate-post   silent! call s:jedi_auto_force_py_version()
  autocmd User vim-pyenv-deactivate-post silent! call s:jedi_auto_force_py_version()
augroup END

" --------------------------------------------------------------
" vim-test {{{2
" --------------------------------------------------------------
nnoremap <silent> <leader>tn :TestNearest<cr>
nnoremap <silent> <leader>tf :TestFile<cr>
nnoremap <silent> <leader>ts :TestSuite<cr>
nnoremap <silent> <leader>tl :TestLast<cr>
nnoremap <silent> <leader>tv :TestVisit<cr>
if has('nvim')
  let test#strategy = 'neovim'
elseif has('terminal')
  let test#strategy = 'vimterminal'
endif

" --------------------------------------------------------------
" sideways.vim {{{2
" --------------------------------------------------------------
nnoremap <silent> gH :SidewaysLeft<cr>
nnoremap <silent> gL :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" --------------------------------------------------------------
" vim-easymotion {{{2
" --------------------------------------------------------------
map <Leader> <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" --------------------------------------------------------------
" nvim-treesitter {{{2
" --------------------------------------------------------------
if has_key(g:plugs, 'nvim-treesitter')
  exe "lua require('plugins.treesitter')"
endif

" --------------------------------------------------------------
" startify {{{2
" --------------------------------------------------------------
let g:startify_bookmarks = [ {'v': expand('<sfile>')}]
let g:startify_commands = [
    \ {'d': 'Dirs'},
    \ {'p': 'Files'},
    \ {'m': 'History'},
    \ {'t': 'Terminal'},
    \ ]
let g:startify_change_to_dir = 0
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ ]

" --------------------------------------------------------------
" termex.vim {{{2
" --------------------------------------------------------------
cabbrev t Terminal

" ===============================================================
" POST PROCESS {{{1
" ===============================================================

" Write some machine-specific settings to ~/.vimrc.local.
" Ex)
" let g:deoplete#enable_at_startup = 0
" let g:loaded_airline = 1
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
