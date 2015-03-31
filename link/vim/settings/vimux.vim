" Some pane configuration
let g:VimuxHeight = "50"
let g:VimuxOrientation = "h"
" let g:VimuxRunnerType = "window"
" let g:VimuxUseNearest = 0

nnoremap <silent> <Leader>vp :wa<CR>:call <sid>VimuxPromptCommand()<CR>
nnoremap <silent> <Leader>vl :wa<CR>:call <sid>VimuxRunLastCommand()<CR>
nnoremap <silent> <Leader>vi :VimuxInspectRunner<CR>
nnoremap <silent> <Leader>vq :call <sid>VimuxCloseRunner()<CR>
nnoremap <silent> <Leader>vs :VimuxInterruptRunner<CR>
nnoremap <silent> <Leader>vz :VimuxZoomRunner<CR>
nnoremap <silent> <Leader>vo :call <sid>VimuxOpenRunnerAtCWD()<CR>
nnoremap <silent> <leader>vu :VimuxScrollUpInspect<cr>
nnoremap <silent> <leader>vd :VimuxScrollDownInspect<cr>

function! s:VimuxOpenRunnerAtCWD()
  let cwd = getcwd()
  sil exe "normal! :VimuxRunCommand(\"" . cwd . "\")\<CR>"
endfunction

" aliases for build
nnoremap <silent> <Leader>vc :wa<CR>:call <sid>VimuxCompile()<CR>
nnoremap <silent> <leader>vC :wa<cr>:call <sid>VimuxCompileAll()<cr>
nnoremap <silent> <Leader>vr :wa<CR>:call <sid>VimuxRun()<CR>
nnoremap <silent> <leader>vR :wa<cr>:call <sid>VimuxRunAll()<cr>
nnoremap <silent> <Leader>vt :wa<cr>:call <sid>VimuxTest()<CR>
nnoremap <silent> <leader>vT :wa<cr>:call <sid>VimuxTestAll()<cr>
nnoremap <silent> <leader>vI :wa<cr>:call <sid>VimuxInteractiveMode()<cr>
nnoremap <silent> <leader>vL :wa<cr>:call <sid>VimuxReload()<cr>
nnoremap <silent> <leader>vv :call <sid>VimuxHideRunner()<cr>

fu! s:IsTest(fname)
  if a:fname =~ '\(Test\|Spec\|_test\|_spec\)'
    return 1
  else
    return 0
  endif
endfu

fu! s:VimuxInteractiveMode()
  call s:VimuxOpenRunnerAtCWD()
  call s:VimuxRunCommand("sbt")
endfu

fu! s:VimuxReload()
  call s:VimuxRunCommand("reload")
endfu

fu! s:VimuxHideRunner()
  sil exe "!tmux resize-pane -Z"
endfu

fu! s:VimuxCompile()
  sil call s:VimuxRunCommand("compile")
endfu

fu! s:VimuxCompileAll()
  sil call s:VimuxRunCommand("test:compile")
endfu

function! s:VimuxTest()
  let l:fname = expand("%:t:r")
  if s:IsTest(l:fname)
    let s:last_test = l:fname
    let l:command = "test:testOnly *" . l:fname
  elseif exists("s:last_test")
    let l:command = "test:testOnly *" . s:last_test
  else
    echoe "The last test is not found."
    return ''
  endif
  sil call s:VimuxRunCommand(l:command)
endfunction

function! s:VimuxTestAll()
  sil call s:VimuxRunCommand("test")
endfunction

fu! s:VimuxRun()
  let l:fname = substitute(expand("%:p:r"), '.*/src/main/\(java\|scala\)/\(.*\)', '\2', '')
  let l:package = substitute(l:fname, '/', '\.', 'g')
  sil call s:VimuxRunCommand("runMain " . l:package)
endfu

fu! s:VimuxRunAll()
  sil call s:VimuxRunCommand("run")
endfu

" Almost same as g:VimuxRunCommand function, but resize panes at first.
fu! s:VimuxRunCommand(cmd)
  sil exe "only"
  sil exe "!tmux resize-pane"
  sil exe "call VimuxRunCommand(\"" . a:cmd . "\")"
  exe "redraw!"
endfu

" Almost same as g:VimuxPromptCommand function, but use s:VimuxRunCommand
" function
fu! s:VimuxPromptCommand(...)
  let command = a:0 == 1 ? a:1 : ""
  let l:command = input(_VimuxOption("g:VimuxPromptString", "Command? "), command)
  call s:VimuxRunCommand(l:command)
endfu

fu! s:VimuxRunLastCommand()
  if exists("g:VimuxRunnerIndex")
    call s:VimuxRunCommand(g:VimuxLastCommand)
  else
    echo "No last vimux command."
  endif
endfu

fu! s:VimuxCloseRunner()
  call VimuxCloseRunner()
  exe "redraw!"
endfu
