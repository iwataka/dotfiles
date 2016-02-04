" DESCRIPTION {{{1
" ===============================================================
" Awesome vimrc
" junegunn - https://github.com/junegunn/dotfiles/blob/master/vimrc
" martin-svk - https://github.com/martin-svk/dot-files/blob/master/neovim/init.vim
" amix - https://github.com/amix/vimrc

" Awesome color scheme
" solarized - https://github.com/altercation/vim-colors-solarized
" vim-hybrid - https://github.com/w0ng/vim-hybrid
" molokai - https://github.com/tomasr/molokai
" tomorrow - https://github.com/chriskempson/vim-tomorrow-theme
" jellybeans - https://github.com/nanotech/jellybeans.vim
" gruvbox - https://github.com/morhetz/gruvbox
" zenburn - https://github.com/jnurmine/Zenburn
" base16 - https://github.com/chriskempson/base16-vim
" pencil - https://github.com/reedes/vim-colors-pencil
" papercolor - https://github.com/NLKNguyen/papercolor-theme
" lucius - https://github.com/jonathanfilip/vim-lucius
" gotham - https://github.com/whatyouhide/vim-gotham

" Color scheme gallery
" vimcolor - http://vimcolor.com

" Direct Codepoint Entry
" <C-V>165 -> ¥
" <C-V>xb1 -> ±
" <C-V>u2211 -> ∑
" <C-V>U0001F609 -> 😉
" Other difficult-to-input characters
" <C-V><Enter> -> 

" ===============================================================
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
if !has('win32')
  " Require my .ssh/config file.
  let g:plug_url_format = 'github:%s.git'
endif
Plug 'iwataka/vim-replace'
Plug 'iwataka/airnote.vim', { 'on': ['Note', 'NoteDelete'] }
unlet! g:plug_url_format

" Git
Plug 'airblade/vim-gitgutter'
" if v:version >= 703
"   Plug 'mhinz/vim-signify'
" endif
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'junegunn/gv.vim', { 'on': ['GV'] }

" Navigation
Plug 'bling/vim-airline'
Plug 'justinmk/vim-dirvish'
Plug 'ctrlpvim/ctrlp.vim'
if has('unix') || has('mac') || has('macunix')
  Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
elseif has('python')
  Plug 'FelikZ/ctrlp-py-matcher'
endif

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
" This plug-in causes errors while inputting japanese characters
" in GVim, so you should execute :DelimitMateOff for it.
" Related to the Vim's bug
" Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
" This plugin is low-performance with YCM.
" Plug 'terryma/vim-multiple-cursors'
" If you want to use syntastic, you must disable vim-auto-save plugin.
" Plug 'scrooloose/syntastic'
" Plug 'vim-scripts/vim-auto-save'

" Colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
" Switching colorscheme includes an error caused by a bug in Vim.
" This plugin resolves it.
" Plug 'xolox/vim-misc' | Plug 'xolox/vim-colorscheme-switcher'

