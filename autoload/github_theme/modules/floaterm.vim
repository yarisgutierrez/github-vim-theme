" autoload/github_theme/modules/floaterm.vim
" Groups for voldikss/vim-floaterm

function! github_theme#modules#floaterm#get(spec, opts) abort
  return {
    \ 'Floaterm':       { 'fg': a:spec.fg1, 'bg': a:spec.bg0 },
    \ 'FloatermBorder': { 'fg': a:spec.palette.border.default, 'bg': a:spec.bg0 },
    \ 'FloatermNC':     { 'fg': a:spec.fg2, 'bg': a:spec.bg0 }
  \ }
endfunction
