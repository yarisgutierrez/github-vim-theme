" autoload/github_theme/color.vim
" Color manipulation library for github-theme
" Port of lua/github-theme/lib/color.lua
"
" Colors are represented as dictionaries:
"   { 'red': 0-255, 'green': 0-255, 'blue': 0-255, 'alpha': 0-1 }
"
" Primary functions:
"   github_theme#color#from_hex(str)       -> color dict
"   github_theme#color#from_rgba(r,g,b,a)  -> color dict
"   github_theme#color#to_hex(color)       -> '#rrggbb'
"   github_theme#color#to_css(color)       -> '#rrggbb'
"   github_theme#color#blend(a, b, f)      -> color dict (linear blend)
"   github_theme#color#brighten(c, v)      -> color dict
"   github_theme#color#lighten(c, v)       -> color dict
"   github_theme#color#saturate(c, v)      -> color dict
"   github_theme#color#shade(c, f)         -> color dict

if exists('g:loaded_github_theme_color') && g:loaded_github_theme_color
  finish
endif
let g:loaded_github_theme_color = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

" ---------------------------------------------------------------------------
" Helper functions
" ---------------------------------------------------------------------------

function! s:round(f) abort
  if a:f >= 0
    return float2nr(floor(a:f + 0.5))
  else
    return float2nr(ceil(a:f - 0.5))
  endif
endfunction

function! s:clamp(value, min, max) abort
  if a:value < a:min | return a:min | endif
  if a:value > a:max | return a:max | endif
  return a:value
endfunction

" Modulo for floats (vim's `%` is integer-only)
function! s:fmod(a, b) abort
  return a:a - (floor(a:a / a:b) * a:b)
endfunction

" ---------------------------------------------------------------------------
" Color constructors
" ---------------------------------------------------------------------------

" Parse a hex color string: '#rgb', '#rgba', '#rrggbb', '#rrggbbaa'
function! github_theme#color#from_hex(c) abort
  if type(a:c) == type({})
    " Already a color dict
    return a:c
  endif
  let l:s = tolower(a:c)
  " strip leading '#' if present
  if l:s[0] ==# '#'
    let l:s = l:s[1:]
  endif
  let l:len = strlen(l:s)
  let l:r = 0 | let l:g = 0 | let l:b = 0 | let l:a = 1.0
  if l:len == 3
    let l:r = str2nr(l:s[0] . l:s[0], 16)
    let l:g = str2nr(l:s[1] . l:s[1], 16)
    let l:b = str2nr(l:s[2] . l:s[2], 16)
  elseif l:len == 4
    let l:r = str2nr(l:s[0] . l:s[0], 16)
    let l:g = str2nr(l:s[1] . l:s[1], 16)
    let l:b = str2nr(l:s[2] . l:s[2], 16)
    let l:a = str2nr(l:s[3] . l:s[3], 16) / 255.0
  elseif l:len == 6
    let l:r = str2nr(l:s[0:1], 16)
    let l:g = str2nr(l:s[2:3], 16)
    let l:b = str2nr(l:s[4:5], 16)
  elseif l:len == 8
    let l:r = str2nr(l:s[0:1], 16)
    let l:g = str2nr(l:s[2:3], 16)
    let l:b = str2nr(l:s[4:5], 16)
    let l:a = str2nr(l:s[6:7], 16) / 255.0
  else
    throw 'github-theme: invalid hex color: ' . a:c
  endif
  return { 'red': l:r * 1.0, 'green': l:g * 1.0, 'blue': l:b * 1.0, 'alpha': l:a }
endfunction

" Create a color from rgba components (r,g,b: 0-255, a: 0-1)
function! github_theme#color#from_rgba(r, g, b, a) abort
  return { 'red': a:r * 1.0, 'green': a:g * 1.0, 'blue': a:b * 1.0, 'alpha': a:a * 1.0 }
endfunction

