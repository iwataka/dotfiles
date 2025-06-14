" ===============================================================
" VIM-PLUG BLOCK
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
Plug 'iwataka/airnote.vim', { 'on': ['Note', 'NoteDelete'] }
Plug 'iwataka/vim-markdown-ex', { 'for': 'markdown', 'on': ['OpenLinkHistory'] }
Plug 'iwataka/gitignore.vim'
Plug 'iwataka/hello-world.vim'
Plug 'iwataka/colorex.vim'
Plug 'iwataka/awesome.vim'
Plug 'iwataka/github.vim', { 'on': ['GHOpen', 'GHReleases', 'GHSearch'] }
Plug 'iwataka/vim-replace'
Plug 'iwataka/termex.vim'

" Git
if executable('git')
  if has('nvim')
    Plug 'lewis6991/gitsigns.nvim'
  elseif v:version >= 703
    Plug 'mhinz/vim-signify'
  endif
  Plug 'tpope/vim-fugitive'
  Plug 'mattn/gist-vim', { 'on': ['Gist'] }
endif

" Navigation
if has('nvim')
  Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v3.x' }
  Plug 'MunifTanjim/nui.nvim'
else
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-hijack.vim'
  Plug 'lambdalisue/nerdfont.vim'
endif
Plug 'airblade/vim-rooter'
if has('nvim')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
else
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
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
Plug 'chrisbra/unicode.vim'
" Vim's folding feature slows down inserting characters, especially cjk.
" This plug-in prevents it and enableds to fold without any effects to the
" performance. Really nice!
Plug 'Konfekt/FastFold'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'vim-test/vim-test'
Plug 'editorconfig/editorconfig-vim'
Plug 'github/copilot.vim'

" LSP
if has('nvim')
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'CopilotC-Nvim/CopilotChat.nvim'
else
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
endif

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'
Plug 'joshdick/onedark.vim'
if has('nvim')
  Plug 'folke/tokyonight.nvim'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'rebelot/kanagawa.nvim'
endif

" Visual
if has('nvim')
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'folke/zen-mode.nvim'
else
  Plug 'itchyny/lightline.vim'
endif

