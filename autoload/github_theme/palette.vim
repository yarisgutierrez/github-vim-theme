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
  let l:base = function('github_theme#palette#' . a:name . '#get')()
  " Apply user palette overrides (specs/all + specs/<theme>)
  let l:cfg = github_theme#config#get()
  let l:palettes = get(l:cfg, 'palettes', {})
  if type(l:palettes) != type({}) || empty(l:palettes)
    return l:base
  endif
  let l:all = get(l:palettes, 'all', {})
  let l:specific = get(l:palettes, a:name, {})
  return github_theme#collect#deep_extend(l:base, l:all, l:specific)
endfunction
