" vi:set ts=8 sts=2 sw=2 tw=0:
scriptencoding utf-8

" nowsdel.vim - set nowrapscan while search(/?) motion used in d{motion}
"
" Maintainer: KIHARA Hideto <deton@m1.interq.or.jp>
" Last Change: 2020-02-02

if exists('g:loaded_nowsdel')
  finish
endif
let g:loaded_noswdel = 1

function! s:setnows(cmd)
  set nows
  return a:cmd
endfunction

function! s:setws(cmd)
  set ws
  return a:cmd
endfunction

function! s:cmd_or_maparg(cmd, mode)
  if maparg(a:cmd, a:mode) != ''
    return ''
  endif
  return a:cmd
endfunction

function! s:mapplug()
  execute 'onoremap <expr> <Plug>(nowsdel-o/)  <SID>setnows("' . s:cmd_or_maparg('/', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-n/)  <SID>setws(  "' . s:cmd_or_maparg('/', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowsdel-o?)  <SID>setnows("' . s:cmd_or_maparg('?', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-n?)  <SID>setws(  "' . s:cmd_or_maparg('?', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowsdel-on)  <SID>setnows("' . s:cmd_or_maparg('n', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-nn)  <SID>setws(  "' . s:cmd_or_maparg('n', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowsdel-oN)  <SID>setnows("' . s:cmd_or_maparg('N', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-nN)  <SID>setws(  "' . s:cmd_or_maparg('N', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowsdel-o*)  <SID>setnows("' . s:cmd_or_maparg('*', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-n*)  <SID>setws(  "' . s:cmd_or_maparg('*', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowsdel-og*) <SID>setnows("' . s:cmd_or_maparg('g*', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-ng*) <SID>setws(  "' . s:cmd_or_maparg('g*', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowsdel-o#)  <SID>setnows("' . s:cmd_or_maparg('#', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-n#)  <SID>setws(  "' . s:cmd_or_maparg('#', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowsdel-og#) <SID>setnows("' . s:cmd_or_maparg('g#', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowsdel-ng#) <SID>setws(  "' . s:cmd_or_maparg('g#', 'n') . '")'
endfunction

call s:mapplug()
if !get(g:, 'nowsdel_no_default_key_mappings', 0)
  execute 'omap / <Plug>(nowsdel-o/)' . maparg('/', 'o')
  execute 'nmap / <Plug>(nowsdel-n/)' . maparg('/', 'n')
  execute 'omap ? <Plug>(nowsdel-o?)' . maparg('?', 'o')
  execute 'nmap ? <Plug>(nowsdel-n?)' . maparg('?', 'n')
  execute 'omap n  <Plug>(nowsdel-on)'  . maparg('n', 'o')
  execute 'nmap n  <Plug>(nowsdel-nn)'  . maparg('n', 'n')
  execute 'omap N  <Plug>(nowsdel-oN)'  . maparg('N', 'o')
  execute 'nmap N  <Plug>(nowsdel-nN)'  . maparg('N', 'n')
  execute 'omap *  <Plug>(nowsdel-o*)'  . maparg('*', 'o')
  execute 'nmap *  <Plug>(nowsdel-n*)'  . maparg('*', 'n')
  execute 'omap g* <Plug>(nowsdel-og*)' . maparg('g*', 'o')
  execute 'nmap g* <Plug>(nowsdel-ng*)' . maparg('g*', 'n')
  execute 'omap #  <Plug>(nowsdel-o#)'  . maparg('#', 'o')
  execute 'nmap #  <Plug>(nowsdel-n#)'  . maparg('#', 'n')
  execute 'omap g# <Plug>(nowsdel-og#)' . maparg('g#', 'o')
  execute 'nmap g# <Plug>(nowsdel-ng#)' . maparg('g#', 'n')
endif
