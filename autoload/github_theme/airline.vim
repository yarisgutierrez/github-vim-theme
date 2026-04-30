" autoload/github_theme/airline.vim
" Helper for airline themes. Port of lua/github-theme/util/airline.lua.
"
" Each autoload/airline/themes/<name>.vim file calls
"   github_theme#airline#setup('<name>')
" which populates g:airline#themes#<name>#palette and colour maps.

function! github_theme#airline#setup(style) abort
  let l:cfg = github_theme#config#options()
  let l:spec = github_theme#spec#load(a:style)
  let l:p = l:spec.palette

  let l:tbg = get(l:cfg, 'transparent', v:false) ? 'NONE' : l:spec.bg0

  let l:palette = {
    \ 'normal':      s:color_map(l:spec, l:tbg, l:p.blue.base),
    \ 'insert':      s:color_map(l:spec, l:tbg, l:p.green.base),
    \ 'visual':      s:color_map(l:spec, l:tbg, l:p.yellow.base),
    \ 'replace':     s:color_map(l:spec, l:tbg, l:p.red.base),
    \ 'commandline': s:color_map(l:spec, l:tbg, l:p.magenta.bright),
    \ 'terminal':    s:color_map(l:spec, l:tbg, l:p.orange),
    \ 'inactive':    s:color_map(l:spec, l:tbg, l:spec.fg0)
    \ }

  let g:airline#themes#{a:style}#palette = l:palette
endfunction

function! s:color_map(spec, tbg, color) abort
  let l:p = a:spec.palette
  let l:mid = github_theme#color#blend_hex(a:spec.bg1, a:color, 0.1)
  let l:z_bg = github_theme#color#blend_hex(a:spec.bg1, l:p.black.base, 0.2)

  " a group: mode indicator (inverted, bright color fill)
  " b group: file info
  " c/x/y/z groups: neutral
  let l:fg_cterm_a = 59
  let l:bg_cterm_a = 74
  let l:fg_cterm_b = 74
  let l:bg_cterm_b = 59
  let l:fg_cterm_z = 145
  let l:bg_cterm_z = 16

  if exists('*airline#themes#generate_color_map')
    return airline#themes#generate_color_map(
      \ [a:tbg,    a:color, l:fg_cterm_a, l:bg_cterm_a],
      \ [a:color,  l:mid,   l:fg_cterm_b, l:bg_cterm_b],
      \ [a:spec.fg2, l:z_bg, l:fg_cterm_z, l:bg_cterm_z]
      \ )
  endif
  " Fallback: produce the palette by hand (should match what
  " airline#themes#generate_color_map would produce).
  let l:a = [a:tbg,     a:color, l:fg_cterm_a, l:bg_cterm_a]
  let l:b = [a:color,   l:mid,   l:fg_cterm_b, l:bg_cterm_b]
  let l:z = [a:spec.fg2, l:z_bg, l:fg_cterm_z, l:bg_cterm_z]
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