" Filetype syntax
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
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
Plug 'dkarter/bullets.vim', { 'for': ['markdown', 'text', 'gitcommit'] }
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
Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
Plug 'tpope/vim-endwise'
Plug 'junegunn/vader.vim', { 'on': 'Vader', 'for': 'vader' }
Plug 'mattn/vim-goaddtags', { 'for': 'go' }
Plug 'mattn/vim-goimpl', { 'for': 'go' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Text Object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-lastpat'
Plug 'rbonvall/vim-textobj-latex', { 'for': 'tex' }

" Utility
Plug 'junegunn/vim-emoji', { 'on': ['EmojiList'] }
Plug 'mattn/webapi-vim'
Plug 'lambdalisue/suda.vim', { 'on': ['SudaRead', 'SudaWrite'] }

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
" BASIC SETTINGS
" ===============================================================

" The mapleader is used as a prefix for all user mappings.
let mapleader      = " "  " Space can be typed by both of hands.
let maplocalleader = "\\"  " The local mapleader is hardly used.

if exists(':language')
  language en_US.UTF-8
endif
set fileencodings=utf-8,sjis                     " UTF8 is first, SJIS is second
set colorcolumn=81
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
set ttyfast                                      " Enable fast connection
set conceallevel=0                               " Disable conceal feature
set allowrevins                                  " Allow to use CTRL-_
set list lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_,lead:· " Show invisible characters
set nojoinspaces                                 " No spaces when joining two lines
set nrformats-=octal
set nrformats+=unsigned
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
  if has('nvim')
    set undodir=~/.vim/undo
  else
    set undodir=~/.vim/undo_vim
  endif
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

if has('wsl')
  let g:netrw_browsex_viewer = "cmd.exe /C start"
endif

set clipboard=unnamed
if has('wsl') && has('nvim') && !has('gui_running')
  let s:copy_command_for_wsl = executable('win32yank.exe') ?
        \ 'win32yank.exe -i' :
        \ 'clip.exe'
  let s:paste_command_for_wsl = executable('win32yank.exe') ?
        \ 'win32yank.exe -o' :
        \ 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
  let g:clipboard = {
        \ 'name': 'WslClipboard',
        \ 'copy': {
        \   '+': s:copy_command_for_wsl,
        \   '*': s:copy_command_for_wsl,
        \ },
        \ 'paste': {
        \   '+': s:paste_command_for_wsl,
        \   '*': s:paste_command_for_wsl,
        \ },
        \ 'cache_enabled': 0,
        \ }
else
  if has('unnamedplus')
    set clipboard+=unnamedplus
  endif
endif

" ==============================================================
" AUTOCMD
" ===============================================================

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
        \ setlocal colorcolumn= |
        \ let b:AutoPairs = {}
  autocmd FileType calendar,git,gitv setlocal nolist
  autocmd FileType dosbatch setlocal commentstring=::%s
  autocmd FileType dot setlocal commentstring=//%s
  autocmd FileType c setlocal commentstring=//%s
  " Close buffers of specified types by just typing q.
  autocmd FileType help,qf,godoc nnoremap <buffer> q :q<cr>
  autocmd FileType fugitive,fugitiveblame nnoremap <buffer> q :q<cr>
  autocmd FileType lspinfo nnoremap <buffer> q :q<cr>
  autocmd BufEnter fugitive://* nnoremap <buffer> q :q<cr>
  autocmd BufWinEnter * if &buftype == 'terminal' | nnoremap <buffer> q :q<cr> | endif
  autocmd FileType fern nnoremap <buffer> q :q<cr>

  " Set filetype
  autocmd BufRead,BufNewFile *spacemacs* set filetype=lisp
  autocmd BufRead,BufNewFile *.gradle set filetype=groovy
  autocmd BufRead,BufNewFile *editorconfig* set filetype=jproperties
  autocmd BufRead,BufNewFile *.gpg set filetype=gnupg
  autocmd BufRead,BufNewFile *gitconfig* set filetype=gitconfig
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

  autocmd BufReadCmd *.pdf,*.mp3,*.mp4,*.xls,*.xlsx,*.xlsm,*.doc,*.docx,*.docm,*.ppt,*.pptx,*.pptm
        \ silent call <sid>open(expand('<afile>')) |
        \ bdelete

  " Automatically remove trailing spaces when saving
  " NOTE: This feature has bad effects for undo function.
  " autocmd BufWritePre * call s:preserve('%s/\s*$//')
augroup END

" ===============================================================
" MAPPINGS
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
  tnoremap <ESC> <C-\><C-n>
  tnoremap <c-[> <C-\><C-n>
  tnoremap jk <C-\><C-n>
  " On neovim-qt, <s-space> prints ";2u" somehow.
  " This is a workaround for this.
  " refer to https://github.com/equalsraf/neovim-qt/issues/728 for details
  tnoremap <s-space> <space>
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

" Terminal often can't distinguish <tab> and <c-i>
nnoremap <c-j> <c-i>

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
nnoremap <leader>cd :<c-u>call <sid>change_dir()<cr>

fu! s:change_dir()
  if &buftype == 'terminal'
    let cmd = printf("cd '%s'", getcwd())
    let job_id = b:terminal_job_id
    call chansend(job_id, printf("\<c-u>%s\<cr>", cmd))
  else
    exe 'cd %:h'
  endif
endfu

" Some mappings for user-defined commands
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
" FUNCTIONS & COMMANDS
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

fu! s:warn(msg)
  echohl WarningMsg
  echo a:msg
  echohl Normal
endfu

com! TabToSpaces call s:tab_to_spaces()
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

cabbrev o Open
" Remove due to newly added netrw#Open and Open command mapped to it
" com! -nargs=* -complete=file Open call s:open(<f-args>)
fu! s:open(...)
  let args = join(map(copy(a:000), 's:quote_path_or_url(v:val)'), ' ')
  let args = empty(args) ? '"'.expand('%:p').'"' : args
  " Vim in Git for Windows has win32unix and doesn't have cygstart
  if has('win32unix') && executable('cygstart')
    call system('cygstart '.args)
  elseif has('win32') || has('win32unix')
    call s:open_win(args)
  elseif has('mac')
    silent exec '!open '.args
  elseif has('unix')
    " This line does not work at all and I don't know the reason.
    " silent exec '!xdg-open '.args
    if has('wsl')
      call s:open_win(args)
    else
      call system('xdg-open '.args)
    endif
  endif
  redraw!
endfu
fu! s:open_win(args)
  let args = a:args
  if filereadable(a:args[1:-2]) || isdirectory(args[1:-2])
    let cwd = getcwd()
    call s:cd_or_lcd(fnamemodify(args[1:-2], ':h'))
    let args = fnamemodify(args[1:-2], ':t')
    call s:open_win_without_fnamemodify(args)
    call s:cd_or_lcd(cwd)
  else
    call s:open_win_without_fnamemodify(args)
  endif
endfu
fu! s:open_win_without_fnamemodify(args)
  silent exec '!rundll32.exe url.dll,FileProtocolHandler '.a:args
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

com! FFinder call s:open_file_finder('.')
fu! s:open_file_finder(dir)
  if !isdirectory(a:dir)
    return
  endif

  if &filetype == 'ffinder'
    exe 'enew'
  else
    exe 'leftabove 50vnew'
  endif
  setlocal buftype=nowrite
  setlocal bufhidden=wipe
  setlocal nobuflisted
  setlocal filetype=ffinder
  setlocal noswapfile
  setlocal noendofline
  let bufnr = bufnr('%')
  call appendbufline(bufnr, 0, fnamemodify(a:dir, ':p'))
  let files = readdir(a:dir)
  for file in files
    if isdirectory(file)
      let file = file.'/'
    endif
    call appendbufline(bufnr, line('$') - 1, file)
  endfor
  call setbufvar(bufnr, 'ffinder_working_dir', a:dir)
  nnoremap <buffer> <cr> :<c-u>call <sid>open_file_finder(b:ffinder_working_dir.'/'.getline('.'))<cr>
  nnoremap <buffer> <c-u> :<c-u>call <sid>open_file_finder(b:ffinder_working_dir.'/..')<cr>
  nnoremap <buffer> q :<c-u>quit<cr>
endfu

com! -nargs=? -complete=customlist,AWSListProfiles AWSProfile call s:aws_profile(<f-args>)
com! AWSProfileCacheDelete unlet g:vimrc_aws_profile_list
fu! AWSListProfiles(A, L, P)
  if !has_key(g:, 'vimrc_aws_profile_list')
    let g:vimrc_aws_profile_list = split(system('aws configure list-profiles'))
  endif
  return filter(g:vimrc_aws_profile_list[:], 'v:val =~ "^".a:A')
endfu
fu! s:aws_profile(...)
  if a:0 == 0
    let profile = $AWS_PROFILE
    if empty(profile)
      echo "No AWS_PROFILE"
    else
      echo printf('AWS_PROFILE: %s', profile)
    endif
  else
    let $AWS_PROFILE = a:1
  endif
endfu

com! ShowMappings call s:show_mappings()
fu! s:show_mappings()
  let lines = sort(split(execute('map <leader>'), "\n"))
  vnew
  for l in lines
    call append(line('$'), l)
  endfor
  setlocal buftype=nofile
  setlocal bufhidden=wipe
endfu

com! GitOpen call s:git_open()
fu! s:git_open()
  let url = split(system('git remote get-url origin'), "\n")[0]
  echom url
  call s:open_git_uri(url)
endfu

" NOTE: This supports only GitHub and no plan to support others.
fu! s:open_git_uri(uri)
  let uriSegments = split(a:uri, '/')
  let org = uriSegments[-2]
  let repo = substitute(uriSegments[-1], '\.git$', '', 'g')
  call s:open(printf('https://github.com/%s/%s', org, repo))
endfu

" ===============================================================
" ABBREVIATIONS
" ===============================================================

" Insert the current date and time.
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" ///+ to search non-1byte characters (not <space>-~)
cab // \v[^\x01-\x7e]+

" ===============================================================
" PLUGINS
" ===============================================================
" --------------------------------------------------------------
" Plug
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
    call s:open_git_uri(uri)
  endfor
endfu
fu! s:plug_open_complete(A, L, P)
  return filter(copy(keys(g:plugs)), 'v:val =~ "\\v^'.a:A.'"')
endfu

" --------------------------------------------------------------
" ColorScheme
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

if has('nvim')
  let g:colorex_cache_file_path = expand('~/.vim/.colorscheme.vim')
else
  let g:colorex_cache_file_path = expand('~/.vim/.colorscheme_vim.vim')
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

" Neovide settings
" * disable animations for performance
let g:neovide_transparency = 0.9
let g:neovide_cursor_vfx_mode = ""
let g:neovide_cursor_animation_length = 0.0
let g:neovide_cursor_trail_size = 0.0

" nvim-qt settings
augroup vimrc_nvim_qt
  autocmd!
  autocmd VimEnter * call s:configure_nvim_qt()
augroup END

fu! s:configure_nvim_qt()
  if exists(':GuiWindowOpacity')
    exe 'GuiWindowOpacity 0.9'
  endif
endfu

if has('nvim') && has_key(g:plugs, 'nightfox.nvim')
  lua require('plugins.nightfox')
endif

" --------------------------------------------------------------
" fuzzy finder
" --------------------------------------------------------------
let g:fuzzy_finder_dirs = [
      \ '~/projects/*',
      \ '~/.vim/plugged/*',
      \ '~/.dotfiles',
      \ ]

fu! FuzzyFinderDirs()
  let dirs = []
  if executable('ghq')
    call extend(dirs, split(system('ghq list -p'), '\n'))
  endif
  " disable it due to performance issue
  " if executable('zoxide')
  "   call extend(dirs, split(system('zoxide query -l'), '\n'))
  " endif
  for d in g:fuzzy_finder_dirs
    for p in split(expand(d), '\n')
      if isdirectory(p)
        call add(dirs, p)
      endif
    endfor
  endfor
  return uniq(sort(dirs))
endfu

if has_key(g:plugs, 'telescope.nvim')
  lua require('plugins.telescope')
  nnoremap <silent> <leader>p :<c-u>Telescope find_files<cr>
  nnoremap <silent> <leader>b :<c-u>Telescope buffers<cr>
  nnoremap <silent> <leader>m :<c-u>Telescope oldfiles<cr>
  nnoremap <silent> <leader>: :<c-u>Telescope commands<cr>
  nnoremap <silent> <leader>; :<c-u>Telescope commands<cr>
  nnoremap <silent> <leader>/ :<c-u>Telescope search_history<cr>
  nnoremap <silent> <leader>d :<c-u>lua require('plugins.telescope').find_dirs()<cr>
  nnoremap <silent> gt :<c-u>Telescope treesitter<cr>
  nnoremap <silent> gT :<c-u>Telescope tags<cr>
  nnoremap <silent> <leader>j :<c-u>Telescope current_buffer_fuzzy_find<cr>
  nnoremap <silent> <leader>f :<c-u>Telescope live_grep<cr>
  nnoremap <leader>gl :<c-u>Telescope git_commits<cr>
  nnoremap <leader>gb :<c-u>Telescope git_bcommits<cr>
else
  nnoremap <silent> <leader>p :<c-u>FZF<cr>
  nnoremap <silent> <leader>b :<c-u>Buffers<cr>
  nnoremap <silent> <leader>m :<c-u>History<cr>
  nnoremap <silent> <leader>: :<c-u>Commands<cr>
  nnoremap <silent> <leader>; :<c-u>Commands<cr>
  nnoremap <silent> <leader>/ :<c-u>History/<cr>
  nnoremap <silent> <leader>d :<c-u>Dirs<cr>
  nnoremap <silent> gt :<c-u>BTags<cr>
  nnoremap <silent> gT :<c-u>Tags<cr>
  nnoremap <silent> <leader>j :<c-u>Lines<cr>
  nnoremap <silent> <leader>f :<c-u>Rg <c-r>=<sid>fzf_grep_prompt()<cr><cr>
  nnoremap <silent> <leader>gl :<c-u>Commits<cr>
  nnoremap <silent> <leader>gb :<c-u>BCommits<cr>
  com! -bang Dirs call <sid>fzf_list_dirs(<bang>0)
  fu! s:fzf_list_dirs(fullscreen)
    let dirs = FuzzyFinderDirs()
    let options = ['--prompt', 'Dirs> ']
    if executable('exa')
      call extend(options, ['--preview', 'exa -al {}'])
    elseif executable('ls')
      call extend(options, ['--preview', 'ls -al --color {}'])
    endif
    call fzf#run(fzf#wrap({
          \   'sink': 'Files',
          \   'source': dirs,
          \   'options': options,
          \ },
          \ a:fullscreen))
  endfu
  fu! s:fzf_grep_prompt()
    call inputsave()
    let keyword = input('Grep> ')
    call inputrestore()
    return keyword
  endfu
