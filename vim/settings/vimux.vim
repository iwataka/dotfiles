" Some pane configuration
let g:VimuxHeight = "40"
let g:VimuxOrientation = "v"
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
  let cmd = "cd " . getcwd()
  sil call s:VimuxRunCommand(cmd)
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
nnoremap <silent> <leader>vP :call <sid>VimuxRepl()<cr>
nnoremap <silent> <Enter> :call <sid>VimuxToggleRunner()<cr>

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

fu! s:VimuxRepl()
  sil call s:VimuxRunCommand("consoleQuick")
  sil call s:VimuxSelectPane()
endfu

fu! s:VimuxToggleRunner()
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
  sil call s:VimuxRunCommand("testQuick")
endfunction

fu! s:VimuxRun()
  let fpath = expand('%:p:r')
  let fname = substitute(fpath, '.*/src/main/\(java\|scala\)/\(.*\)', '\2', '')
  let proj_name = substitute(fpath, '.*/\([^/]*\)/src/main/.*', '\1', '')
  let package = substitute(fname, '/', '\.', 'g')
  sil call s:VimuxRunCommand(proj_name . "/runMain " . package)
endfu

fu! s:VimuxRunAll()
  sil call s:VimuxRunCommand("run")
endfu

" Almost same as g:VimuxRunCommand function, but resize panes at first.
fu! s:VimuxRunCommand(cmd)
  if _VimuxRunnerType() == "pane"
    sil exe "!tmux resizep"
  endif
  sil exe "call VimuxRunCommand(\"" . a:cmd . "\")"
  sil exe "redraw!"
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

fu! s:VimuxSelectPane()
  let index = _VimuxNearestIndex()
  let type = _VimuxRunnerType()
  let result = system("tmux select-" . type . " -t " . index)
endfu