" Map a hue (0-360) and chroma to the unscaled (r1, g1, b1) triplet shared by
" the HSV and HSL → RGB conversions. The caller adds the m offset.
function! s:hue_to_rgb(h, c) abort
  let l:hh = a:h / 60.0
  let l:x = a:c * (1.0 - abs(s:fmod(l:hh, 2.0) - 1.0))
  if     l:hh < 1 | return [a:c,  l:x,  0.0]
  elseif l:hh < 2 | return [l:x,  a:c,  0.0]
  elseif l:hh < 3 | return [0.0,  a:c,  l:x]
  elseif l:hh < 4 | return [0.0,  l:x,  a:c]
  elseif l:hh < 5 | return [l:x,  0.0,  a:c]
  else            | return [a:c,  0.0,  l:x]
  endif
endfunction

" Create a color from HSV (h: 0-360, s,v: 0-100, a: 0-1)
function! github_theme#color#from_hsv(h, s, v, ...) abort
  let l:alpha = a:0 >= 1 ? a:1 : 1.0
  let l:h = s:fmod(a:h * 1.0, 360.0)
  let l:s = s:clamp(a:s * 1.0, 0.0, 100.0) / 100.0
  let l:v = s:clamp(a:v * 1.0, 0.0, 100.0) / 100.0
  let l:c = l:v * l:s
  let [l:r1, l:g1, l:b1] = s:hue_to_rgb(l:h, l:c)
  let l:m = l:v - l:c
  return {
    \ 'red':   (l:r1 + l:m) * 255.0,
    \ 'green': (l:g1 + l:m) * 255.0,
    \ 'blue':  (l:b1 + l:m) * 255.0,
    \ 'alpha': l:alpha }
endfunction

" Create a color from HSL (h: 0-360, s,l: 0-100, a: 0-1)
function! github_theme#color#from_hsl(h, s, l, ...) abort
  let l:alpha = a:0 >= 1 ? a:1 : 1.0
  let l:h = s:fmod(a:h * 1.0, 360.0)
  let l:s = s:clamp(a:s * 1.0, 0.0, 100.0) / 100.0
  let l:ll = s:clamp(a:l * 1.0, 0.0, 100.0) / 100.0
  let l:c = (1.0 - abs(2.0 * l:ll - 1.0)) * l:s
  let [l:r1, l:g1, l:b1] = s:hue_to_rgb(l:h, l:c)
  let l:m = l:ll - l:c * 0.5
  return {
    \ 'red':   (l:r1 + l:m) * 255.0,
    \ 'green': (l:g1 + l:m) * 255.0,
    \ 'blue':  (l:b1 + l:m) * 255.0,
    \ 'alpha': l:alpha }
endfunction

" ---------------------------------------------------------------------------
" Conversions
" ---------------------------------------------------------------------------

function! github_theme#color#to_rgba(color) abort
  return {
    \ 'red':   s:clamp(s:round(a:color.red),   0, 255),
    \ 'green': s:clamp(s:round(a:color.green), 0, 255),
    \ 'blue':  s:clamp(s:round(a:color.blue),  0, 255),
    \ 'alpha': a:color.alpha }
endfunction

function! github_theme#color#to_hex(color, ...) abort
  let l:with_alpha = a:0 >= 1 ? a:1 : 0
  let l:rgba = github_theme#color#to_rgba(a:color)
  if l:with_alpha
    let l:a = s:clamp(s:round(l:rgba.alpha * 255.0), 0, 255)
    return printf('#%02x%02x%02x%02x', l:rgba.red, l:rgba.green, l:rgba.blue, l:a)
  endif
  return printf('#%02x%02x%02x', l:rgba.red, l:rgba.green, l:rgba.blue)
endfunction

function! github_theme#color#to_css(color, ...) abort
  let l:with_alpha = a:0 >= 1 ? a:1 : 0
  return github_theme#color#to_hex(a:color, l:with_alpha)
endfunction