endif

" --------------------------------------------------------------
" LSP
" --------------------------------------------------------------
if has_key(g:plugs, 'nvim-lspconfig')
  lua require('plugins.lspconfig')
  lua require('plugins.cmp')
else
  nnoremap <silent> [d :<c-u>LspPreviousDiagnostic<cr>
  nnoremap <silent> ]d :<c-u>LspNextDiagnostic<cr>
  nnoremap <silent> gd :<c-u>LspDefinition<cr>
  nnoremap <silent> gD :<c-u>LspDeclaration<cr>
  nnoremap <silent> K :<c-u>LspHover<cr>
  nnoremap <silent> gi :<c-u>LspImplementation<cr>
  nnoremap <silent> <leader>r :<c-u>LspRename<cr>
  nnoremap <silent> <leader>a :<c-u>LspCodeAction<cr>
  nnoremap <silent> gr :<c-u>LspReferences<cr>
  nnoremap <silent> <leader>D :<c-u>LspTypeDefinition<cr>
  nnoremap <silent> <leader>F :<c-u>LspDocumentFormat<cr>
endif

" --------------------------------------------------------------
" Git
" --------------------------------------------------------------
nnoremap gs :<c-u>Git<cr>
nnoremap <leader>gd :<c-u>Gdiff<cr>
nnoremap <leader>gD :<c-u>Gsplit! diff<cr>
nnoremap <leader>gc :<c-u>Gcommit<cr>
nnoremap <leader>gr :<c-u>Gread<cr>
nnoremap <leader>gR :<c-u>Gremove<cr>
nnoremap <leader>gw :<c-u>Gwrite<cr>
nnoremap <leader>ga :<c-u>Gcommit --amend<cr>
nnoremap <leader>gA :<c-u>Git add --all<cr>
nnoremap <leader>gg :<c-u>Lazygit<cr>

