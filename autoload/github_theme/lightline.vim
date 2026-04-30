" autoload/github_theme/lightline.vim
" Helper for lightline colorschemes.
"
" Each autoload/lightline/colorscheme/<n>.vim file calls
"   let g:lightline#colorscheme#<n>#palette = github_theme#lightline#build('<n>')

function! github_theme#lightline#build(style) abort
  let l:cfg = github_theme#config#options()
  let l:spec = github_theme#spec#load(a:style)
  let l:p = l:spec.palette
  let l:tbg = get(l:cfg, 'transparent', v:false) ? 'NONE' : l:spec.bg0

  let l:Blend = function('github_theme#color#blend_hex')

  " Color maps for each mode: mode-color + blend(bg1, mode-color, 0.1) + neutral
  " [[fg, bg, ctermfg, ctermbg], ...]

  let l:normal_color   = l:p.blue.base
  let l:insert_color   = l:p.green.base
  let l:visual_color   = l:p.yellow.base
  let l:replace_color  = l:p.red.base
  let l:cmdline_color  = l:p.magenta.bright
  let l:terminal_color = l:p.orange
  let l:inactive_color = l:spec.fg0

  let l:neutral_bg = l:Blend(l:spec.bg1, l:p.black.base, 0.2)
  let l:fg2 = l:spec.fg2

  " Per-mode map
  let l:palette = {}
  for [l:mode, l:col] in items({
    \ 'normal':   l:normal_color,
    \ 'insert':   l:insert_color,
    \ 'visual':   l:visual_color,
    \ 'replace':  l:replace_color,
    \ 'command':  l:cmdline_color,
    \ 'terminal': l:terminal_color,
    \ 'inactive': l:inactive_color
    \ })
    let l:mid = l:Blend(l:spec.bg1, l:col, 0.1)
    let l:palette[l:mode] = {
      \ 'left':   [ [l:tbg, l:col, 59, 74], [l:col, l:mid, 74, 59] ],
      \ 'middle': [ [l:fg2, l:neutral_bg, 145, 16] ],
      \ 'right':  [ [l:tbg, l:col, 59, 74], [l:col, l:mid, 74, 59], [l:fg2, l:neutral_bg, 145, 16] ]
      \ }
  endfor

  " Error/warning used by lightline-ale and similar plugins.
  let l:palette.normal.error   = [[l:spec.bg1, l:spec.diag.error, 16, 203]]
  let l:palette.normal.warning = [[l:spec.bg1, l:spec.diag.warn,  16, 208]]

  " Tabline
  let l:palette.tabline = {
    \ 'left':   [ [l:fg2, l:spec.bg2, 145, 235] ],
    \ 'tabsel': [ [l:spec.fg1, l:spec.bg1, 254, 236] ],
    \ 'middle': [ [l:fg2, l:spec.bg0, 145, 233] ],
    \ 'right':  [ [l:fg2, l:spec.bg2, 145, 235] ]
    \ }

  return l:palette
endfunction
