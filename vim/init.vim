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

" Completion
if has('python')
  " Plug 'Valloric/YouCompleteMe', { 'on': [] }
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif

" Git
Plug 'airblade/vim-gitgutter'
" if v:version >= 703
"   Plug 'mhinz/vim-signify'
" endif
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', { 'on': ['Gitv'] }

" Fancy
" Plug 'bling/vim-airline'  " Waste time on startup
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'

" Navigation
if v:version >= 703
  Plug 'majutsushi/tagbar', { 'on': ['TagbarToggle'] }
endif
Plug 'scrooloose/nerdtree', { 'on': [
  \ 'NERDTree',
  \ 'NERDTreeToggle',
  \ 'NERDTreeFind',
  \ 'NERDTreeCWD',
  \ 'NERDTreeFromBookmark'
  \ ] }
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
" This plug-in causes errors while inputting japanese characters
" in GVim, so you should execute :DelimitMateOff for it.
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular', { 'on': ['Tabularize'] }
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
" Plug 'xolox/vim-misc' || Plug 'xolox/vim-colorscheme-switcher'

" Filetype
if v:version >= 703
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
endif
Plug 'plasticboy/vim-markdown', { 'for': '*markdown' }
if has('unix') || has('mac')
  Plug 'suan/vim-instant-markdown', { 'for': '*markdown' }
endif
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
if has('clientserver')
  Plug 'lervag/vimtex', { 'for': ['tex', 'latex'] }
endif

" Utility
Plug 'itchyny/calendar.vim', { 'on': ['Calendar'] }
Plug 'mattn/gist-vim', { 'on': ['Gist'] }
Plug 'mattn/webapi-vim'

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
set hlsearch                              " Highlight search results
nohlsearch                                " Prevetnt highlight when reloading .vimrc
set ttyfast                               " Enable fast connection
set foldenable                            " Enable to fold
set foldlevel=0                           " Start folding at the second depth
set foldmethod=marker                     " Use specified markers to fold sentences
" set foldopen+=jump,search                 " Open foldings when jumping to them
set allowrevins                           " Allow to use CTRL-_
set list lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show invisible characters
set colorcolumn=81

set wildmenu
set wildignorecase
set wildmode=list:full
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
if has('unnamedplus')
  set clipboard+=unnamedplus
endif

" Some features are disabled to improve scrolling performance
let g:loaded_matchparen = 1
set number
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
    silent! set guifont=Hack:h9:cANSI
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

  " spell, textwidth and other things
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell
  autocmd FileType *markdown setlocal spell
  autocmd FileType calendar,git,gitv setlocal nolist

  " Comment strings
  autocmd FileType *markdown setlocal commentstring=<!--%s-->
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
  autocmd BufRead,BufNewFile *.tex set filetype=tex
  autocmd FileType text set filetype=markdown

  " write comments easily for any files
  autocmd BufRead,BufNewFile * set formatoptions+=ro

  " prevent from conflicting multiple edit
  autocmd SwapExists * let v:swapchoice = 'o'

  " Full-width spaces
  autocmd BufRead,BufNew * hi FullWidthSpace cterm=underline ctermbg=red guibg=#666666
  autocmd BufRead,BufNew * match FullWidthSpace /　/

  " Automatically open the quickfix window
  autocmd QuickFixCmdPost * cwindow

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
inoremap <C-s> <C-O>:w<cr>
nnoremap <C-s> :w<cr>
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
" This annoys me a little
" cnoremap <expr> %% expand("%")

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
nnoremap <silent> <Esc><Esc> :nohlsearch<cr><C-l>

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
nnoremap <silent> <BS><BS> :call <sid>preserve('%s/\s*$//')<cr>

" :checktime is frequently used
nnoremap <leader>ct :checktime<cr>