let g:signify_skip_filetype = { 'help': 1, 'gitcommit': 1 }

" --------------------------------------------------------------
" repeat
" --------------------------------------------------------------
silent! call repeat#set("\<Plug>(EasyAlign)", v:count)

" --------------------------------------------------------------
" scala
" --------------------------------------------------------------
let g:scala_sort_across_groups = 1

" --------------------------------------------------------------
" easy-align
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
" airnote
" --------------------------------------------------------------
let g:airnote_path = expand('~/Dropbox/memo')
let g:airnote_mappings_enabled = 1
let g:airnote_date_format = ''
nnoremap <leader>nn :Note<cr>
nnoremap <leader>nd :NoteDelete<cr>

" --------------------------------------------------------------
" FastFold
" --------------------------------------------------------------
let g:fastfold_savehook = 0
let g:fastfold_fold_command_suffixes = []
let g:fastfold_fold_movement_commands = []
let g:tex_fold_enabled = 1

" --------------------------------------------------------------
" markdown
" --------------------------------------------------------------
nnoremap <silent> gX :OpenLinkHistory<cr>

" --------------------------------------------------------------
" emoji
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
" statusline
" --------------------------------------------------------------
if has_key(g:plugs, 'lualine.nvim')
  lua require('plugins.lualine')
