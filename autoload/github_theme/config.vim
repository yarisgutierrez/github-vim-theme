" autoload/github_theme/config.vim
" Plugin configuration — ported from lua/github-theme/config.lua.
"
" Users set g:github_theme_config before running :colorscheme. Example:
"
"   let g:github_theme_config = {
"     \ 'options': {
"       \ 'transparent': v:true,
"       \ 'hide_end_of_buffer': v:true,
"       \ 'styles': { 'comments': 'italic', 'keywords': 'bold' }
"     \ },
"     \ 'palettes': {
"       \ 'github_dark': { 'red': { 'base': '#ff0000' } }
"     \ },
"     \ 'specs': {},
"     \ 'groups': {
"       \ 'all': { 'Whitespace': { 'link': 'Comment' } }
"     \ }
"   \ }
"
" See doc/github-theme.txt :help github-theme-config for full option list.

if exists('g:loaded_github_theme_config') && g:loaded_github_theme_config
  finish
endif
let g:loaded_github_theme_config = 1

let s:defaults = {
  \ 'options': {
    \ 'hide_end_of_buffer': v:true,
    \ 'hide_nc_statusline': v:true,
    \ 'transparent': v:false,
    \ 'terminal_colors': v:true,
    \ 'dim_inactive': v:false,
    \ 'module_default': v:true,
    \ 'styles': {
      \ 'comments':     'NONE',
      \ 'functions':    'NONE',
      \ 'keywords':     'NONE',
      \ 'variables':    'NONE',
      \ 'conditionals': 'NONE',
      \ 'constants':    'NONE',
      \ 'numbers':      'NONE',
      \ 'operators':    'NONE',
      \ 'strings':      'NONE',
      \ 'types':        'NONE'
    \ },
    \ 'inverse': {
      \ 'match_paren': v:false,
      \ 'visual':      v:false,
      \ 'search':      v:false
    \ },
    \ 'darken': {
      \ 'floats': v:true,
      \ 'sidebars': { 'enable': v:true, 'list': [] }
    \ },
    \ 'modules': {
      \ 'ale':           v:true,
      \ 'coc':           v:true,
      \ 'gitgutter':     v:true,
      \ 'signify':       v:true,
      \ 'nerdtree':      v:true,
      \ 'fzf':           v:true,
      \ 'syntastic':     v:true,
      \ 'tagbar':        v:true,
      \ 'indent_blankline': v:true,
      \ 'dirvish':       v:true,
      \ 'sneak':         v:true,
      \ 'floaterm':      v:true
    \ }
  \ },
  \ 'palettes': {},
  \ 'specs': {},
  \ 'groups': {}
\ }

" Cache the resolved config keyed on the user's config dict serialized.
" Invalidates automatically when g:github_theme_config changes (set or
" mutated by the user). Callers MUST treat the return as read-only.
let s:resolved_cache = {}
let s:resolved_key = ''

function! github_theme#config#get() abort
  let l:user = get(g:, 'github_theme_config', {})
  let l:key = string(l:user)
  if l:key !=# s:resolved_key
    let s:resolved_cache = github_theme#collect#deep_extend(s:defaults, l:user)
    let s:resolved_key = l:key
  endif
  return s:resolved_cache
endfunction

" Return just the options sub-dict (commonly accessed).
function! github_theme#config#options() abort
  return github_theme#config#get().options
endfunction

" Return default config (mostly useful for documentation / debugging).
function! github_theme#config#defaults() abort
  return github_theme#collect#deep_copy(s:defaults)
endfunction

" Check if a module is enabled. Accepts either boolean or a dict with 'enable'.
function! github_theme#config#module_enabled(name) abort
  let l:opts = github_theme#config#options()
  let l:modules = get(l:opts, 'modules', {})
  let l:fallback = get(l:opts, 'module_default', v:true)
  if !has_key(l:modules, a:name)
    return l:fallback
  endif
  let l:v = l:modules[a:name]
  if type(l:v) == type({})
    return get(l:v, 'enable', l:fallback)
  endif
  " boolean or 0/1
  return l:v ? v:true : v:false
endfunction