" Some mappings for user-defined commands
nnoremap <silent> <leader>cb :CheckboxToggle<cr>
nnoremap <silent> <leader>rt :Root<cr>
if !maparg('<tab>', 'i') | inoremap <expr> <tab> <sid>super_duper_tab("\<c-n>", "\<tab>") | endif
if !maparg('<tab>', 'i') | inoremap <expr> <S-tab> <sid>super_duper_tab("\<c-p>", "\<tab>") | endif

" ===============================================================
" FUNCTIONS & COMMANDS {{{1
" ===============================================================

" Clear all buffers by bdelete command.
" If unsaved buffers exist, this command fails.
com! -bang -complete=file -nargs=? BufClear call s:bufclear(<bang>0, <q-args>)
function! s:bufclear(bang, path)
  let lastnr = bufnr('$')
  let abs_path = a:path == '' ? '' : fnamemodify(expand(a:path), ':p')
  " buffer number starts from 1
  let i = 1
  wh i <= lastnr
    let name = fnamemodify(bufname(i), ':p')
    " Terminal buffers can't be deleted automatically.
    if getbufvar(i, "&buftype") != "terminal"
      if bufexists(i) &&
          \ (abs_path == '' || (filereadable(name) && name =~ abs_path.'*'))
        silent exe 'bwipeout '.i
      elseif a:bang && bufloaded(i)
        silent exe 'bdelete '.i
      endif
    endif
    let i = i + 1
  endwh
endfunction

" Changes the current directory to the project root
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

com! MarkdownPreview call s:markdown_preview()
fu! s:markdown_preview()
  let current_name = fnamemodify(expand('%'), ':p')
  let target_name =  fnamemodify(current_name, ':r').'.html'
  if executable('pandoc')
    silent exec '!pandoc -s -f markdown_github '.current_name.' -o '.target_name
    call s:open(target_name)
  else
    echoe 'Require Pandoc!'
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

com! Make call <sid>make_current_project()
fu! s:make_current_project()
  let files = split(system('ls'), '\n')
  for file in files
    if file == "Makefile"
      !make
      return
    elseif file == "Rakefile"
      !rake
      return
    endif
  endfor
  make
endfu

com! -nargs=* Run call <sid>run_this_script(<q-args>)
fu! s:run_this_script(args)
  let fname = expand('%')
  if &filetype == 'python'
    exe '!python '.fname.' '.a:args
  elseif &filetype == 'ruby'
    exe '!ruby '.fname.' '.a:args
  elseif &filetype == 'vim'
    " Put 'silent!' at the head because sourcing .vimrc must cause an error.
    silent! exe 'source '.fname
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

" Use this command after executing grep.
aug vimrc-replace
  autocmd!
  autocmd FileType qf com! -buffer -nargs=+ -range Replace call s:replace(<line1>, <line2>, <f-args>)
aug END
com! -nargs=+ Replace call s:replace(1, 0, <f-args>)
fu! s:replace(line1, line2, old, new)
  let _ignorecase = &ignorecase
  set noignorecase
  let files = {}
  for d in getqflist()[(a:line1 - 1):(a:line2 - 1)]
    let bufnr = d.bufnr
    let bufname = bufname(bufnr)
    if filereadable(bufname)
      let lnum = d.lnum
      let content = []
      if has_key(files, bufnr)
        let content = files[bufnr]
      else
        let content = readfile(bufname)
      endif
      let line = content[lnum - 1]
      let new_line = substitute(line, a:old, a:new, 'g')
      let content[lnum - 1] = new_line
      let files[bufnr] = content
    endif
  endfor
  for [bufnr, content] in items(files)
    silent call writefile(content, bufname(str2nr(bufnr)))
  endfor
  let &ignorecase = _ignorecase
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

if ('python')
  com! PlugYcm call s:load_ycm()
  fu! s:load_ycm()
    call plug#load('YouCompleteMe', 'ultisnips', 'vim-snippets')
    call youcompleteme#Enable()
  endfu
endif

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
let g:solarized_termcolors = 256
let g:solarized_visibility = 'high'
let g:solarized_hitrail = 0
let g:solarized_termtrans = 1
let g:solarized_italic = 1
call togglebg#map('<F5>')

