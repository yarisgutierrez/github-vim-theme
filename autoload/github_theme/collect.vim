" autoload/github_theme/collect.vim
" Deep-merge + deep-copy utilities, ported from lua/github-theme/lib/collect.lua
"
" github_theme#collect#deep_extend(base, overlay, ...) merges overlay into base.
"   Later dicts win. Recursively merges nested dicts. Lists and non-dict values
"   are replaced wholesale (same semantics as vim extend with 'force').
"
" github_theme#collect#deep_copy(x) returns a deep copy.

if exists('g:loaded_github_theme_collect') && g:loaded_github_theme_collect
  finish
endif
let g:loaded_github_theme_collect = 1

function! github_theme#collect#deep_copy(v) abort
  if type(a:v) == type({})
    let l:r = {}
    for [l:k, l:v] in items(a:v)
      let l:r[l:k] = github_theme#collect#deep_copy(l:v)
    endfor
    return l:r
  elseif type(a:v) == type([])
    return map(copy(a:v), 'github_theme#collect#deep_copy(v:val)')
  endif
  return a:v
endfunction

function! github_theme#collect#deep_extend(base, ...) abort
  let l:out = github_theme#collect#deep_copy(a:base)
  for l:i in range(a:0)
    let l:overlay = a:000[l:i]
    if type(l:overlay) != type({})
      continue
    endif
    let l:out = s:merge_two(l:out, l:overlay)
  endfor
  return l:out
endfunction

" Apply two-tier overrides ('all' + per-name) onto a base dict.
"
" `overrides` is the user's overrides bucket — e.g. g:github_theme_config.specs
" or .palettes or .groups. Both `all` and the per-name key are optional.
" Returns `base` unchanged when `overrides` has nothing applicable, so callers
" don't pay for a deep_extend just to get back the same dict.
function! github_theme#collect#apply_overrides(base, overrides, name) abort
  if type(a:overrides) != type({}) || empty(a:overrides)
    return a:base
  endif
  let l:all      = get(a:overrides, 'all', {})
  let l:specific = get(a:overrides, a:name, {})
  if empty(l:all) && empty(l:specific)
    return a:base
  endif
  return github_theme#collect#deep_extend(a:base, l:all, l:specific)
endfunction

function! s:merge_two(base, overlay) abort
  if type(a:base) != type({})
    return github_theme#collect#deep_copy(a:overlay)
  endif
  if type(a:overlay) != type({})
    return github_theme#collect#deep_copy(a:overlay)
  endif
  let l:out = copy(a:base)
  for [l:k, l:v] in items(a:overlay)
    if has_key(l:out, l:k) && type(l:out[l:k]) == type({}) && type(l:v) == type({})
      let l:out[l:k] = s:merge_two(l:out[l:k], l:v)
    else
      let l:out[l:k] = github_theme#collect#deep_copy(l:v)
    endif
  endfor
  return l:out
endfunction
