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
  Plug 'tpope/vim-dispatch'
endif

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
Plug 'iwataka/ctrlproj.vim'
Plug 'JazzCore/ctrlp-cmatcher'

" Other useful goodies
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'

" For specific filetypes
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
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

nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

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
nnoremap <leader>Q :qa!<cr>

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

    " Automatically open the quickfix window after :Ggrep of fugitive.
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

" }}}
" ===============================================================
" FUNCTIONS & COMMANDS {{{
" ===============================================================

" clear buffers except for current one
command! BufClear :call BufClear()
function! BufClear()
    let l:current_bufnr = bufnr("%")
    let l:last_bufnr = bufnr("$")
    silent! exe "normal! :0," . (l:current_bufnr - 1) . "bdelete\<cr>"
    silent! exe "normal! :" . (l:current_bufnr + 1) . "," . l:last_bufnr . "bdelete\<cr>"
endfunction

" }}}
" ===============================================================
" ABBREVIATIONS {{{
" ===============================================================
abbrev factroy factory
abbrev reutrn return
abbrev netowrk network

" }}}
" ===============================================================
" PLUGINS {{{
" ===============================================================

" --------------------------------------------------------------
" dispatch
" --------------------------------------------------------------
augroup dispatchEx
  autocmd!
  autocmd FileType scala let b:start = 'sbt'
augroup END

nnoremap <F9> :call <sid>StartOrDispatch()<cr>
fu! s:StartOrDispatch()
  if exists('b:start') && b:start != ''
    exe 'Start'
  else
    exe 'Dispatch'
  endif
endfu

" --------------------------------------------------------------
" solarized
" --------------------------------------------------------------
let g:solarized_termcolors=256
let g:solarized_visibility='high'
let g:solarized_hitrail=1
let g:solarized_termtrans=1
set background=dark
silent! colo solarized

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
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode='wr'
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

nnoremap <silent> <Leader>pf :CtrlP<CR>
nnoremap <silent> <Leader>pb :CtrlPBuffer<CR>
nnoremap <silent> <leader>pd :CtrlPDir<cr>
nnoremap <silent> <leader>pv :CtrlP ~/.vim<cr>
nnoremap <silent> <Leader>pm :CtrlPMRU<CR>
nnoremap <silent> <Leader>pl :CtrlPLine %<CR>
nnoremap <silent> <Leader>pu :CtrlPUndo<CR>
" nnoremap <silent> <Leader>pr :CtrlPFunky<CR>

" let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" --------------------------------------------------------------
" CtrlProj
" --------------------------------------------------------------
let g:ctrlproj_paths = [
  \ '/usr/lib/ruby/[1-9]\+\(\.[1-9]\+\)*',
  \ '/usr/lib/python[1-9]\+\(\.[1-9]\+\)*',
  \ '/usr/lib/perl/[1-9]\+\(\.[1-9]\+\)*',
  \ '/usr/local/scala',
  \ '/usr/local/jdk',
  \ '~/projects/*',
  \ '~/.vim/plugged/*',
  \ '~/dotfiles'
  \ ]

" fast aliases for ctrlp
nnoremap <silent> <Leader>pq :Ctrlproj<CR>
nnoremap <silent> <Leader>pl :CtrlprojLastDir<CR>
nnoremap <silent> <leader>pg :CtrlprojGrep<cr>
nnoremap <silent> <leader>pr :CtrlprojRooter<cr>
nnoremap <silent> <leader>ps :silent only<cr>:CtrlprojVSwitch<cr>
nnoremap <silent> <leader>pa :silent only<cr>:CtrlprojVAlternate<cr>

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
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)

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
vnoremap <Enter> <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" --------------------------------------------------------------
" scala
" --------------------------------------------------------------
nnoremap <silent> <Leader>ss :SortScalaImports<CR>
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

nnoremap <silent> <Leader>si :SyntasticInfo<CR>
nnoremap <silent> <Leader>sc :SyntasticCheck<CR>

if executable('rubocop')
  let g:syntastic_ruby_checkers = ['rubocop']
endif
if executable('flake8')
  let g:syntastic_python_checkers = ['flake8']
endif

" }}}
