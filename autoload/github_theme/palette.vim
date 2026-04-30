" autoload/github_theme/palette.vim
" Top-level palette loader. Dispatches to github_theme#palette#<name>#get().
"
" Public API (mirrors lua/github-theme/palette.lua):
"   github_theme#palette#load()           -> dict mapping theme name -> palette
"   github_theme#palette#load(name)       -> palette for a single theme
"   github_theme#palette#themes()         -> list of supported theme names

let s:themes = [
  \ 'github_dark',
  \ 'github_dark_default',
  \ 'github_dark_dimmed',
  \ 'github_dark_high_contrast',
  \ 'github_dark_colorblind',
  \ 'github_dark_tritanopia',
  \ 'github_light',
  \ 'github_light_default',
  \ 'github_light_high_contrast',
  \ 'github_light_colorblind',
  \ 'github_light_tritanopia'
  \ ]

function! github_theme#palette#themes() abort
  return copy(s:themes)
endfunction

" Memoize per-theme palettes keyed on (theme name, user-config serialization).
" Invalidates automatically when g:github_theme_config changes.
let s:palette_cache = {}
let s:palette_cache_key = ''

function! github_theme#palette#load(...) abort
  if a:0 >= 1 && a:1 !=# ''
    return s:load_one(a:1)
  endif
  let l:out = {}
  for l:t in s:themes
    let l:out[l:t] = s:load_one(l:t)
  endfor
  return l:out
endfunction

function! s:load_one(name) abort
  if index(s:themes, a:name) < 0
    throw 'github-theme: unknown theme: ' . a:name
  endif
  let l:cfg_key = string(get(g:, 'github_theme_config', {}))
  if l:cfg_key !=# s:palette_cache_key
    let s:palette_cache = {}
    let s:palette_cache_key = l:cfg_key
  endif
  if has_key(s:palette_cache, a:name)
    return s:palette_cache[a:name]
  endif
  let l:base = call('github_theme#palette#' . a:name . '#get', [])
  let l:merged = github_theme#collect#apply_overrides(
    \ l:base, get(github_theme#config#get(), 'palettes', {}), a:name)
  let s:palette_cache[a:name] = l:merged
  return l:merged
endfunction