let g:gruvbox_improved_warnings = 1
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark = 'soft'

if !exists('g:colors_name')
  if has('gui_running')
    set background=dark
    silent! colorscheme gruvbox
  else
    set background=dark
    silent! colorschem solarized
  endif
endif

" --------------------------------------------------------------
" gist {{{2
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
let g:ctrlp_working_path_mode='wr'
let g:ctrlp_by_filename = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_mruf_max = 1000

nnoremap <silent> <Leader>p :CtrlP<CR>
" This immitates atom, sublimeText and so on.
" Conflict with vim-multiple-cursors
" nnoremap <silent> <C-p> :CtrlP<cr>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>m :CtrlPMRU<CR>
nnoremap <silent> <Leader>d :CtrlPBookmarkDir<CR>

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
" YCM {{{2
" --------------------------------------------------------------
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_detailed_diagnostics = ''
nnoremap gd :YcmCompleter GoToDeclaration<cr>

" --------------------------------------------------------------
" Ultisnips {{{2
" --------------------------------------------------------------
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/snippets"

" --------------------------------------------------------------
" Git {{{2
" --------------------------------------------------------------
nnoremap gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <leader>gD :Gsplit! diff<cr>
nnoremap <Leader>gg :Ggrep<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <leader>gR :Gremove<cr>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <leader>gL :Gpedit! log -n 10 --stat<cr><c-w>p
nnoremap <leader>ga :Gcommit --amend<cr>
nnoremap <leader>gA :Git add --all<cr>

nnoremap <leader>gv :Gitv --all<cr>
nnoremap <leader>gV :Gitv! --all<cr>
vnoremap <leader>gV :Gitv! --all<cr>

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
nnoremap <leader>gG :GitGutterToggle<cr>

" --------------------------------------------------------------
" repeat {{{2
" --------------------------------------------------------------
" sil! call repeat#set("\<Plug>(EasyAlign)", v:count)

" --------------------------------------------------------------
" lightline {{{2
" --------------------------------------------------------------
let g:lightline = {}

if has('gui_running')
  let g:lightline.colorscheme = 'gruvbox'
else
  let g:lightline.colorscheme = 'solarized'
endif

