" autoload/github_theme/highlight.vim
" Emit a :highlight command from a group dict.
"
" A group dict has any of: fg, bg, sp, style, link.
"   'link'  -> emits "highlight link <name> <target>"
"   {}      -> empty dict clears the group (FALLBACK_OR_NONE semantics)
"   'NONE'  -> treated as no-value
"
" Used by github_theme#theme#apply() to flush all groups.

" Apply a whole group map to the current vim session.
function! github_theme#highlight#apply(groups) abort
  for [l:name, l:hl] in items(a:groups)
    call github_theme#highlight#set(l:name, l:hl)
  endfor
endfunction

" Set a single highlight group. `hl` is a dict (may be empty) or a string
" (treated as a link target for convenience).
function! github_theme#highlight#set(name, hl) abort
  if type(a:hl) == type('')
    execute 'highlight! link ' . a:name . ' ' . a:hl
    return
  endif
  if type(a:hl) != type({})
    return
  endif
  if empty(a:hl)
    " FALLBACK_OR_NONE: clear the group so other highlights can stack.
    execute 'highlight clear ' . a:name
    return
  endif
  if has_key(a:hl, 'link') && !empty(a:hl.link)
    execute 'highlight! link ' . a:name . ' ' . a:hl.link
    return
  endif

  let l:fg = s:get_color(a:hl, 'fg')
  let l:bg = s:get_color(a:hl, 'bg')
  let l:sp = s:get_color(a:hl, 'sp')
  let l:style = get(a:hl, 'style', '')

  let l:parts = ['highlight', a:name]

  " Clear first so attributes from a previous colorscheme don't leak.
  execute 'highlight clear ' . a:name

  if l:fg !=# ''
    call add(l:parts, 'guifg=' . l:fg)
    call add(l:parts, 'ctermfg=' . s:cterm_of(l:fg))
  endif
  if l:bg !=# ''
    call add(l:parts, 'guibg=' . l:bg)
    call add(l:parts, 'ctermbg=' . s:cterm_of(l:bg))
  endif
  if l:sp !=# ''
    call add(l:parts, 'guisp=' . l:sp)
  endif
  if type(l:style) == type('') && l:style !=# '' && l:style !=? 'NONE'
    call add(l:parts, 'gui=' . l:style)
    call add(l:parts, 'cterm=' . l:style)
  elseif l:style ==? 'NONE'
    call add(l:parts, 'gui=NONE')
    call add(l:parts, 'cterm=NONE')
  endif

  if len(l:parts) > 2
    execute join(l:parts, ' ')
  endif
endfunction

function! s:get_color(hl, key) abort
  if !has_key(a:hl, a:key)
    return ''
  endif
  let l:v = a:hl[a:key]
  if type(l:v) != type('')
    return ''
  endif
  if l:v ==? 'NONE' || l:v ==? 'none'
    return 'NONE'
  endif
  return l:v
endfunction

" Map a hex color to the nearest xterm-256 index. Used for ctermfg/ctermbg
" fallback when users are in a non-true-color terminal.
"
" This is an approximate port of the algorithm common in many vim themes:
" we use the 6x6x6 color cube (indices 16-231) plus the grayscale ramp.
function! github_theme#highlight#cterm_of(hex) abort
  return s:cterm_of(a:hex)
endfunction

let s:cterm_cache = {}

function! s:cterm_of(hex) abort
  if a:hex ==? 'NONE' || a:hex ==? 'none' || a:hex ==# ''
    return 'NONE'
  endif
  if has_key(s:cterm_cache, a:hex)
    return s:cterm_cache[a:hex]
  endif
  let l:s = tolower(a:hex)
  if l:s[0] ==# '#'
    let l:s = l:s[1:]
  endif
  if strlen(l:s) != 6
    " Not a hex we can map; return 'NONE' to be safe.
    let s:cterm_cache[a:hex] = 'NONE'
    return 'NONE'
  endif
  let l:r = str2nr(l:s[0:1], 16)
  let l:g = str2nr(l:s[2:3], 16)
  let l:b = str2nr(l:s[4:5], 16)

  " 6-step cube values
  let l:steps = [0, 95, 135, 175, 215, 255]
  let l:ri = s:closest_step(l:r, l:steps)
  let l:gi = s:closest_step(l:g, l:steps)
  let l:bi = s:closest_step(l:b, l:steps)
  let l:cube_idx = 16 + 36 * l:ri + 6 * l:gi + l:bi
  let l:cube_r = l:steps[l:ri]
  let l:cube_g = l:steps[l:gi]
  let l:cube_b = l:steps[l:bi]
  let l:cube_d = s:sqdist(l:r, l:g, l:b, l:cube_r, l:cube_g, l:cube_b)

  " grayscale ramp (232-255)
  let l:avg = (l:r + l:g + l:b) / 3
  let l:gi2 = l:avg < 8 ? 0 : (l:avg > 238 ? 23 : (l:avg - 8) / 10)
  let l:gray_v = l:gi2 == 0 ? 8 : (8 + l:gi2 * 10)
  let l:gray_d = s:sqdist(l:r, l:g, l:b, l:gray_v, l:gray_v, l:gray_v)

  let l:result = l:gray_d < l:cube_d ? 232 + l:gi2 : l:cube_idx
  let s:cterm_cache[a:hex] = l:result
  return l:result
endfunction

function! s:sqdist(r, g, b, r2, g2, b2) abort
  return (a:r - a:r2) * (a:r - a:r2)
    \ + (a:g - a:g2) * (a:g - a:g2)
    \ + (a:b - a:b2) * (a:b - a:b2)
endfunction

function! s:closest_step(v, steps) abort
  let l:best = 0
  let l:best_d = 1000000
  let l:i = 0
  for l:step in a:steps
    let l:d = (a:v - l:step) * (a:v - l:step)
    if l:d < l:best_d
      let l:best_d = l:d
      let l:best = l:i
    endif
    let l:i += 1
  endfor
  return l:best
endfunction