" Filetype
if v:version >= 703
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
endif
" This is being actively developed and may have some issues, so I fork this.
Plug 'iwataka/vim-markdown', { 'for': 'markdown' }
" Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'tpope/vim-endwise'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'docker' }
Plug 'ap/vim-css-color', { 'for': 'css' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'solarnz/thrift.vim', { 'for': 'thrift' }
Plug 'jamessan/vim-gnupg', { 'for': 'gnupg' }
Plug 'junegunn/vader.vim', { 'for': 'vader' }
Plug 'matze/vim-tex-fold', { 'for': 'tex' }

" Utility
Plug 'itchyny/calendar.vim', { 'on': ['Calendar'] }

call plug#end()
endif

filetype plugin on
filetype indent on

if findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim  " Move between if and else
endif

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
set fileencodings=utf-8,sjis              " UTF8 is first, SJIS is second
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
set foldenable                            " Enable to fold
set foldlevel=0                           " Start folding at the second depth
set foldmethod=marker                     " Use specified markers to fold sentences
set conceallevel=0
" set foldopen+=jump,search               " Open foldings when jumping to them
set allowrevins                           " Allow to use CTRL-_
set list lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show invisible characters
set colorcolumn=81

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

if has('win32') || has('win64')
  set imdisable
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
    " Hack font can't show Japanese characters properly on Windows.
    " silent! set guifont=Hack:h11:cANSI
  else
    silent! set guifont=Hack\ 11
  endif
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
elseif executable('pt')
  set grepprg=pt\ --nogroup\ --nocolor\ --column
elseif executable('ack')
  set grepprg=ack\ -H\ --nocolor\ --nogroup
else
  set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
endif

" ===============================================================
" AUTOCMD {{{1
" ===============================================================

augroup vimrcEx
  autocmd!

  " Use cursorline only in the focused window.
  " This doesn't work with NERDTree.
  " Currently disabled because of performance issue.
  " autocmd WinEnter * set cursorline
  " autocmd WinLeave * set nocursorline

  " When editing a file, always jump to the last known cursor position.
  " do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  autocmd FileType markdown
        \ setlocal spell |
        \ setlocal commentstring=<!--%s--> |
  autocmd FileType calendar,git,gitv setlocal nolist

  autocmd FileType dosbatch setlocal commentstring=rem%s

  " Quit help buffer by typing just q.
  autocmd FileType help
    \ if &readonly | nnoremap <buffer> q :q<cr> | endif

  autocmd FileType java,c,cpp
    \ if executable('astyle') |
    \   setlocal formatprg='astyle' |
    \ endif

  " Set filetype
  autocmd BufRead,BufNewFile *spacemacs set filetype=lisp
  autocmd BufRead,BufNewFile *.gradle set filetype=groovy
  autocmd BufRead,BufNewFile *editorconfig set filetype=jproperties
  autocmd BufRead,BufNewFile *.gpg set filetype=gnupg
  autocmd BufRead,BufNewFile *.json set filetype=javascript
  autocmd FileType text set filetype=markdown

  " write comments easily for any files
  autocmd BufRead,BufNewFile * set formatoptions+=ro

  " prevent from conflicting multiple edit
  autocmd SwapExists * let v:swapchoice = 'o'

  " Full-width spaces
  autocmd BufRead,BufNew * hi FullWidthSpace cterm=underline ctermbg=red guibg=#666666
  autocmd BufRead,BufNew * match FullWidthSpace /　/

  " Automatically open the quickfix window
  autocmd QuickFixCmdPost grep,Ggrep cwindow
  autocmd QuickFixCmdPost lgrep,Glgrep lwindow

  " Automatically remove trailing spaces when saving
  " NOTE: This feature has bad effects for undo function.
  " autocmd BufWritePre * call s:preserve('%s/\s*$//')
augroup END

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

" Prevent to override registers by one character
nnoremap x "_x

" Better jumping to marks
nnoremap ' `
nnoremap ` '

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

" Search in visual mode
xnoremap <silent> * :<C-u>let @/ = <sid>get_search_pattern()<cr>:normal n<cr>
xnoremap <silent> # :<C-u>let @/ = <sid>get_search_pattern()<cr>:normal N<cr>

" Double <BS> to remove trailing spaces
" This doesn't work as you wish.
" nnoremap <silent> <BS><BS> :<c-u>call <sid>preserve('%s/[　\s]*$//')<cr>
nnoremap <silent> <BS><BS> :<c-u>call <sid>preserve('%s/\s*$//')<cr>

" :checktime is frequently used
nnoremap <leader>ct :<c-u>checktime<cr>

" Some mappings for user-defined commands
nnoremap <silent> <leader>cb :<c-u>CheckboxToggle<cr>
nnoremap <silent> <leader>rt :<c-u>Root<cr>
if !maparg('<tab>', 'i') | inoremap <expr> <tab> <sid>super_duper_tab("\<c-n>", "\<tab>") | endif
if !maparg('<tab>', 'i') | inoremap <expr> <S-tab> <sid>super_duper_tab("\<c-p>", "\<tab>") | endif

" Make gt and gT support both tabline and bufline
nnoremap <silent> gt :<c-u>call <sid>move_tab_or_buffer('next', v:count)<cr>
nnoremap <silent> gT :<c-u>call <sid>move_tab_or_buffer('previous', v:count)<cr>

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
com! Root call s:cd_root(expand('%:p:h'))
fu! s:cd_root(path)
  let root = s:root(a:path)
  if empty(root)
    silent exe 'cd '.a:path
    echom 'Not in a project'
  else
    silent exe 'cd '.root
    echom 'Changes the current directory to: '.root
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

com! CheckboxToggle call s:toggle_check_box(line('.'))
fu! s:toggle_check_box(linenr)
  let line = getline(a:linenr)
  if line =~ '[-+*]\s*\[x\]'
    let line = substitute(line, '\([-+*]\s*\[\)x\(\]\)', '\1'.' '.'\2', '')
  elseif line =~ '[-+*]\s*\[\s*\]'
    let line = substitute(line, '\([-+*]\s*\[\)\s*\(\]\)', '\1'.'x'.'\2', '')
  endif
  call setline(a:linenr, line)
endfu

" derived from junegunn's vimrc
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
  if prefix =~ '^[~/.]'
    return "\<c-x>\<c-f>"
  endif
  if s:can_complete(&omnifunc, prefix)
    return "\<c-x>\<c-o>"
  endif
  if s:can_complete(&completefunc, prefix)
    return "\<c-x>\<c-u>"
  endif
  return a:k
endfu

fu! s:can_complete(func, prefix)
  if empty(a:func) || call(a:func, [1, '']) < 0
    return 0
  endif
  let result = call(a:func, [0, matchstr(a:prefix, '\k\+$')])
  return !empty(type(result) == type([]) ? result : result.words)
endfu

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

fu! s:markdown_compile() abort
  if !executable('pandoc')
    throw 'Require pandoc'
  endif
  let current_name = fnamemodify(expand('%'), ':p')
  if !exists('b:markdown_preview_dest_name')
    while !exists('b:markdown_preview_dest_name') ||
          \ filereadable(b:markdown_preview_dest_name)
      let b:markdown_preview_dest_name =  tempname().'.html'
    endwh
  endif
  let cmd = 'pandoc -s -f markdown_github'
  call system(cmd.' '.current_name.' -o '.b:markdown_preview_dest_name)
endfu
fu! s:markdown_preview() abort
  call s:markdown_compile()
  call s:open(b:markdown_preview_dest_name)
endfu
aug markdown-preview
  au!
  au FileType markdown
        \ com! -buffer MarkdownPreview call s:markdown_preview() |
        \ com! -buffer MarkdownCompile call s:markdown_compile()
aug END

nnoremap gx :call <sid>open_url(expand('<cWORD>'))<cr>
fu! s:open_url(line)
  let pat = '\v^.*(http[s]?://[a-zA-Z0-9/\.\?=&]+).*$'
  if a:line =~ pat
    let url = substitute(a:line, pat, '\1', '')
    call s:open(url)
  endif
endfu
cabbrev o Open
com! -nargs=* -complete=file Open call s:open(<f-args>)
fu! s:open(...)
  let target = join(map(copy(a:000), 's:quote_fname(expand(v:val))'), ' ')
  let target = empty(target) ? '"'.expand('%:p').'"' : target
  if has('unix')
    " This line does not work at all and I don't know the reason.
    " silent exec '!xdg-open '.target
    call system('xdg-open '.target)
  elseif has('mac')
    silent exec '!open '.target
  elseif has('win32unix')
    silent exec '!cygstart '.target
  else
    silent! exec '!start '.target
    if v:shell_error
      silent exec '!rundll32 url.dll,FileProtocolHandler '.target
    endif
  endif
  redraw!
endfu
fu! s:quote_fname(str)
  return filereadable(a:str) ? '"'.a:str.'"' : a:str
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
    echoe 'Chrome bookmark file not found'
  endif
  try
    let bookmark = webapi#json#decode(join(readfile(bookmark_fname), ''))
    let children = bookmark.roots.bookmark_bar.children
    return map(children, 'v:val.url')
  catch /^Unknown function/
    echoe 'Require webapi-vim'
  endtry
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
  let separator = '/'
  if has('win32') || has('win64')
    let separator = '\'
  endif

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

fu! s:move_tab_or_buffer(suffix, count)
  let tab_exists = tabpagenr('$') != 1
  let c = a:count == 0 ? '' : a:count
  if tab_exists
    silent exe 'tab'.a:suffix.' '.c
  elseif buflisted(bufnr('%'))
    silent exe 'b'.a:suffix.' '.c
  endif
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
aug vimrc-abbrev
  au!
  au FileType java call s:abbrev_java()
  au FileType scala call s:abbrev_scala()
aug END

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

augroup PlugGx
  autocmd!
  autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
augroup END

function! s:plug_gx()
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
endfunction

" --------------------------------------------------------------
" ColorScheme {{{2
" --------------------------------------------------------------
" gruvbox colorscheme has some issues on terminal Vim (not neovim).
if !(has('gui_running') || has('nvim'))
  let s:colors_name = 'solarized'
else
  let s:colors_name = 'gruvbox'
endif
" Italic style on Windows has low-visibility and disable it.
let s:italic = 1
if has('win32') || !(has('gui_running') || has('nvim'))
  let s:italic = 0
endif
let g:gruvbox_improved_warnings = 1
let g:gruvbox_italic = s:italic

let g:solarized_termcolors = 256
let g:solarized_visibility = 'high'
let g:solarized_hitrail = 0
let g:solarized_termtrans = 1
let g:solarized_italic = s:italic
silent! call togglebg#map('<F5>')

if !exists('g:colors_name')
  silent! exe 'colorscheme '.s:colors_name
  if has('gui_running')
    set background=light
  else
    set background=dark
  endif
endif

" --------------------------------------------------------------
" CtrlP {{{2
" --------------------------------------------------------------
if executable('ag')
  let s:ctrlp_user_command = 'ag --follow --nocolor -g "" %s'
elseif executable('pt')
  let s:ctrlp_user_command = 'pt -l --follow --nocolor "" %s'
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

nnoremap <silent> <Leader>p :<c-u>CtrlP<CR>
" This immitates atom, sublimeText and so on.
" Conflict with vim-multiple-cursors
" nnoremap <silent> <C-p> :CtrlP<cr>
nnoremap <silent> <Leader>b :<c-u>CtrlPBuffer<CR>
nnoremap <silent> <Leader>m :<c-u>CtrlPMRU<CR>
nnoremap <silent> <Leader>d :<c-u>CtrlPBookmarkDir<CR>

let s:ctrlp_bookmark_common_paths = [
  \ '~/projects/*',
  \ '~/lib/*',
  \ '~/dotfiles',
  \ '~/gdrive',
  \ '$JAVA_HOME/src',
  \ '$GOROOT/src'
  \ ]

if has('unix')
  let s:ctrlp_bookmark_paths = [
    \ '/usr/lib/ruby/[1-9]\+\(\.[1-9]\+\)*',
    \ '/usr/lib/python[1-9]\+\(\.[1-9]\+\)*',
    \ '/usr/lib/perl/[1-9]\+\(\.[1-9]\+\)*',
    \ '/usr/lib/jvm/java-[1-9]\+-oracle'
    \ ]
elseif has('win32') || has('win64')
  let s:ctrlp_bookmark_paths = [
    \ 'C:\lib\*'
    \ ]
endif

if exists('s:ctrlp_bookmark_paths')
  call extend(s:ctrlp_bookmark_paths, s:ctrlp_bookmark_common_paths)
else
  let s:ctrlp_bookmark_paths = s:ctrlp_bookmark_common_paths
endif

com! -bang CtrlPBookmarkReload call s:ctrlp_bookmark_init(<bang>0)
fu! s:ctrlp_bookmark_init(bang)
  if a:bang != 0
    call delete(expand('~/.cache/ctrlp/bkd/cache.txt'))
  endif
  if exists('s:ctrlp_bookmark_paths')
    for path in s:ctrlp_bookmark_paths
      let dirs = split(expand(path), '\n')
      let dirs = map(dirs, 'resolve(v:val)')
      call s:ctrlp_bookmark_add(dirs)
    endfor
  endif
  call s:ctrlp_bookmark_add($VIMRUNTIME)
  if exists('g:plug_home')
    let dirs = split(globpath(g:plug_home, '*'))
    call s:ctrlp_bookmark_add(dirs)
  endif
endf

fu! s:ctrlp_bookmark_add(dir)
  if type(a:dir) == type([])
    for d in a:dir
      if isdirectory(d)
        silent exe 'CtrlPBookmarkDirAdd! '.d
      endif
    endfor
  elseif type(a:dir) == type('')
    silent exe 'CtrlPBookmarkDirAdd! '.a:dir
  endif
endfu

augroup vimrc-ctrlp
  au!
  au VimEnter * if exists(':CtrlPBookmarkDirAdd') | call s:ctrlp_bookmark_init(0) | endif
augroup END

if has('unix') || has('mac') || has('macunix')
  let g:ctrlp_match_func = { 'match': 'matcher#cmatch' }
elseif has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif

" --------------------------------------------------------------
" Git {{{2
" --------------------------------------------------------------
nnoremap gs :<c-u>Gstatus<CR>
nnoremap <Leader>gd :<c-u>Gdiff<CR>
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

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
nnoremap <leader>gG :<c-u>GitGutterToggle<cr>

" --------------------------------------------------------------
" repeat {{{2
" --------------------------------------------------------------
silent! call repeat#set("\<Plug>(EasyAlign)", v:count)

" --------------------------------------------------------------
" airline {{{2
" --------------------------------------------------------------
if !exists('g:airline_theme')
  let g:airline_theme = s:colors_name
endif
if has('win32') && has('gui_running')
  let g:airline_powerline_fonts = 0
else
  let g:airline_powerline_fonts = 1
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#wordcount#enabled = 0

" --------------------------------------------------------------
" scala {{{2
" --------------------------------------------------------------
aug vimrc-scala
  au!
  au FileType java,scala nnoremap <silent><buffer> <Leader>si :<c-u>SortScalaImports<CR>
aug END
let g:scala_sort_across_groups = 1

" --------------------------------------------------------------
" markdown {{{2
" --------------------------------------------------------------
let g:markdown_folding = 1

" --------------------------------------------------------------
" calendar {{{2
" --------------------------------------------------------------
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" --------------------------------------------------------------
" goyo {{{2
" --------------------------------------------------------------
let g:goyo_linenr = 0

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
if has('conceal')
  let g:dirvish_relative_paths = 1
endif
aug vimrc-dirvish
  au!
  " Map t to "open in new tab".
  au FileType dirvish nnoremap <buffer> t
      \ :tabnew <C-R>=fnameescape(getline('.'))<CR><CR>

  " Map CTRL-R to reload the Dirvish buffer.
  au FileType dirvish nnoremap <buffer> <C-R> :<C-U>Dirvish %<CR>

  " Map gh to hide "hidden" files.
  au FileType dirvish nnoremap <buffer> gh
      \ :set ma<bar>g@\v/\.[^\/]+/?$@d<cr>:set noma<cr>
aug END

" --------------------------------------------------------------
" airnote {{{2
" --------------------------------------------------------------
let g:airnote_path = expand('~/projects/mynote')
let g:airnote_suffix = 'md'
nnoremap <leader>nn :Note<cr>
nnoremap <leader>nd :NoteDelete<cr>