" Float-safe max/min over a list.
"
" DO NOT replace these with vim's builtin max()/min(): per :help max(), those
" coerce list elements via str2nr(), which truncates floats to integers and
" silently breaks all HSV/HSL math here.
function! s:fmax(list) abort
  let l:m = a:list[0]
  for l:v in a:list[1:]
    if l:v > l:m | let l:m = l:v | endif
  endfor
  return l:m
endfunction

function! s:fmin(list) abort
  let l:m = a:list[0]
  for l:v in a:list[1:]
    if l:v < l:m | let l:m = l:v | endif
  endfor
  return l:m
endfunction

" Hue (degrees, 0-360) from normalized RGB and the precomputed max/delta.
" Returns 0.0 when delta == 0 (achromatic).
function! s:rgb_to_hue(r, g, b, max, delta) abort
  if a:delta == 0.0
    return 0.0
  endif
  let l:h = 0.0
  if a:max == a:r
    let l:h = 60.0 * s:fmod((a:g - a:b) / a:delta, 6.0)
  elseif a:max == a:g
    let l:h = 60.0 * ((a:b - a:r) / a:delta + 2.0)
  else
    let l:h = 60.0 * ((a:r - a:g) / a:delta + 4.0)
  endif
  return l:h < 0 ? l:h + 360.0 : l:h
endfunction

function! github_theme#color#to_hsv(color) abort
  let l:r = a:color.red / 255.0
  let l:g = a:color.green / 255.0
  let l:b = a:color.blue / 255.0
  let l:max = s:fmax([l:r, l:g, l:b])
  let l:min = s:fmin([l:r, l:g, l:b])
  let l:delta = l:max - l:min
  let l:h = s:rgb_to_hue(l:r, l:g, l:b, l:max, l:delta)
  let l:s = l:max == 0.0 ? 0.0 : (l:delta / l:max) * 100.0
  let l:v = l:max * 100.0
  return { 'hue': l:h, 'saturation': l:s, 'value': l:v }
endfunction

function! github_theme#color#to_hsl(color) abort
  let l:r = a:color.red / 255.0
  let l:g = a:color.green / 255.0
  let l:b = a:color.blue / 255.0
  let l:max = s:fmax([l:r, l:g, l:b])
  let l:min = s:fmin([l:r, l:g, l:b])
  let l:delta = l:max - l:min
  let l:ll = (l:max + l:min) / 2.0
  let l:h = s:rgb_to_hue(l:r, l:g, l:b, l:max, l:delta)

  let l:s = 0.0
  if l:delta != 0.0
    let l:denom = 1.0 - abs(2.0 * l:ll - 1.0)
    if l:denom != 0.0
      let l:s = l:delta / l:denom
    endif
  endif
  return { 'hue': l:h, 'saturation': l:s * 100.0, 'lightness': l:ll * 100.0 }
endfunction

" ---------------------------------------------------------------------------
" Operations
" ---------------------------------------------------------------------------

" Linear blend between two colors. f=0 returns a, f=1 returns b.
" a and b may be hex strings or color dicts.
function! github_theme#color#blend(a, b, f) abort
  let l:ca = type(a:a) == type('') ? github_theme#color#from_hex(a:a) : a:a
  let l:cb = type(a:b) == type('') ? github_theme#color#from_hex(a:b) : a:b
  let l:f = a:f * 1.0
  return {
    \ 'red':   (l:cb.red   - l:ca.red)   * l:f + l:ca.red,
    \ 'green': (l:cb.green - l:ca.green) * l:f + l:ca.green,
    \ 'blue':  (l:cb.blue  - l:ca.blue)  * l:f + l:ca.blue,
    \ 'alpha': l:ca.alpha }
endfunction

" Shortcut: blend as hex string (most common use case in specs)
function! github_theme#color#blend_hex(a, b, f) abort
  return github_theme#color#to_hex(github_theme#color#blend(a:a, a:b, a:f))
endfunction