else
  let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'gitstatus', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead',
        \   'gitstatus': 'LightlineSignify',
        \   'filename': 'LightlineFilename',
        \ },
        \ }

  fu! LightlineFilename()
    return expand('%') != '' ? expand('%:.') : '[No Name]'
  endfu

  fu! LightlineSignify()
    if has_key(g:plugs, 'gitsigns.nvim')
      if has_key(b:, 'gitsigns_status')
        return b:gitsigns_status
      else
        return ''
      endif
    endif
    if exists('sy#repo#get_stats')
      let [added, changed, deleted] = sy#repo#get_stats()
      if added + changed + deleted >= 0
        let sign_add = get(g:, 'signify_sign_add', '+')
        let sign_change = get(g:, 'signify_sign_change', '!')
        let sign_delete = get(g:, 'signify_sign_delete', '-')
        return printf(
              \ '%s%d %s%d %s%d',
              \ sign_add,
              \ added,
              \ sign_change,
              \ changed,
              \ sign_delete,
              \ deleted,
              \ )
      else
        return ''
      endif
    endif
    return ''
  endfu

  function! s:set_lightline_colorscheme(name) abort
    if empty(a:name)
      echo get(g:lightline, 'colorscheme', 'default')
      return
    endif
    let g:lightline.colorscheme = a:name
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endfunction

  function! s:lightline_colorschemes(...) abort
    return join(map(
          \ globpath(&rtp, 'autoload/lightline/colorscheme/*.vim', 1, 1),
          \ "fnamemodify(v:val,':t:r')"),
          \ "\n")
  endfunction

  command! -nargs=? -complete=custom,s:lightline_colorschemes LightlineColorscheme
        \ call s:set_lightline_colorscheme(<q-args>)