let g:lightline.active = {}
let g:lightline.active.left = [
  \   ['mode', 'paste'],
  \   ['gitgutter', 'fugitive'],
  \   ['pwd', 'filename']
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
let g:lightline.component_function.pwd = 'MyPWD'
let g:lightline.component_function.fugitive = 'MyFugitive'

" let g:lightline.separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
" let g:lightline.subseparator = { 'left': "\ue0b1", 'right': "\ue0b3" }

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

fu! MyPWD()
  if winwidth('.') <= 90
    return ''
  else
    return substitute(getcwd(), '^'.expand('~'), '~', '')
  endif
endfu

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
" delimitMate {{{2
" --------------------------------------------------------------
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_inside_quotes = 0
aug vimrc-delimitMate
  au!
  au FileType mkd let b:delimitMate_expand_space = 0
aug END

" --------------------------------------------------------------
" scala {{{2
" --------------------------------------------------------------
aug vimrc-scala
  au!
  au FileType java,scala nnoremap <silent><buffer> <Leader>si :SortScalaImports<CR>
aug END
let g:scala_sort_across_groups = 1

" --------------------------------------------------------------
" syntastic {{{2
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
" Navigation {{{2
" --------------------------------------------------------------
if v:version >= 703
  nnoremap <silent> <leader>t :call <sid>toggle_navigation_bar()<cr>
  let g:tagbar_sort = 0
  let g:tagbar_show_linenumbers = 2
  let g:tagbar_autofocus = 1
  let g:tagbar_autoclose = 1
endif
let g:vimtex_view_enabled = 0
let g:vimtex_index_split_width = 40
fu! s:toggle_navigation_bar()
  if &ft == 'tex' || &ft == 'latex'
    VimtexTocToggle
  else
    TagbarToggle
  endif
endfu

" --------------------------------------------------------------
" nerdtree {{{2
" --------------------------------------------------------------
" If you get the error like 'Undefined variable b:NERDTree',
" you should run the command like ':NERDTree .'.
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nm :NERDTreeMirror<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>
nnoremap <leader>nx :NERDTreeClose<cr>
nnoremap <leader>nb :NERDTreeFromBookmark
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 40

augroup vimrc-nerdtree
  autocmd!
  autocmd FileType nerdtree com! -buffer NERDTreePromote call s:nerdtree_promote()
  autocmd FileType nerdtree com! -buffer NERDTreeDemote call s:nerdtree_demote()
  autocmd FileType nerdtree nnoremap <silent> <buffer> << :NERDTreePromote<cr>
  autocmd Filetype nerdtree nnoremap <silent> <buffer> >> :NERDTreeDemote<cr>
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
" indentLine {{{2
" --------------------------------------------------------------
let g:indentLine_color_term = 242

" --------------------------------------------------------------
" markdown {{{2
" --------------------------------------------------------------
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_folding_disabled = 1

" --------------------------------------------------------------
" instant-markdown {{{2
" --------------------------------------------------------------
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0

" --------------------------------------------------------------
" calendar {{{2
" --------------------------------------------------------------
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" --------------------------------------------------------------
" Misc {{{1
" --------------------------------------------------------------
" --------------------------------------------------------------
" separator {{{2
" --------------------------------------------------------------
fu! s:separator_insert(char, enter_insert_mode_key)
  normal! m`
  let use_cursorline_width = get(b:, 'separator_use_cursorline_width',
        \ get(g:, 'separator_use_cursorline_width', 0))
  let cursorline_width = len(substitute(getline(line('.')), '\s*$', '', 'g'))
  let width = get(b:, 'separator_width',
        \ get(g:, 'separator_width', s:separator_width()))
  let w = use_cursorline_width && cursorline_width != 0 ?
        \ cursorline_width : width
  let format = s:separator_format()
  let sep = printf(format, repeat(a:char, w / len(a:char)))
  silent noautocmd exe 'normal! '.a:enter_insert_mode_key.sep
  noautocmd call setline(line('.'), getline('.')[0:(w - 1)])
  normal! ``
endfu
fu! s:separator_width()
  let cc = min(map(split(&cc, ','), 'str2nr(v:val)')) - 1
  return &tw == 0 ? &tw + cc : &tw
endfu
fu! s:separator_format()
  if empty(&cms)
    return '%s'
  endif
  let format = get(b:, 'separator_format', get(g:, 'separator_format', &cms))
  if s:insert_seprator_use_commentary_style()
    return s:separator_commentary_format(format)
  else
    return format
  endif
endfu
fu! s:insert_seprator_use_commentary_style()
  return exists(':Commentary') ||
        \ get(b:, 'separator_use_commentary_style',
        \ get(g:, 'separator_use_commentary_style', 0))
endfu
fu! s:separator_commentary_format(ft)
  " Stealed from vim-commentary
  return substitute(substitute(a:ft, '\S\zs%s',' %s',''), '%s\ze\S', '%s ', '')
endfu
if get(g:, 'separator_use_default_mappings', 1)
  nnoremap <silent> [= :call <sid>separator_insert('=', 'O')<cr>
  nnoremap <silent> ]= :call <sid>separator_insert('=', 'o')<cr>
  nnoremap <silent> g= :call <sid>separator_insert('=', 'I')<cr>
  nnoremap <silent> [- :call <sid>separator_insert('-', 'O')<cr>
  nnoremap <silent> ]- :call <sid>separator_insert('-', 'o')<cr>
  nnoremap <silent> g- :call <sid>separator_insert('-', 'I')<cr>
endif
if get(g:, 'separator_use_default_autocommands', 1)
  aug Separator
    au!
    au Filetype *markdown,text
          \ let b:separator_format = '%s' |
          \ let b:separator_use_curline_width = 1
    au Filetype tex let b:separator_format = '%%%s'
  aug END
endif
