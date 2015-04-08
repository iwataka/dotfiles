if !executable('ibus') || (exists('g:japanese_mode_loaded') && g:japanese_mode_loaded)
  finish
endif
let g:japanese_mode_loaded = 1

if !exists('g:japanese_mode_ja_input_source')
  let g:japanese_mode_ja_input_source = "anthy"
endif

if !exists('g:japanese_mode_en_input_source')
  let g:japanese_mode_en_input_source = "xkb:jp::jpn"
endif

if !exists('g:japanese_mode_toggle_key')
  let g:japanese_mode_toggle_key = '<c-@>'
endif

let b:japanese_mode_enabled = 0
let b:japanese_mode_spell_checked = 0

fu! japanese_mode#to_japanese()
  silent call system("ibus engine ".g:japanese_mode_ja_input_source)
endfu

fu! japanese_mode#to_english()
  silent call system("ibus engine ".g:japanese_mode_en_input_source)
endfu

fu! japanese_mode#toggle_lang()
  let l:current_language = substitute(system('ibus engine'), '\(\n\|\r\)', '', '')
  if l:current_language == g:japanese_mode_ja_input_source
    silent call japanese_mode#to_english()
  elseif l:current_language == g:japanese_mode_en_input_source
    silent call japanese_mode#to_japanese()
  endif
  retu ""
endfu

fu! japanese_mode#show_lang()
  echom system('ibus engine')
endfu

fu! japanese_mode#enable()
  setlocal formatoptions+=mM
  if &spell
    let b:japanese_mode_spell_checked = 1
    setlocal nospell
  endif
  let b:japanese_mode_enabled = 1
  aug ja-fix-mode
    au!
    au ja-fix-mode InsertEnter <buffer> call japanese_mode#to_japanese()
    au ja-fix-mode InsertLeave <buffer> call japanese_mode#to_english()
  aug END
  let l:call = "japanese_mode#toggle_lang()"
  silent exe "normal! :inoremap <buffer> <expr> ".g:japanese_mode_toggle_key." ".l:call."\<cr>"
endf

fu! japanese_mode#disable()
  if b:japanese_mode_enabled
    setlocal formatoptions-=mM
    if b:japanese_mode_spell_checked
      setlocal spell
      let b:japanese_mode_spell_checked = 0
    endif
    au! ja-fix-mode
  endif
  let b:japanese_mode_enabled = 0
  silent! exe "normal! :iunmap ".g:japanese_mode_toggle_key."\<cr>"
endf

fu! japanese_mode#toggle()
  if b:japanese_mode_enabled
    call japanese_mode#disable()
  else
    call japanese_mode#enable()
  en
endf