endif

set noshowmode

" --------------------------------------------------------------
" gitsigns.nvim
" --------------------------------------------------------------
if has_key(g:plugs, 'gitsigns.nvim')
  lua require('plugins.gitsigns')
endif

" --------------------------------------------------------------
" file explorer
" --------------------------------------------------------------
if has_key(g:plugs, 'neo-tree.nvim')
  nnoremap <leader>ee :Neotree toggle<cr>
  nnoremap <leader>ef :Neotree reveal_force_cwd<cr>
else
  nnoremap <leader>ee :<c-u>Fern . -drawer -toggle<cr>
  nnoremap <leader>ef :<c-u>Fern . -drawer -reveal=%<cr>
  let g:fern#renderer = "nerdfont"
  let g:fern#default_hidden = 1

  function! s:init_fern() abort
    nmap <buffer> l <Plug>(fern-action-expand)
    nnoremap <buffer><silent> <Plug>(fern-action-nohlsearch) :<c-u>nohlsearch<cr>
    nmap <buffer> <Plug>(fern-action-nohlsearch-and-redraw)
          \ <Plug>(fern-action-nohlsearch)<Plug>(fern-action-redraw)
    nmap <buffer> <c-l> <Plug>(fern-action-nohlsearch-and-redraw)
    nmap <buffer> p <Plug>(fern-action-focus:parent)
  endfunction

  augroup vimrc_fern
    autocmd!
    autocmd FileType fern call s:init_fern()
  augroup END
endif

" --------------------------------------------------------------
" vim-test
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
" nvim-treesitter
" --------------------------------------------------------------
if has_key(g:plugs, 'nvim-treesitter')
  lua require('plugins.treesitter')
endif

" --------------------------------------------------------------
" startify
" --------------------------------------------------------------
let g:startify_bookmarks = [
      \ {'v': expand('<sfile>')},
      \ ]
let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ ]
let g:startify_files_number = 5
let g:startify_change_to_dir = 0

" --------------------------------------------------------------
" termex.vim
" --------------------------------------------------------------
nnoremap <silent> <leader>tt :<c-u>20STerm<cr>
com! -nargs=* Lazygit FTui lazygit <args>
let g:termex_winblend = 20

" --------------------------------------------------------------
" vim-rooter
" --------------------------------------------------------------
fu! s:rooter_init()
  call extend(g:rooter_patterns, [
        \ "go.mod",
        \ ])
endfu

augroup vimrc_rooter
  autocmd!
  autocmd VimEnter * call s:rooter_init()
augroup END

" --------------------------------------------------------------
" zen-mode.nvim
" --------------------------------------------------------------
if has_key(g:plugs, 'zen-mode.nvim')
  lua require('plugins.zen-mode')
endif

" --------------------------------------------------------------
" copilot.vim
" --------------------------------------------------------------
" Map fish-shell like key bindings to accept Copilot's suggestions.
imap <silent><script><expr> <C-F> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" --------------------------------------------------------------
" CopilotChat.vim
" --------------------------------------------------------------
if has_key(g:plugs, 'CopilotChat.nvim')
  lua require('plugins.copilotchat')
endif

" ===============================================================
" POST PROCESS
" ===============================================================

" Write some machine-specific settings to ~/.vimrc.local.
" Ex)
" let g:deoplete#enable_at_startup = 0
" let g:loaded_airline = 1
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
