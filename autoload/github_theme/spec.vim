" autoload/github_theme/spec.vim
" Top-level spec loader. Dispatches to github_theme#palette#<n>#spec() and
" then applies user overrides from g:github_theme_config.specs.
"
" Public API (mirrors lua/github-theme/spec.lua):
"   github_theme#spec#load()       -> dict theme -> spec
"   github_theme#spec#load(name)   -> spec for single theme (with palette merged)

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
  " Build the spec from the pre-generated function, then swap in any
  " user palette override (so spec.palette reflects user changes too).
  let l:spec = function('github_theme#palette#' . a:name . '#spec')()
  let l:spec.palette = github_theme#palette#load(a:name)
  " Apply user spec overrides.
  let l:cfg = github_theme#config#get()
  let l:specs = get(l:cfg, 'specs', {})
  if type(l:specs) == type({}) && !empty(l:specs)
    let l:all = get(l:specs, 'all', {})
    let l:specific = get(l:specs, a:name, {})
    let l:spec = github_theme#collect#deep_extend(l:spec, l:all, l:specific)
  endif
  " Re-expose bg/fg shortcuts in case they were overridden via bg1/fg1.
  let l:spec.bg = l:spec.bg1
  let l:spec.fg = l:spec.fg1
  return l:spec
endfunction
