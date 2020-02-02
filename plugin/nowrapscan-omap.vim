" vi:set ts=8 sts=2 sw=2 tw=0:
scriptencoding utf-8

" nowrapscan-omap.vim - set nowrapscan while search(/?) motion used in d{motion}
"
" Maintainer: KIHARA Hideto <deton@m1.interq.or.jp>
" Last Change: 2020-02-02

if exists('g:loaded_nowrapscan_omap')
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
  execute 'onoremap <expr> <Plug>(nowrapscan-omap-o/)  <SID>setnows("' . s:cmd_or_maparg('/', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowrapscan-omap-n/)  <SID>setws(  "' . s:cmd_or_maparg('/', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowrapscan-omap-o?)  <SID>setnows("' . s:cmd_or_maparg('?', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowrapscan-omap-n?)  <SID>setws(  "' . s:cmd_or_maparg('?', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowrapscan-omap-on)  <SID>setnows("' . s:cmd_or_maparg('n', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowrapscan-omap-nn)  <SID>setws(  "' . s:cmd_or_maparg('n', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowrapscan-omap-oN)  <SID>setnows("' . s:cmd_or_maparg('N', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowrapscan-omap-nN)  <SID>setws(  "' . s:cmd_or_maparg('N', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowrapscan-omap-o*)  <SID>setnows("' . s:cmd_or_maparg('*', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowrapscan-omap-n*)  <SID>setws(  "' . s:cmd_or_maparg('*', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowrapscan-omap-og*) <SID>setnows("' . s:cmd_or_maparg('g*', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowrapscan-omap-ng*) <SID>setws(  "' . s:cmd_or_maparg('g*', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowrapscan-omap-o#)  <SID>setnows("' . s:cmd_or_maparg('#', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowrapscan-omap-n#)  <SID>setws(  "' . s:cmd_or_maparg('#', 'n') . '")'
  execute 'onoremap <expr> <Plug>(nowrapscan-omap-og#) <SID>setnows("' . s:cmd_or_maparg('g#', 'o') . '")'
  execute 'nnoremap <expr> <Plug>(nowrapscan-omap-ng#) <SID>setws(  "' . s:cmd_or_maparg('g#', 'n') . '")'
endfunction

call s:mapplug()
if !get(g:, 'nowrapscan_omap_no_default_key_mappings', 0)
  execute 'omap / <Plug>(nowrapscan-omap-o/)' . maparg('/', 'o')
  execute 'nmap / <Plug>(nowrapscan-omap-n/)' . maparg('/', 'n')
  execute 'omap ? <Plug>(nowrapscan-omap-o?)' . maparg('?', 'o')
  execute 'nmap ? <Plug>(nowrapscan-omap-n?)' . maparg('?', 'n')
  execute 'omap n  <Plug>(nowrapscan-omap-on)'  . maparg('n', 'o')
  execute 'nmap n  <Plug>(nowrapscan-omap-nn)'  . maparg('n', 'n')
  execute 'omap N  <Plug>(nowrapscan-omap-oN)'  . maparg('N', 'o')
  execute 'nmap N  <Plug>(nowrapscan-omap-nN)'  . maparg('N', 'n')
  execute 'omap *  <Plug>(nowrapscan-omap-o*)'  . maparg('*', 'o')
  execute 'nmap *  <Plug>(nowrapscan-omap-n*)'  . maparg('*', 'n')
  execute 'omap g* <Plug>(nowrapscan-omap-og*)' . maparg('g*', 'o')
  execute 'nmap g* <Plug>(nowrapscan-omap-ng*)' . maparg('g*', 'n')
  execute 'omap #  <Plug>(nowrapscan-omap-o#)'  . maparg('#', 'o')
  execute 'nmap #  <Plug>(nowrapscan-omap-n#)'  . maparg('#', 'n')
  execute 'omap g# <Plug>(nowrapscan-omap-og#)' . maparg('g#', 'o')
  execute 'nmap g# <Plug>(nowrapscan-omap-ng#)' . maparg('g#', 'n')
endif