" Shade: darken (f<0) or lighten (f>0) linearly. f is in [-1, 1].
function! github_theme#color#shade(color, f) abort
  let l:c = type(a:color) == type('') ? github_theme#color#from_hex(a:color) : a:color
  let l:t = a:f < 0 ? 0.0 : 255.0
  let l:p = abs(a:f)
  return {
    \ 'red':   (l:t - l:c.red)   * l:p + l:c.red,
    \ 'green': (l:t - l:c.green) * l:p + l:c.green,
    \ 'blue':  (l:t - l:c.blue)  * l:p + l:c.blue,
    \ 'alpha': l:c.alpha }
endfunction

" Brighten: add v to HSV value channel (v in -100..100)
function! github_theme#color#brighten(color, v) abort
  let l:c = type(a:color) == type('') ? github_theme#color#from_hex(a:color) : a:color
  let l:hsv = github_theme#color#to_hsv(l:c)
  let l:hsv.value = s:clamp(l:hsv.value + a:v, 0.0, 100.0)
  let l:out = github_theme#color#from_hsv(l:hsv.hue, l:hsv.saturation, l:hsv.value, l:c.alpha)
  return l:out
endfunction

" Lighten: add v to HSL lightness (v in -100..100)
function! github_theme#color#lighten(color, v) abort
  let l:c = type(a:color) == type('') ? github_theme#color#from_hex(a:color) : a:color
  let l:hsl = github_theme#color#to_hsl(l:c)
  let l:hsl.lightness = s:clamp(l:hsl.lightness + a:v, 0.0, 100.0)
  return github_theme#color#from_hsl(l:hsl.hue, l:hsl.saturation, l:hsl.lightness, l:c.alpha)
endfunction

" Saturate: add v to HSL saturation (v in -100..100)
function! github_theme#color#saturate(color, v) abort
  let l:c = type(a:color) == type('') ? github_theme#color#from_hex(a:color) : a:color
  let l:hsl = github_theme#color#to_hsl(l:c)
  let l:hsl.saturation = s:clamp(l:hsl.saturation + a:v, 0.0, 100.0)
  return github_theme#color#from_hsl(l:hsl.hue, l:hsl.saturation, l:hsl.lightness, l:c.alpha)
endfunction

" Rotate hue by v degrees
function! github_theme#color#rotate(color, v) abort
  let l:c = type(a:color) == type('') ? github_theme#color#from_hex(a:color) : a:color
  let l:hsl = github_theme#color#to_hsl(l:c)
  let l:hsl.hue = s:fmod(l:hsl.hue + a:v, 360.0)
  return github_theme#color#from_hsl(l:hsl.hue, l:hsl.saturation, l:hsl.lightness, l:c.alpha)
endfunction

" Luminance, per WCAG
function! github_theme#color#luminance(color) abort
  let l:c = type(a:color) == type('') ? github_theme#color#from_hex(a:color) : a:color
  let l:r = l:c.red / 255.0
  let l:g = l:c.green / 255.0
  let l:b = l:c.blue / 255.0
  let l:r = l:r <= 0.03928 ? l:r / 12.92 : pow((l:r + 0.055) / 1.055, 2.4)
  let l:g = l:g <= 0.03928 ? l:g / 12.92 : pow((l:g + 0.055) / 1.055, 2.4)
  let l:b = l:b <= 0.03928 ? l:b / 12.92 : pow((l:b + 0.055) / 1.055, 2.4)
  return 0.2126 * l:r + 0.7152 * l:g + 0.0722 * l:b
endfunction

" Contrast between two colors (WCAG)
function! github_theme#color#contrast(a, b) abort
  let l:la = github_theme#color#luminance(a:a)
  let l:lb = github_theme#color#luminance(a:b)
  let l:lighter = l:la > l:lb ? l:la : l:lb
  let l:darker  = l:la > l:lb ? l:lb : l:la
  return (l:lighter + 0.05) / (l:darker + 0.05)
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
