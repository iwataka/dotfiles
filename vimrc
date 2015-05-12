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

" Auto completion and snippets
if (has('unix') || has('mac')) && has('python')
  Plug 'Valloric/YouCompleteMe'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
else
  Plug 'ervandew/supertab'
endif

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim', { 'on': 'Gist' }
Plug 'mattn/webapi-vim'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': 'install' }

" Colorschemes
Plug 'altercation/vim-colors-solarized'

" Other useful goodies
if v:version >= 703
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
endif
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular', { 'on': ['Tabularize'] }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'iwataka/minidown.vim', { 'on': 'Minidown' }
Plug 'tpope/vim-dispatch', { 'on': ['Make', 'Dispatch', 'Start'] }

" For specific filetypes
if v:version >= 703
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
endif
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'scrooloose/syntastic', { 'for': ['ruby', 'python'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'vim'] }

call plug#end()
endif

" Enable filetype plugins
filetype plugin on
filetype indent on

if findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim  " Move between if and else
endif

" }}}
" ===============================================================
" BASIC SETTINGS {{{
" ===============================================================

" The mapleader is used as a prefix for all user mappings.
let mapleader      = " "  " Space can be typed by both of hands.
let maplocalleader = "\\"  " The local mapleader is hardly used.

let $LANG='en'                            " Vim should be in English
set encoding=utf-8                        " UTF8 is a universal encoding
set fileencodings=utf-8,sjis              " UTF8 is first, SJIS is second
set fileformats=unix,dos,mac              " Unix format has highest priority
set imdisable                             " The Input Method is never used
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
set tabstop=2                             " :retab command use this value
set softtabstop=2                         " Number of spaces while inserting a <Tab> or using <BS>.
set shiftwidth=2                          " Number of spaces to use for each step of (auto)indent
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
set hlsearch                              " Highlight search results
set gdefault                              " Set the g flag by default when executing substitute
set ttyfast                               " Enable fast connection
set foldenable                            " Enable to fold
set foldmethod=marker                     " Use specified markers to fold sentences
set foldopen+=jump                        " Open foldings when jumping to them
set allowrevins                           " Allow to use CTRL-_
set list lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show invisible characters
set pastetoggle=<F2>                      " Toggle paste mode by <F2>

set wildmenu
set wildignorecase
set wildmode=list:full
set wildignore+=.git,.hg,.svn,.bzr,_darcs        " VCS
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX
set wildignore+=*.luac                           " Lua
set wildignore+=*.pyc                            " Python
set wildignore+=*.rbc                            " Ruby
set wildignore+=*.class                          " JVM

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

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
elseif executable('ack')
  set grepprg=ack\ -H\ --nocolor\ --nogroup
else
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
endif

" }}}
" ===============================================================
" AUTOCMD {{{
" ===============================================================

augroup vimrcEx
  autocmd!

  " Use cursorline only in the focused window.
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline

  " When editing a file, always jump to the last known cursor position.
  " do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  " Set markdown filetype.
  autocmd BufRead,BufNewFile *.md setlocal filetype=markdown

  " Enable spellchecking and word wrapping for Markdown
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Quit help buffer by typing just q.
  autocmd FileType help
    \ if &readonly | nnoremap <buffer> q :q<cr> | endif

  autocmd FileType java,make,sh,zsh,markdown
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4

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

  " Automatically open the quickfix window
  autocmd QuickFixCmdPost * cwindow
augroup END

" }}}
" ===============================================================
" MAPPINGS {{{
" ===============================================================

" More reasonable cursor moving
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" Prevent to override registers by one character
nnoremap x "_x

