" autoload/github_theme/spec.vim
" Top-level spec loader. Dispatches to github_theme#palette#<n>#spec() and
" then applies user overrides from g:github_theme_config.specs.
"
" Public API (mirrors lua/github-theme/spec.lua):
"   github_theme#spec#load()       -> dict theme -> spec
"   github_theme#spec#load(name)   -> spec for single theme (with palette merged)

" Memoize per-theme specs keyed on (theme name, user-config serialization).
" Invalidates automatically when g:github_theme_config changes.
let s:spec_cache = {}
let s:spec_cache_key = ''

function! github_theme#spec#load(...) abort
  let l:names = github_theme#palette#themes()
  if a:0 >= 1 && a:1 !=# ''
    return s:load_one(a:1)
  endif
  let l:out = {}
  for l:t in l:names
    let l:out[l:t] = s:load_one(l:t)
  endfor
  return l:out
endfunction

function! s:load_one(name) abort
  if index(github_theme#palette#themes(), a:name) < 0
    throw 'github-theme: unknown theme: ' . a:name
  endif
  let l:cfg_key = string(get(g:, 'github_theme_config', {}))
  if l:cfg_key !=# s:spec_cache_key
    let s:spec_cache = {}
    let s:spec_cache_key = l:cfg_key
  endif
  if has_key(s:spec_cache, a:name)
    return s:spec_cache[a:name]
  endif
  " Build the spec from the pre-generated function, then swap in any
  " user palette override (so spec.palette reflects user changes too).
  " Use call() rather than function()() so autoload resolves at call-time.
  let l:spec = call('github_theme#palette#' . a:name . '#spec', [])
  let l:spec.palette = github_theme#palette#load(a:name)
  let l:spec = github_theme#collect#apply_overrides(
    \ l:spec, get(github_theme#config#get(), 'specs', {}), a:name)
  " Re-expose bg/fg shortcuts in case they were overridden via bg1/fg1.
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  let s:spec_cache[a:name] = l:spec
  return l:spec
endfunction
