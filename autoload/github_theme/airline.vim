" autoload/github_theme/airline.vim
" Helper for airline themes. Port of lua/github-theme/util/airline.lua.
"
" Each autoload/airline/themes/<name>.vim file calls
"   github_theme#airline#setup('<name>')
" which populates g:airline#themes#<name>#palette and colour maps.

" Cterm slots for the airline a/b/z groups — fixed across all modes.
let s:cterm_a = [59, 74]    " fg, bg
let s:cterm_b = [74, 59]
let s:cterm_z = [145, 16]

function! github_theme#airline#setup(style) abort
  let l:cfg = github_theme#config#options()
  let l:spec = github_theme#spec#load(a:style)
  let l:p = l:spec.palette

  let l:tbg = get(l:cfg, 'transparent', v:false) ? 'NONE' : l:spec.bg0
  " Neutral background for the c/x/middle slots — same across all modes.
  let l:z_bg = github_theme#color#blend_hex(l:spec.bg1, l:p.black.base, 0.2)

  let l:palette = {
    \ 'normal':      s:color_map(l:spec, l:tbg, l:z_bg, l:p.blue.base),
    \ 'insert':      s:color_map(l:spec, l:tbg, l:z_bg, l:p.green.base),
    \ 'visual':      s:color_map(l:spec, l:tbg, l:z_bg, l:p.yellow.base),
    \ 'replace':     s:color_map(l:spec, l:tbg, l:z_bg, l:p.red.base),
    \ 'commandline': s:color_map(l:spec, l:tbg, l:z_bg, l:p.magenta.bright),
    \ 'terminal':    s:color_map(l:spec, l:tbg, l:z_bg, l:p.orange),
    \ 'inactive':    s:color_map(l:spec, l:tbg, l:z_bg, l:spec.fg0)
    \ }

  let g:airline#themes#{a:style}#palette = l:palette
endfunction

function! s:color_map(spec, tbg, z_bg, color) abort
  let l:mid = github_theme#color#blend_hex(a:spec.bg1, a:color, 0.1)

  if exists('*airline#themes#generate_color_map')
    return airline#themes#generate_color_map(
      \ [a:tbg,      a:color, s:cterm_a[0], s:cterm_a[1]],
      \ [a:color,    l:mid,   s:cterm_b[0], s:cterm_b[1]],
      \ [a:spec.fg2, a:z_bg,  s:cterm_z[0], s:cterm_z[1]]
      \ )
  endif
  " Fallback: produce the palette by hand (should match what
  " airline#themes#generate_color_map would produce).
  let l:a = [a:tbg,      a:color, s:cterm_a[0], s:cterm_a[1]]
  let l:b = [a:color,    l:mid,   s:cterm_b[0], s:cterm_b[1]]
  let l:z = [a:spec.fg2, a:z_bg,  s:cterm_z[0], s:cterm_z[1]]
  return {
    \ 'airline_a':  l:a,
    \ 'airline_b':  l:b,
    \ 'airline_c':  l:z,
    \ 'airline_x':  l:z,
    \ 'airline_y':  l:b,
    \ 'airline_z':  l:a,
    \ 'airline_error':  [a:spec.bg1, a:spec.diag.error, 16, 203],
    \ 'airline_warning':[a:spec.bg1, a:spec.diag.warn,  16, 208]
    \ }
endfunction