" Better jumping to marks
nnoremap ' `
nnoremap ` '

" jk | Escaping!
inoremap jk <Esc>
cnoremap jk <C-c>

" Edit vimrc
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
" Source vimrc
nnoremap <leader>sv :source ~/.vimrc<cr>
" Source the current buffer
nnoremap <leader>sc :source %<cr>

" qq to record, Q to replay
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Make Y behave like other capitals
nnoremap Y y$

" Save
nnoremap <leader>u :update<cr>
nnoremap <Leader>w :w<CR>
cnoremap w!! w !sudo tee % >/dev/null

" Quit
nnoremap <leader>q :q<cr>

" Hide other visibie buffers
nnoremap <leader>o :only<cr>

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

" Circular window navigation
nnoremap <tab> <c-w>w
nnoremap <S-tab> <c-w>W

" Clear the highlighting of :set hlsearch.
nnoremap <silent> <C-l> :nohlsearch<cr><C-l>

" Increment and decrement numbers by + and - keys.
" Tmux uses <c-a> key as a prefix, so Vim can't use it.
nnoremap + <c-a>
nnoremap - <c-x>

" Changes the current working directory to the directory of focused buffer
nnoremap <leader>cd  :cd %:h<cr>

" Make <C-u> behave like being on command line
inoremap <C-u> <C-g>u<C-u>

" Make search results appear in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Search in visual mode
xnoremap <silent> * :<C-u>let @/ = <sid>get_search_pattern()<cr>:normal n<cr>
xnoremap <silent> # :<C-u>let @/ = <sid>get_search_pattern()<cr>:normal N<cr>

" K to grep files
nnoremap <silent> K :grep <cword><cr>
xnoremap <silent> K :<C-u>exe 'grep "'.<sid>get_grep_pattern().'"'<cr>

" Double <BS> to remove trailing spaces
nnoremap <silent> <BS><BS> :call <sid>preserve('%s/\s*$//')<cr>

" Add extra mappings for commenting out stuffs like other editors.
au vimrcEx VimEnter * call s:extra_commentary_mappings()
fu! s:extra_commentary_mappings()
  if maparg('<Plug>CommentaryLine') && maparg('<Plug>Commentary')
    nmap <C-_> <Plug>CommentaryLine
    xmap <C-_> <Plug>Commentary
  endif
endfu

" }}}
" ===============================================================
" FUNCTIONS & COMMANDS {{{
" ===============================================================

" Clear all buffers by bdelete command.
" If unsaved buffers exist, this command fails.
com! BufClear call s:bufclear()
function! s:bufclear()
  let lastnr = bufnr('$')
  silent exe '0,'.lastnr.'bdelete'
endfunction

" Changes the current directory to the project root
com! Root call s:cd_root()
fu! s:cd_root()
  let cwd = fnamemodify(expand('%'), ':p:h')
  let root = s:root(cwd)
  if empty(root)
    echom 'Not in a project'
  else
    echom 'Changes the current directory to: '.root
    silent exe 'cd '.root
  endif
endfu
fu! s:root(cwd)
  let rmarkers = ['.git', '.hg', '.svn', '.bzr', '_darcs']
  for mark in rmarkers
    let rdir = finddir(mark, a:cwd.';')
    if !empty(rdir)
      retu fnamemodify(rdir, ':h')
    endif
  endfor
  retu ''
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
fu! s:get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1 :]
  return lines
endfu

fu! s:get_search_pattern()
  let lines = map(s:get_visual_selection(), "escape(v:val, ' \\/.*$^~[]')")
  retu join(lines, '\n')
endfu

fu! s:get_grep_pattern()
  let lines = s:get_visual_selection()
  let lines = map(lines, "escape(v:val, '\\')")
  let lines = map(lines, "escape(v:val, ' /.*+#$?^~\[\]()|')")
  let lines = map(lines, "escape(v:val, '\\')")
  " Escape single quotes.
  let lines = map(lines, "escape(v:val, \"''\")")
  " Escape double quotes.
  let lines = map(lines, "escape(v:val, '\"')")
  retu join(lines, '\n')
endfu

" }}}
" ===============================================================
" ABBREVIATIONS {{{
" ===============================================================

" Insert the current date and time.
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" Prevent misspellings.
abbrev factroy factory
abbrev reutrn return
abbrev netowrk network

" }}}
" ===============================================================
" PLUGINS {{{
" ===============================================================

" --------------------------------------------------------------
" solarized
" --------------------------------------------------------------
let g:solarized_termcolors=256
let g:solarized_visibility='high'
let g:solarized_hitrail=0
let g:solarized_termtrans=1
set background=dark
silent! colo solarized

aug vimrc-colorscheme
  au!
  au VimEnter,ColorScheme * call s:tweak_colorscheme()
aug END

fu! s:tweak_colorscheme()
  if g:colors_name == 'solarized'
    call s:tweak_solarized()
  endif
endfu

fu! s:tweak_solarized()
  if &background == 'dark'
    hi Comment ctermfg=242  " The original value is 239.
    hi vimIsCommand ctermfg=243  " The original value is 240.
    hi gitcommitComment ctermfg=242  " The original value is 239.
    hi gitcommitOnBranch ctermfg=242
    hi gitcommitHeader ctermfg=242
  endif
endfu

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

" --------------------------------------------------------------
" CtrlP
" --------------------------------------------------------------
if executable('ag')
    let g:ctrlp_user_command = 'ag --follow --nocolor -g "" %s'
elseif executable('ack')
    let g:ctrlp_user_command = 'ack --follow --nocolor -g "" %s'
endif

" default ignored directories
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.gradle$\|build$\|project$\|target$\|out$\|libs$\|\.git$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode='wr'
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_mruf_max = 1000

nnoremap <silent> <Leader>p :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>m :CtrlPMRU<CR>
nnoremap <silent> <Leader>d :CtrlPBookmarkDir<CR>

if has('unix')
  let s:ctrlp_bookmark_paths = [
    \ '/usr/lib/ruby/[1-9]\+\(\.[1-9]\+\)*',
    \ '/usr/lib/python[1-9]\+\(\.[1-9]\+\)*',
    \ '/usr/lib/perl/[1-9]\+\(\.[1-9]\+\)*',
    \ '/usr/lib/jvm/java-[1-9]\+-oracle',
    \ '~/projects/*',
    \ '~/dotfiles'
    \ ]
endif

fu! s:ctrlp_bookmark_init()
  if exists('s:ctrlp_bookmark_paths')
    for path in s:ctrlp_bookmark_paths
      let dirs = split(expand(path), '\n')
      let dirs = map(dirs, 'resolve(v:val)')
      call s:ctrlp_bookmark_add(dirs)
    endfor
  endif
  call s:ctrlp_bookmark_add(split(&rtp, ','))
endf

fu! s:ctrlp_bookmark_add(dirs)
  for dir in a:dirs
    if isdirectory(dir)
      silent exe 'CtrlPBookmarkDirAdd! '.dir
    endif
  endfor
endfu

augroup vimrc-ctrlp
  au!
  au VimEnter * if exists(':CtrlPBookmarkDirAdd') | call s:ctrlp_bookmark_init() | endif
augroup END

let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }

" --------------------------------------------------------------
" YCM
" --------------------------------------------------------------
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_detailed_diagnostics = ''

" --------------------------------------------------------------
" Ultisnips
" --------------------------------------------------------------
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetsDir="~/.vim/snippets"

" --------------------------------------------------------------
" dispatch
" --------------------------------------------------------------
augroup vimrc-dispatch
  autocmd!
  autocmd FileType scala let b:start = 'sbt'
  autocmd FileType java let b:start = 'sbt'
  autocmd FileType closure let b:start = 'lein repl'
  autocmd FileType python
        \ let b:start = 'python' |
        \ let b:dispatch = 'python %'
  autocmd FileType ruby
        \ let b:start = 'irb' |
        \ let b:dispatch = 'ruby %'
augroup END

nnoremap <silent> <F8> :Start<cr>
nnoremap <silent> <F9> :Dispatch<cr>
inoremap <silent> <F8> <esc>:Start<cr>
inoremap <silent> <F9> <esc>:Dispatch<cr>

" --------------------------------------------------------------
" gitgutter
" --------------------------------------------------------------
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

" --------------------------------------------------------------
" fugitive
" --------------------------------------------------------------
nnoremap <Leader>gs :Gstatus<CR>8j
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <leader>gD :Git diff<cr>
nnoremap <Leader>gg :call <sid>GgrepPrompt()<cr>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <leader>gR :Gremove<cr>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <leader>gL :Git log<cr>
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gA :Git add --all<cr>

fu! s:GgrepPrompt()
  let keyword = input('Keyword? ')
  if keyword != ''
    exe "Ggrep ".keyword
  else
    echoe "Non-empty keyword is needed!"
  endif
endfu

" --------------------------------------------------------------
" repeat
" --------------------------------------------------------------
sil! call repeat#set("\<Plug>(EasyAlign)", v:count)

" --------------------------------------------------------------
" lightline
" --------------------------------------------------------------
let g:lightline = {}

let g:lightline.colorscheme = 'solarized'

let g:lightline.active = {}
let g:lightline.active.left = [
  \   ['mode', 'paste'],
  \   ['gitgutter', 'fugitive'],
  \   ['filename']
  \ ]
let g:lightline.active.right = [
  \   ['lineinfo', 'syntastic'],
  \   ['percent'],
  \   ['fileformat', 'fileencoding', 'filetype']
  \ ]

let g:lightline.component_function = {}
let g:lightline.component_function.syntastic = 'SyntasticStatuslineFlag'
let g:lightline.component_function.gitgutter = 'MyGitGutter'
let g:lightline.component_function.filename = 'MyFilename'
let g:lightline.component_function.fugitive = 'MyFugitive'

let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }

let g:lightline.tabline = {}
let g:lightline.tabline.left = [ [ 'tabs' ] ]
let g:lightline.tabline.right = [ [ 'close' ] ]

let g:lightline.tab = {}
let g:lightline.tab.active = [ 'tabnum', 'filename', 'modified' ]
let g:lightline.tab.inactive = [ 'tabnum', 'filename', 'modified' ]

let g:lightline.component_expand = {}
let g:lightline.component_expand.tabs = 'lightline#tabs'

let g:lightline.component_type = {}
let g:lightline.component_type.tabs = 'tabsel'
let g:lightline.component_type.close = 'raw'

let g:lightline.tab_component_function = {}
let g:lightline.tab_component_function.filename = 'lightline#tab#filename'
let g:lightline.tab_component_function.modified = 'lightline#tab#modified'
let g:lightline.tab_component_function.readonly = 'lightline#tab#readonly'
let g:lightline.tab_component_function.tabnum = 'lightline#tab#tabnum'

let g:lightline.enable = {}
let g:lightline.enable.statusline = 1
let g:lightline.enable.tabline = 1

let g:ctrlp_buffer_func = {'enter': 'CtrlPEnter'}
function! CtrlPEnter()
  let w:lightline = 0
endfunction

function! MyFugitive()
  if exists('*fugitive#head')
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyReadonly()
  return &readonly ? '' : ''
endfunction

function! MyModified()
  return &modifiable && &modified ? '+' : ''
endfunction

function! MyGitGutter()
  if !exists('*GitGutterGetHunkSummary')
        \ || !get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  en
  let symbols = [
    \ g:gitgutter_sign_added . ' ',
    \ g:gitgutter_sign_modified . ' ',
    \ g:gitgutter_sign_removed . ' '
    \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    call add(ret, symbols[i].hunks[i])
  endfo
  return join(ret, ' ')
endf

" --------------------------------------------------------------
" delimitMate
" --------------------------------------------------------------
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 1

" --------------------------------------------------------------
" scala
" --------------------------------------------------------------
aug vimrc-scala
  au!
  au FileType scala nnoremap <silent><buffer> <Leader>si :SortScalaImports<CR>
aug END
let g:scala_sort_across_groups = 1

" --------------------------------------------------------------
" syntastic
" --------------------------------------------------------------
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ['ruby', 'python'],
  \ "passive_filetypes": []
  \ }
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1

if executable('rubocop')
  let g:syntastic_ruby_checkers = ['rubocop']
endif
if executable('flake8')
  let g:syntastic_python_checkers = ['flake8']
endif

" --------------------------------------------------------------
" tagbar
" --------------------------------------------------------------
if v:version >= 703
  inoremap <F3> <esc>:TagbarToggle<cr>
  nnoremap <F3> :TagbarToggle<cr>
  let g:tagbar_sort = 0
  let g:tagbar_show_linenumbers = 2
  let g:tagbar_autofocus = 1
  let g:tagbar_autoclose = 1
endif

" --------------------------------------------------------------
" nerdtree
" --------------------------------------------------------------
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nm :NERDTreeMirror<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>
nnoremap <leader>nb :NERDTreeFromBookmark

" --------------------------------------------------------------
" indentLine
" --------------------------------------------------------------
let g:indentLine_color_term = 242

" }}}
