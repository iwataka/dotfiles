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

" Auto Completion
if (has('unix') || has('mac')) && has('python')
  Plug 'Valloric/YouCompleteMe'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
else
  Plug 'ervandew/supertab'
endif

" Tmux
if !has('gui_running')
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tpope/vim-dispatch', { 'on': ['Make', 'Dispatch', 'Start'] }
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
Plug 'haya14busa/incsearch.vim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align', { 'on': '<Plug>(EasyAlign)' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'iwataka/minidown.vim', { 'on': 'Minidown' }

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

" }}}
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
set foldenable
set foldmethod=marker
set foldopen+=jump
set complete-=i

set wildmenu
set wildignorecase
set wildmode=list:full
" From fatih's vimrc (https://github.com/fatih/dotfiles)
set wildignore+=.git,.hg,.svn                     " Version control
set wildignore+=*.aux,*.out,*.toc                 " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
set wildignore+=*.spl                             " compiled spelling word lists
set wildignore+=*.sw?                             " Vim swap files
set wildignore+=*.DS_Store                        " OSX bullshit
set wildignore+=*.luac                            " Lua byte code
set wildignore+=*.pyc                             " Python byte code
set wildignore+=*.class                           " JVM byte code

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
" ===============================================================
" MAPPINGS {{{
" ===============================================================

nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

nnoremap x "_x

nnoremap ' `
nnoremap ` '

inoremap jk <Esc>
cnoremap jk <C-c>

nnoremap <leader>v :tabe ~/.vimrc<cr>

" qq to record, Q to replay
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Make Y behave like other capitals
nnoremap Y y$

" Save
nnoremap <Leader>w :w<CR>
cnoremap w!! w !sudo tee % >/dev/null

" Quit
nnoremap <leader>q :q<cr>

" Hide other visibie buffers
nnoremap <leader>o :only<cr>

" Source the current file
nnoremap <leader>S :source %<cr>
" Source a visual range
vnoremap <leader>S y:@"<cr>

" Redraw
nnoremap <silent> gr :redraw!<cr>:nohlsearch<cr>

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

" Move between splitted panes
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

" Execute grep by the word under the cursor
nnoremap K :grep <cword><cr>:cwindow<cr>

" Increment and decrement numbers by + and - keys.
" Tmux uses <c-a> key as a prefix, so Vim can't use it.
nnoremap + <c-a>
nnoremap - <c-x>

" Changes the current working directory to the directory of focused buffer
nnoremap <leader>cd  :cd %:h<cr>

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

" }}}
" ===============================================================
" AUTOCMD {{{
" ===============================================================

augroup vimrcEx
    autocmd!

    " Use cursorline only in the focused window.
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline

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
    autocmd BufRead,BufNew *
      \ highlight FullWidthSpace cterm=underline ctermbg=red guibg=#666666
    autocmd BufRead,BufNew * match FullWidthSpace /　/

    " Automatically open the quickfix window
    autocmd QuickFixCmdPost * cwindow
augroup END

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

com! Chomp call s:remove_trailing_space()
fu! s:remove_trailing_space()
  silent! call s:preserve('%s/\s*$//')
endfu

if has('mac')
  let s:open = 'open'
elseif has('unix')
  if executable('xdg-open')
    let s:open = 'xdg-open'
  endif
elseif has('win32unix')
  let s:open = 'cygstart'
else
  let s:open = 'start'
endif

nnoremap gG :call <sid>google(expand('<cword>'))<cr>
vnoremap gG y:call <sid>google()<cr>
fu! s:google(...)
  let word = a:0 == 0 ? join(split(substitute(@0, '\n\|\r', '', 'g')), '+') : a:1
  let url = shellescape('http://google.com/search?q='.word)
  if exists('s:open') && !empty(s:open)
    silent exe '!'.s:open.' '.url
  endif
endfu

nnoremap gW :call <sid>wikipedia(expand('<cword>'))<cr>
vnoremap gW y:call <sid>wikipedia()<cr>
fu! s:wikipedia(...)
  let word = a:0 == 0 ? join(split(substitute(@0, '\n\|\r', '', 'g')), '_') : a:1
  let url = shellescape('http://en.wikipedia.org/'.word)
  if exists('s:open') && !empty(s:open)
    silent exe '!'.s:open.' '.url
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

" Expands a given path/paths and returns a path list.
fu! s:expand(path)
  if type(a:path) == type('')
    retu split(expand(a:path), '\n')
  elseif type(a:path) == type([])
    let result = []
    for p in a:path
      call extend(result, s:expand(p))
    endfor
    retu result
  endif
endfu

" Resolves a given path/paths and returns a path list.
fu! s:resolve(path)
  if type(a:path) == type('')
    retu resolve(a:path)
  elseif type(a:path) == type([])
    let result = []
    for p in a:path
      call add(result, s:resolve(p))
    endfor
    retu result
  endif
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
let g:solarized_hitrail=1
let g:solarized_termtrans=1
set background=dark
silent! colo solarized

aug colorschemeEx
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

let s:ctrlp_bookmark_paths = [
  \ '/usr/lib/ruby/[1-9]\+\(\.[1-9]\+\)*',
  \ '/usr/lib/python[1-9]\+\(\.[1-9]\+\)*',
  \ '/usr/lib/perl/[1-9]\+\(\.[1-9]\+\)*',
  \ '/usr/lib/jvm/java-[1-9]\+-oracle',
  \ '~/projects/*',
  \ '~/dotfiles'
  \ ]

fu! s:ctrlp_bookmark_init()
  for path in s:ctrlp_bookmark_paths
    call s:ctrlp_bookmark_add(s:resolve(s:expand(path)))
  endfor
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

nnoremap <silent> <F8> :Dispatch<cr>
nnoremap <silent> <F9> :Start<cr>
inoremap <silent> <F8> <esc>:Dispatch<cr>
inoremap <silent> <F9> <esc>:Start<cr>

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
    exe ":Ggrep " . keyword
  else
    echoe "Non-empty keyword is needed!"
  endif
endfu

" --------------------------------------------------------------
" repeat
" --------------------------------------------------------------
sil! call repeat#set("\<Plug>(EasyAlign)", v:count)

" --------------------------------------------------------------
" incsearch
" --------------------------------------------------------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

augroup vimrc-incsearch
  autocmd!
  autocmd VimEnter * call s:incsearch_keymap()
augroup END
fu! s:incsearch_keymap()
  IncSearchNoreMap <Tab> <Over>(buffer-complete)
  IncSearchNoreMap <S-Tab> <Over>(buffer-complete-prev)
endfu

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
" easy-align
" --------------------------------------------------------------
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment']
\    },
\ ']': {
\     'pattern':       '[[\]]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ ')': {
\     'pattern':       '[()]',
\     'left_margin':   0,
\     'right_margin':  0,
\     'stick_to_left': 0
\   },
\ 'd': {
\     'pattern':      ' \(\S\+\s*[;=]\)\@=',
\     'left_margin':  0,
\     'right_margin': 0
\   }
\ }
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" --------------------------------------------------------------
" scala
" --------------------------------------------------------------
aug scalaEx
  au!
  au FileType scala nnoremap <silent><buffer> <Leader>s :SortScalaImports<CR>
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
  nnoremap <leader>t :TagbarToggle<cr>
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
